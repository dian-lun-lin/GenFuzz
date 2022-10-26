
#ifndef RF_VERILATED_RTLFLOW_H_
#define RF_VERILATED_RTLFLOW_H_  // guard

#include <taskflow.hpp>

#include <rf_heavy.h>

#include <cuda/cudaflow.hpp>

#include <tuple>
#include "Top__Syms.h"
#include "Top.h"
// begin of namespace RF =====================================
namespace RF {
    class RTLflow {
        
        friend class Top;
      private:
        tf::Taskflow _taskflow;
        tf::cudaFlow _cudaflow;
        tf::Executor _executor{1};
        size_t cuda_cmem_size{3634};
        size_t cuda_smem_size{54};
        size_t cuda_imem_size{1176};
        size_t cuda_qmem_size{174};
        size_t ast_size{94095};
        int loop{0};
        bool init{false};
        void _randomize();
        void _ctor_var_reset(Top__Syms* VlSymsp);
        Top* dut;
      public:
        CData* _csignals{nullptr};
        SData* _ssignals{nullptr};
        IData* _isignals{nullptr};
        QData* _qsignals{nullptr};
        IData* change{nullptr};
        Top* _dut{nullptr};
        bool*  done{nullptr};
        RTLflow(Top* dut);
        RTLflow(const RTLflow&);
        ~RTLflow();
        void initialize();
        void run();
        tf::Taskflow& taskflow();
        CData* get(CDataLoc cdl, size_t idx);
        SData* get(SDataLoc sdl, size_t idx);
        QData* get(QDataLoc qdl, size_t idx);
        IData* get(IDataLoc idl, size_t idx);
    };
    
} // end of namespace RF ========================================
#endif  //
