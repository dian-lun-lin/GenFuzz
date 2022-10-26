if [[ "$1" == "-h" ]]; then
  echo "Usage: ./rtlflow.sh [coverage metrics] [design_name] [num_inputs]"
  echo "Available coverage metrics: reg (DIFuzzRTL), mux (RFuzz)"
  echo "Available designs for mux coverage: Sodor3Stage, Sodor5Stage, TLSPI, TLI2C, RocketTile"
  echo "Available designs for register coverage: RocketTile SmallBoomTile_1 SmallBoomTile_2"
  echo "For example, to simulate Sodor3Stage design with 256 inputs using mux coverage, use: ./rtlflow.sh mux Sodor3Stage 256"
  exit
fi

COV=$1
DESIGN=$2
NUM_INPUTS=$3
is_avail=false

if [[ "$COV" == "mux" ]]; then
  available_designs=("Sodor3Stage" "Sodor5Stage" "TLSPI" "TLI2C" "RocketTile")
fi

if [[ "$COV" == "reg" ]]; then
  available_designs=("RocketTile" "SmallBoomTile_1" "SmallBoomTile_2")
fi

for design in ${available_designs[@]}; do
  if [[ "$DESIGN" == $design ]]; then
    is_avail=true
  fi
done

if [[ "$is_avail" == "false" ]]; then
  echo "[$DESIGN] design not exists. try ./rtlflow.sh -h for more details"
  exit
fi

if [[ $NUM_INPUTS < 2 ]]; then
  echo "number of inputs should be larger than 2"
  exit
fi
  


#rtlflow --cc ./benchmarks/Sodor3Stage/Sodor3Stage_VHarness.v -I./benchmarks/Sodor3Stage/ --hierarchical --threads 8 -weight_table weights.out  -O3 --prefix Top --exe rfuzz_entry.cu --stats -CFLAGS "-O2 -DBATCH=32" -LDFLAGS "-lstdc++fs" --threads-max-mtasks 65536 -Mdir Sodor3Stage_32_build
#rtlflow --cc ./benchmarks/Sodor5Stage/Sodor5Stage_VHarness.v -I./benchmarks/Sodor5Stage/ --hierarchical --threads 8 -weight_table weights.out  -O3 --prefix Top --exe rfuzz_entry.cu --stats -CFLAGS "-O2 -DBATCH=32" -LDFLAGS "-lstdc++fs" --threads-max-mtasks 65536 -Mdir Sodor5Stage_32_build

if [[ "$COV" == "mux" ]]; then
rtlflow -Wno-fatal --cc ./mux/benchmarks/${DESIGN}/${DESIGN}_VHarness.v -I./mux/benchmarks/${DESIGN}/  --hierarchical --threads 8 -weight_table weights.out  -O3 --build -j 8 --prefix Top --exe ./entry.cu --stats -CFLAGS "-O3 -I../3rd-party/ -I../src/ -I../benchmarks/${DESIGN}/ -DBATCH=${NUM_INPUTS} -DDESIGN=${DESIGN}" -LDFLAGS "-lstdc++fs" --threads-max-mtasks 65536 -Mdir ${COV}/${DESIGN}_${NUM_INPUTS}_build
fi

if [[ "$COV" == "reg" ]]; then
rtlflow -Wno-fatal --cc ./reg/benchmarks/${DESIGN}_state.v --hierarchical --threads 8 -weight_table weights.out  -O3 --prefix Top --exe ./RTLSim/testbench.cu --stats --build -j 8 -CFLAGS "-O3 -DBATCH=${NUM_INPUTS} -D${DESIGN}" -LDFLAGS "-lstdc++fs" --threads-max-mtasks 65536 -Mdir ${COV}/${DESIGN}_${NUM_INPUTS}_build
fi

echo ""
echo "Done."
echo "You can see the binary file for simulation using RTLflow under ${COV}/${DESIGN}_${NUM_INPUTS}_build"
#cd ${DESIGN}_${NUM_INPUTS}_build

#rtlflow --cc ./benchmarks/RocketTile.e2e/RocketTile_E2EHarness.v -I./benchmarks/RocketTile.e2e/ --hierarchical --threads 8 -weight_table weights.out  -O3 --prefix Top --exe rfuzz_entry.cu --stats -CFLAGS "-O2 -DBATCH=256" -LDFLAGS "-lstdc++fs" --threads-max-mtasks 65536 -Mdir RocketTile_256_build

