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
// 0x10 : Data signal of avg
//        bit 15~0 - avg[15:0] (Read)
//        others   - reserved
// 0x14 : Control signal of avg
//        bit 0  - avg_ap_vld (Read/COR)
//        others - reserved
// 0x40 : Data signal of min
//        bit 15~0 - min[15:0] (Read)
//        others   - reserved
// 0x44 : Control signal of min
//        bit 0  - min_ap_vld (Read/COR)
//        others - reserved
// 0x50 : Data signal of max
//        bit 15~0 - max[15:0] (Read)
//        others   - reserved
// 0x54 : Control signal of max
//        bit 0  - max_ap_vld (Read/COR)
//        others - reserved
// 0x20 ~
// 0x3f : Memory 'a' (16 * 16b)
//        Word n : bit [15: 0] - a[2n]
//                 bit [31:16] - a[2n+1]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL  0x00
#define XAVG_MIN_MAX_CONTROL_ADDR_GIE      0x04
#define XAVG_MIN_MAX_CONTROL_ADDR_IER      0x08
#define XAVG_MIN_MAX_CONTROL_ADDR_ISR      0x0c
#define XAVG_MIN_MAX_CONTROL_ADDR_AVG_DATA 0x10
#define XAVG_MIN_MAX_CONTROL_BITS_AVG_DATA 16
#define XAVG_MIN_MAX_CONTROL_ADDR_AVG_CTRL 0x14
#define XAVG_MIN_MAX_CONTROL_ADDR_MIN_DATA 0x40
#define XAVG_MIN_MAX_CONTROL_BITS_MIN_DATA 16
#define XAVG_MIN_MAX_CONTROL_ADDR_MIN_CTRL 0x44
#define XAVG_MIN_MAX_CONTROL_ADDR_MAX_DATA 0x50
#define XAVG_MIN_MAX_CONTROL_BITS_MAX_DATA 16
#define XAVG_MIN_MAX_CONTROL_ADDR_MAX_CTRL 0x54
#define XAVG_MIN_MAX_CONTROL_ADDR_A_BASE   0x20
#define XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH   0x3f
#define XAVG_MIN_MAX_CONTROL_WIDTH_A       16
#define XAVG_MIN_MAX_CONTROL_DEPTH_A       16

