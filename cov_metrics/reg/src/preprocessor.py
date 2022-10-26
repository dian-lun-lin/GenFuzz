import time
import os
import subprocess
import shutil
import random

from ISASim.host import isaInput
from RTLSim.host import rtlInput
from src.input_generator import simInput, templates, P_M, P_S, P_U, V_U

class rvPreProcessor():
    def __init__(self, cc, elf2hex, out_base, template='../../cov_metrics/reg/Template'):
        self.cc = cc
        self.elf2hex = elf2hex
        self.template = template
        self.base = out_base

        self.er_num = 0
        self.cc_args = [ cc, '-march=rv64g', '-mabi=lp64', '-static', '-mcmodel=medany',
                         '-fvisibility=hidden', '-nostdlib', '-nostartfiles',
                         '-I', '{}/include'.format(template),
                         '-T', '{}/include/link.ld'.format(template) ]

        self.elf2hex_args = [ elf2hex, '--bit-width', '64', '--input' ]

    def get_symbols(self, elf_name, sym_name):
        # symbol_file = self.base + '/.input.symbols'
        fd = open(sym_name, 'w')
        subprocess.call([ 'nm', elf_name], stdout=fd )
        fd.close()

        symbols = {}
        fd = open(sym_name, 'r')
        lines = fd.readlines()
        fd.close()

        for line in lines:
            symbol = line.split(' ')[2]
            addr = line.split(' ')[0]
            symbols[symbol[:-1]] = int(addr, 16)

        return symbols

    def write_isa_intr(self, isa_input, rtl_input, epc):
        fd = open(rtl_input.intrfile, 'r')
        tuples = [ line.split(':') for line in fd.readlines() ]
        fd.close()

        # TODO, assert interrupt multiple time
        assert len(tuples) == 1, 'Interrupt must be asserted only one time'
        val = int(tuples[0][1], 2)

        fd = open(isa_input.intrfile, 'w')
        fd.write('{:016x}:{:04b}\n'.format(epc, val))
        fd.close()

    def process(self, idx, sim_input: simInput, data: list, intr: bool, num_data_sections=6):
        section_size = len(data) // num_data_sections

        assert data, 'Empty data can not be processed'
        assert (section_size & (section_size - 1)) == 0, \
            'Number of memory blocks should be power of 2'

        version = sim_input.get_template()
        test_template = self.template + '/rv64-{}.S'.format(templates[version])

        if intr: DINTR = ['-DINTERRUPT']
        else: DINTR = []
        extra_args = DINTR + [ '-I', '{}/include/p'.format(self.template) ]
        if version in [ V_U ]:
            rand = data[0] & 0xffffffff
            # extra_args = DINTR + [ '-DENTROPY=0x{:08x}'.format(rand), '-std=gnu99', 
            extra_args = DINTR + [ '-DENTROPY=0x{:08x}'.format(rand), '-std=gnu99', '-O2',
                                   '-I', '{}/include/v'.format(self.template),
                                   '{}/include/v/string.c'.format(self.template),
                                   '{}/include/v/vm.c'.format(self.template) ]

        si_name = self.base + '/.input_{}.si'.format(idx)
        asm_name = self.base + '/.input_{}.S'.format(idx)
        elf_name = self.base + '/.input_{}.elf'.format(idx)
        hex_name = self.base + '/.input_{}.hex'.format(idx)
        sym_name = self.base + '/.input_{}.symbols'.format(idx)
        rtl_intr_name = self.base + '/.input_{}.rtl.intr'.format(idx)
        isa_intr_name = self.base + '/.input_{}.isa.intr'.format(idx)

        start_t = time.time()
        prefix_insts = sim_input.get_prefix()
        insts = sim_input.get_insts()
        suffix_insts = sim_input.get_suffix()
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~get Time: " + str(end_t - start_t))
        start_t = time.time()
        sim_input_ints = sim_input.ints.copy()
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~copy Time: " + str(end_t - start_t))

        start_t = time.time()
        ints = []
        for inst in insts[:-1]:
            INT = sim_input_ints.pop(0)
            if 'la' in inst:
                ints.append(INT)
                ints.append(0)
            else:
                ints.append(INT)
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~insts Time: " + str(end_t - start_t))

        start_t = time.time()
        sim_input.save(si_name, data)
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~save Time: " + str(end_t - start_t))

        start_t = time.time()
        fd = open(test_template, 'r')
        template_lines = fd.readlines()
        fd.close()
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~read Time: " + str(end_t - start_t))
        start_t = time.time()

        assembly = []
        for line in template_lines:
            assembly.append(line)
            if '_fuzz_prefix:' in line:
                for inst in prefix_insts:
                    assembly.append(inst + ';\n')

            if '_fuzz_main:' in line:
                for inst in insts:
                    assembly.append(inst + ';\n')

            if '_fuzz_suffix:' in line:
                for inst in suffix_insts:
                    assembly.append(inst + ';\n')

            for n in range(num_data_sections):
                start = n * section_size
                end = start + section_size
                if '_random_data{}'.format(n) in line:
                    k = 0
                    for i in range(start, end, 2):
                        label = ''
                        if i > start + 2 and i < end - 4:
                            label = 'd_{}_{}:'.format(n, k)
                            k += 1

                        assembly.append('{:<16}.dword 0x{:016x}, 0x{:016x}\n'.\
                                        format(label, data[i], data[i+1]))

        fd = open(asm_name, 'w')
        fd.writelines(assembly)
        fd.close()
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~write Time: " + str(end_t - start_t))

        cc_args = self.cc_args + extra_args + [ asm_name, '-o', elf_name ]

        # for arg in cc_args:
            # print (arg + " ")
        # print (*cc_args)

        start_t = time.time()
        cc_ret = -1
        while True:
            cc_ret = subprocess.call(cc_args)
            # if cc_ret == -9: cc process is killed by OS due to memory usage
            if cc_ret != -9: break
        end_t = time.time()
        # print ("~~~~~~~~~~~~~~~~~~~~~~~Time: " + str(end_t - start_t))

        if cc_ret == 0:
            start_t = time.time()
            subprocess.call(cc_args)
            # print ("~~~~~~~~~~~~~~~~~~~~" + str(cc_args[0]) + " Time: " + str(end_t - start_t))
            end_t = time.time()

            start_t = time.time()
            elf2hex_args = self.elf2hex_args + [ elf_name, '--output', hex_name]
            subprocess.call(elf2hex_args)
            end_t = time.time()
            # print (elf2hex_args)
            # print ("~~~~~~~~~~~~~~~~~~~~elf2hex Time: " + str(end_t - start_t))
            symbols= self.get_symbols(elf_name, sym_name)

            if intr:
                fuzz_main = symbols['_fuzz_main']
                fd = open(rtl_intr_name, 'w')
                for i, INT in enumerate(ints):
                    if INT:
                        fd.write('{:016x}:{:04b}\n'.format(fuzz_main + 4 * i, INT))
                fd.close()

            max_cycles = 6000
            if version in [ V_U ]:
                max_cycles = 200000
                # max_cycles = 10

            isa_input = isaInput(elf_name, isa_intr_name)
            rtl_input = rtlInput(hex_name, rtl_intr_name, data, symbols, max_cycles)
        else:
            isa_input = None
            rtl_input = None
            symbols = None

        return (isa_input, rtl_input, symbols)
