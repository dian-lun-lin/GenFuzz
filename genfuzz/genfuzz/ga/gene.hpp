
#pragma once


namespace gf { // begin of namespace gf =================================

// ====================================================================
//
// Declaration of Gene
//
// Each gene represents an instruction
// ====================================================================

class Gene {

  friend class GAManager;
  friend class Chromosome;
  friend class Offspring;
  friend class Parent;
  friend class GA;
  friend class GA0;
  friend class GA1;

  public:

    Gene(const std::string& word): _word(word) {
    }

    //Gene(const std::string& word, int id): _word(word), _id{id} {
    //}

  private:

    std::string _word;

    //int _id{0};

    bool _is_mutated{false};
};

} // end of namespace gf ==================================================
