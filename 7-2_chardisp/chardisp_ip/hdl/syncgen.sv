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
wire hcntend = (HCNT == HPERIOD-$bits(HPERIOD)'(1));

always @(posedge PCK) begin
    if (RST)
        HCNT <= $bits(HCNT)'(0);
    else if (hcntend)
        HCNT <= $bits(HCNT)'(0);
    else
        HCNT <= HCNT + $bits(HCNT)'(1);
end

/* vertical counter */
always @(posedge PCK) begin
    if (RST)
        VCNT <= $bits(VCNT)'(0);
    else if (hcntend) begin
        if (VCNT == VPERIOD-$bits(VCNT)'(1))
            VCNT <= $bits(VCNT)'(0);
        else
            VCNT <= VCNT + $bits(VCNT)'(1);
    end
end

/* sync signal */
localparam [9:0] hsstart = HFRONT - $bits(HFRONT)'(1);
localparam [9:0] hsend   = HFRONT + HWIDTH - $bits(HFRONT)'(1);
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
