`default_nettype none

module display_xga_wrap #(
    parameter integer DISP_ADDR_WIDTH = 30,
    parameter integer C_M_AXI_THREAD_ID_WIDTH = 1,
    parameter integer C_M_AXI_ADDR_WIDTH = 32,
    parameter integer C_M_AXI_DATA_WIDTH = 64
)(
    /* System signals */
    input wire ACLK,
    input wire ARESETN,

    /* AXI Master Interface Write Address */
    output wire M_AXI_AWVALID,
    input wire M_AXI_AWREADY,
    output wire[C_M_AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output wire [8-1:0] M_AXI_AWLEN,
    output wire [3-1:0] M_AXI_AWSIZE,
    output wire [2-1:0] M_AXI_AWBURST,
    output wire M_AXI_AWLOCK,
    output wire [4-1:0] M_AXI_AWCACHE,
    output wire [3-1:0] M_AXI_AWPROT,
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_AWID,
    output wire [4-1:0] M_AXI_AWQOS,
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_AWUSER,

    /* AXI Master Interface Write Data */
    output wire M_AXI_WVALID,
    input wire M_AXI_WREADY,
    output wire[C_M_AXI_DATA_WIDTH-1:0] M_AXI_WDATA,
    output wire[C_M_AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
    output wire M_AXI_WLAST,
    output wire M_AXI_WUSER,

    /* AXI Master Interface Write Response */
    input wire M_AXI_BVALID,
    output wire M_AXI_BREADY,
    input wire [2-1:0] M_AXI_BRESP,
    input wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_BID,
    input wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_BUSER,

    /* AXI Master Interface Read Address */
    output wire M_AXI_ARVALID,
    input wire M_AXI_ARREADY,
    output wire[C_M_AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR,
    output wire [8-1:0] M_AXI_ARLEN,
    output wire [3-1:0] M_AXI_ARSIZE,
    output wire [2-1:0] M_AXI_ARBURST,
    output wire M_AXI_ARLOCK,
    output wire [4-1:0] M_AXI_ARCACHE,
    output wire [3-1:0] M_AXI_ARPROT,
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_ARID,
    output wire [4-1:0] M_AXI_ARQOS,
    output wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_ARUSER,

    /* AXI Master Interface Read Data */
    input wire M_AXI_RVALID,
    output wire M_AXI_RREADY,
    input wire[C_M_AXI_DATA_WIDTH-1:0] M_AXI_RDATA,
    input wire [2-1:0] M_AXI_RRESP,
    input wire M_AXI_RLAST,
    input wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_RID,
    input wire [C_M_AXI_THREAD_ID_WIDTH-1:0] M_AXI_RUSER,

    /* VGA, HDMI adapter signal */
    output wire PCK,
    output wire [8-1:0] XGA_R, XGA_G, XGA_B,
    output wire XGA_HS, XGA_VS, XGA_DE,

    /* GPIO signal */
    input wire [DISP_ADDR_WIDTH-1:0] DISP_ADDR,
    input wire DISP_ON, CLR_VBLANK,
    output wire VBLANK,

    /* FIFO flag */
    output wire FIFO_OVERFLOW, FIFO_UNDERFLOW
);

display_xga display_xga_inst(
    .ACLK(ACLK),
    .ARESETN(ARESETN),
    .M_AXI_AWVALID(M_AXI_AWVALID),
    .M_AXI_AWREADY(M_AXI_AWREADY),
    .M_AXI_AWADDR(M_AXI_AWADDR),
    .M_AXI_AWLEN(M_AXI_AWLEN),
    .M_AXI_AWSIZE(M_AXI_AWSIZE),
    .M_AXI_AWBURST(M_AXI_AWBURST),
    .M_AXI_AWLOCK(M_AXI_AWLOCK),
    .M_AXI_AWCACHE(M_AXI_AWCACHE),
    .M_AXI_AWPROT(M_AXI_AWPROT),
    .M_AXI_AWID(M_AXI_AWID),
    .M_AXI_AWQOS(M_AXI_AWQOS),
    .M_AXI_AWUSER(M_AXI_AWUSER),
    .M_AXI_WVALID(M_AXI_WVALID),
    .M_AXI_WREADY(M_AXI_WREADY),
    .M_AXI_WDATA(M_AXI_WDATA),
    .M_AXI_WSTRB(M_AXI_WSTRB),
    .M_AXI_WLAST(M_AXI_WLAST),
    .M_AXI_WUSER(M_AXI_WUSER),
    .M_AXI_BVALID(M_AXI_BVALID),
    .M_AXI_BREADY(M_AXI_BREADY),
    .M_AXI_BRESP(M_AXI_BRESP),
    .M_AXI_BID(M_AXI_BID),
    .M_AXI_BUSER(M_AXI_BUSER),
    .M_AXI_ARVALID(M_AXI_ARVALID),
    .M_AXI_ARREADY(M_AXI_ARREADY),
    .M_AXI_ARADDR(M_AXI_ARADDR),
    .M_AXI_ARLEN(M_AXI_ARLEN),
    .M_AXI_ARSIZE(M_AXI_ARSIZE),
    .M_AXI_ARBURST(M_AXI_ARBURST),
    .M_AXI_ARLOCK(M_AXI_ARLOCK),
    .M_AXI_ARCACHE(M_AXI_ARCACHE),
    .M_AXI_ARPROT(M_AXI_ARPROT),
    .M_AXI_ARID(M_AXI_ARID),
    .M_AXI_ARQOS(M_AXI_ARQOS),
    .M_AXI_ARUSER(M_AXI_ARUSER),
    .M_AXI_RVALID(M_AXI_RVALID),
    .M_AXI_RREADY(M_AXI_RREADY),
    .M_AXI_RDATA(M_AXI_RDATA),
    .M_AXI_RRESP(M_AXI_RRESP),
    .M_AXI_RLAST(M_AXI_RLAST),
    .M_AXI_RID(M_AXI_RID),
    .M_AXI_RUSER(M_AXI_RUSER),
    .PCK(PCK),
    .XGA_R(XGA_R),
    .XGA_G(XGA_G),
    .XGA_B(XGA_B),
    .XGA_HS(XGA_HS),
    .XGA_VS(XGA_VS),
    .XGA_DE(XGA_DE),
    .DISP_ADDR(DISP_ADDR),
    .DISP_ON(DISP_ON),
    .CLR_VBLANK(CLR_VBLANK),
    .VBLANK(VBLANK),
    .FIFO_OVERFLOW(FIFO_OVERFLOW),
    .FIFO_UNDERFLOW(FIFO_UNDERFLOW)
);

endmodule
