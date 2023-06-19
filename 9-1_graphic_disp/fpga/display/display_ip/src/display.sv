`default_nettype none

`include "vga_param.svh"
import common_constants::*;

localparam FIFO_DEPTH = 512;

module display # (
    parameter integer C_M_AXI_THREAD_ID_WIDTH = 1,
    parameter integer C_M_AXI_ADDR_WIDTH = 32,
    parameter integer C_M_AXI_DATA_WIDTH = 64
)
(
    /* System signals */
    input uwire ACLK,
    input uwire ARESETN,

    /* AXI Master Interface Write Address */
    output uwire M_AXI_AWVALID,
    input uwire M_AXI_AWREADY,
    output uwire[C_M_AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output uwire [8-1:0] M_AXI_AWLEN,
    output uwire [3-1:0] M_AXI_AWSIZE,
    output uwire [2-1:0] M_AXI_AWBURST,
    output uwire M_AXI_AWLOCK,
    output uwire [4-1:0] M_AXI_AWCACHE,
    output uwire [3-1:0] M_AXI_AWPROT,
    output uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_AWID,
    output uwire [4-1:0] M_AXI_AWQOS,
    output uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_AWUSER,

    /* AXI Master Interface Write Data */
    output uwire M_AXI_WVALID,
    input uwire M_AXI_WREADY,
    output uwire[C_M_AXI_DATA_WIDTH-1:0] M_AXI_WDATA,
    output uwire[C_M_AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
    output uwire M_AXI_WLAST,
    output uwire M_AXI_WUSER,

    /* AXI Master Interface Write Response */
    input uwire M_AXI_BVALID,
    output uwire M_AXI_BREADY,
    input uwire [2-1:0] M_AXI_BRESP,
    input uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_BID,
    input uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_BUSER,

    /* AXI Master Interface Read Address */
    output uwire M_AXI_ARVALID,
    input uwire M_AXI_ARREADY,
    output uwire[C_M_AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR,
    output uwire [8-1:0] M_AXI_ARLEN,
    output uwire [3-1:0] M_AXI_ARSIZE,
    output uwire [2-1:0] M_AXI_ARBURST,
    output uwire M_AXI_ARLOCK,
    output uwire [4-1:0] M_AXI_ARCACHE,
    output uwire [3-1:0] M_AXI_ARPROT,
    output uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_ARID,
    output uwire [4-1:0] M_AXI_ARQOS,
    output uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_ARUSER,

    /* AXI Master Interface Read Data */
    input uwire M_AXI_RVALID,
    output uwire M_AXI_RREADY,
    input uwire[C_M_AXI_DATA_WIDTH-1:0] M_AXI_RDATA,
    input uwire [2-1:0] M_AXI_RRESP,
    input uwire M_AXI_RLAST,
    input uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_RID,
    input uwire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_RUSER,

    /* VGA, HDMI adapter signal */
    output uwire PCK,
    output uwire [8-1:0] VGA_R, VGA_G, VGA_B,
    output uwire VGA_HS, VGA_VS, VGA_DE,

    /* GPIO signal */
    input uwire[DISP_ADDR_WIDTH-1:0] DISP_ADDR,
    input uwire DISP_ON, CLR_VBLANK,
    output uwire VBLANK,

    /* FIFO flag */
    output uwire FIFO_OVERFLOW, FIFO_UNDERFLOW
);

/* -------- Fixed AXI signals -------- */
/* AW */
assign M_AXI_AWVALID = '0;
assign M_AXI_AWADDR = '0;
assign M_AXI_AWLEN = '0;
assign M_AXI_AWSIZE = '0;
assign M_AXI_AWBURST = '0;
assign M_AXI_AWLOCK = '0;
assign M_AXI_AWCACHE = 4'b0011;
assign M_AXI_AWPROT = '0;
assign M_AXI_AWID = '0;
assign M_AXI_AWQOS = '0;
assign M_AXI_AWUSER = '0;

/* W */
assign M_AXI_WVALID = '0;
assign M_AXI_WDATA = '0;
assign M_AXI_WSTRB = '0;
assign M_AXI_WLAST = '0;
assign M_AXI_WUSER = '0;

/* B */
assign M_AXI_BREADY = '0;

/* AR */
assign M_AXI_ARLEN = $bits(M_AXI_ARLEN)'(15); /* 16 beats */
assign M_AXI_ARSIZE = $bits(M_AXI_ARSIZE)'(3); /* 8 bytes */
assign M_AXI_ARBURST = AXI_BURST_TYPE_INCR;
assign M_AXI_ARLOCK = '0;
assign M_AXI_ARCACHE = 4'b0011;
assign M_AXI_ARPROT = '0;
assign M_AXI_ARID = '0;
assign M_AXI_ARQOS = '0;
assign M_AXI_ARUSER = '0;


/* ------- ACLK-synchronized reset signal -------- */
reg [1:0] arst_ff;

always @(posedge ACLK) begin
    arst_ff <= {arst_ff[0], ~ARESETN};
end

uwire ARST = arst_ff[1];


/* ------- PCK-synchronized reset signal -------- */
reg [1:0] prst_ff;

always @(posedge PCK) begin
    prst_ff <= {prst_ff[0], ~ARESETN};
end

uwire PRST = prst_ff[1];


/* -------- Connect blocks. -------- */
uwire AXI_START;
uwire FIFO_READ;
uwire [3*$bits(VGA_R)-1:0] FIFO_OUT;
uwire [$clog2(HPERIOD)-1:0] HCNT;
uwire [$clog2(VPERIOD)-1:0] VCNT;
uwire [$clog2(FIFO_DEPTH)-1:0] fifo_cnt;
(* mark_debug = "true" *) uwire FIFO_READY = (fifo_cnt < $bits(fifo_cnt)'(FIFO_DEPTH*3/4));

disp_ctrl disp_ctrl_inst(
    .ACLK(ACLK),
    .ARST(ARST),
    .ARADDR(M_AXI_ARADDR),
    .ARVALID(M_AXI_ARVALID),
    .ARREADY(M_AXI_ARREADY),
    .RLAST(M_AXI_RLAST),
    .RVALID(M_AXI_RVALID),
    .RREADY(M_AXI_RREADY),
    .AXI_START(AXI_START),
    .DISP_ON(DISP_ON),
    .DISP_ADDR(DISP_ADDR),
    .FIFO_READY(FIFO_READY)
);

disp_fifo disp_fifo_inst(
    .rst(~VGA_VS),
    .wr_clk(ACLK),
    .rd_clk(PCK),
    .din({M_AXI_RDATA[0+:3*$bits(VGA_R)], M_AXI_RDATA[32+:3*$bits(VGA_R)]}),
    .wr_en(M_AXI_RVALID),
    .rd_en(FIFO_READ),
    .dout(FIFO_OUT),
    .full(),
    .overflow(FIFO_OVERFLOW),
    .empty(),
    .underflow(FIFO_UNDERFLOW),
    .wr_data_count(fifo_cnt)
);

disp_out disp_out_inst(
    .PCK(PCK),
    .PRST(PRST),
    .DISP_ON(DISP_ON),
    .FIFO_READ(FIFO_READ),
    .FIFO_OUT(FIFO_OUT),
    .HCNT(HCNT),
    .VCNT(VCNT),
    .AXI_START(AXI_START),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_DE(VGA_DE)
);

disp_flag disp_flag_inst(
    .ACLK(ACLK),
    .ARST(ARST),
    .VGA_VS(VGA_VS),
    .CLR_VBLANK(CLR_VBLANK),
    .VBLANK(VBLANK)
);

syncgen syncgen_inst(
    .CLK(ACLK),
    .RST(PRST),
    .PCK(PCK),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .HCNT(HCNT),
    .VCNT(VCNT)
);

endmodule
