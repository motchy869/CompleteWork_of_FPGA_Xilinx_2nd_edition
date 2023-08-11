// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1.1 (64-bit)
// Tool Version Limit: 2023.06
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xbitblt.h"

extern XBitblt_Config XBitblt_ConfigTable[];

XBitblt_Config *XBitblt_LookupConfig(u16 DeviceId) {
	XBitblt_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBITBLT_NUM_INSTANCES; Index++) {
		if (XBitblt_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBitblt_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBitblt_Initialize(XBitblt *InstancePtr, u16 DeviceId) {
	XBitblt_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBitblt_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBitblt_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

