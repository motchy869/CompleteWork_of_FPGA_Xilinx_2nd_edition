`default_nettype none

`include "xga_param.svh"
import common_constants::*;

module disp_out(
    input uwire PCK,
    input uwire PRST,
    input uwire DISP_ON,
    output reg FIFO_READ,
    input uwire [3*$bits(XGA_R)-1:0] FIFO_OUT,
    input uwire [$clog2(HPERIOD)-1:0] HCNT,
    input uwire [$clog2(VPERIOD)-1:0] VCNT,
    output reg AXI_START,
    output reg [8-1:0] XGA_R, XGA_G, XGA_B,
    output reg XGA_DE
);

/* -------- FIFO read signal -------- */
localparam DELAY_FROM_FIFO_READ_START_TO_DISP = 3;
localparam POS_FIFO_READ_START = HFRONT + HWIDTH + HBACK - $bits(HCNT)'(DELAY_FROM_FIFO_READ_START_TO_DISP);
localparam POS_FIFO_READ_END = HPERIOD - $bits(HCNT)'(DELAY_FROM_FIFO_READ_START_TO_DISP);

always @(posedge PCK) begin
    if (PRST)
        FIFO_READ <= 1'b0;
    else if (VCNT < VFRONT + VWIDTH + VBACK)
        FIFO_READ <= 1'b0;
    else if ((HCNT == POS_FIFO_READ_START) & DISP_ON)
        FIFO_READ <= 1'b1;
    else if (HCNT == POS_FIFO_READ_END)
        FIFO_READ <= 1'b0;
end


/* -------- Create display enable signal from delayed FIFO_READ. -------- */
reg disp_enable;

always @(posedge PCK) begin
    if (PRST)
        disp_enable <= 1'b0;
    else
        disp_enable <= FIFO_READ;
end


/* ------- Drive XGA_R, XGA_G, XGA_B. -------- */
always @(posedge PCK) begin
    if (PRST)
        {XGA_R, XGA_G, XGA_B} <= '0;
    else if (disp_enable)
        {XGA_R, XGA_G, XGA_B} <= FIFO_OUT;
    else
        {XGA_R, XGA_G, XGA_B} <= '0;
end


/* -------- Drive XGA_DE. -------- */
always @(posedge PCK) begin
    if (PRST)
        XGA_DE <= 1'b0;
    else
        XGA_DE <= disp_enable;
end


/* Drive VRAM read start signal. */
always @(posedge PCK) begin
    if (PRST)
        AXI_START <= 1'b0;
    else
        AXI_START <= (VCNT == VFRONT + VWIDTH + VBACK - $bits(VCNT)'(1));
end

endmodule
