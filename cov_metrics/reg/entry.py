
import os
from datetime import datetime
from src.env_parser import envParser
from src.utils import save_file
from mux import run

# register coverage entry =================================================================
# This entry file is based on DIFuzzRTL's implementation on register coverage

parser = envParser()

parser.add_option('toplevel', None, 'Toplevel module of DUT')
parser.add_option('out_dir', 'output', 'Directory to save the result')
# parser.add_option('record', 0, 'Record the result')
# parser.add_option('prob_intr', 0, 'Probability of asserting interrupt')
# parser.add_option('no_guide', 0, 'Only random testing?')
parser.add_option('is_init', 0, 'Initialize inputs?')
parser.add_option('num_inputs', 0, 'Number of inputs')
parser.add_option('rtlflow', None, 'RTLflow executable path')
parser.add_option('coverage_map', 'unify.model', 'RTLflow load cov model file')


parser.print_help()
parser.parse_option()

toplevel = parser.arg_map['toplevel'][0]
out = parser.arg_map['out_dir'][0]
is_init = parser.arg_map['is_init'][0]
num_inputs = parser.arg_map['num_inputs'][0]
rtlflow = parser.arg_map['rtlflow'][0]
coverage_map = parser.arg_map['coverage_map'][0]

# print(template, toplevel, out, is_init, num_inputs, idx, start_idx, rtlflow)


# if not os.path.isdir(out):
    # os.makedirs(out)

# if not os.path.isdir(out + '/mismatch'):
    # os.makedirs(out + '/mismatch')
    # os.makedirs(out + '/mismatch/sim_input')
    # os.makedirs(out + '/mismatch/elf')
    # os.makedirs(out + '/mismatch/asm')
    # os.makedirs(out + '/mismatch/hex')

# if not os.path.isdir(out + '/illegal'):
    # os.makedirs(out + '/illegal')
    # os.makedirs(out + '/illegal/sim_input')
    # os.makedirs(out + '/illegal/elf')
    # os.makedirs(out + '/illegal/asm')
    # os.makedirs(out + '/illegal/hex')

# if not os.path.isdir(out + '/corpus'):
    # os.makedirs(out + '/corpus')

# date = datetime.today().strftime('%Y%m%d')
# cov_log = out + '/cov_log_{}.txt'.format(date)
# if not os.path.isfile(cov_log):
    # save_file(cov_log, 'w', '{:<10}\t{:<10}\t{:<10}\n'.
              # format('time', 'iter', 'coverage'))

if num_inputs != 0:
    run(num_inputs, toplevel, rtlflow, coverage_map, out, is_init)
else:
    print("Number of inputs and cycles should not be zero!")


