// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xavg_min_max.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAvg_min_max_CfgInitialize(XAvg_min_max *InstancePtr, XAvg_min_max_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAvg_min_max_Start(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAvg_min_max_IsDone(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAvg_min_max_IsIdle(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAvg_min_max_IsReady(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAvg_min_max_EnableAutoRestart(XAvg_min_max *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAvg_min_max_DisableAutoRestart(XAvg_min_max *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XAvg_min_max_Get_avg(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AVG_DATA);
    return Data;
}

u32 XAvg_min_max_Get_avg_vld(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_AVG_CTRL);
    return Data & 0x1;
}

u32 XAvg_min_max_Get_min(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_MIN_DATA);
    return Data;
}

u32 XAvg_min_max_Get_min_vld(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_MIN_CTRL);
    return Data & 0x1;
}

u32 XAvg_min_max_Get_max(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_MAX_DATA);
    return Data;
}

u32 XAvg_min_max_Get_max_vld(XAvg_min_max *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_MAX_CTRL);
    return Data & 0x1;
}

u32 XAvg_min_max_Get_a_BaseAddress(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XAVG_MIN_MAX_CONTROL_ADDR_A_BASE);
}

u32 XAvg_min_max_Get_a_HighAddress(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH);
}

u32 XAvg_min_max_Get_a_TotalBytes(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH - XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + 1);
}

u32 XAvg_min_max_Get_a_BitWidth(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAVG_MIN_MAX_CONTROL_WIDTH_A;
}

u32 XAvg_min_max_Get_a_Depth(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAVG_MIN_MAX_CONTROL_DEPTH_A;
}

u32 XAvg_min_max_Write_a_Words(XAvg_min_max *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH - XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XAvg_min_max_Read_a_Words(XAvg_min_max *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH - XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + (offset + i)*4);
    }
    return length;
}

u32 XAvg_min_max_Write_a_Bytes(XAvg_min_max *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH - XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XAvg_min_max_Read_a_Bytes(XAvg_min_max *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XAVG_MIN_MAX_CONTROL_ADDR_A_HIGH - XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XAVG_MIN_MAX_CONTROL_ADDR_A_BASE + offset + i);
    }
    return length;
}

void XAvg_min_max_InterruptGlobalEnable(XAvg_min_max *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_GIE, 1);
}

void XAvg_min_max_InterruptGlobalDisable(XAvg_min_max *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_GIE, 0);
}

void XAvg_min_max_InterruptEnable(XAvg_min_max *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_IER);
    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_IER, Register | Mask);
}

void XAvg_min_max_InterruptDisable(XAvg_min_max *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_IER);
    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAvg_min_max_InterruptClear(XAvg_min_max *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAvg_min_max_WriteReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_ISR, Mask);
}

u32 XAvg_min_max_InterruptGetEnabled(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_IER);
}

u32 XAvg_min_max_InterruptGetStatus(XAvg_min_max *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAvg_min_max_ReadReg(InstancePtr->Control_BaseAddress, XAVG_MIN_MAX_CONTROL_ADDR_ISR);
}

