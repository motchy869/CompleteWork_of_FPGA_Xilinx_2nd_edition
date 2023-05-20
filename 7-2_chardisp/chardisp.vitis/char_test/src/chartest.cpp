#include "xparameters.h"
#include "xil_printf.h"

#define FORCE_INLINE __attribute__((always_inline)) inline

volatile uint8_t *const VRAM = reinterpret_cast<volatile uint8_t *>(XPAR_CHARDISP_IP_0_BASEADDR);

FORCE_INLINE void getVramEntry(const int index, uint8_t &r, uint8_t &g, uint8_t &b, uint8_t &charCode) {
    const uint32_t entry = VRAM[index*4];
    charCode = entry&0xff;
    b = (entry>>8)&0xf;
    g = (entry>>12)&0xf;
    r = (entry>>16)&0xf;
}

FORCE_INLINE void setVramEntry(const int index, const uint8_t r, const uint8_t g, const uint8_t b, const uint8_t charCode) {
    VRAM[index*4] = charCode;
    VRAM[index*4+1] = ((g<<4)&0xf0)|(b&0xf);
    VRAM[index*4+2] = (VRAM[index*4+2] & 0xf0) | (r&0xf);
}

FORCE_INLINE void setVramChar(const int index, const uint8_t charCode) {
    VRAM[index*4] = charCode;
}

FORCE_INLINE void copyVramEntry(const int dstIndex, const int srcIndex) {
    VRAM[dstIndex*4] = VRAM[srcIndex*4];
    VRAM[dstIndex*4+1] = VRAM[srcIndex*4+1];
    VRAM[dstIndex*4+2] = VRAM[srcIndex*4+2];
}

void showLines(const int numLines) {
    for (int i=0; i<numLines; ++i) {
        uint8_t charCode, b, g, r;
        getVramEntry(i, r, g, b, charCode);
        xil_printf("VRAM[%d]: r=%02x, g=%02x, b=%02x, charCode=%02x\n", i, r, g, b, charCode);
    }
}

int main() {
    /* Display characters in various colors. */
    for (int i=0; i<4000; ++i) {
        setVramEntry(i, (i>>8)&0xf, (i>>4)&0xf, i&0xf, i&0xff);
    }

    showLines(40);

    /* Set all characters to 'A'. Set a break point here. */
    for (int i=0; i<4000; ++i) {
        setVramChar(i, 'A');
    }

    showLines(40);

    /* Scroll and clear the bottom line. Set a break point here. */
    for (int i=0; i<3920; ++i) {
        copyVramEntry(i, i+80);
    }
    for (int i=3920; i<4000; ++i) {
        setVramChar(i, ' ');
    }

    return 0;
}
