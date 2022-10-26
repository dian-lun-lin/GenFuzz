#pragma once

namespace gf { // begin of namespace gf ============================

// ==============================================================================
//
// Declaration of GA
//
// ==============================================================================

class GA {

  public:

    virtual void select_parents(const std::vector<Parent>& pool) = 0;
    virtual void crossover(size_t num_offsprings, size_t max_genes) = 0;
    virtual void mutate(float rate = 0.05f) = 0;

    virtual std::string name() { return "ga"; };

    void save(const std::filesystem::path& dir);

    virtual ~GA() {}



  protected:

    // selection methods
    void _top_k_select(const std::vector<Parent>& pool, float k = 0.5f);
    void _roulette_wheel_select(const std::vector<Parent>& pool, size_t num_parents);

    // crossover methods
    void _1p_crossover(size_t num_offsprings);
    void _2p_crossover(size_t num_offsprings);
    void _kp_crossover(size_t num_points, size_t num_offsprings);

    void _concate_crossover(size_t num_offsprings);
    void _1p_concate_crossover(size_t num_offsprings, size_t max_genes);

    // mutation methods
    void _random_mutate(float rate = 0.05f);
    void _random_mutate_v2(float rate = 0.05f);
    void _pure_mutate(size_t num_offsprings, float rate);
    void _insertion_mutate();

    std::vector<const Parent*> _parents;
    std::vector<Offspring> _offsprings;
    std::random_device _rd{};
    std::mt19937 _eng{_rd()};
};

// ==============================================================================
//
// Definition of GA
//
// ==============================================================================

void GA::save(const std::filesystem::path& dir) {
  if(std::filesystem::is_directory(dir)) {
    
    for(auto& os: _offsprings) {
      os._save(dir / (std::to_string(os._id) + ".ga"));
    }
  }
  else {
    std::runtime_error("Directory dose not exist.");
  }
}

// select top k parents
void GA::_top_k_select(const std::vector<Parent>& pool, float k) {
  _parents.clear();

  for(const auto& par: pool) {
    _parents.push_back(&par);
  }

  auto top_k = _parents.size() * k;

  std::nth_element(_parents.begin(), _parents.begin() + top_k, _parents.end(), [](const Parent* a, const Parent* b) {
    return a->_fitness > b->_fitness;
  });


  _parents.resize(top_k);

}

// select use distribution to select parents
void GA::_roulette_wheel_select(const std::vector<Parent>& pool, size_t num_parents) {
  _parents.clear();

  // pool should be already sorted
  size_t all_score = 0;
  for(auto&& p: pool) {
    all_score += p._fitness;
  }

  std::cerr << "all score: " << all_score << "\n";
  if(all_score == 0) {
    std::uniform_int_distribution<size_t> distr(0, pool.size() - 1);
    // all zero, random choose
    while(_parents.size() < num_parents) {
      auto random = distr(_eng);
      _parents.push_back(&pool[random]);
    }
    
  }
  else {
    std::uniform_int_distribution<size_t> distr(1, all_score);

    while(_parents.size() < num_parents) {
      auto random = distr(_eng);
      size_t current = 0;
      for(int c = pool.size() - 1; c >= 0; --c) {
        current += pool[c]._fitness;
        if(current >= random) {
          // choose the parent
          _parents.push_back(&pool[c]);
          break;
        }
      }
    }
  }
}

// 1-point crossover
void GA::_1p_crossover(size_t num_offsprings) {
  _offsprings.clear();
  _offsprings.reserve(num_offsprings);
  std::uniform_int_distribution<> distr(0, _parents.size() - 1);
  std::uniform_int_distribution<> gene_distr(0, _parents[0]->_genes.size() - 1);


  while(_offsprings.size() < num_offsprings) {

    size_t size = _offsprings.size();
    _offsprings.emplace_back(size);
    auto& os = _offsprings[size];

    auto idx1 = distr(_eng);
    auto idx2 = distr(_eng);
    auto split = gene_distr(_eng);

    //os._template = _parents[idx1]->_template;
    //os._datas = _parents[idx1]->_datas;
    os._set_info(*_parents[idx1]);

    std::copy(
      _parents[idx1]->_genes.begin(), 
      _parents[idx1]->_genes.begin() + split,
      std::back_inserter(os._genes)
    );

    std::copy(
      _parents[idx2]->_genes.begin() + split, 
      _parents[idx2]->_genes.end(),
      std::back_inserter(os._genes)
    );
  }
}

// 2-point crossover
void GA::_2p_crossover(size_t num_offsprings) {
  _offsprings.clear();
  _offsprings.reserve(num_offsprings);
  std::uniform_int_distribution<> distr(0, _parents.size() - 1);
  std::uniform_int_distribution<> gene_distr(0, _parents[0]->_genes.size() - 1);

  while(_offsprings.size() < num_offsprings) {

    size_t size = _offsprings.size();
    _offsprings.emplace_back(size);
    auto& os = _offsprings[size];

    auto idx1 = distr(_eng);
    auto idx2 = distr(_eng);

    if(_parents[idx2] > _parents[idx1]) {
      std::swap(idx1, idx2);
    }

    //os._template = _parents[idx1]->_template;
    //os._template = temp;
    //os._datas = _parents[idx1]->_datas;
    os._set_info(*_parents[idx1]);

    std::vector<int> gene_split;
    gene_split.push_back(gene_distr(_eng));
    gene_split.push_back(gene_distr(_eng));
    std::sort(gene_split.begin(), gene_split.end());

    std::copy(
      _parents[idx1]->_genes.begin(), 
      _parents[idx1]->_genes.begin() + gene_split[0], 
      std::back_inserter(os._genes)
    );

    std::copy(
      _parents[idx2]->_genes.begin() + gene_split[0], 
      _parents[idx2]->_genes.begin() + gene_split[1], 
      std::back_inserter(os._genes)
    );

    std::copy(
      _parents[idx1]->_genes.begin() + gene_split[1], 
      _parents[idx1]->_genes.end(),
      std::back_inserter(os._genes)
    );
  }
}

void GA::_kp_crossover(size_t num_points, size_t num_offsprings) {
  _offsprings.clear();
  _offsprings.reserve(num_offsprings);
  std::uniform_int_distribution<> distr(0, _parents.size() - 1);

  std::uniform_int_distribution<> gene_distr(0, _parents[0]->_genes.size() - 1);
  std::vector<int> points;
  points.push_back(0);
  points.push_back(_parents[0]->_genes.size());

  for(size_t p = 0; p < num_points; ++p) {
    auto random = gene_distr(_eng);
    while(std::find(points.begin(), points.end(), random) != points.end()) {
      random = gene_distr(_eng);
    }
    points.push_back(random);
  }

  std::sort(points.begin(), points.end());
  //std::partial_sum(points.begin(), points.end(), points.begin());

  while(_offsprings.size() < num_offsprings) {

    size_t size = _offsprings.size();
    _offsprings.emplace_back(size);
    auto& os = _offsprings[size];

    auto idx1 = distr(_eng);
    auto idx2 = distr(_eng);

    if(_parents[idx2] > _parents[idx1]) {
      std::swap(idx1, idx2);
    }

    //os._template = _parents[idx1]->_template;
    //os._datas = _parents[idx1]->_datas;
    os._set_info(*_parents[idx1]);

    for(size_t p = 1; p < points.size(); ++p) {

      if(p % 2 == 0) {
        std::copy(
          _parents[idx1]->_genes.begin() + points[p - 1], 
          _parents[idx1]->_genes.begin() + points[p], 
          std::back_inserter(os._genes)
        );
      }
      else {

        std::copy(
          _parents[idx2]->_genes.begin() + points[p - 1], 
          _parents[idx2]->_genes.begin() + points[p], 
          std::back_inserter(os._genes)
        );
      }
    }

    //std::copy(
      //_parents[idx1]->_genes.begin() + gene_split[1], 
      //_parents[idx1]->_genes.end(),
      //std::back_inserter(os._genes)
    //);
  }
}

void GA::_1p_concate_crossover(size_t num_offsprings, size_t max_genes) {
  _offsprings.clear();
  _offsprings.reserve(num_offsprings);
  std::uniform_int_distribution<> distr(0, _parents.size() - 1);

  while(_offsprings.size() < num_offsprings) {

    size_t size = _offsprings.size();
    _offsprings.emplace_back(size);
    auto& os = _offsprings[size];

    auto idx1 = distr(_eng);
    auto idx2 = distr(_eng);
    std::uniform_int_distribution<> gene_distr(0, std::min(max_genes, _parents[idx1]->_genes.size() - 1));

    //if(_parents[idx2] > _parents[idx1]) {
      //std::swap(idx1, idx2);
    //}

    //os._template = _parents[idx1]->_template;
    //os._template = temp;
    //os._datas = _parents[idx1]->_datas;
    os._set_info(*_parents[idx1]);
    auto split = gene_distr(_eng);

    std::copy(
      _parents[idx1]->_genes.begin(), 
      _parents[idx1]->_genes.begin() + split, 
      std::back_inserter(os._genes)
    );

    size_t remains = max_genes - os._genes.size();

    auto end = _parents[idx2]->_genes.end();
    if(_parents[idx2]->_genes.size() > remains) {
      end = _parents[idx2]->_genes.begin() + remains;
    }


    std::copy(
      _parents[idx2]->_genes.begin(), 
      end,
      std::back_inserter(os._genes)
    );

  }
}

void GA::_concate_crossover(size_t num_offsprings) {
  size_t MAX_GENE_SIZE = 5000;
  _offsprings.clear();
  _offsprings.reserve(num_offsprings);
  std::uniform_int_distribution<> distr(0, _parents.size() - 1);
  std::uniform_int_distribution<> gene_distr(0, _parents[0]->_genes.size() - 1);

  while(_offsprings.size() < num_offsprings) {

    size_t size = _offsprings.size();
    _offsprings.emplace_back(size);
    auto& os = _offsprings[size];

    auto idx1 = distr(_eng);
    auto idx2 = distr(_eng);

    //if(_parents[idx2] > _parents[idx1]) {
      //std::swap(idx1, idx2);
    //}

    //os._template = _parents[idx1]->_template;
    //os._template = temp;
    //os._datas = _parents[idx1]->_datas;
    os._set_info(*_parents[idx1]);

    std::copy(
      _parents[idx1]->_genes.begin(), 
      _parents[idx1]->_genes.end(), 
      std::back_inserter(os._genes)
    );

    size_t remains = MAX_GENE_SIZE - os._genes.size();

    auto end = _parents[idx2]->_genes.end();
    if(_parents[idx2]->_genes.size() > remains) {
      end = _parents[idx2]->_genes.begin() + remains;
    }


    std::copy(
      _parents[idx2]->_genes.begin(), 
      end,
      std::back_inserter(os._genes)
    );

  }
}

// random mutate
void GA::_random_mutate(float rate) {
  std::uniform_real_distribution<float> distr(0.0f, 1.0f);

  for(auto& os: _offsprings) {
    for(auto& g: os._genes) {
      auto random = distr(_eng);
      if(random < rate) {
        g._is_mutated = true;
      }
    }
  }
}

// random mutate
void GA::_random_mutate_v2(float rate) {
  std::uniform_real_distribution<float> distr(0.0f, 1.0f);

  for(auto& os: _offsprings) {
    auto random1 = distr(_eng);
    if(random1 < 0.5f) {
      for(auto& g: os._genes) {
        auto random2 = distr(_eng);
        if(random2 < rate) {
          g._is_mutated = true;
        }
      }
    }
  }
}

void GA::_pure_mutate(size_t num_offsprings, float rate) {
  std::uniform_real_distribution<float> distr(0.0f, 1.0f);
  std::uniform_int_distribution<> parent_distr(0, _parents.size() - 1);

  _offsprings.clear();
  _offsprings.reserve(num_offsprings);

  while(_offsprings.size() < num_offsprings) {
    size_t size = _offsprings.size();
    _offsprings.emplace_back(size);
    auto& os = _offsprings[size];
    auto idx = parent_distr(_eng);

    //os._template = _parents[idx]->_template;
    //os._datas = _parents[idx]->_datas;
    os._set_info(*_parents[idx]);

    os._genes = _parents[idx]->_genes;

    for(auto& g: os._genes) {
      auto random = distr(_eng);
      if(random < rate) {
        g._is_mutated = true;
      }
    }
  }
}

// insertion mutate
void GA::_insertion_mutate() {
}

// ==============================================================================
//
// Declaration of GA0
//
// use top 50% chromosomes in the pool as parents 
// single-point crossover
// if mutate = randomly generate a new word
//
// ==============================================================================

class GA0: public GA {

  public:

    void select_parents(const std::vector<Parent>& pool);
    //void crossover(size_t num_offsprings)
    void crossover(size_t num_offsprings, size_t max_genes);
    void mutate(float rate = 0.05f);

    virtual ~GA0() {}
    std::string name() { return "ga0"; }
};

// ==============================================================================
//
// Definition of GA0
//
// ==============================================================================
void GA0::select_parents(const std::vector<Parent>& pool) {
  size_t num_parents = pool.size() * 0.5f;
  _roulette_wheel_select(pool, num_parents);
}

void GA0::crossover(size_t num_offsprings, size_t max_genes) {
  _1p_concate_crossover(num_offsprings, max_genes);
  //_offsprings = _parents;
  //_pure_mutate(num_offsprings, rate);
}

//
void GA0::mutate(float rate) {
  _random_mutate(rate);
}

//void GA0::crossover(size_t num_offsprings) {
  //_offsprings.clear();
  //_offsprings.reserve(num_offsprings);
  //std::uniform_int_distribution<> distr(0, _parents.size() - 1);
  //std::uniform_int_distribution<> prefix_distr(0, _parents[0]->_prefix_genes.size() - 1);
  //std::uniform_int_distribution<> main_distr(0, _parents[0]->_main_genes.size() - 1);
  //std::uniform_int_distribution<> suffix_distr(0, _parents[0]->_suffix_genes.size() - 1);


  //while(_offsprings.size() < num_offsprings) {

    //size_t size = _offsprings.size();
    //_offsprings.emplace_back(size);
    //auto& os = _offsprings[size];

    //auto idx1 = distr(_eng);
    //auto idx2 = distr(_eng);
    //std::cerr << "chosen id: " << idx1 << ", " << idx2 << "\n";
    //auto prefix_split = prefix_distr(_eng);
    //auto main_split = main_distr(_eng);
    //auto suffix_split = suffix_distr(_eng);

    //os._template = _parents[idx1]->_template;
    //os._datas = _parents[idx1]->_datas;

    //// prefix
    //std::copy(
      //_parents[idx1]->_prefix_genes.begin(), 
      //_parents[idx1]->_prefix_genes.begin() + prefix_split, 
      //std::back_inserter(os._prefix_genes)
    //);

    //std::copy(
      //_parents[idx2]->_prefix_genes.begin() + prefix_split, 
      //_parents[idx2]->_prefix_genes.end(),
      //std::back_inserter(os._prefix_genes)
    //);

    //// main
    //std::copy(
      //_parents[idx1]->_main_genes.begin(), 
      //_parents[idx1]->_main_genes.begin() + main_split, 
      //std::back_inserter(os._main_genes)
    //);
  

    //std::copy(
      //_parents[idx2]->_main_genes.begin() + main_split, 
      //_parents[idx2]->_main_genes.end(),
      //std::back_inserter(os._main_genes)
    //);

    //// suffix
    //std::copy(
      //_parents[idx1]->_suffix_genes.begin(), 
      //_parents[idx1]->_suffix_genes.begin() + suffix_split, 
      //std::back_inserter(os._suffix_genes)
    //);

    //std::copy(
      //_parents[idx2]->_suffix_genes.begin() + suffix_split, 
      //_parents[idx2]->_suffix_genes.end(),
      //std::back_inserter(os._suffix_genes)
    //);

  //}

//}

//void GA0::mutate() {

  //std::uniform_real_distribution<float> distr(0.0f, 1.0f);

  //for(auto& os: _offsprings) {
    //for(auto& g: os._prefix_genes) {
      //auto random = distr(_eng);
      //if(random > 0.9f) {
        //g._is_mutated = true;
        //g._word = "\n_m" + std::to_string(g._id);
      //}
    //}
    //for(auto& g: os._main_genes) {
      //auto random = distr(_eng);
        ////std::cerr << "random\n";
      //if(random > 0.9f) {
        ////std::cerr << "ptr: "<<  g.get() << "\n";
        //g._is_mutated = true;
        ////std::cerr << "mmmmmm\n";
        //g._word = "\n_m" + std::to_string(g._id);
        ////std::cerr << "instr\n";
      //}
    //}
    //for(auto& g: os._suffix_genes) {
      //auto random = distr(_eng);
      //if(random > 0.9f) {
        //g._is_mutated = true;
        //g._word = "\n_m" + std::to_string(g._id);
      //}
    //}
  //}
//}

//// ==============================================================================
////
//// Declaration of GA1
////
//// ==============================================================================

//class GA1: public GA {

  //public:

    //void select_parents(const std::vector<Parent>& pool);
    //void crossover(size_t num_offsprings);
    //void mutate(float rate = 0.05f);
    //virtual ~GA1() {}
//};

//// ==============================================================================
////
//// Definition of GA1
////
//// ==============================================================================

//void GA1::select_parents(const std::vector<Parent>& pool) {
  //_top_k_select(pool, 0.5f);
//}

//void GA1::crossover(size_t num_offsprings) {
  //_2p_crossover(num_offsprings);
//}

//void GA1::mutate(float rate) {
  //_random_mutate(rate);
//}
//// ==============================================================================
////
//// Declaration of GA2
////
//// ==============================================================================

//class GA2: public GA {

  //public:

    //void select_parents(const std::vector<Parent>& pool);
    //void crossover(size_t num_offsprings);
    //void mutate(float rate = 0.05f);
    //virtual ~GA2() {}
//};

//// ==============================================================================
////
//// Definition of GA2
////
//// ==============================================================================

//void GA2::select_parents(const std::vector<Parent>& pool) {
  //_top_k_select(pool, 0.5f);
//}

//void GA2::crossover(size_t num_offsprings) {
  //_1p_crossover(num_offsprings);
//}

//void GA2::mutate(float rate) {
  ////_insertion_mutate();
  //_random_mutate(rate);
//}

//// ==============================================================================
////
//// Declaration of GA3
//// crossover: change the order of two selected parents
//// ==============================================================================

//class GA3: public GA {

  //public:

    //void select_parents(const std::vector<Parent>& pool);
    //void crossover(size_t num_offsprings);
    //void mutate(float rate = 0.05f);
    //virtual ~GA3() {}
//};

//// ==============================================================================
////
//// Definition of GA3
////
//// ==============================================================================

//void GA3::select_parents(const std::vector<Parent>& pool) {
  //_top_k_select(pool, 0.5f);
//}

//void GA3::crossover(size_t num_offsprings) {
  //_2p_crossover(num_offsprings);
//}

//void GA3::mutate(float rate) {
  ////_insertion_mutate();
  //_random_mutate(rate);
//}

//// ==============================================================================
////
//// Declaration of GA4
//// crossover: change the order of two selected parents
//// ==============================================================================

//class GA4: public GA {

  //public:

    //void select_parents(const std::vector<Parent>& pool);
    //void crossover(size_t num_offsprings);
    //void mutate(float rate = 0.05f);
    //virtual ~GA4() {}
//};

//// ==============================================================================
////
//// Definition of GA4
////
//// ==============================================================================

//void GA4::select_parents(const std::vector<Parent>& pool) {
  //_top_k_select(pool, 0.5f);
//}

//void GA4::crossover(size_t num_offsprings) {
  //_concate_crossover(num_offsprings);
//}

//void GA4::mutate(float rate) {
  ////_insertion_mutate();
  //_random_mutate(rate);
//}

} // end of namespace gf ==============================================
