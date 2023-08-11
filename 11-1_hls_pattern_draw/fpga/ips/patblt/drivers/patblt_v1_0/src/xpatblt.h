// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XPATBLT_H
#define XPATBLT_H

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
#include "xpatblt_hw.h"

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
} XPatblt_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XPatblt;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPatblt_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPatblt_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPatblt_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPatblt_ReadReg(BaseAddress, RegOffset) \
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
int XPatblt_Initialize(XPatblt *InstancePtr, u16 DeviceId);
XPatblt_Config* XPatblt_LookupConfig(u16 DeviceId);
int XPatblt_CfgInitialize(XPatblt *InstancePtr, XPatblt_Config *ConfigPtr);
#else
int XPatblt_Initialize(XPatblt *InstancePtr, const char* InstanceName);
int XPatblt_Release(XPatblt *InstancePtr);
#endif

void XPatblt_Start(XPatblt *InstancePtr);
u32 XPatblt_IsDone(XPatblt *InstancePtr);
u32 XPatblt_IsIdle(XPatblt *InstancePtr);
u32 XPatblt_IsReady(XPatblt *InstancePtr);
void XPatblt_EnableAutoRestart(XPatblt *InstancePtr);
void XPatblt_DisableAutoRestart(XPatblt *InstancePtr);

void XPatblt_Set_dst_out(XPatblt *InstancePtr, u64 Data);
u64 XPatblt_Get_dst_out(XPatblt *InstancePtr);
void XPatblt_Set_xpos(XPatblt *InstancePtr, u32 Data);
u32 XPatblt_Get_xpos(XPatblt *InstancePtr);
void XPatblt_Set_ypos(XPatblt *InstancePtr, u32 Data);
u32 XPatblt_Get_ypos(XPatblt *InstancePtr);
void XPatblt_Set_width(XPatblt *InstancePtr, u32 Data);
u32 XPatblt_Get_width(XPatblt *InstancePtr);
void XPatblt_Set_height(XPatblt *InstancePtr, u32 Data);
u32 XPatblt_Get_height(XPatblt *InstancePtr);
void XPatblt_Set_color(XPatblt *InstancePtr, u32 Data);
u32 XPatblt_Get_color(XPatblt *InstancePtr);

void XPatblt_InterruptGlobalEnable(XPatblt *InstancePtr);
void XPatblt_InterruptGlobalDisable(XPatblt *InstancePtr);
void XPatblt_InterruptEnable(XPatblt *InstancePtr, u32 Mask);
void XPatblt_InterruptDisable(XPatblt *InstancePtr, u32 Mask);
void XPatblt_InterruptClear(XPatblt *InstancePtr, u32 Mask);
u32 XPatblt_InterruptGetEnabled(XPatblt *InstancePtr);
u32 XPatblt_InterruptGetStatus(XPatblt *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
