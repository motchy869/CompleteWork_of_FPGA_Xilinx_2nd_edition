`default_nettype none

module blinkpat(
    input wire CLK,
    input wire RST,
    input wire [0:0] BTN,
    output reg [2:0] LED_RGB
);

/* hazard elimination for RST */
reg ff1_RST, ff2_RST;

always @(posedge CLK) begin
    ff1_RST <= RST;
    ff2_RST <= ff1_RST;
end

/* Connect Chattering elimination circuit. */
wire btnon;

debounce debounce_inst (.CLK(CLK), .RST(ff2_RST), .BTNIN(BTN), .BTNOUT(btnon));

/* The counter for pattern setting. */
reg [0:0] pattern; /* 0 or 1 */

always @(posedge CLK, posedge ff2_RST) begin
    if (ff2_RST)
        pattern <= 1'h0;
    else if (btnon)
        pattern <= ~pattern;
end

/* Divide system clock */
reg [25:0] cnt26;

always @(posedge CLK, posedge ff2_RST) begin
    if (ff2_RST)
        cnt26 <= 26'h0;
    else
        cnt26 <= cnt26 + 26'h1;
end

/* the enable signal for LED counter */
wire ledcnten = (cnt26 == 26'h3ffffff);

/* 5-digit counter for LED */
reg [2:0] cnt3;

always @(posedge CLK, posedge ff2_RST) begin
    if (ff2_RST)
        cnt3 <= 3'h0;
    else if (ledcnten)
        if (cnt3 == 3'd4)
            cnt3 <= 3'h0;
        else
            cnt3 <= cnt3 + 1'h1;
end

/* color selection */
wire [2:0] color0 = (pattern == 1'h0) ? 3'b100 : 3'b110;
wire [2:0] color1 = (pattern == 1'h0) ? 3'b010 : 3'b011;
wire [2:0] color2 = (pattern == 1'h0) ? 3'b001 : 3'b101;

/* LED decoder */
always @* begin
    case (cnt3)
        3'd0: LED_RGB = color0;
        3'd1: LED_RGB = color1;
        3'd2: LED_RGB = color2;
        3'd3: LED_RGB = 3'b111;
        3'd4: LED_RGB = 3'b000;
        default: LED_RGB = 3'b000;
    endcase
end

endmodule
