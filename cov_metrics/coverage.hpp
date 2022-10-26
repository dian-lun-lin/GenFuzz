#pragma once

#include <rtlflow.h>
#include <filesystem>

namespace RF {
// ==================================================================
//
// Declaration/Definition of CoverageManager
//
// ==================================================================

class CoverageManager {

  public:

      CoverageManager(size_t NUM_INPUTS): _NUM_INPUTS{NUM_INPUTS} {}
  
      virtual void load_coverage(const std::filesystem::path& file_name) = 0;
      virtual void save_total_coverage(const std::filesystem::path& filename) = 0;
      virtual void save_one_coverage(const std::filesystem::path& file_name, size_t idx) = 0;
      virtual void caculate_coverage(const RTLflow& rtlflow) = 0;


  protected:

      size_t _NUM_INPUTS;

      std::vector<size_t> _incremental_covs;
      std::vector<size_t> _delta_covs;
      size_t _total_cov{0};
      size_t _prev_cov{0};
};

  
}
