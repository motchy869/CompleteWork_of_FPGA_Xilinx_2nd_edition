#include <cstdio>
#include <cstdlib>
#include <xparameters.h>
#include <xgpio.h>
#include <xil_cache.h>

/* GPIO channels */
#define DISP_ADDR 1
#define DISP_ON 2
#define VBLANK 1
#define CLR_VBLANK 2

#define X_SIZE 640
#define Y_SIZE 480
#define VRAM_START_ADDR 0x10000000
volatile uint32_t *const VRAM = reinterpret_cast<uint32_t *>(VRAM_START_ADDR);

XGpio GpioAddrOn, GpioBlank;

/* Wait VBLANK. */
void wait_vblank() {
    XGpio_DiscreteWrite(&GpioBlank, CLR_VBLANK, 1);
    XGpio_DiscreteWrite(&GpioBlank, CLR_VBLANK, 0);
    while (XGpio_DiscreteRead(&GpioBlank, VBLANK) == 0);
}

/* Draw a box. */
void drawBox(const int xpos, const int ypos, const int width, const int height, const uint32_t color) {
    for (int x=xpos; x<xpos+width; ++x) {
        VRAM[ypos*X_SIZE + x] = color;
        VRAM[(ypos + height - 1)*X_SIZE + x] = color;
    }
    for (int y=ypos; y<ypos+height; ++y) {
        VRAM[y*X_SIZE + xpos] = color;
        VRAM[y*X_SIZE + xpos + width - 1] = color;
    }
}

int main() {
    int status;

    /* Initialize GPIO_0 (display address, display on/off). */
    status = XGpio_Initialize(&GpioAddrOn, XPAR_GPIO_0_DEVICE_ID);
    if (XST_SUCCESS != status) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioAddrOn, DISP_ADDR, 0);
    XGpio_SetDataDirection(&GpioAddrOn, DISP_ON, 0);

    /* Initialize GPIO_1 (VBLANK control). */
    status = XGpio_Initialize(&GpioBlank, XPAR_GPIO_1_DEVICE_ID);
    if (XST_SUCCESS != status) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioBlank, VBLANK, 1);
    XGpio_SetDataDirection(&GpioBlank, CLR_VBLANK, 0);

    /* Enable display. */
    wait_vblank();
    XGpio_DiscreteWrite(&GpioAddrOn, DISP_ADDR, VRAM_START_ADDR);
    XGpio_DiscreteWrite(&GpioAddrOn, DISP_ON, 1);

    /* Clear display. */
    for (int i=0; i<X_SIZE*Y_SIZE; ++i) {
        VRAM[i] = 0;
    }
    Xil_DCacheFlush();

    /* Draw some frames. */
    drawBox(0, 0, X_SIZE, Y_SIZE, 0x00ffffff);
    drawBox(10, 10, 200, 100, 0x00ff0000); /* R */
    drawBox(40, 30, 150, 300, 0x0000ff00); /* G */
    drawBox(100, 150, 400, 300, 0x000000ff); /* B */
    Xil_DCacheFlush();

    /* Draw stripe. */
    for (int i=0; i<X_SIZE*Y_SIZE; ++i) {
        VRAM[i] = i;
    }
    Xil_DCacheFlush();

    /* Disable display. */
    wait_vblank();
    XGpio_DiscreteWrite(&GpioAddrOn, DISP_ON, 0);

    return EXIT_SUCCESS;
}
