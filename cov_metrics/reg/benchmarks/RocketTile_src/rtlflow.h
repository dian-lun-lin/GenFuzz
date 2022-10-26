
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
        size_t cuda_cmem_size{21011910};
        size_t cuda_smem_size{532};
        size_t cuda_imem_size{10674};
        size_t cuda_qmem_size{750};
        size_t ast_size{231714};
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
        std::vector<std::tuple<size_t, size_t, std::string>> CDcovs{
            {19963117, 1048576, "RocketTile__DOT__core__DOT__div__DOT__MulDiv_cov"}, 
            {18914501, 1048576, "RocketTile__DOT__core__DOT__csr__DOT__CSRFile_cov"}, 
            {17865747, 1048576, "RocketTile__DOT__core__DOT__Rocket_cov"}, 
            {13669168, 64, "RocketTile__DOT__frontend__DOT__icache__DOT__ICache_cov"}, 
            {13669066, 64, "RocketTile__DOT__frontend__DOT__Frontend_cov"}, 
            {12603987, 1048576, "RocketTile__DOT__dcache__DOT__pma_checker__DOT__TLB_cov"}, 
            {11555305, 1048576, "RocketTile__DOT__dcache__DOT__tlb__DOT__TLB_cov"}, 
            {10506121, 8, "RocketTile__DOT__tlMasterXbar__DOT__TLXbar_7_cov"}, 
            {10506529, 1048576, "RocketTile__DOT__dcache__DOT__DCache_cov"}, 
            {15767719, 1048576, "RocketTile__DOT__fpuOpt__DOT__FPU_cov"}, 
            {16816740, 32, "RocketTile__DOT__fpuOpt__DOT__divSqrt__DOT__divSqrtRecFNToRaw__DOT__divSqrtRawFN__DOT__DivSqrtRawFN_small_cov"}, 
            {16816670, 2, "RocketTile__DOT__fpuOpt__DOT__dfma__DOT__fma__DOT__MulAddRecFNPipe_1_cov"}, 
            {13669311, 2, "RocketTile__DOT__frontend__DOT__fq__DOT__ShiftQueue_cov"}, 
            {16816327, 2, "RocketTile__DOT__fpuOpt__DOT__sfma__DOT__fma__DOT__MulAddRecFNPipe_cov"}, 
            {13669505, 1048576, "RocketTile__DOT__frontend__DOT__tlb__DOT__TLB_1_cov"}, 
            {14718812, 1048576, "RocketTile__DOT__frontend__DOT__btb__DOT__BTB_cov"}, 
            {16816496, 128, "RocketTile__DOT__fpuOpt__DOT__fpmu__DOT__FPToFP_cov"}, 
            {18914348, 4, "RocketTile__DOT__core__DOT__ibuf__DOT__IBuf_cov"}, 
            {16816439, 32, "RocketTile__DOT__fpuOpt__DOT__ifpu__DOT__IntToFP_cov"}, 
            {16816374, 32, "RocketTile__DOT__fpuOpt__DOT__fpiu__DOT__FPToInt_cov"}, 
            {16816818, 32, "RocketTile__DOT__fpuOpt__DOT__divSqrt_1__DOT__divSqrtRecFNToRaw__DOT__divSqrtRawFN__DOT__DivSqrtRawFN_small_1_cov"}, 
            {16816865, 2, "RocketTile__DOT__dcacheArb__DOT__HellaCacheArbiter_cov"}, 
            {16816938, 1048576, "RocketTile__DOT__ptw__DOT__PTW_cov"}
        };
        std::vector<std::tuple<size_t, size_t, std::string>> SDcovs{
        };
        std::vector<std::tuple<size_t, size_t, std::string>> IDcovs{
            {10618, 1, "RocketTile__DOT__core__DOT__div__DOT__MulDiv_covSum"}, 
            {10580, 1, "RocketTile__DOT__core__DOT__csr__DOT__CSRFile_covSum"}, 
            {10539, 1, "RocketTile__DOT__core__DOT__ibuf__DOT__IBuf_covSum"}, 
            {10532, 1, "RocketTile__DOT__core__DOT__Rocket_covSum"}, 
            {10072, 1, "RocketTile__DOT__frontend__DOT__fq__DOT__ShiftQueue_covSum"}, 
            {10391, 1, "RocketTile__DOT__fpuOpt__DOT__dfma__DOT__fma__DOT__MulAddRecFNPipe_1_covSum"}, 
            {5680, 1, "RocketTile__DOT__frontend__DOT__Frontend_covSum"}, 
            {5665, 1, "RocketTile__DOT__dcache__DOT__pma_checker__DOT__TLB_covSum"}, 
            {10100, 1, "RocketTile__DOT__frontend__DOT__tlb__DOT__TLB_1_covSum"}, 
            {10283, 1, "RocketTile__DOT__fpuOpt__DOT__sfma__DOT__fma__DOT__MulAddRecFNPipe_covSum"}, 
            {5649, 1, "RocketTile__DOT__dcache__DOT__tlb__DOT__TLB_covSum"}, 
            {10335, 1, "RocketTile__DOT__fpuOpt__DOT__ifpu__DOT__IntToFP_covSum"}, 
            {5341, 1, "io_covSum"}, 
            {10367, 1, "RocketTile__DOT__fpuOpt__DOT__fpmu__DOT__FPToFP_covSum"}, 
            {5347, 1, "RocketTile__DOT__tlMasterXbar__DOT__TLXbar_7_covSum"}, 
            {10066, 1, "RocketTile__DOT__frontend__DOT__icache__DOT__ICache_covSum"}, 
            {10318, 1, "RocketTile__DOT__fpuOpt__DOT__fpiu__DOT__FPToInt_covSum"}, 
            {5620, 1, "RocketTile__DOT__dcache__DOT__DCache_covSum"}, 
            {10122, 1, "RocketTile__DOT__frontend__DOT__btb__DOT__BTB_covSum"}, 
            {10271, 1, "RocketTile__DOT__fpuOpt__DOT__FPU_covSum"}, 
            {10453, 1, "RocketTile__DOT__fpuOpt__DOT__divSqrt__DOT__divSqrtRecFNToRaw__DOT__divSqrtRawFN__DOT__DivSqrtRawFN_small_covSum"}, 
            {10460, 1, "RocketTile__DOT__fpuOpt__DOT__divSqrt_1__DOT__divSqrtRecFNToRaw__DOT__divSqrtRawFN__DOT__DivSqrtRawFN_small_1_covSum"}, 
            {10468, 1, "RocketTile__DOT__dcacheArb__DOT__HellaCacheArbiter_covSum"}, 
            {10515, 1, "RocketTile__DOT__ptw__DOT__PTW_covSum"}
        };
        std::vector<std::tuple<size_t, size_t, std::string>> QDcovs{
        };
    };
    
} // end of namespace RF ========================================
#endif  //
