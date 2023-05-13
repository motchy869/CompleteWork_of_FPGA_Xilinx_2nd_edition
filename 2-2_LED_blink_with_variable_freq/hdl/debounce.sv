`default_nettype none

module debounce(
    input wire CLK,
    input wire RST,
    input wire BTNIN,
    output reg BTNOUT
);

/* Create 40 Hz clock from 125 MHz clock. */
reg [21:0] cnt22; /* log2(125 MHz / 40 Hz) = log2(3125000) ~ 21.58 */

wire en40hz = (cnt22 == 22'd3125000-1);

always @(posedge CLK) begin
    if (RST)
        cnt22 <= 22'h0;
    else if (en40hz)
        cnt22 <= 22'h0;
    else
        cnt22 <= cnt22 + 22'h1;
end

/* 2-stage FF for switch input */
reg ff1, ff2;

always @(posedge CLK) begin
    if (RST) begin
        ff1 <= 1'b0;
        ff2 <= 1'b0;
    end
    else if (en40hz) begin
        ff2 <= ff1;
        ff1 <= BTNIN;
    end
end

/* edge detection */
wire temp = ff1 & ~ff2 & en40hz; /* The pulse width is same as CLK. */

always @(posedge CLK) begin
    if (RST)
        BTNOUT <= 1'b0;
    else
        BTNOUT <= temp;
end

endmodule
