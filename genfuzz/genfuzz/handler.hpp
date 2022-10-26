#pragma once

#include "ga/ga_manager.hpp"

namespace gf { // begin of namespace gf ========================================

// ====================================================================
//
// Definition of Handler
//
// ====================================================================

class Handler {

  public:

    Handler(
      size_t num_inputs,
      const std::string& dir
    );

    virtual ~Handler(); 

    void define_taskflow(tf::Taskflow& taskflow);

  protected:

    GAManager _gam;
    size_t _num_inputs;
    size_t _prev_coverage{0};
    size_t _coverage{0};
    size_t _iter{0};

    bool _is_init{false};

    std::filesystem::path _dir;
    std::filesystem::path _pool_dir;
    std::filesystem::path _iter_dir;
    std::chrono::time_point<std::chrono::steady_clock> _tic;
    std::chrono::time_point<std::chrono::steady_clock> _toc;


    virtual void _initialize() = 0;
    virtual void _create_dir() = 0;
    virtual void _get_results() = 0;
    virtual void _process_results() = 0;
    virtual void _remove_dir() = 0;
    virtual void _apply_ga() = 0;

    void _generate_pool();

};

// ====================================================================
//
// Definition of Handler
//
// ====================================================================

Handler::Handler(
  size_t num_inputs,
  const std::string& dir
): _num_inputs{num_inputs}, _dir{dir} {
  _tic = std::chrono::steady_clock::now();
  _pool_dir = _dir / "pool";
  _iter = 0;
}

Handler::~Handler() {
}

void Handler::define_taskflow(tf::Taskflow& taskflow) {

  auto start_t = taskflow.emplace([this](){ 
    _iter_dir = _dir / ("iter" + std::to_string(_iter));
    return _is_init; 
  });

  auto init_t = taskflow.emplace([this](){
    _initialize();
  }).name("Initialize");

  auto generate_pool_t = taskflow.emplace([this](){
    _generate_pool();
  }).name("generate_pool");

  auto create_dir_t = taskflow.emplace([this](){
    _create_dir();
  }).name("create_directories");

  auto apply_ga_t = taskflow.emplace([this](){
    _apply_ga();
  }).name("apply_GA");

  auto get_results_t = taskflow.emplace([this](){
    _get_results();
  }).name("get_results");

  auto process_results_t = taskflow.emplace([this](){
    _process_results();
  }).name("process_result");

  auto remove_dir_t = taskflow.emplace([this](){
    _remove_dir();
  }).name("remove_dir");

  auto end_t = taskflow.emplace([this](){

    _toc = std::chrono::steady_clock::now();

    VERBOSE_MSG("Iteration: " << _iter << "\n");
    VERBOSE_MSG("Current coverage: " << _coverage << "\n");
    auto duration = std::chrono::duration_cast<std::chrono::seconds>(_toc - _tic).count();
    VERBOSE_MSG("Execution time: " << duration << "s\n");

    ++_iter;
  }).name("end");

  start_t.precede(init_t, create_dir_t);
  create_dir_t.precede(generate_pool_t);
  generate_pool_t.precede(apply_ga_t);
  apply_ga_t.precede(get_results_t);
  get_results_t.precede(process_results_t);
  process_results_t.precede(remove_dir_t);
  remove_dir_t.precede(end_t);
}

void Handler::_generate_pool() {
  auto in_dir = _pool_dir / "in";
  auto cov_dir = _pool_dir / "cov";
  _gam.generate_pool(_coverage, _num_inputs, in_dir, cov_dir);
}

// ====================================================================
//
// Declaration of RegHandler
//
// ====================================================================

class RegHandler: public Handler {

  public:

    RegHandler(
      const size_t num_inputs,
      const std::string& dir,
      const std::string& design,
      const std::string& python,
      const std::string& spike,
      const std::string& rtlflow
    );

  private:

    std::string _design;
    std::filesystem::path _preprocessor{"../../cov_metrics/reg/entry.py"};
    std::filesystem::path _python;
    std::filesystem::path _rtlflow;
    std::filesystem::path _spike;

    void _initialize();
    void _create_dir();
    void _get_results();
    void _process_results();
    void _remove_dir();
    void _apply_ga();

};

// ====================================================================
//
// Definition of RegHandler
//
// ====================================================================

RegHandler::RegHandler(
  const size_t num_inputs,
  const std::string& dir,
  const std::string& design,
  const std::string& python,
  const std::string& rtlflow,
  const std::string& spike
): Handler{num_inputs, dir}, _design{design}, 
  _python{python}, _rtlflow{rtlflow}, _spike{spike}
{
}


void RegHandler::_initialize() {
  _create_dir();
  _get_results();
  _process_results();
  _remove_dir();

  _toc = std::chrono::steady_clock::now();

  VERBOSE_MSG("Iteration: " << _iter << "\n");
  VERBOSE_MSG("Current coverage: " << _coverage << "\n");
  auto duration = std::chrono::duration_cast<std::chrono::seconds>(_toc - _tic).count();
  VERBOSE_MSG("Execution time: " << duration << "s\n");

  ++_iter;
  _is_init = true;
}

void RegHandler::_apply_ga() {
  auto ga_dir = _iter_dir / "ga";
  _gam.apply_ga(_num_inputs, ga_dir, 200);
}


void RegHandler::_get_results() {
  std::stringstream ss;

  ss  << " SPIKE="      << _spike
      << " RTLFLOW="    << _rtlflow
      << " TOPLEVEL="   << _design 
      << " OUT_DIR="    << _iter_dir
      << " IS_INIT="    << _is_init
      << " NUM_INPUTS=" << _num_inputs
      << " COVERAGE_MAP=" << _pool_dir / "union.cov"
      << " " << _python << " " << _preprocessor;

  system(ss.str().c_str());
}

void RegHandler::_create_dir() {
  auto rtlflow_dir = _iter_dir / "rtlflow";

  if(!_is_init) {
    std::filesystem::create_directories(_pool_dir);
    std::filesystem::create_directories(_pool_dir / "in");
    std::filesystem::create_directories(_pool_dir / "cov");
  }

  std::filesystem::create_directories(_iter_dir);
  std::filesystem::create_directories(_iter_dir / "isa_sig");
  std::filesystem::create_directories(_iter_dir / "rtl_sig");
  std::filesystem::create_directories(_iter_dir / "ga");
  std::filesystem::create_directories(_iter_dir / "in");
  std::filesystem::create_directories(_iter_dir / "mismatch");
  std::filesystem::create_directories(_iter_dir / "mismatch" / "sim_input");
  std::filesystem::create_directories(_iter_dir / "mismatch" / "elf");
  std::filesystem::create_directories(_iter_dir / "mismatch" / "asm");
  std::filesystem::create_directories(_iter_dir / "mismatch" / "hex");
  std::filesystem::create_directories(_iter_dir / "illegal");
  std::filesystem::create_directories(_iter_dir / "illegal" / "sim_input");
  std::filesystem::create_directories(_iter_dir / "illegal" / "elf");
  std::filesystem::create_directories(_iter_dir / "illegal" / "asm");
  std::filesystem::create_directories(_iter_dir / "illegal" / "hex");
  std::filesystem::create_directories(_iter_dir / "corpus");

  std::filesystem::create_directories(rtlflow_dir);
  std::filesystem::create_directories(rtlflow_dir / "ints");
  std::filesystem::create_directories(rtlflow_dir / "memory");
  std::filesystem::create_directories(rtlflow_dir / "tohost_addr");
  std::filesystem::create_directories(rtlflow_dir / "traces");
  std::filesystem::create_directories(rtlflow_dir / "results");
}

void RegHandler::_remove_dir() {
  auto rtlflow_dir = _iter_dir / "rtlflow";
  std::filesystem::remove_all(_iter_dir / "isa_sig");
  std::filesystem::remove_all(_iter_dir / "rtl_sig");
  std::filesystem::remove_all(rtlflow_dir / "ints");
  std::filesystem::remove_all(rtlflow_dir / "memory");
  std::filesystem::remove_all(rtlflow_dir / "tohost_addr");
  std::filesystem::remove_all(rtlflow_dir / "traces");
}


void RegHandler::_process_results() {
  // copy .si and .cov files back to dir/pool/

  auto from_si_dir = _iter_dir / "in";
  auto to_si_dir = _pool_dir / "in";

  auto from_cov_dir = _iter_dir / "rtlflow" / "results";
  auto to_cov_dir = _pool_dir / "cov";
  auto to_union_cov_f = _pool_dir / "union.cov";


  for(auto& from_si_f: std::filesystem::directory_iterator(from_si_dir)) {
    auto to_si_f = to_si_dir / from_si_f.path().filename();
    std::filesystem::copy(from_si_f, to_si_f, std::filesystem::copy_options::overwrite_existing);
  }


  for(auto& from_cov_f: std::filesystem::directory_iterator(from_cov_dir)) {
    if(from_cov_f.path().extension() == ".cov") {
      auto to_cov_f = to_cov_dir / from_cov_f.path().filename();
      if(from_cov_f.path().filename() == "union.cov") {
        to_cov_f = to_union_cov_f;
      }
      std::filesystem::copy(from_cov_f, to_cov_f, std::filesystem::copy_options::overwrite_existing);
    }
  }

  // get total coverage
  VERBOSE_MSG("total delta coverage: " << _coverage - _prev_coverage << "\n");
  _prev_coverage = _coverage;

  std::ifstream in(to_union_cov_f, std::ios::in | std::ios::binary);
  if(in.is_open()) {
    in.read((char*)&_coverage,  sizeof(size_t));
  }
  else {
    assert(false);
  }
}

// ====================================================================
//
// Declaration of MuxHandler
//
// ====================================================================

class MuxHandler: public Handler {

  public:

    MuxHandler(const size_t num_inputs, const std::string& dir, const std::string& rtlflow);


  private:

    std::string _rtlflow;

    void _initialize();
    void _create_dir();
    void _get_results();
    void _process_results();
    void _remove_dir();
    void _apply_ga();

    //size_t _max_genes{500};
};

MuxHandler::MuxHandler(const size_t num_inputs, const std::string& dir, const std::string& rtlflow)
: Handler{num_inputs, dir}, _rtlflow{rtlflow} {
  //if(_design == "") {
      ////design_dir = 
  //}
}

void MuxHandler::_initialize() {
  _create_dir();
  _get_results();
  _process_results();
  _remove_dir();

  _toc = std::chrono::steady_clock::now();

  VERBOSE_MSG("Iteration: " << _iter << "\n");
  VERBOSE_MSG("Current coverage: " << _coverage << "\n");
  auto duration = std::chrono::duration_cast<std::chrono::seconds>(_toc - _tic).count();
  VERBOSE_MSG("Execution time: " << duration << "s\n");

  ++_iter;

  if(_coverage == 0) {
    _is_init = false;
  }
  else {
    _is_init = true;
  }
}

void MuxHandler::_create_dir() {
  if(!_is_init) {
    std::filesystem::create_directories(_pool_dir);
    std::filesystem::create_directories(_pool_dir / "cov");
    std::filesystem::create_directories(_pool_dir / "in");
  }

  std::filesystem::create_directories(_iter_dir);
  std::filesystem::create_directories(_iter_dir / "ga");
  std::filesystem::create_directories(_iter_dir / "cov");
  std::filesystem::create_directories(_iter_dir / "in");
}

void MuxHandler::_get_results() {
  std::stringstream ss;
  auto cov_file = _pool_dir / "union.cov";
  auto input_dir = _iter_dir / "ga";

  ss  << _rtlflow
      << " " << _num_inputs
      << " " << (_is_init ? "true" : "false")
      << " " << cov_file
      << " " << input_dir
      << " " << _iter_dir;

  system(ss.str().c_str());
}

void MuxHandler::_apply_ga() {
  auto ga_dir = _iter_dir / "ga";
  _gam.apply_ga(_num_inputs, ga_dir, 30 * (_iter / 10 + 1));
}

void MuxHandler::_process_results() {
  // copy .in and .cov files back to dir/pool/

  auto from_in_dir = _iter_dir / "in";
  auto to_in_dir = _pool_dir / "in";

  auto from_cov_dir = _iter_dir / "cov";
  auto to_cov_dir = _pool_dir / "cov";
  auto to_union_cov_f = _pool_dir / "union.cov";


  for(auto& from_in_f: std::filesystem::directory_iterator(from_in_dir)) {
    auto to_in_f = to_in_dir / from_in_f.path().filename();
    std::filesystem::copy(from_in_f, to_in_f, std::filesystem::copy_options::overwrite_existing);
  }


  for(auto& from_cov_f: std::filesystem::directory_iterator(from_cov_dir)) {
    auto to_cov_f = to_cov_dir / from_cov_f.path().filename();
    if(from_cov_f.path().filename() == "union.cov") {
      to_cov_f = to_union_cov_f;
    }
    std::filesystem::copy(from_cov_f, to_cov_f, std::filesystem::copy_options::overwrite_existing);
  }

  // get total coverage
  VERBOSE_MSG("total delta coverage: " << _coverage - _prev_coverage << "\n");
  _prev_coverage = _coverage;

  std::ifstream in(to_union_cov_f, std::ios::in | std::ios::binary);
  if(in.is_open()) {
    in.read((char*)&_coverage,  sizeof(size_t));
  }
  else {
    assert(false);
  }
}

void MuxHandler::_remove_dir() {
}

} // end of namespace gf ========================================
