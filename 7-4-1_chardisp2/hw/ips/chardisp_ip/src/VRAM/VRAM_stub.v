// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sat May 20 20:56:38 2023
// Host        : SurfaceLaptop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/7-2_chardisp/chardisp_ip/src/VRAM/VRAM_stub.v
// Design      : VRAM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *)
module VRAM(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="wea[2:0],addra[11:0],dina[23:0],douta[23:0],web[2:0],addrb[11:0],dinb[23:0],doutb[23:0]" */
/* synthesis syn_force_seq_prim="clka" */
/* synthesis syn_force_seq_prim="clkb" */;
  input clka /* synthesis syn_isclock = 1 */;
  input [2:0]wea;
  input [11:0]addra;
  input [23:0]dina;
  output [23:0]douta;
  input clkb /* synthesis syn_isclock = 1 */;
  input [2:0]web;
  input [11:0]addrb;
  input [23:0]dinb;
  output [23:0]doutb;
endmodule
