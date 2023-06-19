// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Jun 18 19:11:07 2023
// Host        : SurfaceLaptop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/motchy/Documents/GitHub/CompleteWork_of_FPGA_Xilinx_2nd_edition/9-1_graphic_disp/fpga/display/display_ip/src/disp_fifo/disp_fifo_stub.v
// Design      : disp_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_8,Vivado 2023.1" *)
module disp_fifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  overflow, empty, underflow, wr_data_count)
/* synthesis syn_black_box black_box_pad_pin="rst,din[47:0],wr_en,rd_en,dout[23:0],full,overflow,empty,underflow,wr_data_count[8:0]" */
/* synthesis syn_force_seq_prim="wr_clk" */
/* synthesis syn_force_seq_prim="rd_clk" */;
  input rst;
  input wr_clk /* synthesis syn_isclock = 1 */;
  input rd_clk /* synthesis syn_isclock = 1 */;
  input [47:0]din;
  input wr_en;
  input rd_en;
  output [23:0]dout;
  output full;
  output overflow;
  output empty;
  output underflow;
  output [8:0]wr_data_count;
endmodule
