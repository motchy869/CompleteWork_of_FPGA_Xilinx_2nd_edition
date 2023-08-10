############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project avg_min_max
set_top avg_min_max
add_files ../cpp_src/avg_min_max.cpp
add_files ../cpp_src/avg_min_max.hpp
add_files -tb ../cpp_src/avg_min_max_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z010iclg225-1L}
create_clock -period 10 -name default
source "./avg_min_max/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
