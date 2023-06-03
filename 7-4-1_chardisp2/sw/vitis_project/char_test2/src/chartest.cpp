#include "xparameters.h"
#include "xil_printf.h"

#define FORCE_INLINE __attribute__((always_inline)) inline

volatile uint8_t *const VRAM = reinterpret_cast<volatile uint8_t *>(XPAR_CHARDISP_IP_0_BASEADDR);

#pragma pack(1)
struct VramEntry {
    unsigned charCode: 7;
    unsigned reserved_1: 1;
    unsigned b: 4;
    unsigned g: 4;
    unsigned r: 4;
    unsigned inversion: 1;
    unsigned blink: 1;
    unsigned reserved_0: 2;
};
#pragma pack()
static_assert(sizeof(VramEntry)==3, "VramEntry must be 3 bytes");

FORCE_INLINE VramEntry getVramEntry(const int index) {
    const uint32_t entry = 0x00ffffff&(*reinterpret_cast<volatile uint32_t *>(&VRAM[index*4]));
    return *reinterpret_cast<const VramEntry *>(&entry);
}

FORCE_INLINE void setVramEntry(const int index, const VramEntry entry) {
    VRAM[index*4] = entry.charCode;
    VRAM[index*4+1] = ((entry.g<<4)&0xf0)|(entry.b&0xf);
    VRAM[index*4+2] = (VRAM[index*4+2] & 0b11000000) | (entry.blink<<5) | (entry.inversion<<4) | (entry.r&0xf);
}

FORCE_INLINE void setVramChar(const int index, const uint8_t charCode) {
    VRAM[index*4] = charCode;
}

FORCE_INLINE void setVramBlink(const int index, const bool blink) {
    VRAM[index*4+2] = (VRAM[index*4+2]&0b11011111) | (blink<<5);
}

FORCE_INLINE void copyVramEntry(const int dstIndex, const int srcIndex) {
    VRAM[dstIndex*4] = VRAM[srcIndex*4];
    VRAM[dstIndex*4+1] = VRAM[srcIndex*4+1];
    VRAM[dstIndex*4+2] = VRAM[srcIndex*4+2];
}

void showLines(const int numLines) {
    for (int i=0; i<numLines; ++i) {
        const VramEntry entry = getVramEntry(i);
        xil_printf("VRAM[%d]: r=%02x, g=%02x, b=%02x, charCode=%02x\n", i, entry.r, entry.g, entry.b, entry.charCode);
    }
}

int main() {
    /* Display characters in various colors. */
    for (int i=0; i<4000; ++i) {
        const unsigned int ui = i;
        const VramEntry entry = {
            .charCode = ui&0xff,
            .b = ui&0xf,
            .g = (ui>>4)&0xf,
            .r = (ui>>8)&0xf,
            .inversion = static_cast<bool>((ui>>4)&0b1), /* Invert color every 16 characters. */
            .blink = false
        };
        setVramEntry(i, entry);
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

    /* Set blink */
    for (int i=0; i<4000; ++i) {
    	const bool blink = static_cast<bool>((i>>4)&0b1); /* Set blink every 16 characters. */
		setVramBlink(i, blink);
	}

    return 0;
}
