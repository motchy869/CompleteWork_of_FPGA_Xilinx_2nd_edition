// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xbitblt.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBitblt_CfgInitialize(XBitblt *InstancePtr, XBitblt_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBitblt_Start(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBitblt_IsDone(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBitblt_IsIdle(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBitblt_IsReady(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBitblt_EnableAutoRestart(XBitblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XBitblt_DisableAutoRestart(XBitblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_AP_CTRL, 0);
}

void XBitblt_Set_src_in(XBitblt *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_SRC_IN_DATA, (u32)(Data));
    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_SRC_IN_DATA + 4, (u32)(Data >> 32));
}

u64 XBitblt_Get_src_in(XBitblt *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_SRC_IN_DATA);
    Data += (u64)XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_SRC_IN_DATA + 4) << 32;
    return Data;
}

void XBitblt_Set_dst_in(XBitblt *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_IN_DATA, (u32)(Data));
    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_IN_DATA + 4, (u32)(Data >> 32));
}

u64 XBitblt_Get_dst_in(XBitblt *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_IN_DATA);
    Data += (u64)XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_IN_DATA + 4) << 32;
    return Data;
}

void XBitblt_Set_dst_out(XBitblt *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_OUT_DATA, (u32)(Data));
    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_OUT_DATA + 4, (u32)(Data >> 32));
}

u64 XBitblt_Get_dst_out(XBitblt *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_OUT_DATA);
    Data += (u64)XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_DST_OUT_DATA + 4) << 32;
    return Data;
}

void XBitblt_Set_alpha(XBitblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_ALPHA_DATA, Data);
}

u32 XBitblt_Get_alpha(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_ALPHA_DATA);
    return Data;
}

void XBitblt_Set_width(XBitblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XBitblt_Get_width(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XBitblt_Set_height(XBitblt *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XBitblt_Get_height(XBitblt *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XBitblt_InterruptGlobalEnable(XBitblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_GIE, 1);
}

void XBitblt_InterruptGlobalDisable(XBitblt *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_GIE, 0);
}

void XBitblt_InterruptEnable(XBitblt *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_IER);
    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_IER, Register | Mask);
}

void XBitblt_InterruptDisable(XBitblt *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_IER);
    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_IER, Register & (~Mask));
}

void XBitblt_InterruptClear(XBitblt *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBitblt_WriteReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_ISR, Mask);
}

u32 XBitblt_InterruptGetEnabled(XBitblt *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_IER);
}

u32 XBitblt_InterruptGetStatus(XBitblt *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBitblt_ReadReg(InstancePtr->Control_BaseAddress, XBITBLT_CONTROL_ADDR_ISR);
}

