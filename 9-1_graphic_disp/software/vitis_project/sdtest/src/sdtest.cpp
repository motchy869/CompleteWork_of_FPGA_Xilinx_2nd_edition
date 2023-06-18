#include <cstdlib>

#include <xparameters.h>
#include <xsdps.h>
#include <xil_printf.h>
#include <ff.h>

int main() {
    FIL fil;
    FATFS fatfs;
    FRESULT fRes;
    UINT numBytesRead;
    constexpr uint32_t readChunkSize = 8*1024;
    const char *const path = "0:/";

    const char *fileName = "display.xdc";
    unsigned char buff[readChunkSize];

    /* Mount the SD card. */
    fRes = f_mount(&fatfs, path, 0);
    if (FR_OK != fRes) {
        xil_printf("Error(%d): f_mount\n", fRes);
        return XST_FAILURE;
    }

    /* Open the file. */
    fRes = f_open(&fil, fileName, FA_READ);
    if (FR_OK != fRes) {
        xil_printf("Error(%d): f_open\n", fRes);
        return XST_FAILURE;
    }

    while (true) {
        /* Read the file. */
        fRes = f_read(&fil, buff, readChunkSize, &numBytesRead);
        if (FR_OK != fRes) {
            xil_printf("Error(%d): f_read\n", fRes);
            return XST_FAILURE;
        }

        /* Print. */
        for (int i=0; i<numBytesRead; ++i) {
            xil_printf("%c", buff[i]);
        }

        if (numBytesRead < readChunkSize) {
            break;
        }

        /* Close the file. */
        fRes = f_close(&fil);
        if (FR_OK != fRes) {
            xil_printf("Error(%d): f_close\n", fRes);
            return XST_FAILURE;
        }
    }

    return XST_SUCCESS;
}
