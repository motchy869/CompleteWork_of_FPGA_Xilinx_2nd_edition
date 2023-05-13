`default_nettype none

module syncgen (
    input wire CLK,
    input wire RST,
    output wire PCK,
    output reg VGA_HS,
    output reg VGA_VS,
    output reg [9:0] HCNT,
    output reg [9:0] VCNT
);

/* Load parameters for VGA (640x480) */
`include "vga_param.svh"

/* Generate PCK using MMCM. */
pckgen pckgen_inst (.SYSCLK(CLK), .PCK(PCK));

/* horizonal counter */
wire hcntend = (HCNT == HPERIOD-10'h001);

always @(posedge PCK) begin
    if (RST)
        HCNT <= 10'h000;
    else if (hcntend)
        HCNT <= 10'h000;
    else
        HCNT <= HCNT + 10'h001;
end

/* vertical counter */
always @(posedge PCK) begin
    if (RST)
        VCNT <= 10'h000;
    else if (hcntend) begin
        if (VCNT == VPERIOD-10'h001)
            VCNT <= 10'h000;
        else
            VCNT <= VCNT + 10'h001;
    end
end

/* sync signal */
localparam [9:0] hsstart = HFRONT - 10'h001;
localparam [9:0] hsend   = HFRONT + HWIDTH - 10'h001;
localparam [9:0] vsstart = VFRONT;
localparam [9:0] vsend   = VFRONT + VWIDTH;

always @(posedge PCK) begin
    if (RST)
        VGA_HS <= 1'b1;
    else if (HCNT == hsstart)
        VGA_HS <= 1'b0;
    else if (HCNT == hsend)
        VGA_HS <= 1'b1;
end

always @(posedge PCK) begin
    if (RST)
        VGA_VS <= 1'b1;
    else if (HCNT == hsstart) begin /* Align VGA_VS edge to VGA_HS enable. */
        if (VCNT == vsstart)
            VGA_VS <= 1'b0;
        else if (VCNT == vsend)
            VGA_VS <= 1'b1;
    end
end

endmodule
