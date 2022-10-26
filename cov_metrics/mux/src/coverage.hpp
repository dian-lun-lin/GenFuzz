#pragma once

#include <rtlflow.h>
#include "../../coverage.hpp"

namespace RF {

// ==================================================================
//
// Declaration/Definition of RFCoverage
//
// ==================================================================
//
class RFCoverage: public CoverageManager {

  public:

    RFCoverage(size_t COVERAGE_SIZE, size_t NUM_INPUTS): _COVERAGE_SIZE{COVERAGE_SIZE}, CoverageManager{NUM_INPUTS} {}


    void load_coverage(const std::filesystem::path& file_name);
    void save_total_coverage(const std::filesystem::path& filename);
    void save_one_coverage(const std::filesystem::path& file_name, size_t idx);
    void caculate_coverage(const RTLflow& rtlflow) { assert(false); };
    void caculate_coverage(const std::vector<std::vector<uint8_t>>& cov_map, const std::vector<size_t>& assert_idxs);

  private:
    
    std::vector<uint8_t> _cov_map;
    //std::vector<uint8_t> _valid_cov_map;
    size_t _COVERAGE_SIZE;
};

void RFCoverage::load_coverage(const std::filesystem::path& file_name) {
  std::ifstream in(file_name, std::ios::in | std::ios::binary);
  if(in.is_open()) {
    _cov_map.resize(_COVERAGE_SIZE);

    in.read((char*)&_prev_cov,  sizeof(size_t));

    in.read((char*)(_cov_map.data()), sizeof(uint8_t) * _COVERAGE_SIZE);

    // we don't need to load delta covs 
  }
  else {
    std::cerr << file_name << " not load!!!!!!!!!!!!!!\n";
  }
}

// Like RFuzz uses JQF technique, we need to check whether an input is valid
//
void RFCoverage::caculate_coverage(const std::vector<std::vector<uint8_t>>& coverages, const std::vector<size_t>& assert_idxs) {
  if(_cov_map.empty()) {
    _cov_map.resize(_COVERAGE_SIZE);
  }

  _incremental_covs.clear();
  _incremental_covs.resize(_NUM_INPUTS, 0);

  _total_cov = _prev_cov;

  _delta_covs.clear();
  _delta_covs.resize(_NUM_INPUTS, 0);

  auto prev_cov_map = _cov_map;

  for(size_t b = 0; b < _NUM_INPUTS; ++b) {
    // check if valid
    bool is_valid{true};
    for(auto id: assert_idxs) {
      if(coverages[b][id] != 0) {
        //std::cerr << "Invalid input is detected! Input id: " << b << "\n";
        is_valid = false;
        break;
      }
    }

    if(!is_valid) { continue; }

    for(size_t c = 0; c < _COVERAGE_SIZE; ++c) {
      for(unsigned int mask = 1; mask != 16; mask <<= 1) {
        uint8_t result = coverages[b][c] & mask;
        uint8_t prev_result = prev_cov_map[c] & mask;
        uint8_t incre_result = _cov_map[c] & mask;
        //uint8_t valid_result = _valid_cov_map[c] & mask;

        if(incre_result == 0 && result != 0) {
          // new incremental coverage
          _cov_map[c] |= result;
          ++_incremental_covs[b];
          ++_total_cov;

        }

        if(prev_result == 0 && result != 0) {
          // new delta coverage
          ++_delta_covs[b];
        }
      }
    }
  }

}

void RFCoverage::save_total_coverage(const std::filesystem::path& file_name) {
  std::ofstream out(file_name, std::ios::out | std::ios::binary);

  out.write((char*)&_total_cov, sizeof(size_t));

  out.write((char*)(_cov_map.data()), sizeof(uint8_t) * _COVERAGE_SIZE);
  out.write((char*)_incremental_covs.data(), sizeof(size_t) * _incremental_covs.size());
}

void RFCoverage::save_one_coverage(const std::filesystem::path& file_name, size_t idx) {
  std::ofstream out(file_name, std::ios::out | std::ios::binary);

  out.write((char*)&idx, sizeof(size_t));
  out.write((char*)&_delta_covs[idx], sizeof(size_t));
  out.write((char*)&_incremental_covs[idx], sizeof(size_t));
}
  
}
