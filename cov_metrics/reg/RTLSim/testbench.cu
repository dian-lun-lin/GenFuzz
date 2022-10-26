#include <rtlflow.h>
#include "coverage.hpp"
#include <rf_heavy.h>

#include <chrono>
#include <iostream>
//#include <algorithm/pipeline.hpp>
#include <sstream>
#include <fstream>
#include <unordered_map>
#include <assert.h>
#include "src/adapters/tile_adapter.hpp"



void read(
  const std::filesystem::path& filename,
  std::unordered_map<unsigned long long, unsigned long long>& output
) {
  std::ifstream file(filename);
  std::stringstream ss;

  if(file) {
    ss << file.rdbuf(); 
    file.close();
    unsigned long long key, value;
    char c;

    if (ss >> c && c == '{') {
      while (ss >> key)
      {
        if ((ss >> c && c == ':') && ss >> value) {
          output[key] = value;
        }
        if (ss >> c && c != ',') {
          break;
        }
      }
    }

  }
  else {
    assert(false);
  }
}

void write(
  const std::filesystem::path& filename,
  std::unordered_map<unsigned long long, unsigned long long>& output
) {
  std::ofstream file(filename);
  std::stringstream ss;

  if(file) {
    unsigned long long key, value;
    char c;

    ss << '{';
    for(auto&& pair: output) {
      ss << '\"';  
      ss << pair.first;
      ss << '\"';
      ss << ':';
      ss << pair.second;
      ss << ',';
    }
    ss.seekp(-1, std::ios_base::end);
    ss << '}';

    file << ss.rdbuf(); 
    file.close();

  }
  else {
    assert(false);
  }
}

unsigned long long read_tohost_addr(const std::filesystem::path& filename) {
  std::ifstream file(filename);
  std::stringstream ss;
  unsigned long long addr;

  if(file) {
    ss << file.rdbuf(); 
    file.close();
    ss >> addr;
  }
  else {
    assert(false);
  }

  return addr;
}

void reset(
  RF::RTLflow& rtlflow, 
  RF::Top* dut, 
  //std::vector<gf::tileAdapter>& adapters, 
  size_t NUM_STIMULI=1
) {

  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->metaReset, i) = 1;
  }

  // meta reset
  for(size_t c = 0; c < 5; ++c) {
    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *rtlflow.get(dut->clock, i) = 0;
    }
    rtlflow.run();

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *rtlflow.get(dut->clock, i) = 1;
    }
    rtlflow.run();
  }


  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->metaReset, i) = 0;
    *rtlflow.get(dut->reset, i) = 1;
  }

  // reset
  for(size_t c = 0; c < 5; ++c) {
    for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->clock, i) = 0;
    }
    rtlflow.run();

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->clock, i) = 1;
    }
    rtlflow.run();
  }


  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->reset, i) = 0;
  }
}


int main(int argc, char** argv) {

  RF::Verilated::commandArgs(argc, argv); 
  const size_t NUM_STIMULI = std::stoi(argv[1]);
  const size_t NUM_CYCLES      = std::stoi(argv[2]);
  const std::filesystem::path ints_dir{argv[3]}; 
  const std::filesystem::path memory_dir{argv[4]}; 
  const std::filesystem::path tohost_addr_dir{argv[5]}; 
  const std::filesystem::path trace_dir{argv[6]}; 
  const std::filesystem::path output_dir{argv[7]};
  const std::filesystem::path map_file{argv[8]};

  std::vector<std::unordered_map<unsigned long long, unsigned long long>> ints(NUM_STIMULI);
  std::vector<std::unordered_map<unsigned long long, unsigned long long>> memorys(NUM_STIMULI);
  std::vector<unsigned long long> tohosts(NUM_STIMULI);
  std::vector<unsigned long long> tohost_addrs(NUM_STIMULI);

  //std::cerr << ints_dir << " " << memory_dir << " " << tohost_addr_dir << " " << trace_dir << " " << output_dir << " " << map_file << "\n";
  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    read(ints_dir / (std::to_string(i) + ".ints"), ints[i]);
    read(memory_dir / (std::to_string(i) + ".mem"), memorys[i]);
    tohost_addrs[i] = read_tohost_addr(tohost_addr_dir / (std::to_string(i) + ".tohost"));
  }

  //memory.insert({tohost_addr, 0});
  //for(auto&& v: memory) {  
    //std::cerr << v.first << ": " << v.second << "\n";
  //}

  auto dut = new RF::Top;
  RF::RTLflow rtlflow(dut);
  RF::RegCoverage cov(NUM_STIMULI);

  rtlflow.initialize();

  //std::cerr << "initialize...\n";

  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->clock, i) = 0;
  }
  rtlflow.run();
  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    *rtlflow.get(dut->clock, i) = 1;
  }
  rtlflow.run();


  std::vector<gf::tileAdapter> adapters(NUM_STIMULI, gf::tileAdapter(rtlflow, dut));
  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    adapters[i].set(i);
  }
  
  //std::cerr << "reset...\n";
  reset(rtlflow, dut, NUM_STIMULI);
  //rtlflow.load_coverage_map(cov.get_coverage_map());
  cov.load_coverage(map_file, rtlflow);

  std::vector<size_t> cycles(NUM_STIMULI);

  std::chrono::microseconds sim_duration(0);
  std::chrono::microseconds eval_duration(0);
  std::chrono::time_point<std::chrono::steady_clock> eval_tic;
  std::chrono::time_point<std::chrono::steady_clock> eval_toc;
  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    adapters[i].start(memorys[i], ints[i]);
  }
  std::chrono::time_point<std::chrono::steady_clock> sim_tic = std::chrono::steady_clock::now();

  size_t all_finished{0};
  std::vector<bool> finishes(NUM_STIMULI, false);

  //std::cerr << "start simulation...\n";
  size_t c;
  for(c = 0; c < NUM_CYCLES; ++c) {
    if(c % 10000 == 0) {
      std::cout << "cycles: " << c << "\n";
    }

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *(rtlflow.get(dut->clock, i)) = 0;
    }

    eval_tic = std::chrono::steady_clock::now();
    rtlflow.run();
    eval_toc = std::chrono::steady_clock::now();
    eval_duration +=  std::chrono::duration_cast<std::chrono::microseconds>(eval_toc - eval_tic);

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *(rtlflow.get(dut->clock, i)) = 1;
    }

    eval_tic = std::chrono::steady_clock::now();
    rtlflow.run();
    eval_toc = std::chrono::steady_clock::now();
    eval_duration +=  std::chrono::duration_cast<std::chrono::microseconds>(eval_toc - eval_tic);
    

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      if(!finishes[i]) {
        adapters[i].drive_input(memorys[i], ints[i]);
        adapters[i].update();

        if(c % 10000 == 0) {
          auto tohost = memorys[i][tohost_addrs[i]];
          if(tohost != 0) {
            rtlflow.done[i] = true;
            finishes[i] = true;
            ++all_finished;
            
          }
          else {
            adapters[i].probe_tohost(tohost_addrs[i]);
          }
        }
      }
    }

    if(all_finished == NUM_STIMULI) {
      break;
    }
  }

  std::chrono::time_point<std::chrono::steady_clock> sim_toc = std::chrono::steady_clock::now();
  sim_duration =  std::chrono::duration_cast<std::chrono::microseconds>(sim_toc - sim_tic);

  //std::cout << "cycles: " << c << "\n";
  //std::cout << "Simulation time: " << std::chrono::duration_cast<std::chrono::microseconds>(sim_duration).count() << "\n";
  //std::cout << "Evaluation time: " << std::chrono::duration_cast<std::chrono::microseconds>(eval_duration).count() << "\n";
  //std::cout << "Driving input time: " << std::chrono::duration_cast<std::chrono::microseconds>(sim_duration - eval_duration).count() << "\n";
  //std::cerr << "finish simulation, start to terminate...\n";

  // stop for all =======================================
  std::vector<int> goings(NUM_STIMULI, -1);
  size_t finish_going{0};
  std::vector<int> runnings(NUM_STIMULI, -1);
  size_t finish_running{0};

  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    adapters[i].drive_stop();
    rtlflow.done[i] = false;
  }

  //std::cerr << "stop simulation......\n";
  while(finish_going < NUM_STIMULI) {
    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      if(!adapters[i].onGoing() && goings[i] == -1) {
        goings[i] = 0;
        rtlflow.done[i] = true;
      }
    }

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *(rtlflow.get(dut->clock, i)) = 0;
    }
    rtlflow.run();
    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *(rtlflow.get(dut->clock, i)) = 1;
    }
    rtlflow.run();

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      if(goings[i] == -1) {
        adapters[i].drive_input(memorys[i], ints[i]);
        adapters[i].update();
      }
      else if(goings[i] == 0) {
        goings[i] = 1;
        ++finish_going;
      }
    }
  }

  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    adapters[i].stop();
    rtlflow.done[i] = false;
  }


  while(finish_running < NUM_STIMULI) {
    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      if(!adapters[i].isRunning() && runnings[i] == -1) {
        runnings[i] = 0;
        rtlflow.done[i] = true;
      }
    }

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *(rtlflow.get(dut->clock, i)) = 0;
    }
    rtlflow.run();
    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      *(rtlflow.get(dut->clock, i)) = 1;
    }
    rtlflow.run();

    for(size_t i = 0; i < NUM_STIMULI; ++i) {
      if(runnings[i] == -1) {
        adapters[i].drive_input(memorys[i], ints[i]);
        adapters[i].update();
      }
      else if(runnings[i] == 0) {
        runnings[i] = 1;
        ++finish_running;
      }
    }
  }
  

  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    adapters[i].clear();
  }

  //std::cerr << "caculate_coverage\n";
  cov.caculate_coverage(rtlflow);
  for(size_t i = 0; i < NUM_STIMULI; ++i) {
    write(output_dir / (std::to_string(i) + ".mem"), memorys[i]);
    cov.save_one_coverage(output_dir / (std::to_string(i) + ".cov"), i);
  }

  cov.save_total_coverage(output_dir / "union.cov");
}
