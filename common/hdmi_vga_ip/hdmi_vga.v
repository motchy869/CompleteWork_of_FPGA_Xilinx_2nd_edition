/* Copyright(C) 2020 Cobac.Net All Rights Reserved. */
/* chapter: ��7�͑�          */
/* project: chardisp��       */
/* outline: HDMI/VGA�A�_�v�^ */

module hdmi_vga #(
    parameter kClkRange = 5 // 5:VGA(25.175MHz), 2:XGA(65MHz)
)
(
    /* �A�_�v�^���͐M�� */
    input           nRST,   /* �V�X�e�����Z�b�g�ɐڑ�����̂�Low�A�N�e�B�u */
    input           PCK,
    input   [7:0]   IN_VGA_R,
    input   [7:0]   IN_VGA_G,
    input   [7:0]   IN_VGA_B,
    input           IN_VGA_HS, IN_VGA_VS,
    input           IN_VGA_DE,
    /* HDMI�o�� */
    output          HDMI_CLK_N,
    output          HDMI_CLK_P,
    output  [2:0]   HDMI_N,
    output  [2:0]   HDMI_P,
    /* VGA�o�� */
    output  [3:0]   VGA_R,
    output  [3:0]   VGA_G,
    output  [3:0]   VGA_B,
    output          VGA_HS, VGA_VS
);

/* DVI�o��IP��ڑ� */
rgb2dvi #(
    .kClkPrimitive("MMCM"),
    .kClkRange  (kClkRange)
    )
  rgb2dvi (
    .PixelClk   (PCK),
    .TMDS_Clk_n (HDMI_CLK_N),
    .TMDS_Clk_p (HDMI_CLK_P),
    .TMDS_Data_n(HDMI_N),
    .TMDS_Data_p(HDMI_P),
    .aRst       (~nRST),
    .vid_pData  ({IN_VGA_R, IN_VGA_B, IN_VGA_G}),
    .vid_pHSync (IN_VGA_HS),
    .vid_pVDE   (IN_VGA_DE),
    .vid_pVSync (IN_VGA_VS)
);

/* VGA�o�͂��쐬 */
assign VGA_R  = IN_VGA_R[7:4];
assign VGA_G  = IN_VGA_G[7:4];
assign VGA_B  = IN_VGA_B[7:4];

assign VGA_HS = IN_VGA_HS;
assign VGA_VS = IN_VGA_VS;

endmodule
