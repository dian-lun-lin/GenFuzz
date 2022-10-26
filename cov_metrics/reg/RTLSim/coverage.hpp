#pragma once

#include <rtlflow.h>
#include "../../coverage.hpp"

namespace RF {

// ==================================================================
//
// Declaration/Definition of RegCoverage
//
// ==================================================================

class RegCoverage: public CoverageManager {

  public:

    RegCoverage(size_t NUM_INPUTS): CoverageManager{NUM_INPUTS} {}

    const std::vector<CData>& get_coverage_map();

    void load_coverage(const std::filesystem::path& file_name) { assert(false); };
    void load_coverage(const std::filesystem::path& file_name, RTLflow& rtlflow);
    void save_total_coverage(const std::filesystem::path& filename);
    void save_one_coverage(const std::filesystem::path& file_name, size_t idx);
    void caculate_coverage(const RTLflow& rtlflow);

  private:

    std::vector<CData> _cov_map;
};


const std::vector<CData>& RegCoverage::get_coverage_map() {
  return _cov_map;
}

void RegCoverage::load_coverage(const std::filesystem::path& file_name, RTLflow& rtlflow) {
  std::ifstream in(file_name, std::ios::in | std::ios::binary);
  if(in.is_open()) {

    in.read((char*)&_prev_cov,  sizeof(size_t));

    size_t size;
    in.read((char*)&size,  sizeof(size_t));
    _cov_map.resize(size);

    in.read((char*)(_cov_map.data()), sizeof(CData) * size);

    // we don't need to load delta covs 
  }
  else {
    std::cerr << file_name << " not load!!!!!!!!!!!!!!\n";
  }

  if(_cov_map.empty()) {
    size_t size{0};
    for(auto&& cov: rtlflow.CDcovs) {
      size += std::get<1>(cov);
    }
    _cov_map.resize(size, 0U);
  }
  else {
    // load coverage to rtlflow
    size_t acc{0};
    for(size_t i = 0; i < rtlflow.CDcovs.size(); ++i) {
      const auto& cov = rtlflow.CDcovs[i];
      for(size_t b = 0; b < _NUM_INPUTS; ++b) {
        for(size_t k = 0; k < std::get<1>(cov); ++k) {
          rtlflow._csignals[std::get<0>(cov) * _NUM_INPUTS + b * std::get<1>(cov) + k] = _cov_map[acc + k];
        }
      }
      acc += std::get<1>(cov);
    }
  }
}

void RegCoverage::caculate_coverage(const RTLflow& rtlflow) {

  _incremental_covs.clear();
  _incremental_covs.resize(_NUM_INPUTS, 0);

  _total_cov = _prev_cov;

  _delta_covs.clear();
  _delta_covs.resize(_NUM_INPUTS, 0);

  size_t cov_mask = (1 << 30) - 1;


  //for(size_t b = 0; b < _NUM_INPUTS; ++b) {
    
    //size_t cov_sum =  rtlflow._isignals[rtlflow.io_covSum * _NUM_INPUTS + b];
    //size_t cov =  cov_sum & cov_mask;
    //std::cerr << "cov sum:" << cov_sum << ", cov: " << cov << "\n";
    //_delta_covs[b] = cov;
  //}

  auto prev_cov_map = _cov_map;

  for(size_t b = 0; b < _NUM_INPUTS; ++b) {
    size_t acc = 0;

    for(auto&& cov: rtlflow.CDcovs) {
      for(size_t i = 0; i < std::get<1>(cov); ++i) {
        CData result = rtlflow._csignals[std::get<0>(cov) * _NUM_INPUTS + b * std::get<1>(cov) + i];
        CData incre_result = _cov_map[acc + i];

        CData prev_result = prev_cov_map[acc + i];

        if(incre_result == 0U && result == 1U) {
          // new incremental coverage
          _cov_map[acc + i] = 1U;
          ++_incremental_covs[b];
          ++_total_cov;
        }

        if(prev_result == 0U && result == 1U) {
          // new delta coverage
          ++_delta_covs[b];
        }
        

      }
      acc += std::get<1>(cov);
    }
  }
}

void RegCoverage::save_total_coverage(const std::filesystem::path& file_name) {
  std::ofstream out(file_name, std::ios::out | std::ios::binary);
  size_t size = _cov_map.size();

  out.write((char*)&_total_cov, sizeof(size_t));
  out.write((char*)&size, sizeof(size_t));
  out.write((char*)_cov_map.data(), sizeof(CData) * _cov_map.size());
  out.write((char*)_incremental_covs.data(), sizeof(size_t) * _incremental_covs.size());
}

void RegCoverage::save_one_coverage(const std::filesystem::path& file_name, size_t idx) {
  std::ofstream out(file_name, std::ios::out | std::ios::binary);

  out.write((char*)&idx, sizeof(size_t));
  out.write((char*)&_delta_covs[idx], sizeof(size_t));
  out.write((char*)&_incremental_covs[idx], sizeof(size_t));
}

  
}
