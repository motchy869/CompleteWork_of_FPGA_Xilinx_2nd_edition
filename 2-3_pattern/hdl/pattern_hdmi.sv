`default_nettype none

module pattern_hdmi(
    input wire CLK,
    input wire RST,
    output wire HDMI_CLK_N, HDMI_CLK_P,
    output wire [2:0] HDMI_N, HDMI_P
);

/* hazard elimination for RST */
reg ff1_RST, ff2_RST;

always @(posedge CLK) begin
    ff1_RST <= RST;
    ff2_RST <= ff1_RST;
end

wire [7:0] VGA_R, VGA_G, VGA_B;
wire VGA_HS, VGA_VS, VGA_DE;
wire PCK;

/* Connect the pattern creation circuit. */
pattern pattern_inst (
    .CLK(CLK),
    .RST(ff2_RST),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .VGA_DE(VGA_DE),
    .PCK(PCK)
);

/* Connect the HDMI signal creation IP. */
rgb2dvi #(
    .kClkPrimitive("MMCM"),
    .kClkRange(5) /* MULT_F = kClkRange*5 (choose >=120MHz=1, >=60MHz=2, >=40MHz=3) */
) rgb2dvi_inst (
    .PixelClk(PCK),
    .SerialClk(),
    .TMDS_Clk_n(HDMI_CLK_N),
    .TMDS_Clk_p(HDMI_CLK_P),
    .TMDS_Data_n(HDMI_N),
    .TMDS_Data_p(HDMI_P),
    .aRst(ff2_RST),
    .aRst_n(),
    .vid_pData({VGA_R, VGA_B, VGA_G}), /* Note: The order is RBG. */
    .vid_pHSync(VGA_HS),
    .vid_pVSync(VGA_VS),
    .vid_pVDE(VGA_DE)
);

endmodule
