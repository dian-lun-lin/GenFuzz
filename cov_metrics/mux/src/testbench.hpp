
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <chrono>
#include <filesystem>

#include <rtlflow.h>
#include <coverage.hpp>
#include <dut.hpp>

//const uint8_t ResetInput[INPUT_SIZE] = { 0 };
//struct Input {
  //std::vector<std::vector<std::vector<uint8_t>>> inputs;
//};

//// Override Verilator definition so first $finish ends simulation
//// Note: VL_USER_FINISH needs to be defined when compiling Verilator code
//void vl_finish(const char* filename, int linenum, const char* hier) {
	//Verilated::flushCall();
	//exit(0);
//}

static inline void print_header() {
	std::cout << "Fuzz Server for \033[1m" << TOPLEVEL_STR << "\033[0m\n";
	std::cout << "Allocated Bytes per Input:    " << INPUT_SIZE << "\n";
	std::cout << "Allocated Bytes per Coverage: " << COVERAGE_SIZE << "\n";
}

//#define CLR_LINES(n) "\033[" #n "F\033[0J"
//class StatusDisplay {
	//using Clock = std::chrono::high_resolution_clock;
	//using TimePoint = Clock::time_point;
	//using Duration = Clock::duration;
	//const TimePoint begin = Clock::now();
	//TimePoint last_status = Clock::now();
	//uint64_t test_count = 0;
	//bool first = true;

	//template<typename D>
	//static constexpr std::chrono::milliseconds
	//Milliseconds(const D& duration) {
		//return std::chrono::duration_cast<std::chrono::milliseconds>(duration);
	//}
	//template<typename D>
	//static constexpr std::chrono::seconds
	//Seconds(const D& duration) {
		//return std::chrono::duration_cast<std::chrono::seconds>(duration);
	//}

	//inline void print(const uint64_t cycles) {
		//const auto now = Clock::now();
		//const auto delta_t = now - begin;
		////const auto ms = Milliseconds(delta_t).count();
		//const auto sec = Seconds(delta_t).count();

		//if(sec < 1) return;
		//if(first) { first = false; }
		//else { std::cout << CLR_LINES(5); }

		//const auto tests_per_second = test_count / sec;
		//std::cout << "Test/s:   " << tests_per_second << std::endl;
		//const auto cycles_per_second = cycles / sec;
		//std::cout << "Cycles/s: " << cycles_per_second << std::endl;
		//const auto khz = cycles_per_second / 1000.0;
		//std::cout << "kHz:      " << khz << std::endl;
		//const auto Mhz = cycles_per_second / 1000000.0;
		//std::cout << "MHz:      " << Mhz << std::endl;
		//std::cout << "Runtime:  " << sec << " s" << std::endl;
	//}

//public:
	//inline void update(const uint64_t cycles, const uint64_t new_tests) {
		//this->test_count += new_tests;
		//const auto now = Clock::now();
		//const auto ms_last_print = Milliseconds(now - last_status).count();
		//if(ms_last_print > 500) {
			//this->last_status = now;
			//this->print(cycles);
		//}
	//}

//};

void step(RF::RTLflow& rtlflow, RF::Top* dut, size_t NUM_INPUTS) {
	// finish last cycle
  for(size_t i = 0; i < NUM_INPUTS; ++i) {
    *rtlflow.get(dut->clock, i) = 0;
  }
  rtlflow.run();
  for(size_t i = 0; i < NUM_INPUTS; ++i) {
    *rtlflow.get(dut->clock, i) = 1;
  }
  rtlflow.run();
}

void reset(
  RF::RTLflow& rtlflow, 
  RF::Top* dut, 
  size_t NUM_INPUTS=1
) {

	// meta reset circuit for one cycle
  for(size_t i = 0; i < NUM_INPUTS; ++i) {
    *rtlflow.get(dut->io_meta_reset, i) = 1;
  }
  step(rtlflow, dut, NUM_INPUTS);

  for(size_t i = 0; i < NUM_INPUTS; ++i) {
    *rtlflow.get(dut->io_meta_reset, i) = 0;
    *rtlflow.get(dut->reset, i) = 1;
  }
  step(rtlflow, dut, NUM_INPUTS);

  for(size_t i = 0; i < NUM_INPUTS; ++i) {
    *rtlflow.get(dut->reset, i) = 0;
  }
}

void sim(
  const size_t NUM_INPUTS,
  const std::vector<std::vector<std::vector<uint8_t>>>& inputs,
  const std::vector<size_t>& assert_idxs,
  const std::filesystem::path& cov_file,
  const std::filesystem::path& output_dir
) {
	print_header();

  auto dut = new RF::Top;
  RF::RTLflow rtlflow(dut);

  std::vector<std::vector<uint8_t>> coverages(NUM_INPUTS);
  RF::RFCoverage cov(COVERAGE_SIZE, NUM_INPUTS);
  for(auto&& c: coverages) {
    c.resize(COVERAGE_SIZE);
  }
  cov.load_coverage(cov_file);
  rtlflow.initialize();

  // reset inputs
  //std::vector<std::vector<std::vector<uint8_t>>> reset_inputs(NUM_INPUTS);
  //for(auto& input: reset_inputs) {
    //input.resize(1);
    //for(auto& each: input) {
      //each.resize(INPUT_SIZE, 0);
    //}
  //}
  //apply_input(rtlflow, dut, NUM_INPUTS, 0, reset_inputs);
  reset(rtlflow, dut, NUM_INPUTS);

  std::cerr << "start simulation\n";

  // each file should have same input lenth
  std::vector<bool> finishes(NUM_INPUTS, false);
  size_t all_finished{0};
  size_t cycle{0};

  while(1) {

    for(size_t i = 0; i < NUM_INPUTS; ++i) {
      if(!finishes[i] && (cycle >= inputs[i].size())) {
        rtlflow.done[i] = true;
        ++all_finished;
        finishes[i] = true;
      }
    }

    if(all_finished == NUM_INPUTS) {
      break;
    }

    apply_input(rtlflow, dut, NUM_INPUTS, cycle, inputs);
    step(rtlflow, dut, NUM_INPUTS);

    ++cycle;
  }

	std::cout << "Simulation completed after " << cycle << " cycles\n";
  std::cerr << "Reading coverages....\n";

  read_coverages(rtlflow, dut, NUM_INPUTS, coverages);

  std::cerr << "Caculating coverages....\n";
  cov.caculate_coverage(coverages, assert_idxs);

  std::cerr << "Saving coverages....\n";
  for(size_t i = 0; i < NUM_INPUTS; ++i) {
    cov.save_one_coverage(output_dir / "cov" / (std::to_string(i) + ".cov"), i);
  }

  cov.save_total_coverage(output_dir / "cov" / "union.cov");
  //fuzzer.push(coverage, CoverageSize);


	//fuzzer.init(CoverageSize, InputSize, instance_id);

	// finish last cycle
  //rtlflow.run();
}

