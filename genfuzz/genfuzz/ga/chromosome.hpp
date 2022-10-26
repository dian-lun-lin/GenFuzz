
#pragma once

#include "gene.hpp"

namespace gf { // begin of namespace gf ======================

// ==================================================================
//
// Declaration/Definition of Chromosome
//
// Each chromosome represents one file with instructions
//
// ==================================================================

class Chromosome {

  friend class GAManager;
  friend class GA;
  friend class GA0;
  friend class GA1;
  friend class GA2;
  friend class GA3;
  friend class Elite;

  protected:

    std::vector<Gene> _genes;

    // TODO: move these two (for register coverage) into other class?
    // TODO: include prefix, suffix into GA
    std::vector<std::string> _datas;
    std::vector<std::string> _prefix;
    std::vector<std::string> _words; // gene
    std::vector<std::string> _suffix;
    std::string _template;

};

// ===================================================================
//
// Declaration of Parent
// 
// ===================================================================

class Parent: public Chromosome {

  friend class GAManager;
  friend class GA;
  friend class GA0;
  friend class GA1;
  friend class GA2;
  friend class GA3;
  friend class Elite;
  friend class Offspring;

  public:

    Parent(
      const std::filesystem::path& in_file,
      const std::filesystem::path& cov_file
    );
    Parent(const Parent&) = default;
    Parent(Parent&&) = default;
    Parent& operator = (const Parent&) = default;
    Parent& operator = (Parent&&) = default;
    ~Parent() = default;

    //void caculate_fitness(int iter);
    void caculate_fitness(int iter, size_t cov);


  private:

    void _mux_parse(
      const std::filesystem::path& in_file,
      const std::filesystem::path& cov_file
    );

    void _reg_parse(
      const std::filesystem::path& in_file,
      const std::filesystem::path& cov_file
    );

    double _fitness{0};
    size_t _delta_cov;
    size_t _incremental_cov;
};

// =====================================================================
//
// Definition of Parent
// 
// =====================================================================
//
Parent::Parent(
  const std::filesystem::path& in_file,
  const std::filesystem::path& cov_file
) {
  switch(COVERAGE_TYPE) {

    case CoverageType::MUX:
      _mux_parse(in_file, cov_file);
      break;
    case CoverageType::REG:
      _reg_parse(in_file, cov_file);
      break;

    default:
      assert(false);
  }
}

void Parent::_mux_parse(
  const std::filesystem::path& in_file,
  const std::filesystem::path& cov_file
) {
  {
    // parse instructins as genes
    auto sstream = read_file_to_stream(in_file);
    std::string line;

    while(std::getline(sstream, line, ' ')) {
      _genes.emplace_back(line);
    }
  }

  {
    // binary coverage file
    size_t idx;
    std::ifstream in(cov_file, std::ios::in | std::ios::binary);
    in.read((char*)&idx, sizeof(size_t));
    in.read((char*)&_delta_cov, sizeof(size_t));
    in.read((char*)&_incremental_cov, sizeof(size_t));
    if(idx % 50 == 0) {
      VERBOSE_MSG("delta cov: " << _delta_cov << ", incremental coverage: "<< _incremental_cov << "\n");
    }
  }
}

void Parent::_reg_parse(
  const std::filesystem::path& in_file,
  const std::filesystem::path& cov_file
) {
  {
    // parse instructins as genes
    auto sstream = read_file_to_stream(in_file);
    std::vector<std::string> lines;
    std::string line;

    std::getline(sstream, line);
    _template = line;
    std::getline(sstream, line);

    std::getline(sstream, line);
    _genes.reserve(std::stoi(line));
    std::getline(sstream, line);

    auto insert_back = [&](std::vector<std::string>& section) {
      if(!lines.empty()) {
        std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b; });
        //std::string label = word.substr(0, word.find(":"));
        //std::string label_num = label.substr(3);
        section.emplace_back(word);
      }
      lines.clear();
    };

    std::getline(sstream, line);

    // prefix
    while(line.find("_l") == std::string::npos) {
      if (line.find("_p") != std::string::npos) {
        insert_back(_prefix);
      }
      lines.push_back(line);
      std::getline(sstream, line);
    }

    insert_back(_prefix);

    // main
    while(line.find("_s") == std::string::npos) {
      if (line.find("_l") != std::string::npos) {
        insert_back(_words);
      }
      lines.push_back(line);
      std::getline(sstream, line);
    }

    insert_back(_words);

    // suffix
    while(line.find("data:") == std::string::npos) {
      if (line.find("_s") != std::string::npos) {
        insert_back(_suffix);
      }
      lines.push_back(line);
      std::getline(sstream, line);
    }

    insert_back(_suffix);

    // data
    while(std::getline(sstream, line)) {
      _datas.push_back(line);
    }

    // use words for creating genes
    for(auto& w: _words) {
      _genes.emplace_back(w);
    }

  }
    //while(std::getline(sstream, line)) {
      //if(line.find("data:") != std::string::npos) {
        //while(std::getline(sstream, line)) {
          //_datas.push_back(line);
        //}
        //break;
      //}
      //else if (
        //line.find("_p") != std::string::npos ||
        //line.find("_l") != std::string::npos ||
        //line.find("_s") != std::string::npos 
      //) {
        //if(!lines.empty()) {
          //std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b; });
          //std::string label = word.substr(0, word.find(":"));
          //std::string label_num = label.substr(3);
          //_genes.emplace_back(word, std::stoi(label_num));
        //}

        //lines.clear();
        //lines.push_back(line);
      //}
    //}

    //if(!lines.empty()) {
      //std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b;});
      //std::string label = word.substr(0, word.find(":"));
      //std::string label_num = label.substr(3);
      //_genes.emplace_back(word, std::stoi(label_num));
    //}
  //}

  {
    // binary coverage file
    size_t idx;
    std::ifstream in(cov_file, std::ios::in | std::ios::binary);
    in.read((char*)&idx, sizeof(size_t));
    in.read((char*)&_delta_cov, sizeof(size_t));
    in.read((char*)&_incremental_cov, sizeof(size_t));
    if(idx % 50 == 0) {
      VERBOSE_MSG("delta cov: " << _delta_cov << ", incremental coverage: "<< _incremental_cov << "\n");
    }
  }
}

//Parent::Parent(
  //const std::filesystem::path& file
//): _file{file} {
  //// parse instructins as genes
  //auto sstream = read_file_to_stream(_file);
  //std::vector<std::string> lines;
  //std::string line;

  //std::getline(sstream, line);
  //_cov = std::stoi(line);
  //std::getline(sstream, line);

  //std::getline(sstream, line);
  //_template = line;
  //std::getline(sstream, line);

  //std::vector<Gene>* tmp = &_prefix_genes;

  //while(std::getline(sstream, line)) {
    //if(line.find("data:") != std::string::npos) {
      //while(std::getline(sstream, line)) {
        //_datas.push_back(line);
      //}
      //break;
    //}
    //else if(line.find("_p") != std::string::npos) {
      //if(!lines.empty()) {
        //std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b; });
        //std::string label = word.substr(0, word.find(":"));
        //std::string label_num = label.substr(3);
        //tmp->emplace_back(word, std::stoi(label_num));
      //}

      //lines.clear();
      //lines.push_back(line);
      //tmp = &_prefix_genes;
    //}
    //else if(line.find("_l") != std::string::npos) {
      //if(!lines.empty()) {
        //std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b;});
        //std::string label = word.substr(0, word.find(":"));
        //std::string label_num = label.substr(3);
        //tmp->emplace_back(word, std::stoi(label_num));
      //}

      //lines.clear();
      //lines.push_back(line);
      //tmp = &_main_genes;
    //}
    //else if(line.find("_s") != std::string::npos) {
      //if(!lines.empty()) {
        //std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b;});
        //std::string label = word.substr(0, word.find(":"));
        //std::string label_num = label.substr(3);
        //tmp->emplace_back(word, std::stoi(label_num));
      //}

      //lines.clear();
      //lines.push_back(line);
      //tmp = &_suffix_genes;
    //}
    //else {
      //lines.push_back(line);
    //}
  //}

  //if(!lines.empty()) {
    //std::string word = std::accumulate(lines.begin(), lines.end(), std::string(""), [](auto& a, auto& b){ return a + "\n" + b;});
    //std::string label = word.substr(0, word.find(":"));
    //std::string label_num = label.substr(3);
    //tmp->emplace_back(word, std::stoi(label_num));
  //}

  //std::cerr << "delta cov: " << _cov << " _template: " << _template << "\n";
//}

void Parent::caculate_fitness(int iter, size_t cov) {
  if(_fitness != 0) {
    return;
  }

  if(iter == 0) {
  _fitness = _incremental_cov + _delta_cov;
  }
  else {
    //_fitness =  _cov * std::pow(iter, 2.f);
    //_fitness = (_incremental_cov + _delta_cov) * cov;
    _fitness = (_incremental_cov + _delta_cov) * 100 * (cov / (1.0 + cov));
    //_fitness = _incremental_cov + _delta_cov;
  }
}

// =====================================================================
//
// Declaration/Definition of Offspring
// 
// =====================================================================

class Offspring: public Chromosome {

  friend class GAManager;
  friend class GA;
  friend class GA0;
  friend class GA1;
  friend class GA2;
  friend class GA3;
  friend class Elite;

  public:

    Offspring(size_t id): _id{id} {}

  private:

    void _set_info(const Parent& chro);

    void _save(const std::filesystem::path& file);

    size_t _id;
};

void Offspring::_set_info(const Parent& chro) {
  switch(COVERAGE_TYPE) {
    case CoverageType::MUX:
      break;
    case CoverageType::REG:
      _template = chro._template;
      _datas = chro._datas;
      _prefix = chro._prefix;
      _suffix = chro._suffix;
      break;

    default:
      assert(false);
  }
}

void Offspring::_save(const std::filesystem::path& file) {
  std::ofstream of(file);

  switch(COVERAGE_TYPE) {
    case CoverageType::MUX:
      for(size_t g = 0; g < _genes.size(); ++g) {
        
        if(_genes[g]._is_mutated) {
          _genes[g]._word = "_m";
        } 
        
        of << _genes[g]._word;
        if(g != _genes.size() - 1) {
          of << " ";
        }
      }
      break;
    case CoverageType::REG: {

      of << _template << "\n";
      of << _genes.size() << "\n";
      //for(auto& p: _prefix) {
        //of << p;
      //}

      for(auto& g: _genes) {
        if(g._is_mutated) {
          //g._word = "\n_m" + std::to_string(g._id);
          g._word = "\n_m";
        } 
        of << g._word;
      }

      //for(auto& s: _sufffix) {
        //of << s;
      //}

      of << "\ndata:\n";
      for(auto& d: _datas) {
        of << d << "\n";
      }
      break;
    }

    default:
      assert(false);
  }
}


} // end of namespace gf ======================
