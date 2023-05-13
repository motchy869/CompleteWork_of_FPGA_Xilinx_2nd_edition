`default_nettype none

module gradation (
    input wire CLK,
    input wire RST,
    output reg [7:0] VGA_R, VGA_G, VGA_B,
    output wire VGA_HS, VGA_VS,
    output reg VGA_DE,
    output wire PCK
);

/* Load parameters for VGA (640x480) */
`include "vga_param.svh"

localparam HSIZE = 10'd64; /* 640 / 10 */
localparam VSIZE = 10'd120; /* 480 / 4 */

/* Connect sync signal generator. */
wire [9:0] HCNT, VCNT;

syncgen syncgen_inst (
    .CLK(CLK),
    .RST(RST),
    .PCK(PCK),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .HCNT(HCNT),
    .VCNT(VCNT)
);

/* Create RGB output. */
localparam [9:0] HBLANK = HFRONT + HWIDTH + HBACK;
localparam [9:0] VBLANK = VFRONT + VWIDTH + VBACK;

wire disp_enable = (VBLANK <= VCNT) && (HBLANK-10'd1 <= HCNT) && (HCNT < HPERIOD-10'd1);

(* mark_debug = "true" *) wire [1:0] horiz_band_idx = ((VCNT - VBLANK) / VSIZE) & 2'b11;
wire [5:0] vert_intra_band_idx = (HCNT - HBLANK + 10'd1) & 6'h3f;
wire [3:0] intensity = vert_intra_band_idx[5:2];
wire [2:0] rgb_mask =
    (horiz_band_idx == 2'd0) ? 3'b111 :
    (horiz_band_idx == 2'd1) ? 3'b100 :
    (horiz_band_idx == 2'd2) ? 3'b010 : 3'b001;

wire [3:0] intensity_R = (rgb_mask[2]) ? intensity : 4'h0;
wire [3:0] intensity_G = (rgb_mask[1]) ? intensity : 4'h0;
wire [3:0] intensity_B = (rgb_mask[0]) ? intensity : 4'h0;

always @(posedge PCK) begin
    if (RST)
        {VGA_R, VGA_G, VGA_B} <= 24'h0;
    else if (disp_enable)
        {VGA_R, VGA_G, VGA_B} <= {{intensity_R, 4'h0}, {intensity_G, 4'h0}, {intensity_B, 4'h0}};
    else
        {VGA_R, VGA_G, VGA_B} <= 24'h0;
end

/* disp_enable lags behind VGA_DE by 1 clock cycle. */
always @(posedge PCK) begin
    if (RST)
        VGA_DE <= 1'b0;
    else
        VGA_DE <= disp_enable;
end

endmodule
