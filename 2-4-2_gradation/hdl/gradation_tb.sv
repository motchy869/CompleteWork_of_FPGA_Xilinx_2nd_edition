`default_nettype none

module gradation_tb;

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
gradation gradation_inst(
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

integer fd; /* file descripter */

/* Generate the input to the target. */
initial begin
    RST = 0;
    fd = $fopen("imagedata.raw", "wb");
    #(STEP*600) RST = 1; /* Wait for the MMCM to be stable. */
    #(STEP*20) RST = 0;
    #(STEP*CLKNUM);
    $fclose(fd);
    $stop;
end

/* file output */
always @(posedge PCK) begin
    if (VGA_DE) begin
        $fwrite(fd, "%c", VGA_R);
        $fwrite(fd, "%c", VGA_G);
        $fwrite(fd, "%c", VGA_B);
    end
end

endmodule
