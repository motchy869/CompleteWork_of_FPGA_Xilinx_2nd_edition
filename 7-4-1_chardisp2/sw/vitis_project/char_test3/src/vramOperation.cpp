#include "vramOperation.hpp"
#include <stdint.h>
#include <xparameters.h>

volatile uint8_t *const VRAM = reinterpret_cast<volatile uint8_t *>(XPAR_CHARDISP_IP_0_BASEADDR);

VramEntry getVramEntry(const int index) {
    const uint32_t entry = 0x00ffffff&(*reinterpret_cast<volatile uint32_t *>(&VRAM[index*4]));
    return *reinterpret_cast<const VramEntry *>(&entry);
}

void setVramEntry(const int index, const VramEntry entry) {
    VRAM[index*4] = entry.charCode;
    VRAM[index*4+1] = ((entry.g<<4)&0xf0)|(entry.b&0xf);
    VRAM[index*4+2] = (VRAM[index*4+2] & 0b11000000) | (entry.blink<<5) | (entry.inversion<<4) | (entry.r&0xf);
}

void setVramChar(const int index, const uint8_t charCode) {
    VRAM[index*4] = charCode;
}

void setVramBlink(const int index, const bool blink) {
    VRAM[index*4+2] = (VRAM[index*4+2]&0b11011111) | (blink<<5);
}

void copyVramEntry(const int dstIndex, const int srcIndex) {
    VRAM[dstIndex*4] = VRAM[srcIndex*4];
    VRAM[dstIndex*4+1] = VRAM[srcIndex*4+1];
    VRAM[dstIndex*4+2] = VRAM[srcIndex*4+2];
}

void scrollVram() {
    for (int i=0; i<3920; ++i) {
        copyVramEntry(i, i+80);
    }
    for (int i=3920; i<4000; ++i) {
        setVramChar(i, ' ');
    }
}