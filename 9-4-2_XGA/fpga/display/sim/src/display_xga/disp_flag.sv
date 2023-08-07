`default_nettype none

module disp_flag(
    input uwire ACLK,
    input uwire ARST,
    input uwire XGA_VS,
    input uwire CLR_VBLANK,
    output reg VBLANK
);

/* -------- Detect the rising edge of the XGA_VS synchronized with ACLK. -------- */
reg [2:0] vblank_ff;

always @(posedge ACLK) begin
    if(ARST)
        vblank_ff <= '1;
    else begin
        vblank_ff <= {vblank_ff[1:0], XGA_VS};
    end
end

uwire set_vblank = (vblank_ff[2:1] == 2'b10);

/* -------- Drive VBLANK. -------- */
always @(posedge ACLK) begin
    if (ARST)
        VBLANK <= 1'b0;
    else if (CLR_VBLANK)
        VBLANK <= 1'b0;
    else if (set_vblank)
        VBLANK <= 1'b1;
end

endmodule
