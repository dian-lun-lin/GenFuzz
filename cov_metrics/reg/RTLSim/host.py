import time
import sys
import os
import json
import struct

SUCCESS = 0
ASSERTION_FAIL = 1
TIME_OUT = 2
ILL_MEM = -1

DRAM_BASE = 0x80000000

def toint(x):
    return {int(k): v for k, v in x.items()}

class rtlInput():
    def __init__(self, hexfile, intrfile, data, symbols, max_cycles):
        self.hexfile = hexfile
        self.intrfile = intrfile
        self.data = data
        self.symbols = symbols
        self.max_cycles = max_cycles

class rvRTLhost():
    def __init__(self, num_inputs, toplevel, rtl_sigdir, rtlflow, rtlflow_output, coverage_map=' '):

        self.coverage_map = coverage_map
        self.sig_dir = rtl_sigdir
        self.rtlflow = rtlflow

        self.rtlflow_output = rtlflow_output
        self.ints_dir = self.rtlflow_output + 'ints/'
        self.memory_dir = self.rtlflow_output + 'memory/'
        self.tohost_addr_dir = self.rtlflow_output + 'tohost_addr/'
        self.traces_dir = self.rtlflow_output + 'traces/'
        self.results_dir = self.rtlflow_output + 'results/'

        # if not os.path.isdir(self.rtlflow_output):
            # os.makedirs(self.rtlflow_output)




        # source_info = 'infos/' + toplevel + '_info.txt'
        # reader = tileSrcReader(source_info)

        # paths = reader.return_map()

        # self.debug = debug

        # self.adapter = tileAdapter(port_names, monitor, self.debug)

        self.bootrom = [ 0x00000297, # auipc t0, 0x0
                    0x02028593, # addi a1, t0, 32
                    0xf1402573, # csrr a0, mhartid
                    0x0182b283, # ld t0, 24(t0)
                    0x00028067, # jr t0
                    0x00000000, # no data
                    0x80000000, # Jump address
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000,
                    0x00000000 ] # no data

        self.sig_starts = []
        self.sig_ends = []
        self.bootrom_addrs = []
        self.rets = []
        self.covs = []
        self.result_mems = []
        self.num_inputs = num_inputs
        # self.best_cov
        # self.best_id


        for i in range(0, len(self.bootrom), 2):
            self.bootrom_addrs.append(0x10000 + i * 4)

    # def debug_print(self, message):
        # if self.debug:
            # print(message)

    def set_bootrom(self):
        memory = {}

        for i in range(0, len(self.bootrom), 2):
            memory[0x10000 + i * 4] = (self.bootrom[i+1] << 32) | self.bootrom[i]

        return memory

    # @coroutine
    # def clock_gen(self, clock, period=2):
        # while True:
            # clock <= 1
            # yield Timer(period / 2)
            # clock <= 0
            # yield Timer(period / 2)

    # @coroutine
    # def reset(self, clock, metaReset, reset, timer=5):
        # clkedge = RisingEdge(clock)

        # metaReset <= 1
        # for i in range(timer):
            # yield clkedge
        # metaReset <= 0
        # reset <= 1
        # for i in range(timer):
            # yield clkedge
        # reset <= 0

    def save_signature(self):
        for i in range(self.num_inputs):
            fd = open(self.sig_dir + str(i) + '.out', 'w')
            for k in range(self.sig_starts[i], self.sig_ends[i], 16):
                dump = '{:016x}{:016x}\n'.format(self.result_mems[i][k+8], self.result_mems[i][k])
                fd.write(dump)

            for (data_start, data_end) in self.data_addrs[i]:
                for k in range(data_start, data_end, 16):
                    dump = '{:016x}{:016x}\n'.format(self.result_mems[i][k+8], self.result_mems[i][k])
                    fd.write(dump)

            fd.close()

    # def get_covsum(self):
        # cov_mask = (1 << len(self.dut.io_covSum)) - 1
        # return self.dut.io_covSum.value & cov_mask

    def process_instructions(self, rtl_inputs: list, assert_intr: bool):
        # total_start = time.time()

        # self.debug_print('[RTLHost] Start RTL simulation')
        idx = 0
        for rtl_input in rtl_inputs:
            # if rtl_input == None:
                # # dump empty ints, memory 
                # with open('rtlflow_ints/ints_file' + str(idx) + '.out', 'w') as ints_file:
                    # ints_file.write('')
                # with open('rtlflow_memory/memory_file' + str(idx) + '.out', 'w') as mem_file:
                    # mem_file.write('')
                # with open('rtlflow_tohost_addr/tohost_addr' + str(idx) + '.out', 'w') as tohost_addr_file:
                    # tohost_addr_file.write('')

            fd = open(rtl_input.hexfile, 'r')
            lines = fd.readlines()
            fd.close()

            max_cycles = rtl_input.max_cycles

            symbols = rtl_input.symbols
            _start = symbols['_start']
            _end = symbols['_end_main']

            # (bootrom_addrs, memory) = self.set_bootrom()
            memory = self.set_bootrom()
            for (i, addr) in enumerate(range(_start, _end + 36, 8)):
                memory[addr] = int(lines[i], 16)

            tohost_addr = symbols['tohost']
            self.sig_starts.append(symbols['begin_signature'])
            self.sig_ends.append(symbols['end_signature'])

            memory[tohost_addr] = 0
            for addr in range(self.sig_starts[idx] // 8 * 8, self.sig_ends[idx], 8):
                memory[addr] = 0

            data = rtl_input.data
            offset = 0
            data_addrs = []
            for n in range(6):
                data_start = symbols['_random_data{}'.format(n)]
                data_end = symbols['_end_data{}'.format(n)]
                data_addrs.append((data_start, data_end))

                for i, addr in enumerate(range(data_start // 8 * 8, data_end // 8 * 8, 8)):
                    word = data[i + offset]
                    memory[addr] = word

                offset += (data_end - data_start) // 8

            self.data_addrs.append(data_addrs)

            ints = {}
            if assert_intr:
                fd = open(rtl_input.intrfile, 'r')
                intr_pairs = [ line.split(':') for line in fd.readlines() ]
                fd.close()

                for pair in intr_pairs:
                    ints[int(pair[0], 16)] = int(pair[1], 2)
        # for key, value in ints.items():
            # print (type(key))
            # print (type(value))
        # for key, value in memory.items():
            # print (type(key))
            # print (type(value))

        # dump ints, memory 
            with open(self.ints_dir + str(idx) + '.ints', 'w') as ints_file:
                ints_file.write(str(ints))
            with open(self.memory_dir + str(idx) + '.mem', 'w') as mem_file:
                mem_file.write(str(memory))
            with open(self.tohost_addr_dir + str(idx) + '.tohost', 'w') as tohost_addr_file:
                tohost_addr_file.write(str(tohost_addr))

            idx += 1

    def get_results(self):

        mem_checks = [True for _ in range(self.num_inputs)]
        for i in range(self.num_inputs):
            # get results
            with open(self.results_dir + str(i) + '.mem', 'r') as result_file:
                result_data = result_file.read()
                self.result_mems.append(json.loads(result_data, object_hook=toint))

            # with open(out + '/rtlflow_results/' + str(i) + '.cov', 'r') as cov_file:
                # self.covs.append(int((cov_file.readline().split())[0]))

        # sim_end = time.time()
        # print("Sim time: ", sim_end - sim_start)
        # yield self.adapter.stop()
        # clk_driver.kill()

        # # Check all the CPU's memory access operations occurs in DRAM
            for addr in self.result_mems[-1].keys():
                if addr not in self.bootrom_addrs and addr < DRAM_BASE:
                    mem_checks[i] = False

            if not mem_checks[i]:
                self.rets.append(ILL_MEM)
            else:
                self.rets.append(SUCCESS)


        self.save_signature()
        # self.debug_print('[RTLHost] Stop RTL simulation')

    # def get_best_and_other_results(self):

        # mem_checks = [True for _ in range(self.num_inputs)]
        # for i in range(self.num_inputs):
            # # get results
            # with open(out + '/rtlflow_results/mem' + str(i) + '.out', 'r') as result_file:
                # result_data = result_file.read()
                # self.result_mems.append(json.loads(result_data, object_hook=toint))

            # with open(out + '/rtlflow_results/' + str(i) + '.cov', 'r') as cov_file:
                # self.covs.append(int((cov_file.readline().split())[0]))

        # sim_end = time.time()
        # print("Sim time: ", sim_end - sim_start)
        # yield self.adapter.stop()
        # clk_driver.kill()

        # # Check all the CPU's memory access operations occurs in DRAM
            # for addr in self.result_mems[-1].keys():
                # if addr not in self.bootrom_addrs and addr < DRAM_BASE:
                    # mem_checks[i] = False

            # if not mem_checks[i]:
                # self.rets.append(ILL_MEM)
            # else:
                # self.rets.append(SUCCESS)

        # with open('rtlflow_results/unify.cov', 'rb') as cov_file:
            # self.best_cov, = struct.unpack('Q', cov_file.read(8))
            # self.best_id, = struct.unpack('Q', cov_file.read(8))
        # print ("cov::::" + str(self.best_cov))
        # print ("id::::" + str(self.best_id))

        # self.save_signature(result_mems, sig_starts, sig_ends, self.data_addrs, rtl_sig_dir)
        # self.save_signature()
        # self.debug_print('[RTLHost] Stop RTL simulation')



    def clear(self):
        # clear the data_addrs
        self.data_addrs = []
        self.rets = []
        self.result_mems = []
        self.covs = []

        self.sig_starts = []
        self.sig_ends = []


    def run_test(self, rtl_inputs: list, assert_intr: bool):

        self.clear()

        # call RTLflow NUM_STIMULUS MAX_CYCLES ints_file memory_file

        # TODO: change obj_dir_2

        self.process_instructions(rtl_inputs, assert_intr)

        os.system("%s %s %s %s %s %s %s %s %s"%(self.rtlflow, self.num_inputs, 200000, self.ints_dir, self.memory_dir, self.tohost_addr_dir, self.traces_dir, self.results_dir, self.coverage_map))

        # self.get_results()
        self.get_results()


        return self.rets
        # return (self.rets, self.best_cov, self.best_id)
        # return self.rets

        # TODO CYCLES?
        # if i == max_cycles - 1:
            # self.debug_print('[RTLHost] Timeout, max_cycle={}'.format(max_cycles))
            # return (TIME_OUT, self.get_covsum())

        # TODO 
        # if self.adapter.check_assert():
            # self.debug_print('[RTLHost] Assertion Failure')
            # return (ASSERTION_FAIL, self.get_covsum())


        # total_end = time.time()
        # print("Total time: ", total_end - total_start)
        
