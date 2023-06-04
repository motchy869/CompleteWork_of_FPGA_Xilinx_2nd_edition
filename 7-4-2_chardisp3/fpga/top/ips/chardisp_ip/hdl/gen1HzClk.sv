`default_nettype none

module gen1HzClk #(
    parameter integer fPck = 25174825
)(
    input wire RST,
    input wire PCK,
    output wire CLK_OUT
);

localparam integer MAX_COUNT = fPck / 2 - 1;
localparam integer COUNTER_BIT_WIDTH = $clog2(MAX_COUNT+1);

reg [COUNTER_BIT_WIDTH-1:0] count = 0;
reg clk_out = 1'b0;
assign CLK_OUT = clk_out;

always_ff @(posedge PCK) begin
    if (RST) begin
        count <= 0;
        clk_out <= 1'b0;
    end else begin
        if (count == MAX_COUNT) begin
            count <= 0;
            clk_out <= ~clk_out;
        end else begin
            count <= count + $bits(count)'(1);
        end
    end
end

endmodule
