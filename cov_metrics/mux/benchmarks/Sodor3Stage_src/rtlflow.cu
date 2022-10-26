
#include <taskflow.hpp>

#include <cuda/algorithm/reduce.hpp>

#include "rtlflow.h"


#include "Top.h"


#include <curand.h>

#include <assert.h>

// begin of namespace RF =====================================
namespace RF {
    inline
    cudaError_t checkCuda(cudaError_t result) {
        if (result != cudaSuccess) {
            using namespace std::literals::string_literals;
            throw std::runtime_error("CUDA Runtime Error: "s + cudaGetErrorString(result));
        }
        return result;
    }
    
    __global__ void _eval_settle(Top__Syms* __restrict vlSymsp, CData* _csignals, SData* _ssignals, IData* _isignals, QData* _qsignals);
    
    RTLflow::RTLflow(Top* dut): dut{dut} {
        checkCuda(cudaMallocManaged(&_csignals, BATCH_SIZE * cuda_cmem_size * sizeof(CData)));
        checkCuda(cudaMallocManaged(&_ssignals, BATCH_SIZE * cuda_smem_size * sizeof(SData)));
        checkCuda(cudaMallocManaged(&_qsignals, BATCH_SIZE * cuda_qmem_size * sizeof(QData)));
        checkCuda(cudaMallocManaged(&_isignals, BATCH_SIZE * cuda_imem_size * sizeof(IData)));
        checkCuda(cudaMallocManaged(&change, BATCH_SIZE * sizeof(IData)));
        checkCuda(cudaMallocManaged(&done, BATCH_SIZE * sizeof(bool)));
        checkCuda(cudaMemset(change, 1, BATCH_SIZE * sizeof(IData)));
        checkCuda(cudaMemset(done, 0, BATCH_SIZE * sizeof(bool)));
    }
    RTLflow::RTLflow(const RTLflow& rtlflow) {
        dut = rtlflow.dut;
        checkCuda(cudaMallocManaged(&_csignals, BATCH_SIZE * cuda_cmem_size * sizeof(CData)));
        checkCuda(cudaMallocManaged(&_ssignals, BATCH_SIZE * cuda_smem_size * sizeof(SData)));
        checkCuda(cudaMallocManaged(&_qsignals, BATCH_SIZE * cuda_qmem_size * sizeof(QData)));
        checkCuda(cudaMallocManaged(&_isignals, BATCH_SIZE * cuda_imem_size * sizeof(IData)));
        checkCuda(cudaMallocManaged(&change, BATCH_SIZE * sizeof(IData)));
        checkCuda(cudaMallocManaged(&done, BATCH_SIZE * sizeof(bool)));
        checkCuda(cudaMemset(change, 1, BATCH_SIZE * sizeof(IData)));
        checkCuda(cudaMemset(done, 0, BATCH_SIZE * sizeof(bool)));
    }
    RTLflow::~RTLflow() {
        checkCuda(cudaFree(_csignals));
        checkCuda(cudaFree(_ssignals));
        checkCuda(cudaFree(_qsignals));
        checkCuda(cudaFree(_isignals));
        checkCuda(cudaFree(change));
        checkCuda(cudaFree(done));
    }
    
    // idx: index of testbenches
    CData* RTLflow::get(CDataLoc cdl, size_t idx) {
        return _csignals + idx * cdl.size + cdl.memloc;
    }
    SData* RTLflow::get(SDataLoc sdl, size_t idx) {
        return _ssignals + idx * sdl.size + sdl.memloc;
    }
    QData* RTLflow::get(QDataLoc qdl, size_t idx) {
        return _qsignals + idx * qdl.size + qdl.memloc;
    }
    IData* RTLflow::get(IDataLoc idl, size_t idx) {
        return _isignals + idx * idl.size + idl.memloc;
    }
    
    void RTLflow::_randomize() {
        curandGenerator_t generator;
        curandCreateGenerator(&generator,CURAND_RNG_PSEUDO_XORWOW);
        curandSetPseudoRandomGeneratorSeed(generator,(int)time(NULL));
        curandGenerate(generator, (unsigned int*)_csignals, BATCH_SIZE * cuda_cmem_size / 4);
        curandGenerate(generator, (unsigned int*)_ssignals, BATCH_SIZE * cuda_smem_size / 2);
        curandGenerate(generator, (unsigned int*)_isignals, BATCH_SIZE * cuda_imem_size);
        curandGenerate(generator, (unsigned int*)_qsignals, BATCH_SIZE * cuda_qmem_size * 2);
    }
    
    void RTLflow::run() { _executor.run(_taskflow).wait(); }
    
    tf::Taskflow& RTLflow::taskflow() { return _taskflow; }
    
    void RTLflow::_ctor_var_reset(Top__Syms* VlSymsp) {
        size_t offsetc{0};
        size_t offsets{0};
        size_t offseti{0};
        size_t offsetq{0};
        offsetc = 0;
        offsets = 0;
        offseti = 0;
        offsetq = 0;
        VlSymsp->TOPp->_ctor_var_reset(_csignals + offsetc, _ssignals + offsets, _isignals + offseti, _qsignals + offsetq);
    }
    
    void RTLflow::initialize() {
        Top__Syms* VlSymsp = dut-> __VlSymsp;
         _ctor_var_reset(VlSymsp);
        const size_t num_threads = (BATCH_SIZE < 128) ? BATCH_SIZE : 128;
        const size_t num_blocks = (num_threads < 128) ? 1 : BATCH_SIZE / num_threads;
        auto reset_cut = _cudaflow.memset(change, 1, sizeof(IData) * BATCH_SIZE);
        auto change_cut = _cudaflow.kernel(num_blocks, num_threads, 0, _change_request, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change);
        auto last_assign_cut = _cudaflow.kernel(num_blocks, num_threads, 0, _last_assign, VlSymsp, _csignals, _ssignals, _isignals, _qsignals);
        auto reduce_cut = _cudaflow.reduce(change, change + BATCH_SIZE, change, [] __device__ (IData a, IData b){ return a | b; });
        last_assign_cut.precede(change_cut);
        
        change_cut.precede(reduce_cut);
        
        auto id_4_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__4, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_4");
        auto id_6_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__6, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_6");
        auto id_7_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__7, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_7");
        auto id_8_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__8, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_8");
        auto id_9_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__9, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_9");
        auto id_10_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__10, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_10");
        auto id_16_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__16, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_16");
        auto id_17_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__17, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_17");
        auto id_18_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__18, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_18");
        auto id_19_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__19, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_19");
        auto id_20_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__20, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_20");
        auto id_21_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__21, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_21");
        auto id_22_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__22, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_22");
        auto id_23_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__23, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_23");
        auto id_25_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__25, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_25");
        auto id_26_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__26, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_26");
        auto id_27_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__27, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_27");
        auto id_29_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__29, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_29");
        auto id_30_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__30, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_30");
        auto id_31_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__31, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_31");
        auto id_32_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__32, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_32");
        auto id_1_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__1, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_1");
        auto id_2_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__2, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_2");
        auto id_24_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__24, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_24");
        auto id_28_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__28, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_28");
        auto id_36_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__36, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_36");
        auto id_37_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__37, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_37");
        auto id_38_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__38, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_38");
        auto id_40_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__40, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_40");
        auto id_41_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__41, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_41");
        auto id_42_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__42, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_42");
        auto id_43_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__43, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_43");
        auto id_44_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__44, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_44");
        auto id_45_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__45, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_45");
        auto id_46_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__46, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_46");
        auto id_47_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__47, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_47");
        auto id_48_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__48, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_48");
        auto id_49_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__49, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_49");
        auto id_50_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__50, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_50");
        auto id_34_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__34, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_34");
        auto id_35_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__35, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_35");
        auto id_39_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__39, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_39");
        auto id_52_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__52, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_52");
        auto id_5_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__5, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_5");
        auto id_11_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__11, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_11");
        auto id_12_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__12, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_12");
        auto id_13_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__13, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_13");
        auto id_14_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__14, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_14");
        auto id_15_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__15, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_15");
        auto id_51_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__51, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_51");
        auto id_53_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__53, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_53");
        auto id_54_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__54, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_54");
        auto id_55_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__55, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_55");
        auto id_56_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__56, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_56");
        auto id_57_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__57, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_57");
        auto id_58_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__58, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_58");
        auto id_59_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__59, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_59");
        auto id_60_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__60, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_60");
        auto id_61_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__61, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_61");
        auto id_62_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__62, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_62");
        auto id_63_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__63, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_63");
        auto id_64_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__64, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_64");
        auto id_65_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__65, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_65");
        auto id_66_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__66, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_66");
        auto id_67_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__67, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_67");
        auto id_68_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__68, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_68");
        auto id_69_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__69, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_69");
        auto id_70_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__70, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_70");
        auto id_71_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__71, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_71");
        auto id_72_cut = _cudaflow.kernel(num_blocks, num_threads, 0, __Vmtask__72, VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change, done).name("task_72");
        id_4_cut.precede(id_16_cut);
        id_4_cut.precede(id_25_cut);
        id_4_cut.precede(id_26_cut);
        id_4_cut.precede(id_27_cut);
        id_4_cut.precede(id_29_cut);
        id_4_cut.precede(id_30_cut);
        id_4_cut.precede(id_31_cut);
        id_4_cut.precede(id_32_cut);
        reset_cut.precede(id_4_cut);
        id_6_cut.precede(id_53_cut);
        id_6_cut.precede(id_54_cut);
        reset_cut.precede(id_6_cut);
        id_7_cut.precede(id_11_cut);
        id_7_cut.precede(id_54_cut);
        id_7_cut.precede(id_55_cut);
        id_7_cut.precede(id_56_cut);
        id_7_cut.precede(id_57_cut);
        id_7_cut.precede(id_58_cut);
        id_7_cut.precede(id_59_cut);
        reset_cut.precede(id_7_cut);
        id_8_cut.precede(id_60_cut);
        reset_cut.precede(id_8_cut);
        id_9_cut.precede(id_61_cut);
        reset_cut.precede(id_9_cut);
        id_10_cut.precede(id_62_cut);
        reset_cut.precede(id_10_cut);
        id_16_cut.precede(id_37_cut);
        id_16_cut.precede(id_42_cut);
        id_17_cut.precede(id_2_cut);
        id_17_cut.precede(id_34_cut);
        reset_cut.precede(id_17_cut);
        id_18_cut.precede(id_2_cut);
        id_18_cut.precede(id_34_cut);
        reset_cut.precede(id_18_cut);
        id_19_cut.precede(id_2_cut);
        id_19_cut.precede(id_34_cut);
        reset_cut.precede(id_19_cut);
        id_20_cut.precede(id_2_cut);
        id_20_cut.precede(id_34_cut);
        reset_cut.precede(id_20_cut);
        id_21_cut.precede(id_2_cut);
        id_21_cut.precede(id_34_cut);
        reset_cut.precede(id_21_cut);
        id_22_cut.precede(id_2_cut);
        id_22_cut.precede(id_34_cut);
        reset_cut.precede(id_22_cut);
        id_23_cut.precede(id_2_cut);
        id_23_cut.precede(id_34_cut);
        reset_cut.precede(id_23_cut);
        id_25_cut.precede(id_47_cut);
        id_26_cut.precede(id_28_cut);
        id_27_cut.precede(id_28_cut);
        id_29_cut.precede(id_24_cut);
        id_29_cut.precede(id_28_cut);
        id_30_cut.precede(id_24_cut);
        id_30_cut.precede(id_28_cut);
        id_31_cut.precede(id_24_cut);
        id_31_cut.precede(id_28_cut);
        id_32_cut.precede(id_24_cut);
        id_32_cut.precede(id_28_cut);
        id_1_cut.precede(id_2_cut);
        id_1_cut.precede(id_34_cut);
        reset_cut.precede(id_1_cut);
        id_2_cut.precede(id_35_cut);
        id_24_cut.precede(id_47_cut);
        id_28_cut.precede(id_36_cut);
        id_28_cut.precede(id_38_cut);
        id_28_cut.precede(id_40_cut);
        id_28_cut.precede(id_41_cut);
        id_28_cut.precede(id_42_cut);
        id_28_cut.precede(id_43_cut);
        id_28_cut.precede(id_44_cut);
        id_28_cut.precede(id_45_cut);
        id_28_cut.precede(id_47_cut);
        id_36_cut.precede(id_37_cut);
        id_36_cut.precede(id_46_cut);
        id_36_cut.precede(id_34_cut);
        id_36_cut.precede(id_39_cut);
        id_37_cut.precede(id_48_cut);
        id_37_cut.precede(id_52_cut);
        id_38_cut.precede(id_46_cut);
        id_40_cut.precede(id_52_cut);
        id_41_cut.precede(id_52_cut);
        id_42_cut.precede(id_48_cut);
        id_43_cut.precede(id_52_cut);
        id_44_cut.precede(id_52_cut);
        id_45_cut.precede(id_34_cut);
        id_46_cut.precede(id_52_cut);
        id_47_cut.precede(id_48_cut);
        id_47_cut.precede(id_34_cut);
        id_47_cut.precede(id_39_cut);
        id_48_cut.precede(id_49_cut);
        id_48_cut.precede(id_50_cut);
        id_49_cut.precede(last_assign_cut);
        id_50_cut.precede(last_assign_cut);
        id_34_cut.precede(id_35_cut);
        id_34_cut.precede(id_52_cut);
        id_35_cut.precede(id_5_cut);
        id_35_cut.precede(id_51_cut);
        id_39_cut.precede(last_assign_cut);
        id_52_cut.precede(id_5_cut);
        id_52_cut.precede(id_51_cut);
        id_5_cut.precede(id_11_cut);
        id_5_cut.precede(id_12_cut);
        id_5_cut.precede(id_13_cut);
        id_5_cut.precede(id_14_cut);
        id_5_cut.precede(id_15_cut);
        id_5_cut.precede(id_53_cut);
        id_5_cut.precede(id_54_cut);
        id_5_cut.precede(id_55_cut);
        id_5_cut.precede(id_56_cut);
        id_5_cut.precede(id_57_cut);
        id_5_cut.precede(id_58_cut);
        id_5_cut.precede(id_59_cut);
        id_5_cut.precede(id_60_cut);
        id_5_cut.precede(id_61_cut);
        id_5_cut.precede(id_62_cut);
        id_5_cut.precede(id_63_cut);
        id_5_cut.precede(id_64_cut);
        id_5_cut.precede(id_65_cut);
        id_5_cut.precede(id_66_cut);
        id_5_cut.precede(id_67_cut);
        id_5_cut.precede(id_68_cut);
        id_5_cut.precede(id_69_cut);
        id_5_cut.precede(id_70_cut);
        id_5_cut.precede(id_71_cut);
        id_5_cut.precede(id_72_cut);
        id_11_cut.precede(last_assign_cut);
        id_12_cut.precede(last_assign_cut);
        id_13_cut.precede(last_assign_cut);
        id_14_cut.precede(last_assign_cut);
        id_15_cut.precede(last_assign_cut);
        id_51_cut.precede(last_assign_cut);
        id_53_cut.precede(last_assign_cut);
        id_54_cut.precede(last_assign_cut);
        id_55_cut.precede(last_assign_cut);
        id_56_cut.precede(last_assign_cut);
        id_57_cut.precede(last_assign_cut);
        id_58_cut.precede(last_assign_cut);
        id_59_cut.precede(last_assign_cut);
        id_60_cut.precede(last_assign_cut);
        id_61_cut.precede(last_assign_cut);
        id_62_cut.precede(last_assign_cut);
        id_63_cut.precede(last_assign_cut);
        id_64_cut.precede(last_assign_cut);
        id_65_cut.precede(last_assign_cut);
        id_66_cut.precede(last_assign_cut);
        id_67_cut.precede(last_assign_cut);
        id_68_cut.precede(last_assign_cut);
        id_69_cut.precede(last_assign_cut);
        id_70_cut.precede(last_assign_cut);
        id_71_cut.precede(last_assign_cut);
        id_72_cut.precede(last_assign_cut);
        auto start_t = _taskflow.emplace([=](){
                if(VL_UNLIKELY(!init)) {
                    Top::_eval_initial(VlSymsp, _csignals, _ssignals, _isignals, _qsignals);
                    int device;
                    checkCuda(cudaGetDevice(&device));
                    checkCuda(cudaMemPrefetchAsync(_csignals, BATCH_SIZE * cuda_cmem_size * sizeof(CData), device));
                    checkCuda(cudaMemPrefetchAsync(_ssignals, BATCH_SIZE * cuda_smem_size * sizeof(SData), device));
                    checkCuda(cudaMemPrefetchAsync(_isignals, BATCH_SIZE * cuda_imem_size * sizeof(IData), device));
                    checkCuda(cudaMemPrefetchAsync(_qsignals, BATCH_SIZE * cuda_qmem_size * sizeof(QData), device));
                    checkCuda(cudaMemPrefetchAsync(change, BATCH_SIZE * sizeof(IData), device));
                    checkCuda(cudaMemPrefetchAsync(done, BATCH_SIZE * sizeof(bool), device));
                    init = true;
                    return 0;
                }
                else {
                    return 1;
                }
        });
        
        auto init_detect_t = _taskflow.emplace([=](){
                if(++loop > 100) {
                    _change_request<<<num_blocks, num_threads, 0>>>(VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change);
                    checkCuda(cudaDeviceSynchronize());
                    VL_FATAL_MT("add.v", 2, "",
                        "Verilated model didn't converge"
                        "- See https://verilator.org/warn/DIDNOTCONVERGE");
                }
                return (bool)change[0];
        });
        auto init_sim_t = _taskflow.emplace([=](){
                _eval_settle<<<num_blocks, num_threads, 0>>>(VlSymsp, _csignals, _ssignals, _isignals, _qsignals);
                checkCuda(cudaDeviceSynchronize());
                _cudaflow.offload();
        });
        auto sim_t = _taskflow.emplace([=](){
                _cudaflow.offload();
        });
        auto end_t = _taskflow.emplace([=](){
                loop = 0;
        });
        
        auto detect_t = _taskflow.emplace([=](){
                if(++loop > 100) {
                    _change_request<<<num_blocks, num_threads, 0>>>(VlSymsp, _csignals, _ssignals, _isignals, _qsignals, change);
                    checkCuda(cudaDeviceSynchronize());
                    VL_FATAL_MT("add.v", 2, "",
                        "Verilated model didn't converge"
                        "- See https://verilator.org/warn/DIDNOTCONVERGE");
                }
                return (bool)change[0];
        });
        start_t.precede(init_sim_t, sim_t);
        init_sim_t.precede(init_detect_t);
        init_detect_t.precede(end_t, init_sim_t);
        
        sim_t.precede(detect_t);
        detect_t.precede(end_t, sim_t);
        std::ofstream ofs("./cudaflow.out");
        _cudaflow.dump(ofs);
    }
} // end of namespace RF ==================================== 
