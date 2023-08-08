`default_nettype none

module syncgen (
    input uwire CLK,
    input uwire RST,
    output uwire PCK,
    output reg XGA_HS,
    output reg XGA_VS,
    output reg [$clog2(HPERIOD)-1:0] HCNT,
    output reg [$clog2(HPERIOD)-1:0] VCNT
);

/* Load parameters for XGA */
`include "xga_param.svh"

/* Generate PCK using MMCM. */
pckgen pckgen_inst (.SYSCLK(CLK), .PCK(PCK));

/* horizontal counter */
uwire hcntend = (HCNT == HPERIOD-$bits(HPERIOD)'(1));

always_ff @(posedge PCK) begin
    if (RST)
        HCNT <= '0;
    else if (hcntend)
        HCNT <= '0;
    else
        HCNT <= HCNT + $bits(HCNT)'(1);
end

/* vertical counter */
uwire vcntend = (VCNT == VPERIOD-$bits(VCNT)'(1));

always_ff @(posedge PCK) begin
    if (RST)
        VCNT <= '0;
    else if (hcntend) begin
        if (vcntend)
            VCNT <= '0;
        else
            VCNT <= VCNT + $bits(VCNT)'(1);
    end
end

/* sync signal */
localparam int HSSTART = $clog2(HPERIOD)'(HFRONT - $bits(HFRONT)'(1));
localparam int HSEND   = $clog2(HPERIOD)'(HFRONT + HWIDTH - $bits(HFRONT)'(1));
localparam int VSSTART = $clog2(HPERIOD)'(VFRONT);
localparam int VSEND   = $clog2(HPERIOD)'(VFRONT + VWIDTH);

always_ff @(posedge PCK) begin
    if (RST)
        XGA_HS <= 1'b1;
    else if (HCNT == HSSTART)
        XGA_HS <= 1'b0;
    else if (HCNT == HSEND)
        XGA_HS <= 1'b1;
end

always_ff @(posedge PCK) begin
    if (RST)
        XGA_VS <= 1'b1;
    else if (HCNT == HSSTART) begin /* Align XGA_VS edge to XGA_HS enable. */
        if (VCNT == VSSTART)
            XGA_VS <= 1'b0;
        else if (VCNT == VSEND)
            XGA_VS <= 1'b1;
    end
end

endmodule
