#pragma once

#include <declarations.h>

#include "handler.hpp"


namespace gf { // begin of namespace gf ========================================

// ====================================================================
//
// Declaration/Definition of GenFuzz
//
// ====================================================================

class GenFuzz {

  public:

    template <typename ...Args>
    GenFuzz(const size_t num_inputs, const Args&... args);

    void set_regcov_env(
      const std::string& design,
      const std::string& dir,
      const std::string& python,
      const std::string& spike,
      const std::string& rtlflow
    );

    void run_n(size_t n);

    void run();

  private:

    size_t _num_inputs;

    tf::Taskflow _taskflow;
    tf::Executor _executor;
    
    Handler* handler;
};

// ====================================================================
//
// Definition of GenFuzz
//
// ====================================================================

template <typename ...Args>
GenFuzz::GenFuzz(const size_t num_inputs, const Args&... args): _num_inputs{num_inputs} {
  switch(COVERAGE_TYPE) {
  
    //case CoverageType::MUX:
      //handler = new MuxHandler(_num_inputs, args...);
      //break;
    case CoverageType::REG:
      handler = new RegHandler(_num_inputs, args...);
      break;
    default:
      assert(false);
  }

  handler->define_taskflow(_taskflow);
}

void GenFuzz::run_n(size_t n) {
  _executor.run_n(_taskflow, n).wait();
}

void GenFuzz::run() {
  run_n(1);
}

} // end of namespace gf ========================================

