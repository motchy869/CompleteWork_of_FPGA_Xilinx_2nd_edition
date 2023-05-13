`default_nettype none

module pattern (
    input wire CLK,
    input wire RST,
    output reg [7:0] VGA_R, VGA_G, VGA_B,
    output wire VGA_HS, VGA_VS,
    output reg VGA_DE,
    output wire PCK
);

/* Load parameters for VGA (640x480) */
`include "vga_param.svh"

localparam HSIZE = 10'd80; /* 640 / 8 */
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

wire [2:0] rgb_0 = (HCNT - HBLANK + 10'd1) / HSIZE; /* up-count */
wire [2:0] rgb_1 = (((VCNT - VBLANK)/VSIZE)&1) == 0 ? 3'd7-rgb_0 : rgb_0; /* Switch up/down-count according to vertical position. */

always @(posedge PCK) begin
    if (RST)
        {VGA_R, VGA_G, VGA_B} <= 24'h0;
    else if (disp_enable)
        {VGA_R, VGA_G, VGA_B} <= {{8{rgb_1[2]}}, {8{rgb_1[1]}}, {8{rgb_1[0]}}};
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
