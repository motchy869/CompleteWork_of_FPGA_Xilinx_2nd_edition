############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode s_axilite "patblt"
set_directive_interface -mode m_axi -depth 307200 -max_write_burst_length 16 -num_write_outstanding 16 "patblt" dst_out
set_directive_interface -mode s_axilite "patblt" width
set_directive_interface -mode s_axilite "patblt" height
set_directive_interface -mode s_axilite "patblt" ypos
set_directive_interface -mode s_axilite "patblt" xpos
set_directive_interface -mode s_axilite "patblt" color
set_directive_top -name patblt "patblt"
set_directive_loop_tripcount -avg 240 -max 480 -min 1 "patblt/height_loop"
set_directive_loop_tripcount -avg 320 -max 640 -min 1 "patblt/width_loop"
