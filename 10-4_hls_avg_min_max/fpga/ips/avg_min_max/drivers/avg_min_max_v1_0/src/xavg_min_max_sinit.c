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
#include "xavg_min_max.h"

extern XAvg_min_max_Config XAvg_min_max_ConfigTable[];

XAvg_min_max_Config *XAvg_min_max_LookupConfig(u16 DeviceId) {
	XAvg_min_max_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XAVG_MIN_MAX_NUM_INSTANCES; Index++) {
		if (XAvg_min_max_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAvg_min_max_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAvg_min_max_Initialize(XAvg_min_max *InstancePtr, u16 DeviceId) {
	XAvg_min_max_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAvg_min_max_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAvg_min_max_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

