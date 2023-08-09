############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project muladd
set_top muladd
add_files ../cpp_src/muladd.cpp
add_files ../cpp_src/muladd.hpp
add_files -tb ../cpp_src/muladd_tb.cpp
open_solution "solution3" -flow_target vivado
set_part {xc7z010iclg225-1L}
create_clock -period 10 -name default
source "./muladd/solution3/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
