############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
set_directive_top -name bitblt "bitblt"
set_directive_interface -mode s_axilite "bitblt"
set_directive_interface -mode m_axi -bundle src -depth 307200 -max_read_burst_length 32 -num_read_outstanding 16 "bitblt" src_in
set_directive_interface -mode m_axi -bundle dst -depth 307200 -max_write_burst_length 32 -num_write_outstanding 16 -offset slave "bitblt" dst_in
set_directive_interface -mode m_axi -bundle dst -depth 307200 -max_write_burst_length 32 -num_write_outstanding 16 -offset slave "bitblt" dst_out
set_directive_interface -mode s_axilite "bitblt" width
set_directive_interface -mode s_axilite "bitblt" alpha
set_directive_interface -mode s_axilite "bitblt" height
set_directive_loop_tripcount -avg 320 -max 640 -min 1 "bitblt/horiz_loop"
set_directive_loop_tripcount -avg 240 -max 480 -min 1 "bitblt/vert_loop"
