`default_nettype none

module blink(
    input wire CLK,
    input wire RST,
    output reg [2:0] LED_RGB
);

/* hazard elimination for RST */
reg ff1_RST, ff2_RST;

always @(posedge CLK) begin
    ff1_RST <= RST;
    ff2_RST <= ff1_RST;
end

/* Divide system clock */
reg [25:0] cnt26;

always @(posedge CLK, posedge ff2_RST) begin
    if (ff2_RST)
        cnt26 <= 26'h0;
    else
        cnt26 <= cnt26 + 26'h1;
end

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
