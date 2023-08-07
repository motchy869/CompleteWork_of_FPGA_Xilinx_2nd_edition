`default_nettype none

timeunit 1ns;
timeprecision 1ps;

`include "xga_param.svh"

import common_constants::*;
import axi_vip_pkg::*;
import design_1_axi_vip_0_0_pkg::*;

module display_tb;

/* -------- Declare signals. -------- */
reg ACLK;
reg ARESETN;
uwire [8-1:0] XGA_R, XGA_G, XGA_B;
uwire XGA_HS, XGA_VS, XGA_DE;
reg [DISP_ADDR_WIDTH-1:0] DISP_ADDR;
uwire PCK, VBLANK;
reg DISP_ON, CLR_VBLANK;
uwire FIFO_OVERFLOW, FIFO_UNDERFLOW;

/* -------- Connect the verification target. -------- */
design_1_wrapper dut(.*);


/* -------- Create the clock. -------- */
localparam int CLK_FREQ_MHZ = 100;
localparam int SIM_FREQ_MHZ = 1000;
localparam int PIXEL_FREQ_MHZ = 65;
localparam int STEP = SIM_FREQ_MHZ/CLK_FREQ_MHZ;
localparam int CLK_NUM = (HPERIOD*VPERIOD + 12000)*(CLK_FREQ_MHZ/PIXEL_FREQ_MHZ);
localparam int TOTAL_TIME_NS = CLK_NUM*STEP;
reg [$clog2(TOTAL_TIME_NS)-1:0] elapsed_time_ns = 0; /* elapsed time in ns */
uwire [$clog2(100)-1:0] progress_pct = elapsed_time_ns*100/TOTAL_TIME_NS; /* progress in % */

always begin
    ACLK = 0; #(STEP/2);
    ACLK = 1; #(STEP/2);
    elapsed_time_ns += STEP;
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
    if (XGA_DE)
        $fwrite(fd, "%c%c%c", XGA_R, XGA_G, XGA_B);
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
    for (int i=0; i<XGA_VISIBLE_WIDTH*XGA_VISIBLE_HEIGHT; i=i+1) begin
        agent.mem_model.backdoor_memory_write_4byte(MEM_BASE + i*4, i, 4'b1111);
    end
endtask

endmodule
