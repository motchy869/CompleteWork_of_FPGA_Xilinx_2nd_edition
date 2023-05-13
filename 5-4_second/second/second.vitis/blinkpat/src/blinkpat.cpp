/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>
#include "xgpio.h"
#include "xscutimer.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"

#define TIMER_LOAD_VALUE 8325000 /* interrupt freq 40 Hz */
#define LED_CHANNEL 1 /* GPIO channel for LED*/
#define BTN_CHANNEL 2 /* GPIO channel for BTN */

#define UPBTN 1

/* instances of peripheral circuits */
XGpio g_Gpio;
XScuTimer g_TimerInstance;
XScuGic g_IntCInstance;

int g_cnt_40Hz = 0, g_cnt_1Hz = 0;
int g_blinkPattern = 0; /* 0 or 1 */

/* LED display pattern */
int led_rgb(const int blinkPattern, const int cnt) {
    int led;

    switch (cnt%5) {
        case 0: led = blinkPattern ? 0b110 : 0b100; break;
        case 1: led = blinkPattern ? 0b011 : 0b010; break;
        case 2: led = blinkPattern ? 0b101 : 0b001; break;
        case 3: led = 0b111; break;
        case 4: led = 0b000; break;
        default: led = 0b000; break;
    }

    return led;
}

void updateLed(const int blinkPattern, const int cnt) {
    XGpio_DiscreteWrite(&g_Gpio, LED_CHANNEL, led_rgb(blinkPattern, cnt));
}

void TimerCounterHandler(void *CallbackRef) {
    volatile static int prevBTN, currentBTN;
    XScuTimer *const timerInstancePtr = reinterpret_cast<XScuTimer *>(CallbackRef);

    if (XScuTimer_IsExpired(timerInstancePtr)) {
        XScuTimer_ClearInterruptStatus(timerInstancePtr);
        g_cnt_40Hz += 1;
        if (g_cnt_40Hz % 40 == 0) {
            g_cnt_1Hz += 1;
            xil_printf("g_cnt_1Hz=%d\n", g_cnt_1Hz);
        }
        prevBTN = currentBTN;
        currentBTN = XGpio_DiscreteRead(&g_Gpio, BTN_CHANNEL) & 1;
        if ((prevBTN & UPBTN)==0 && (currentBTN & UPBTN)==UPBTN) {
            g_blinkPattern = (g_blinkPattern+1)&1;
            xil_printf("BTNON g_blinkPattern=%d\n", g_blinkPattern);
        }
        updateLed(g_blinkPattern, g_cnt_1Hz);
    }
}

/* Init the interrupt controller. */
int ScuGicInt_Init() {
    XScuGic_Config *const configPtr = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
    const int status = XScuGic_CfgInitialize(&g_IntCInstance, configPtr, configPtr->CpuBaseAddress);
    if (status != XST_SUCCESS) {return XST_FAILURE;}
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
        reinterpret_cast<Xil_ExceptionHandler>(XScuGic_InterruptHandler), /* the 1st destination for interrupt */
        &g_IntCInstance
    );
    Xil_ExceptionEnable();
    return XST_SUCCESS;
}

/* Register interrupt handler */
int ScuGicInt_Reg(u32 Int_Id, void *InstancePtr, Xil_ExceptionHandler IntHandler) {
    const int status = XScuGic_Connect(&g_IntCInstance, Int_Id, IntHandler, InstancePtr);
    if (status != XST_SUCCESS) {return XST_FAILURE;}
    XScuGic_Enable(&g_IntCInstance, Int_Id);
    return XST_SUCCESS;
}

int main() {
    int status;
    xil_printf("Timer Interrupt Test.\n");

    /* Init GPIO. */
    status = XGpio_Initialize(&g_Gpio, XPAR_GPIO_0_DEVICE_ID);
    if (status != XST_SUCCESS) {return XST_FAILURE;}
    XGpio_SetDataDirection(&g_Gpio, LED_CHANNEL, 0); /* out */
    XGpio_SetDataDirection(&g_Gpio, BTN_CHANNEL, 1); /* in */
    XGpio_DiscreteWrite(&g_Gpio, LED_CHANNEL, led_rgb(g_blinkPattern, g_cnt_1Hz));

    /* Init timer driver. */
    XScuTimer_Config *const configPtr = XScuTimer_LookupConfig(XPAR_XSCUTIMER_0_DEVICE_ID);
    status = XScuTimer_CfgInitialize(&g_TimerInstance, configPtr, configPtr->BaseAddr);
    if (status != XST_SUCCESS) {return XST_FAILURE;}

    /* Init interrupts and register handlers. */
    status = ScuGicInt_Init();
    if (status != XST_SUCCESS) {return XST_FAILURE;}
    status = ScuGicInt_Reg(XPAR_SCUTIMER_INTR, &g_TimerInstance, TimerCounterHandler);
    if (status != XST_SUCCESS) {return XST_FAILURE;}

    /* Initialize and start timers. */
    XScuTimer_EnableAutoReload(&g_TimerInstance);
    XScuTimer_LoadTimer(&g_TimerInstance, TIMER_LOAD_VALUE);
    XScuTimer_EnableInterrupt(&g_TimerInstance);
    XScuTimer_Start(&g_TimerInstance);

    while (1) {
        /* nothing to do */
    }

    return 0;
}
