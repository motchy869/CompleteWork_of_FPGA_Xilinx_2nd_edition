`default_nettype none

timeunit 1ns;
timeprecision 1ps;

`include "vga_param.svh"

import common_constants::*;
import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

module display_tb;

/* -------- Declare signals. -------- */
reg ACLK;
reg ARESETN;
uwire [8-1:0] VGA_R, VGA_G, VGA_B;
uwire VGA_HS, VGA_VS, VGA_DE;
reg [DISP_ADDR_WIDTH-1:0] DISP_ADDR;
uwire PCK, VBLANK;
reg DISP_ON, CLR_VBLANK;
uwire FIFO_OVERFLOW, FIFO_UNDERFLOW;

/* -------- Connect the verification target. -------- */
design_1_wrapper dut(.*);


/* -------- Create the clock. -------- */
localparam int STEP = 10; /* 100 MHz */
localparam int CLK_NUM = (HPERIOD*VPERIOD + 12000)*4;
localparam int TOTAL_TIME_NS = CLK_NUM*STEP;
int elapsed_time_ns = 0; /* elapsed time in ns */
int progress = 0; /* progress in % */

always begin
    ACLK = 0; #(STEP/2);
    ACLK = 1; #(STEP/2);
    elapsed_time_ns += STEP;
    progress = elapsed_time_ns*100/TOTAL_TIME_NS;
end


/* -------- VRAM start address -------- */
localparam MEM_BASE = 32'h1000_0000;


/* -------- Drive the verification target. -------- */
int fd; /* file descriptor */

initial begin
    fd = $fopen("image_data.raw", "wb");
    if (fd == 0) begin
        $display("Error: cannot open image_data.raw");
        $finish;
    end

    ARESETN = 1'b1;
    DISP_ON = 1'b0;
    DISP_ADDR = MEM_BASE;
    CLR_VBLANK = 1'b0;
    #(200*STEP) ARESETN = 1'b0;
    #(20*STEP) ARESETN = 1'b1;
    #(20*STEP) DISP_ON = 1'b1;
    #(STEP*CLK_NUM);
    $fclose(fd);
    $stop;
end

/* assertion */
// always_comb begin
//     sva_RRESP: assert(dut.design_1_i.display_wrapper_0.M_AXI_RRESP == 2'b00);
// end

/* file output */
always @(posedge PCK) begin
    if (VGA_DE)
        $fwrite(fd, "%c%c%c", VGA_R, VGA_G, VGA_B);
end

/* -------- VIP slave agent -------- */
design_1_axi_vip_0_0_slv_mem_t agent;

initial begin
    agent = new("AXI Slave Agent", dut.design_1_i.axi_vip_0.inst.IF);
    agent.start_slave();
    meminit_incr();
end

/* Create increment data. */
task meminit_incr();
    for (int i=0; i<VGA_VISIBLE_WIDTH*VGA_VISIBLE_HEIGHT; i=i+1) begin
        agent.mem_model.backdoor_memory_write_4byte(MEM_BASE + i*4, i, 4'b1111);
    end
endtask

endmodule
