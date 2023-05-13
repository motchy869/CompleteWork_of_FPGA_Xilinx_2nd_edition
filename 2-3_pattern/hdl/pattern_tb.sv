`default_nettype none

module pattern_tb;

/* clock period, the number of the simulation clocks */
localparam STEP = 8;
localparam CLKNUM = (800*525+12000)*5; /* 125/PCK ~ 5 */

/* signals for connections */
reg CLK;
reg RST;
wire [7:0] VGA_R, VGA_G, VGA_B;
wire VGA_HS, VGA_VS, VGA_DE;
wire PCK;

/* Connect the pattern generation circuit. */
pattern pattern_inst(
    .CLK(CLK),
    .RST(RST),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .VGA_DE(VGA_DE),
    .PCK(PCK)
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
