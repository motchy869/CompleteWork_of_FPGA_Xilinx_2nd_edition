`default_nettype none

import common_constants::*;

localparam int ARADDR_WIDTH = 32;

module disp_ctrl(
    input uwire ACLK,
    input uwire ARST,
    output uwire [ARADDR_WIDTH-1:0] ARADDR,
    output uwire ARVALID,
    input uwire ARREADY,
    input uwire RLAST,
    input uwire RVALID,
    output uwire RREADY,
    input uwire AXI_START,
    input uwire DISP_ON,
    input uwire [DISP_ADDR_WIDTH-1:0] DISP_ADDR,
    input uwire FIFO_READY
);

reg [DISP_ADDR_WIDTH-1:0] addr_cnt;
uwire disp_end;


/* declare a state machine */
typedef enum {HALT, SET_ADDR, READING, WAITING} state_t;
state_t state_current = HALT, state_next = HALT;


/* Read Address (AR) */
assign ARADDR[(ARADDR_WIDTH-1)-:2] = '0; /* Restrict to 0x00000000 - 0x3FFFFFFF. */
assign ARADDR[0+:DISP_ADDR_WIDTH] = DISP_ADDR + addr_cnt;
assign ARVALID = (state_current == SET_ADDR);


/* Read and Read Response (R) */
assign RREADY = RVALID;


/* Start VRAM read (Detect the rising edge of the AXI_START synchronized with ACLK.) */
reg [2:0] axi_start_ff;

always @(posedge ACLK) begin
    if (ARST)
        axi_start_ff <= '0;
    else
        axi_start_ff <= {axi_start_ff[1:0], AXI_START};
end

uwire disp_start = DISP_ON & (axi_start_ff[2:1] == 2'b01);


/* address counter */
always @(posedge ACLK) begin
    if (ARST)
        addr_cnt <= '0;
    else if (state_current == HALT && disp_start)
        addr_cnt <= '0;
    else if (ARVALID && ARREADY) // Show the NEXT burst start address.
        addr_cnt <= addr_cnt + $bits(addr_cnt)'('h80);
end


/* end of display */
localparam int XGA_MAX = XGA_VISIBLE_WIDTH*XGA_VISIBLE_HEIGHT*4;
assign disp_end = (addr_cnt >= XGA_MAX);


/* state machine control */
always @(posedge ACLK) begin
    if (ARST)
        state_current <= HALT;
    else
        state_current <= state_next;
end

always_comb begin // state transition table
    unique case (state_current)
        HALT:
            if (disp_start)
                state_next <= SET_ADDR;
            else
                state_next <= HALT;
        SET_ADDR:
            if (ARREADY)
                state_next <= READING;
            else
                state_next <= SET_ADDR;
        READING:
            if (RLAST & RVALID & RREADY) begin
                if (disp_end)
                    state_next <= HALT;
                else if (!FIFO_READY)
                    state_next <= WAITING;
                else
                    state_next <= SET_ADDR;
            end else
                state_next <= READING;
        WAITING:
            if (FIFO_READY)
                state_next <= SET_ADDR;
            else
                state_next <= WAITING;
    endcase
end

endmodule
