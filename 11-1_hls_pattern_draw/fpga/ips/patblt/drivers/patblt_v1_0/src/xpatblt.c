// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xpatblt.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPatblt_CfgInitialize(XPatblt *InstancePtr, XPatblt_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPatblt_Start(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XPatblt_IsDone(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XPatblt_IsIdle(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XPatblt_IsReady(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XPatblt_EnableAutoRestart(XPatblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XPatblt_DisableAutoRestart(XPatblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_AP_CTRL, 0);
}

void XPatblt_Set_dst_out(XPatblt *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_DST_OUT_DATA, (u32)(Data));
    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_DST_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XPatblt_Get_dst_out(XPatblt *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_DST_OUT_DATA);
    Data += (u64)XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_DST_OUT_DATA + 4) << 32;
    return Data;
}

void XPatblt_Set_xpos(XPatblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_XPOS_DATA, Data);
}

u32 XPatblt_Get_xpos(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_XPOS_DATA);
    return Data;
}

void XPatblt_Set_ypos(XPatblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_YPOS_DATA, Data);
}

u32 XPatblt_Get_ypos(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_YPOS_DATA);
    return Data;
}

void XPatblt_Set_width(XPatblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XPatblt_Get_width(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XPatblt_Set_height(XPatblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XPatblt_Get_height(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XPatblt_Set_color(XPatblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_COLOR_DATA, Data);
}

u32 XPatblt_Get_color(XPatblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_COLOR_DATA);
    return Data;
}

void XPatblt_InterruptGlobalEnable(XPatblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_GIE, 1);
}

void XPatblt_InterruptGlobalDisable(XPatblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_GIE, 0);
}

void XPatblt_InterruptEnable(XPatblt *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_IER);
    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_IER, Register | Mask);
}

void XPatblt_InterruptDisable(XPatblt *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_IER);
    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_IER, Register & (~Mask));
}

void XPatblt_InterruptClear(XPatblt *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPatblt_WriteReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_ISR, Mask);
}

u32 XPatblt_InterruptGetEnabled(XPatblt *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_IER);
}

u32 XPatblt_InterruptGetStatus(XPatblt *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPatblt_ReadReg(InstancePtr->Control_BaseAddress, XPATBLT_CONTROL_ADDR_ISR);
}

