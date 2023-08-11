// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XBITBLT_H
#define XBITBLT_H

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
#include "xbitblt_hw.h"

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
} XBitblt_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XBitblt;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBitblt_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBitblt_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBitblt_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBitblt_ReadReg(BaseAddress, RegOffset) \
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
int XBitblt_Initialize(XBitblt *InstancePtr, u16 DeviceId);
XBitblt_Config* XBitblt_LookupConfig(u16 DeviceId);
int XBitblt_CfgInitialize(XBitblt *InstancePtr, XBitblt_Config *ConfigPtr);
#else
int XBitblt_Initialize(XBitblt *InstancePtr, const char* InstanceName);
int XBitblt_Release(XBitblt *InstancePtr);
#endif

void XBitblt_Start(XBitblt *InstancePtr);
u32 XBitblt_IsDone(XBitblt *InstancePtr);
u32 XBitblt_IsIdle(XBitblt *InstancePtr);
u32 XBitblt_IsReady(XBitblt *InstancePtr);
void XBitblt_EnableAutoRestart(XBitblt *InstancePtr);
void XBitblt_DisableAutoRestart(XBitblt *InstancePtr);

void XBitblt_Set_src_in(XBitblt *InstancePtr, u64 Data);
u64 XBitblt_Get_src_in(XBitblt *InstancePtr);
void XBitblt_Set_dst_in(XBitblt *InstancePtr, u64 Data);
u64 XBitblt_Get_dst_in(XBitblt *InstancePtr);
void XBitblt_Set_dst_out(XBitblt *InstancePtr, u64 Data);
u64 XBitblt_Get_dst_out(XBitblt *InstancePtr);
void XBitblt_Set_alpha(XBitblt *InstancePtr, u32 Data);
u32 XBitblt_Get_alpha(XBitblt *InstancePtr);
void XBitblt_Set_width(XBitblt *InstancePtr, u32 Data);
u32 XBitblt_Get_width(XBitblt *InstancePtr);
void XBitblt_Set_height(XBitblt *InstancePtr, u32 Data);
u32 XBitblt_Get_height(XBitblt *InstancePtr);

void XBitblt_InterruptGlobalEnable(XBitblt *InstancePtr);
void XBitblt_InterruptGlobalDisable(XBitblt *InstancePtr);
void XBitblt_InterruptEnable(XBitblt *InstancePtr, u32 Mask);
void XBitblt_InterruptDisable(XBitblt *InstancePtr, u32 Mask);
void XBitblt_InterruptClear(XBitblt *InstancePtr, u32 Mask);
u32 XBitblt_InterruptGetEnabled(XBitblt *InstancePtr);
u32 XBitblt_InterruptGetStatus(XBitblt *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
