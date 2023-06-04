`default_nettype none

module chardisp(
    /* AXI4-Lite signals */
    input wire CLK, RST,
    input wire [15:0] WRITE_ADDR,
    input wire [3:0] BYTE_EN,
    input wire WRITE_EN,
    input wire [31:0] WRITE_DATA,
    input wire [15:0] READ_ADDR,
    input wire READ_EN,
    output wire [31:0] READ_DATA,

    /* VGA output */
    output wire PCK,
    output wire [3:0] VGA_R, VGA_G, VGA_B,
    output wire VGA_HS, VGA_VS,
    output reg VGA_DE
);

typedef struct packed {
    logic [1:0] reserved_0;
    logic blink;
    logic inversion;
    logic [11:0] color;
    logic reserved_1;
    logic [6:0] charCode;
} VramEntry;

/* load VGA (640x480) parameters */
`include "vga_param.svh"

localparam VGA_HEIGHT = 480;
localparam VGA_WIDTH = 640;
localparam CHAR_HEIGHT = 8;
localparam CHAR_WIDTH = 8;
localparam NUM_CHAR_ROWS = 50;
localparam NUM_CHAR_COLS = 80;

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
wire [9:0] i_hcnt = hcnt - HFRONT - HWIDTH - HBACK + $bits(hcnt)'(CHAR_WIDTH);
wire [9:0] i_vcnt = vcnt - VFRONT - VWIDTH - VBACK - $bits(vcnt)'((VGA_HEIGHT - NUM_CHAR_ROWS*CHAR_HEIGHT)/2);


/* ----- dispConfReg -----> */
/* AXI local address: 0x4000 to 0x4000 */

reg [7:0] dispConfReg;
wire write_en_dispConfReg = WRITE_EN & BYTE_EN[0] & (WRITE_ADDR >= $bits(WRITE_ADDR)'('h4000)) & (WRITE_ADDR < $bits(WRITE_ADDR)'('h4001));

always_ff @(posedge CLK) begin
    if (RST)
        dispConfReg <= '0;
    else if (write_en_dispConfReg)
        dispConfReg <= WRITE_DATA[7:0];
end
/* <----- dispConfReg ----- */


/* ----- VRAM -----> */
/* AXI local address: 0x0000 to 0x3FFF */

/* VRAM signals */
VramEntry vramout_port_a;
VramEntry vramout_port_b;
wire [11:0] addrb_vram;

wire [11:0] addra_vram = READ_EN ? READ_ADDR[2+:$bits(addra_vram)] : WRITE_ADDR[2+:$bits(addra_vram)];
wire [2:0] wea_vram = {3{WRITE_EN}} & BYTE_EN[2:0] & {3{WRITE_ADDR >= $bits(WRITE_ADDR)'('h0000)}} & {3{WRITE_ADDR < $bits(WRITE_ADDR)'('h4000)}};

/* Connect VRAM. */
VRAM vram_inst(
    .clka(CLK),
    .wea(wea_vram),
    .addra(addra_vram),
    .dina(WRITE_DATA[23:0]),
    .douta(vramout_port_a),
    .clkb(PCK),
    .web('0),
    .addrb(addrb_vram),
    .dinb('0),
    .doutb(vramout_port_b)
);
/* <----- VRAM ----- */

/* ----- READ_DATA mapping -----> */
assign READ_DATA =
    ($bits(READ_ADDR)'('h0000) <= READ_ADDR && READ_ADDR < $bits(READ_ADDR)'('h4000)) ? {8'h0, vramout_port_a} :
    (READ_ADDR == $bits(READ_ADDR)'('h4000)) ? {($bits(READ_DATA) - $bits(dispConfReg))'(0), dispConfReg} :
    '0;
/* <----- READ_DATA mapping ----- */


wire [6:0] hchacnt = i_hcnt[3+:7]; /* horizontal character count */
wire [2:0] hdotcnt = i_hcnt[0+:3]; /* horizontal dot count */
wire [5:0] vcharcnt = i_vcnt[3+:6]; /* vertical character count */
wire [2:0] vdotcnt = i_vcnt[0+:3]; /* vertical dot count */

wire [7:0] cgout;

/* Connect CGROM. */
CGROM cgrom_inst(
    .addra({vramout_port_b.charCode, vdotcnt}),
    .douta(cgout),
    .clka(PCK)
);

wire clk1Hz;

/* Connect 1Hz clock generator. */
gen1HzClk gen1HzClk_inst(
    .RST(RST),
    .PCK(PCK),
    .CLK_OUT(clk1Hz)
);

/* Generate VRAM address. */
wire [5:0] vramRowOffset = dispConfReg < $bits(dispConfReg)'(NUM_CHAR_ROWS) ? dispConfReg : NUM_CHAR_ROWS-1; /* virtual start line of real 1st row of characters */
wire [6:0] vcharcnt2 = vramRowOffset + vcharcnt;
wire [12:0] addrb_vram_temp = (vcharcnt2 << 6) + (vcharcnt2 << 4) + hchacnt; /* 80 = 64 + 16 = 1<<6 + 1<<4 */
assign addrb_vram = (addrb_vram_temp < $bits(addrb_vram_temp)'(NUM_CHAR_ROWS*NUM_CHAR_COLS)) ? addrb_vram_temp[0+:$bits(addrb_vram)] : $bits(addrb_vram)'(addrb_vram_temp - $bits(addrb_vram_temp)'(NUM_CHAR_ROWS*NUM_CHAR_COLS));

/* shift register */
reg [7:0] shreg;
wire shregld = hdotcnt == $bits(hdotcnt)'(CHAR_WIDTH - 2) && i_hcnt < $bits(i_hcnt)'(VGA_WIDTH);

always_ff @(posedge PCK) begin
    if (RST)
        shreg <= '0;
    else if (shregld)
        shreg <= cgout;
    else
        shreg <= {shreg[6:0], 1'b0};
end

/* Capture color, inversion and blink info at shift register load timing. */
reg [11:0] color;
reg inversion;
reg blink;

always_ff @(posedge PCK) begin
    if (RST) begin
        color <= '0;
        inversion <= '0;
        blink <= '0;
    end else if (shregld) begin
        color <= vramout_port_b.color;
        inversion <= vramout_port_b.inversion;
        blink <= vramout_port_b.blink;
    end
end

/* horizontal and vertical enable signals */
wire hdispen = ($bits(i_hcnt)'(CHAR_WIDTH - 1) <= i_hcnt) && (i_hcnt < $bits(i_hcnt)'(VGA_WIDTH + CHAR_WIDTH - 1));
wire vdispen = i_vcnt < $bits(i_vcnt)'(NUM_CHAR_ROWS*CHAR_HEIGHT);

/* RGB output signals */
reg [11:0] vga_rgb;
wire inversion2 = (blink & clk1Hz) | (!blink & inversion);

always_ff @(posedge PCK) begin
    if (RST)
        vga_rgb <= '0;
    else
        vga_rgb <= color & {$bits(vga_rgb){hdispen & vdispen & (shreg[$bits(shreg)-1] ^ inversion2)}};
end

assign {VGA_R, VGA_G, VGA_B} = vga_rgb;

/* VGA_DE */
always_ff @(posedge PCK) begin
    if (RST)
        VGA_DE <= '0;
    else
        VGA_DE <= hdispen & (VFRONT + VWIDTH + VBACK <= vcnt);
end

endmodule
