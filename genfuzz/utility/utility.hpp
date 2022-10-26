#pragma once

#include "declarations.h"

namespace gf { // begin of namespace gf =======================================

std::stringstream read_file_to_stream(const std::filesystem::path& file) {
  using namespace std::literals::string_literals;
    
  std::ifstream ifs{file};

  if(!ifs) {
    throw std::runtime_error("cannot open the file"s + file.c_str());
  }

  std::stringstream sstream;

  sstream << ifs.rdbuf();

  return sstream;
}

} // end of namespace gf ===================================
