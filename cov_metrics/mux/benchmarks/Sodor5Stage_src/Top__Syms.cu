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
        // Setup scopes
        __Vscope_VerilatorHarness__dut__bb__core__d__regfile__mem_sparse.configure(this, name(), "VerilatorHarness.dut.bb.core.d.regfile.mem_sparse", "mem_sparse", -12, VerilatedScope::SCOPE_OTHER);
        __Vscope_VerilatorHarness__dut__bb__memory__async_data__mem_sparse.configure(this, name(), "VerilatorHarness.dut.bb.memory.async_data.mem_sparse", "mem_sparse", -12, VerilatedScope::SCOPE_OTHER);
        __Vscope_VerilatorHarness__dut__bb__memory__async_data__mem_sparse_0.configure(this, name(), "VerilatorHarness.dut.bb.memory.async_data.mem_sparse_0", "mem_sparse_0", -12, VerilatedScope::SCOPE_OTHER);
        __Vscope_VerilatorHarness__dut__bb__memory__async_data__mem_sparse_1.configure(this, name(), "VerilatorHarness.dut.bb.memory.async_data.mem_sparse_1", "mem_sparse_1", -12, VerilatedScope::SCOPE_OTHER);
        __Vscope_VerilatorHarness__dut__bb__memory__async_data__mem_sparse_2.configure(this, name(), "VerilatorHarness.dut.bb.memory.async_data.mem_sparse_2", "mem_sparse_2", -12, VerilatedScope::SCOPE_OTHER);
    }
} // end of namespace RF ==================================== 
