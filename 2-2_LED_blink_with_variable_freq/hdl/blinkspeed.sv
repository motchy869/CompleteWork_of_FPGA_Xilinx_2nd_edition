`default_nettype none

module blinkspeed(
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

/* The counter for speed setting. */
reg [1:0] speed; /* from 0 (slowest) to 3(fastest) */

always @(posedge CLK, posedge ff2_RST) begin
    if (ff2_RST)
        speed <= 2'h0;
    else if (btnon)
        speed <= speed + 2'h1;
end

/* Divide system clock */
reg [26:0] cnt27;

always @(posedge CLK, posedge ff2_RST) begin
    if (ff2_RST)
        cnt27 <= 27'h0;
    else
        cnt27 <= cnt27 + 27'h1;
end

/* the enable signal for LED counter */
reg ledcnten;

always @* begin
    case (speed)
        2'h0: ledcnten = (cnt27       == 27'h7ffffff);
        2'h1: ledcnten = (cnt27[25:0] == 26'h3ffffff);
        2'h2: ledcnten = (cnt27[24:0] == 25'h1ffffff);
        2'h3: ledcnten = (cnt27[23:0] == 24'hffffff);
        default: ledcnten = 1'b0;
    endcase
end

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

/* LED decoder */
always @* begin
    case (cnt3)
        3'd0: LED_RGB = 3'b100;
        3'd1: LED_RGB = 3'b010;
        3'd2: LED_RGB = 3'b001;
        3'd3: LED_RGB = 3'b111;
        3'd4: LED_RGB = 3'b000;
        default: LED_RGB = 3'b000;
    endcase
end

endmodule
