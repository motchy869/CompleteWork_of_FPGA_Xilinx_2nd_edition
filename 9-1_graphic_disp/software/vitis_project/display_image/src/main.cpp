#include <cstdio>
#include <cstdlib>
#include <vector>

#include <sleep.h>
#include <xparameters.h>
#include <xgpio.h>
#include <xsdps.h>
#include <xil_cache.h>
#include <xil_printf.h>
#include <ff.h>

/* GPIO channels */
#define DISP_ADDR 1
#define DISP_ON 2
#define VBLANK 1
#define CLR_VBLANK 2

#define DISP_X_SIZE 640
#define DISP_Y_SIZE 480
#define VRAM_START_ADDR 0x10000000
volatile uint32_t *const VRAM = reinterpret_cast<uint32_t *>(VRAM_START_ADDR);

XGpio GpioAddrOn, GpioBlank;

/* Wait VBLANK. */
void wait_vblank() {
    XGpio_DiscreteWrite(&GpioBlank, CLR_VBLANK, 1);
    XGpio_DiscreteWrite(&GpioBlank, CLR_VBLANK, 0);
    while (XGpio_DiscreteRead(&GpioBlank, VBLANK) == 0);
}

/**
 * @brief Load an image from the SD card.
 *
 * @param[in] filePath the path to the image file
 * @param[in] width the width of the image
 * @param[in] height the height of the image
 * @param[out] vramBuffer The VRAM buffer to store the image. It can be offsetted to store the image at a different location.
 * @retval false success
 * @retval true failure
 */
bool loadImage(const char *filePath, const int width, const int height, uint32_t *const vramBuffer) {
    const size_t readChunkSize = width*3; // 1 row (3 bytes per pixel)

    FIL fil;
    FRESULT fRes;
    UINT numBytesRead;
    std::vector<uint8_t> buffer(readChunkSize);
    bool retCode = false;

    /* Open the file. */
    fRes = f_open(&fil, filePath, FA_READ);
    if (FR_OK != fRes) {
        xil_printf("Error(%d): f_open\n", fRes);
        retCode = true;
        goto RETURN_TO_CALLER;
    }

    /* Read the file. */
    for (int row=0; row<height; ++row) {
        /* Read one row from the file. */
        fRes = f_read(&fil, buffer.data(), readChunkSize, &numBytesRead);

        if (FR_OK != fRes) {
            xil_printf("Error(%d): f_read\n", fRes);
            retCode = true;
            goto CLOSE_FILE;
        }

        /* Copy to the VRAM buffer. */
        uint32_t *vramBuffer_rowPtr = &vramBuffer[row*width];
        uint8_t *buffer_rowPtr = buffer.data();
        for (int col=0; col<width; ++col) {
            *vramBuffer_rowPtr = (*buffer_rowPtr << 16) | (*(buffer_rowPtr+1) << 8) | *(buffer_rowPtr+2);
            buffer_rowPtr += 3;
            ++vramBuffer_rowPtr;
        }
    }

    CLOSE_FILE:
        /* Close the file. */
        fRes = f_close(&fil);
        if (FR_OK != fRes) {
            xil_printf("Error(%d): f_close\n", fRes);
            retCode = true;
        }

    RETURN_TO_CALLER:
        return retCode;
}

int main() {
    FATFS fatFs;
    FRESULT fRes;

    /* Mount the SD card. */
    fRes = f_mount(&fatFs, "0:/", 0);
    if (FR_OK != fRes) {
        xil_printf("Error(%d): f_mount\n", fRes);
        return XST_FAILURE;
    }

    /* Initialize GPIO_0 (display address, display on/off). */
    if (XST_SUCCESS != XGpio_Initialize(&GpioAddrOn, XPAR_GPIO_0_DEVICE_ID)) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioAddrOn, DISP_ADDR, 0);
    XGpio_SetDataDirection(&GpioAddrOn, DISP_ON, 0);

    /* Initialize GPIO_1 (VBLANK control). */
    if (XST_SUCCESS != XGpio_Initialize(&GpioBlank, XPAR_GPIO_1_DEVICE_ID)) {
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&GpioBlank, VBLANK, 1);
    XGpio_SetDataDirection(&GpioBlank, CLR_VBLANK, 0);

    /* Clear display. */
    for (int i=0; i<DISP_X_SIZE*DISP_Y_SIZE; ++i) {
        VRAM[i] = 0;
    }
    Xil_DCacheFlush();

    /* Enable display. */
    wait_vblank();
    XGpio_DiscreteWrite(&GpioAddrOn, DISP_ADDR, VRAM_START_ADDR);
    XGpio_DiscreteWrite(&GpioAddrOn, DISP_ON, 1);

    /* Load the images. */
    {
        const char *filePaths[] = {"imgs/1.raw", "imgs/2.raw", "imgs/3.raw"};
        const int numImages = sizeof(filePaths)/sizeof(filePaths[0]);
        for (int i=0; i<numImages; ++i) {
            if (loadImage(filePaths[i], DISP_X_SIZE, DISP_Y_SIZE, const_cast<uint32_t *>(VRAM + i*DISP_X_SIZE*DISP_Y_SIZE))) {
                xil_printf("Error, failed to load image.");
                return XST_FAILURE;
            }
        }
        Xil_DCacheFlush();
    }

    /* Change the picture every 1 seconds. */
    while (true) {
        for (int i=0; i<3; ++i) {
            wait_vblank();
            XGpio_DiscreteWrite(&GpioAddrOn, DISP_ADDR, VRAM_START_ADDR + i*DISP_X_SIZE*DISP_Y_SIZE*sizeof(uint32_t));
            usleep(1000000);
        }
    }

    /* Disable display. */
    wait_vblank();
    XGpio_DiscreteWrite(&GpioAddrOn, DISP_ON, 0);

    return XST_SUCCESS;
}
