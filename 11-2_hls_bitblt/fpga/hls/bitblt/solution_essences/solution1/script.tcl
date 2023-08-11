############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project bitblt
set_top bitblt
add_files ../cpp_src/bitblt.cpp
add_files ../cpp_src/bitblt.hpp
add_files ../cpp_src/common.hpp
add_files ../cpp_src/patblt.cpp
add_files ../cpp_src/patblt.hpp
add_files ../cpp_src/util.hpp
add_files -tb ../cpp_src/bitblt_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_cosim -tool xsim
source "./bitblt/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
