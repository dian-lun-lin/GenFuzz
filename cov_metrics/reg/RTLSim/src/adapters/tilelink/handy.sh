nvcc -std=c++17 utils.cu  -I /fuzz/RTLflow/include/ -I /fuzz/RTLflow/include/taskflow -I /fuzz/difuzz-rtl/Benchmarks/Verilog/obj_dir/ -I /usr/local/cuda/include --extended-lambda -Xcompiler -c
