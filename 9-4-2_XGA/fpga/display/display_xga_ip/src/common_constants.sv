package common_constants;
    `include "xga_param.svh"

    parameter int AXI_BURST_TYPE_INCR = 2'b01;
    parameter int XGA_VISIBLE_WIDTH = HPERIOD - HFRONT - HWIDTH - HBACK;
    parameter int XGA_VISIBLE_HEIGHT = VPERIOD - VFRONT - VWIDTH - VBACK;
    parameter int DISP_ADDR_WIDTH = 30;
endpackage
