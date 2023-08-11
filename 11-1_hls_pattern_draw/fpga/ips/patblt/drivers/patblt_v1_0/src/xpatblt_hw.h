// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of dst_out
//        bit 31~0 - dst_out[31:0] (Read/Write)
// 0x14 : Data signal of dst_out
//        bit 31~0 - dst_out[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of xpos
//        bit 9~0 - xpos[9:0] (Read/Write)
//        others  - reserved
// 0x20 : reserved
// 0x24 : Data signal of ypos
//        bit 9~0 - ypos[9:0] (Read/Write)
//        others  - reserved
// 0x28 : reserved
// 0x2c : Data signal of width
//        bit 9~0 - width[9:0] (Read/Write)
//        others  - reserved
// 0x30 : reserved
// 0x34 : Data signal of height
//        bit 9~0 - height[9:0] (Read/Write)
//        others  - reserved
// 0x38 : reserved
// 0x3c : Data signal of color
//        bit 31~0 - color[31:0] (Read/Write)
// 0x40 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPATBLT_CONTROL_ADDR_AP_CTRL      0x00
#define XPATBLT_CONTROL_ADDR_GIE          0x04
#define XPATBLT_CONTROL_ADDR_IER          0x08
#define XPATBLT_CONTROL_ADDR_ISR          0x0c
#define XPATBLT_CONTROL_ADDR_DST_OUT_DATA 0x10
#define XPATBLT_CONTROL_BITS_DST_OUT_DATA 64
#define XPATBLT_CONTROL_ADDR_XPOS_DATA    0x1c
#define XPATBLT_CONTROL_BITS_XPOS_DATA    10
#define XPATBLT_CONTROL_ADDR_YPOS_DATA    0x24
#define XPATBLT_CONTROL_BITS_YPOS_DATA    10
#define XPATBLT_CONTROL_ADDR_WIDTH_DATA   0x2c
#define XPATBLT_CONTROL_BITS_WIDTH_DATA   10
#define XPATBLT_CONTROL_ADDR_HEIGHT_DATA  0x34
#define XPATBLT_CONTROL_BITS_HEIGHT_DATA  10
#define XPATBLT_CONTROL_ADDR_COLOR_DATA   0x3c
#define XPATBLT_CONTROL_BITS_COLOR_DATA   32

