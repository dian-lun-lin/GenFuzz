// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Top__Syms.h"
#include "Top.h"
// begin of namespace RF =====================================
namespace RF {



    // FUNCTIONS
    Top__Syms::~Top__Syms()
    {
    }
    
    Top__Syms::Top__Syms(VerilatedContext* contextp, Top* topp, const char* namep)
        // Setup locals
      : VerilatedSyms{contextp}
        , __Vm_namep(namep)
        , __Vm_didInit(false)
        // Setup submodule names
    {
        // Pointer to top level
        TOPp = topp;
        // Setup each module's pointers to their submodules
        // Setup each module's pointer back to symbol table (for public functions)
        TOPp->__Vconfigure(this, true);
    }
} // end of namespace RF ==================================== 
