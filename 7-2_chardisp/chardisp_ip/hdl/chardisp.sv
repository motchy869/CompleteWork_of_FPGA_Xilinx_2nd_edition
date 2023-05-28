`default_nettype none

module chardisp(
    /* AXI4-Lite signals */
    input wire CLK, RST,
    input wire [15:0] WRADDR,
    input wire [3:0] BYTEEN,
    input wire WREN,
    input wire [31:0] WRDATA,
    input wire [15:0] RDADDR,
    input wire RDEN,
    output wire [31:0] RDDATA,

    /* VGA output */
    output wire PCK,
    output wire [3:0] VGA_R, VGA_G, VGA_B,
    output wire VGA_HS, VGA_VS,
    output reg VGA_DE
);

/* load VGA (640x480) parameters */
`include "vga_param.svh"

wire [9:0] hcnt, vcnt;

/* Connect syncgen. */
syncgen syncgen_inst(
    .CLK(CLK),
    .RST(RST),
    .PCK(PCK),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .HCNT(hcnt),
    .VCNT(vcnt)
);

/* Convert count value for internel reference. */
(* mark_debug = "true" *) wire [9:0] i_hcnt = hcnt - HFRONT - HWIDTH - HBACK + $bits(hcnt)'(8);
(* mark_debug = "true" *) wire [9:0] i_vcnt = vcnt - VFRONT - VWIDTH - VBACK - $bits(vcnt)'(40);

/* VRAM signals */
(* mark_debug = "true" *) wire [23:0] vramout;
wire [11:0] addra;
(* mark_debug = "true" *) wire [11:0] vramaddr;

assign addra = (RDEN) ? RDADDR[2+:$bits(addra)] : WRADDR[2+:$bits(addra)];
assign RDDATA[31-:8] = 8'h00;
wire [2:0] wea = {3{WREN}} & BYTEEN[2:0];

/* Connect VRAM. */
VRAM vram_inst(
    .clka(CLK),
    .wea(wea),
    .addra(addra),
    .dina(WRDATA[23:0]),
    .douta(RDDATA[23:0]),
    .clkb(PCK),
    .web($bits(wea)'(0)),
    .addrb(vramaddr),
    .dinb(24'h0),
    .doutb(vramout)
);


wire [6:0] hchacnt = i_hcnt[3+:7]; /* horizontal character count */
wire [2:0] hdotcnt = i_hcnt[0+:3]; /* horizontal dot count */
wire [5:0] vcharcnt = i_vcnt[3+:6]; /* vertical character count */
wire [2:0] vdotcnt = i_vcnt[0+:3]; /* vertical dot count */

wire [7:0] cgout;

/* Connect CGROM. */
CGROM cgrom_inst(
    .addra({vramout[6:0], vdotcnt}),
    .douta(cgout),
    .clka(PCK)
);

/* Generate VRAM address. */
assign vramaddr = (vcharcnt << 6) + (vcharcnt << 4) + hchacnt; /* 80 = 64 + 16 = 1<<6 + 1<<4 */

/* shift register */
(* mark_debug = "true" *) reg [7:0] shreg;
wire shregld = (hdotcnt==$bits(hdotcnt)'(6)) && i_hcnt<$bits(i_hcnt)'(640);

always @(posedge PCK) begin
    if (RST)
        shreg <= $bits(shreg)'(0);
    else if (shregld)
        shreg <= cgout;
    else
        shreg <= {shreg[6:0], 1'b0};
end

/* Capture color info at shift register load timing. */
reg [11:0] color;

always @(posedge PCK) begin
    if (RST)
        color <= $bits(color)'(0);
    else if (shregld)
        color <= vramout[8+:$bits(color)];
end

/* horizontal and vertical enable signals */
wire hdispen = ($bits(i_hcnt)'(7) <= i_hcnt) && (i_hcnt < $bits(i_hcnt)'(647));
wire vdispen = i_vcnt < $bits(i_vcnt)'(400);

/* RGB output signals */
reg [11:0] vga_rgb;

always @(posedge PCK) begin
    if (RST)
        vga_rgb <= $bits(vga_rgb)'(0);
    else
        vga_rgb <= color & {12{hdispen & vdispen & shreg[$bits(shreg)-1]}};
end

assign {VGA_R, VGA_G, VGA_B} = vga_rgb;

/* VGA_DE */
always @(posedge PCK) begin
    if (RST)
        VGA_DE <= 1'b0;
    else
        VGA_DE <= hdispen & (VFRONT + VWIDTH + VBACK <= vcnt);
end

endmodule
