# only debug use

clang++ -std=c++2b -Wall -fsanitize=address -fstack-protector -ftrapv ./cpp_src/patblt.cpp ./cpp_src/bitblt.cpp ./cpp_src/bitblt_tb.cpp -I/mnt/c/Xilinx/Vitis_HLS/2023.1/include -o a.out
