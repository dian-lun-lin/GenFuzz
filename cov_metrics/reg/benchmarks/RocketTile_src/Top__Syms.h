// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef RF_VERILATED_TOP__SYMS_H_
#define RF_VERILATED_TOP__SYMS_H_  // guard

#include "rf_verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "Top.h"
// begin of namespace RF =====================================
namespace RF {

    // SYMS CLASS
    class Top__Syms : public VerilatedSyms {
      public:

        // LOCAL STATE
        const char* __Vm_namep;
        bool __Vm_didInit;

        // SUBCELL STATE
        Top*                           TOPp;

        // SCOPE NAMES
        VerilatedScope __Vscope_RocketTile__buffer__TLMonitor;
        VerilatedScope __Vscope_RocketTile__core__csr;
        VerilatedScope __Vscope_RocketTile__core__ibuf;
        VerilatedScope __Vscope_RocketTile__dcache;
        VerilatedScope __Vscope_RocketTile__dcache__tlb;
        VerilatedScope __Vscope_RocketTile__fpuOpt;
        VerilatedScope __Vscope_RocketTile__frontend;
        VerilatedScope __Vscope_RocketTile__frontend__icache;
        VerilatedScope __Vscope_RocketTile__frontend__tlb;
        VerilatedScope __Vscope_RocketTile__ptw;
        VerilatedScope __Vscope_RocketTile__tlMasterXbar;
        VerilatedScope __Vscope_RocketTile__tlMasterXbar__TLMonitor;
        VerilatedScope __Vscope_RocketTile__tlMasterXbar__TLMonitor_1;

        // CREATORS
        Top__Syms(VerilatedContext* contextp, Top* topp, const char* namep);
        ~Top__Syms();

        // METHODS
        __host__ __device__ inline const char* name() { return __Vm_namep; }

    } VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);
} // end of namespace RF ==================================== 

#endif  // guard
