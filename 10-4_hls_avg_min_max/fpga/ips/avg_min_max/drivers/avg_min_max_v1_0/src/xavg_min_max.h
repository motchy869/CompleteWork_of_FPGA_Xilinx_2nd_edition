// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XAVG_MIN_MAX_H
#define XAVG_MIN_MAX_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xavg_min_max_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XAvg_min_max_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAvg_min_max;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAvg_min_max_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAvg_min_max_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAvg_min_max_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAvg_min_max_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XAvg_min_max_Initialize(XAvg_min_max *InstancePtr, u16 DeviceId);
XAvg_min_max_Config* XAvg_min_max_LookupConfig(u16 DeviceId);
int XAvg_min_max_CfgInitialize(XAvg_min_max *InstancePtr, XAvg_min_max_Config *ConfigPtr);
#else
int XAvg_min_max_Initialize(XAvg_min_max *InstancePtr, const char* InstanceName);
int XAvg_min_max_Release(XAvg_min_max *InstancePtr);
#endif

void XAvg_min_max_Start(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_IsDone(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_IsIdle(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_IsReady(XAvg_min_max *InstancePtr);
void XAvg_min_max_EnableAutoRestart(XAvg_min_max *InstancePtr);
void XAvg_min_max_DisableAutoRestart(XAvg_min_max *InstancePtr);

u32 XAvg_min_max_Get_avg(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_avg_vld(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_min(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_min_vld(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_max(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_max_vld(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_a_BaseAddress(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_a_HighAddress(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_a_TotalBytes(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_a_BitWidth(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Get_a_Depth(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_Write_a_Words(XAvg_min_max *InstancePtr, int offset, word_type *data, int length);
u32 XAvg_min_max_Read_a_Words(XAvg_min_max *InstancePtr, int offset, word_type *data, int length);
u32 XAvg_min_max_Write_a_Bytes(XAvg_min_max *InstancePtr, int offset, char *data, int length);
u32 XAvg_min_max_Read_a_Bytes(XAvg_min_max *InstancePtr, int offset, char *data, int length);

void XAvg_min_max_InterruptGlobalEnable(XAvg_min_max *InstancePtr);
void XAvg_min_max_InterruptGlobalDisable(XAvg_min_max *InstancePtr);
void XAvg_min_max_InterruptEnable(XAvg_min_max *InstancePtr, u32 Mask);
void XAvg_min_max_InterruptDisable(XAvg_min_max *InstancePtr, u32 Mask);
void XAvg_min_max_InterruptClear(XAvg_min_max *InstancePtr, u32 Mask);
u32 XAvg_min_max_InterruptGetEnabled(XAvg_min_max *InstancePtr);
u32 XAvg_min_max_InterruptGetStatus(XAvg_min_max *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
