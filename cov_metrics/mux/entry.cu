#include <chrono>
#include <algorithm>
#include <testbench.hpp>
#include <toml11/toml.hpp>


std::mt19937 _eng{(unsigned int) time(NULL)};
std::uniform_int_distribution<uint8_t> distr(0, UINT8_MAX);

void generate_random_inputs(
  uint8_t& input
) {
  input = distr(_eng);
}

void generate_random_inputs(
  const size_t NUM_INPUTS,
  std::vector<std::vector<std::vector<uint8_t>>>& inputs
) {
  inputs.clear();
  inputs.resize(NUM_INPUTS);

  for(auto&& input: inputs) {
    std::vector<uint8_t> new_cycle(INPUT_SIZE);
    input.emplace_back(std::move(new_cycle));
    for(auto& each: input[0]) {
      each = distr(_eng);
    }
  }
}

void save_inputs(
  const std::filesystem::path& dir,
  std::vector<std::vector<std::vector<uint8_t>>>& inputs
) {

  for(size_t s = 0; s < inputs.size(); ++s) {
    std::ofstream of(dir / (std::to_string(s) + ".in"));

    for(size_t c = 0; c < inputs[s].size(); ++c) {
      for(size_t i = 0; i < inputs[s][c].size(); ++i) {
        of << std::to_string(inputs[s][c][i]);
        if(i != inputs[s][c].size() - 1) {
          of << " ";
        }
      }
    }
  }
}

void read_inputs(
  const size_t NUM_INPUTS,
  const std::filesystem::path& dir,
  std::vector<std::vector<std::vector<uint8_t>>>& inputs
) {
  inputs.clear();
  inputs.resize(NUM_INPUTS);


  for(auto& each: std::filesystem::directory_iterator(dir)) {
    if(each.path().extension() == ".ga") {
      auto idx = std::stoi(each.path().stem());

      std::ifstream inf(each.path());
      std::stringstream sstream;
      std::string token;
      sstream << inf.rdbuf();

      while(std::getline(sstream, token, ' ')) {
        std::vector<uint8_t> new_cycle(INPUT_SIZE, 0);
        inputs[idx].emplace_back(std::move(new_cycle));

        for(size_t i = 0; i < INPUT_SIZE; ++i) {
          if(token == "_m") {
            generate_random_inputs(inputs[idx][inputs[idx].size() - 1][i]);
          }
          else {
            inputs[idx][inputs[idx].size() - 1][i] = std::stoi(token);
          }
      
          if(sstream.eof()) {
            // pad with zeros like RFuzz
            //for(size_t k = i; k < INPUT_SIZE; ++k) {
              //inputs[idx][inputs.size() - 1][k] = 0;
            //}
            //std::fill(
              //(inputs[idx][inputs.size() - 1]).begin() + i, 
              //(inputs[idx][inputs.size() - 1]).end(),
              //0
            //);
            break;
          }

          if(i != INPUT_SIZE - 1) {
            std::getline(sstream, token, ' ');
          }
        }
      }
    }
  }

}

void parse_assert_idx(const std::string& file, std::vector<size_t>& assert_idxs) {
  assert_idxs.clear();

  const auto data = toml::parse(file);
  const auto tables = toml::find<std::vector<toml::table>>(data, "counter");
  for(const auto& tab: tables) {
    const auto is_fail = toml::get<bool>(tab.at("fail"));
    //const auto is_fail = toml::find<bool>(tab, "fail");
    if(is_fail) {
      const auto idx = toml::get<size_t>(tab.at("index"));
      assert_idxs.push_back(idx);
    }
  }

  //std::cerr << "assert indexes: ";
  //for(auto&& idx: assert_idxs) {
    //std::cerr << idx << ", ";
  //}
  //std::cerr << "\n";
}

int main(int argc, char** argv) {

  RF::Verilated::commandArgs(argc, argv); 
  const size_t NUM_INPUTS = std::stoi(argv[1]);
  const std::string is_init{argv[2]};
  const std::filesystem::path cov_file{argv[3]};
  const std::filesystem::path input_dir{argv[4]};
  const std::filesystem::path output_dir{argv[5]};
  const std::string design = TOPLEVEL_STR;
  std::vector<size_t> assert_idxs;
  const std::string toml_f{"../../cov_metrics/mux/benchmarks/" + design + "/" + design + ".toml"}; 

  //std::cerr << "NUM_INPUTS: " << NUM_INPUTS << "\n";
  //std::cerr << "DESIGN: " << design << "\n";
  //std::cerr << "IS_INIT: " << is_init << "\n";
  //std::cerr << "toml file: " << toml_f << "\n";

  parse_assert_idx(toml_f, assert_idxs);

  std::vector<std::vector<std::vector<uint8_t>>> inputs;


  if(is_init == "true") {
    read_inputs(NUM_INPUTS, input_dir, inputs);
  }
  else {
    generate_random_inputs(NUM_INPUTS, inputs);
  }

  assert(inputs[0][0].size() == INPUT_SIZE);
  assert(NUM_INPUTS == RF::BATCH_SIZE);

  sim(NUM_INPUTS, inputs, assert_idxs, cov_file, output_dir);

  save_inputs(output_dir / "in", inputs);
}
