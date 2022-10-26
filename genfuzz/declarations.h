#pragma once

#include <filesystem>
#include <iostream>
#include <fstream>
#include <string>
#include <random>

#include <vector>
#include <unordered_map>

#include <algorithm>
#include <3rd-party/taskflow/taskflow.hpp>
#include <utility/utility.hpp>


namespace gf {

  #ifdef DEBUG
  #define DEBUG_MSG(x) do { std::cerr << x; } while (false)
  #else 
  #define DEBUG_MSG(x)
  #endif

  #ifdef VERBOSE
  #define VERBOSE_MSG(x) do { std::cout << x; } while (false)
  #else 
  #define VERBOSE_MSG(x)
  #endif

  enum class CoverageType {
    MUX,
    REG
  };

  CoverageType COVERAGE_TYPE;

  class GenFuzz;
  class GAManager;
  class GA;
  class GA0;
  class GA1;
  class Chromosome;
  class Gene;
  class Handler;
  class MuxHandler;
  class RegHandler;

}
