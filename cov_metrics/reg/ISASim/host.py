import sys
import os
import subprocess

class isaInput():
    def __init__(self, binary, intrfile):
        self.binary = binary
        self.intrfile = intrfile

class rvISAhost():
    def __init__(self, spike, spike_args, isa_sigdir, debug=False):
        self.spike = spike
        self.spike_args = spike_args
        self.isa_sigdir = isa_sigdir

        self.debug= debug

    def debug_print(self, message):
        if self.debug:
            print(message)

    def run_test(self, idx, isa_input: isaInput, assert_intr=False):
        binary = isa_input.binary
        if assert_intr: intr = [ '--intr={}'.format(isa_input.intrfile) ]
        else: intr = []

        args = [ self.spike ] + self.spike_args + intr + \
            [ '+signature={}'.format(self.isa_sigdir + str(idx) + '.out'), binary ]

        self.debug_print('[ISAHost] Start ISA simulation')
        return subprocess.call(args)
