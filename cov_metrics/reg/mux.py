import time
import random

from concurrent import futures

from RTLSim.host import ILL_MEM, SUCCESS, TIME_OUT, ASSERTION_FAIL

from src.utils import *
from src.multicore_manager import proc_state

random.seed(time.time())

def run(num_inputs, toplevel, rtlflow, coverage_map=' ', out='output', is_init=0, cov_log=None):

    assert toplevel in ['RocketTile', 'SmallBoomTile_1', 'SmallBoomTile_2' ], \
        '{} is not toplevel'.format(toplevel)


    isa_sigdir = out + '/isa_sig/'
    rtl_sigdir = out + '/rtl_sig/'
    rtlflow_output = out + '/rtlflow/'

    (input_generator, preprocessor, isaHost, rtlHost, checker) = \
        setup(num_inputs, toplevel, out, isa_sigdir, rtl_sigdir, rtlflow, rtlflow_output, coverage_map)

    stop = [ proc_state.NORMAL ]
    mNum = 0
    cNum = 0
    iNum = 0
    last_coverage = 0

    # begin of read/get siminput files ================================================================

    mstart_t = time.time()
    sim_inputs = []
    datas = []

    # TODO: add intr
    assert_intr = False
    assert_intrs = [assert_intr for i in range(num_inputs)]
    ga_files = [out + '/ga/{}.ga'.format(i) for i in range(num_inputs)]


    # with futures.ThreadPoolExecutor(max_workers=8) as executor:
    if is_init is 0:
        for i in range(num_inputs):
        # for sim_input, data in executor.map(input_generator.get, assert_intrs):
            (sim_input, data) = input_generator.get(assert_intr)
            sim_inputs.append(sim_input)
            datas.append(data)
    else:
        for i in range(num_inputs):
        # for sim_input, data, assert_intr in executor.map(input_generator.read_ga, ga_files):
            (sim_input, data, assert_intr) = input_generator.read_ga(out + '/ga/{}.ga'.format(i))
            sim_inputs.append(sim_input)
            datas.append(data)
    mend_t = time.time()

    # end of read/get siminput files ====================================================================

    # begin of process siminput into rtl/isa inputs ====================================================================

    isa_inputs = []
    rtl_inputs = []
    symbolss = []

    idxs = [i for i in range(num_inputs)]

    with futures.ProcessPoolExecutor(max_workers=16) as executor:
        pstart_t = time.time()
        # for i in range(num_inputs):
        for isa_input, rtl_input, symbols in executor.map(preprocessor.process, idxs, sim_inputs, datas, assert_intrs):
            # () = preprocessor.process(i, sim_inputs[i], datas[i], assert_intrs[i])
            isa_inputs.append(isa_input)
            rtl_inputs.append(rtl_input)
            symbolss.append(symbols)
        pend_t = time.time()

    # end of process siminput into rtl/isa inputs ====================================================================


    # begin of isa simulation ========================================================================================
    # 
    # if isa fails, create a new siminput

    isa_rets = [None for _ in range(num_inputs) ]

    isastart_t = time.time()
    for i in range(num_inputs):
        if isa_inputs[i]:
            isa_ret = run_isa_test(isaHost, i, isa_inputs[i], stop, out)

            # isa_rets.append(run_isa_test(isaHost, i, isa_input, stop, out, proc_num))
            # print("run isa")
            # TODO: check ERR?
            while isa_ret == proc_state.ERR_ISA_TIMEOUT or isa_ret == proc_state.ERR_ISA_ASSERT: 
                # print("isa error, find another one")
                (sim_input, data) = input_generator.get(assert_intr)
                sim_inputs[i] = sim_input
                datas[i] = data
                (isa_input, rtl_input, symbols) = preprocessor.process(i, sim_inputs[i], datas[i], assert_intr)

                isa_inputs[i] = isa_input
                rtl_inputs[i] = rtl_input
                symbolss[i] = symbols
                isa_ret = run_isa_test(isaHost, i, isa_inputs[i], stop, out)
            isa_rets[i] = isa_ret
    isaend_t = time.time()
    # print ("=============isa time " + str(isaend_t - isastart_t))

    # end of isa simulation ===========================================================================================

    # begin of rtl simulation ========================================================================================

    # rtl_rets = []
    # rtl_coverages = []

    # # give up this iteration
    # if(inum >= num_inputs / 2): 
        # continue

    rstart_t = time.time()
    rtl_rets = rtlHost.run_test(rtl_inputs, assert_intr)
    rend_t = time.time()
    # print ("=============rtl time " + str(rend_t - rstart_t))

    # end of rtl simulation ============================================================================================

    # begin of checking results between isa and rtl =====================================================================
    checkstart_t = time.time()
    for i in range(num_inputs):
        cause = '-'
        match = False
        if rtl_rets[i] == SUCCESS:
            match = checker.check(symbolss[i], isa_sigdir + str(i) + '.out', rtl_sigdir + str(i) + '.out')
        elif rtl_rets[i] == ILL_MEM:
            match = True
            # debug_print('[DifuzzRTL] Memory access outside DRAM -- {}'. \
                        # format(iNum), debug, True)
            save_mismatch(out, i, out + '/illegal',
                          sim_inputs[i], datas[i])

        if not match or rtl_rets[i] not in [SUCCESS, ILL_MEM]:
            # if multicore:
                # mNum = manager.read_num('mNum')
                # manager.write_num('mNum', mNum + 1)

            save_mismatch(out, i, out + '/mismatch',
                          sim_inputs[i], datas[i])

            if rtl_rets[i] == TIME_OUT: cause = 'Timeout'
            elif rtl_rets[i] == ASSERTION_FAIL: cause = 'Assertion fail'
            else: cause = 'Mismatch'

            print('[GFuzz] Bug -- id{} [{}]'.format(i, cause))

        sim_inputs[i].save(out + '/in/{}.si'.format(i), datas[i])

        # idx = last_coverages.index(min(last_coverages))
        # if rtl_coverages[i] > last_coverages[idx]:
            # mutator.add_corpus(sim_inputs[i])
            # last_coverages[idx] = rtl_coverages[i]
    # for i in range(num_inputs):
        # if rtl_coverages[i] > last_coverage:
            # mutator.add_corpus(sim_inputs[rtl_best_id])
    checkend_t = time.time()
    # print ("============ checking results time " + str(checkend_t - checkstart_t))

    # end of checking results between isa and rtl =====================================================================

    # if rtl_best_coverage > last_coverage:
        # save_file(cov_log, 'a', '{:<10}\t{:<10}\t{:<10}\n'.
                  # format(time.time() - start_time, start_iter + it,
                         # start_cov + rtl_best_coverage))


        # cNum += 1
        # last_coverage = rtl_best_coverage

            # dut need to change

    # mutator.update_phase(it)

            # else:
                # stop[0] = proc_state.ERR_COMPILE
                # # Compile failed
                # break


    # debug_print('[DifuzzRTL] Stop Fuzzing', debug)
