############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project patblt
set_top patblt
add_files ../cpp_src/patblt.cpp
add_files ../cpp_src/patblt.hpp
add_files ../cpp_src/util.hpp
add_files -tb ../cpp_src/patblt_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_cosim -tool xsim
source "./patblt/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
