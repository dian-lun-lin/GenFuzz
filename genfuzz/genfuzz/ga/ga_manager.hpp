
#pragma once
#include "chromosome.hpp"
#include "ga.hpp"
//#include "3rd-party/taskflow.hpp"
//
//


namespace gf { // begin of namespace gf ============================

// ==============================================================================
//
// Declaration of GAManager
//
// ==============================================================================


class GAManager{

  friend class GenFuzz;
  
  public:

    //GAManager(const std::string& dir);

    //~GAManager() = default;
    //GAManager(const GAManager&) = delete;
    //GAManager(GAManager&&) = delete;
    //GAManager& operator = (const GAManager&) = delete;
    //GAManager& operator = (GAManager&&) = delete;

    //void update_mutated_gene();


    //void select_parents(size_t num_parents);

    //void distribute(size_t num_gas);

    void apply_ga(size_t num_offsprings, const std::filesystem::path& dir, size_t max_genes = 2000);


    void generate_pool(
      size_t coverage,
      size_t num_inputs, 
      const std::filesystem::path& in_dir,
      const std::filesystem::path& cov_dir
    );

    void dump();

  private:

    void _caculate_fitness(size_t coverage);
    void _sort_pool();
    void _select_elites(size_t num_offsprings);

    std::random_device rd{};
    std::mt19937 eng{rd()};

    std::vector<Parent> _pool;


    //std::vector<Parent*> _parents;
    //std::vector<std::vector<Parent*>> _distributed_parents;

    size_t _iter{0};
    //float _alpha;

    std::vector<Parent> _elites;
    float _elite_rate{0.1f};
};

// ==============================================================================
//
// Definition of GAManager
//
// ==============================================================================


//GAManager::GAManager(const std::string& dir): _dir{dir} {
//}



void GAManager::apply_ga(size_t num_offsprings, const std::filesystem::path& dir, size_t max_genes) {
  DEBUG_MSG("Applying GA...\n");

  GA0 ga;
  ga.select_parents(_pool);
  ga.crossover(num_offsprings, max_genes);

  //float mutate_rate;
  //if(_iter % 20 == 0) {
    //mutate_rate = 0.9;
  //}
  //else {
  //}
  //auto mutate_rate = 1; 
  //auto mutate_rate = 0.05; 
  auto mutate_rate = std::pow(0.9, _iter);
  mutate_rate = mutate_rate > 0.05 ? mutate_rate : 0.05;
  //float mutate_rate = std::pow(0.9, _iter % 20);
  VERBOSE_MSG("Current mutate rate: " << mutate_rate << "\n");

  //auto mutate_rate = 1;

  ga.mutate(mutate_rate);

  ga.save(dir);
}

void GAManager::generate_pool(
  size_t coverage,
  size_t num_inputs,
  const std::filesystem::path& in_dir,
  const std::filesystem::path& cov_dir
) {
  DEBUG_MSG("Generating pool...\n");

  _pool.clear();
  _pool.reserve(num_inputs + _elites.size());
  _pool = _elites;

  std::vector<std::filesystem::path> infs;
  std::vector<std::filesystem::path> covfs;
  infs.reserve(num_inputs);
  covfs.reserve(num_inputs);

  if(std::filesystem::is_directory(in_dir)) {
    for(const auto& in_file: std::filesystem::directory_iterator(in_dir)) {
      infs.emplace_back(in_file.path());
    }
  }

  if(std::filesystem::is_directory(cov_dir)) {
    for(const auto& cov_file: std::filesystem::directory_iterator(cov_dir)) {
      covfs.emplace_back(cov_file.path());
    }
  }
  
  std::cerr << num_inputs << ", " << infs.size() << ", " << covfs.size() << "\n";
  assert(infs.size() == covfs.size() && infs.size() == num_inputs);

  for(size_t i = 0; i < num_inputs; ++i) {
    _pool.emplace_back(infs[i], covfs[i]);
  }

  assert(_pool.size() == num_inputs + _elites.size());

  _caculate_fitness(coverage);
  _sort_pool();
  _select_elites(_pool.size() * _elite_rate);
  ++_iter;
}

void GAManager::_caculate_fitness(size_t coverage) {
  DEBUG_MSG("Caculating fitness of each chromosome...\n");

  for(auto& chro: _pool) {
    chro.caculate_fitness(_iter, coverage);
  }
}

void GAManager::_sort_pool() {
  DEBUG_MSG("Sorting pool...\n");

  std::sort(_pool.begin(), _pool.end(), [](const Parent& a, const Parent& b) {
    return a._fitness > b._fitness;
  });
}

void GAManager::_select_elites(size_t num_offsprings) {
  DEBUG_MSG("Selecting " << num_offsprings << " elites...\n");

  _elites.clear();

  assert(_pool.size() >= num_offsprings);

  _elites.insert(_elites.end(), std::make_move_iterator(_pool.begin()), std::make_move_iterator(_pool.begin() + num_offsprings));
  _pool.erase(_pool.begin(), _pool.begin() + num_offsprings);

  DEBUG_MSG("Remaining pool size: " << _pool.size() << "\n");
}


} // end of namespace gf ===================================================

