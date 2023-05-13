`default_nettype none
`timescale 1ns/1fs

module pattern_tb3;

/* clock period, the number of the simulation clocks */
localparam STEP = 8;
localparam CLKNUM = (800*525+12000)*5; /* 125/PCK ~ 5 */

/* signals for connections */
reg CLK;
reg RST;
wire HDMI_CLK_N, HDMI_CLK_P;
wire [2:0] HDMI_N, HDMI_P;

/* Connect the pattern generation circuit. */
pattern_hdmi pattern_hdmi_inst(
    .CLK(CLK),
    .RST(RST),
    .HDMI_CLK_N(HDMI_CLK_N),
    .HDMI_CLK_P(HDMI_CLK_P),
    .HDMI_N(HDMI_N),
    .HDMI_P(HDMI_P)
);

/* Generate the clock. */
always begin
    CLK = 0; #(STEP/2);
    CLK = 1; #(STEP/2);
end

/* Generate the input to the target. */
initial begin
    RST = 0;
    #(STEP*600) RST = 1; /* Wait for the MMCM to be stable. */
    #(STEP*20) RST = 0;
    #(STEP*CLKNUM);
    $stop;
end

endmodule
