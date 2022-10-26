import os
import shutil
import psutil
import signal
from threading import Timer

from ISASim.host import rvISAhost
from RTLSim.host import rvRTLhost

from src.preprocessor import rvPreProcessor
from src.signature_checker import sigChecker
from src.input_generator import simInput, InputGenerator
from src.multicore_manager import proc_state, procManager

ISA_TIME_LIMIT = 1

# def save_err(out: str, idx: int, manager: procManager, stop_code: int):

    # if stop_code == proc_state.NORMAL:
        # return

    # status = proc_state.tpe[stop_code]

    # manager.P('state')
    # fd = open(out + '/fuzz_log', 'a')
    # fd.write('[DifuzzRTL] Thread {}: {} occurred\n'.format(idx, status))
    # fd.close()

    # if not os.path.isdir(out + '/err'):
        # os.makedirs(out + '/err')
    # manager.V('state')

    # shutil.copyfile(out + '/.input_{}.si'.format(idx),
                    # out + '/err/err_{}_{}.si'.format(status, idx))


def isa_timeout(out, stop, idx):
    if not os.path.isdir(out + '/isa_timeout'):
        os.makedirs(out + '/isa_timeout')

    shutil.copy(out + '/.input_{}.elf'.format(idx), out + '/isa_timeout/timeout.elf')
    shutil.copy(out + '/.input_{}.S'.format(idx), out + '/isa_timeout/timeout.S')

    ps = psutil.Process()
    children = ps.children(recursive=True)
    for child in children:
        try: os.kill(child.pid, signal.SIGKILL) # SIGKILL
        except: continue

    stop[0] = proc_state.ERR_ISA_TIMEOUT

def run_isa_test(isaHost, idx, isa_input, stop, out, assert_intr=False):
#TODO: proc_num?
    ret = proc_state.NORMAL
   
    timer = Timer(ISA_TIME_LIMIT, isa_timeout, [out, stop, idx])
    timer.start()
    isa_ret = isaHost.run_test(idx, isa_input, assert_intr)
    timer.cancel()

    if stop[0] == proc_state.ERR_ISA_TIMEOUT:
        stop[0] = proc_state.NORMAL
        ret = proc_state.ERR_ISA_TIMEOUT
    elif isa_ret != 0:
        stop[0] = proc_state.ERR_ISA_ASSERT
        ret = proc_state.ERR_ISA_ASSERT

    return ret


def debug_print(message, debug, highlight=False):
    if highlight:
        print('\x1b[1;31m' + message + '\x1b[1;m')
    elif debug:
        print(message)

def save_file(file_name, mode, line):
    fd = open(file_name, mode)
    fd.write(line)
    fd.close()

def save_mismatch(base, idx, out, sim_input: simInput, data: list): #, elf, asm, hexfile, mNum):
    sim_input.save(out + '/sim_input/id_{}.si'.format(idx), data)

    elf = base + '/.input_{}.elf'.format(idx)
    asm = base + '/.input_{}.S'.format(idx)
    hexfile = base + '/.input_{}.hex'.format(idx)

    shutil.copy(elf, out + '/elf/id_{}.elf'.format(idx))
    shutil.copy(asm, out + '/asm/id_{}.S'.format(idx))
    shutil.copy(hexfile, out + '/hex/id_{}.hex'.format(idx))

def setup(num_inputs, toplevel, out, isa_sigdir, rtl_sigdir, rtlflow, rtlflow_output, coverage_map=' '):
    input_generator = InputGenerator(num_inputs)

    cc = 'riscv64-unknown-elf-gcc'
    elf2hex = 'riscv64-unknown-elf-elf2hex'
    preprocessor = rvPreProcessor(cc, elf2hex, out)

    spike = os.environ['SPIKE']

    # if not os.path.exists(isa_sigdir):
        # os.makedirs(isa_sigdir)
    
    # if not os.path.exists(rtl_sigdir):
        # os.makedirs(rtl_sigdir)

    # if debug: spike_arg = ['-l']
    spike_arg = []

    isaHost = rvISAhost(spike, spike_arg, isa_sigdir)
    rtlHost = rvRTLhost(num_inputs, toplevel, rtl_sigdir, rtlflow, rtlflow_output, coverage_map)

    checker = sigChecker(num_inputs, isa_sigdir, rtl_sigdir)

    return (input_generator, preprocessor, isaHost, rtlHost, checker)
