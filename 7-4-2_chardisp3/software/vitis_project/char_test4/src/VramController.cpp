#include "VramController.hpp"

VramController::VramEntry VramController::getVramEntry(const int index) const {
    const uint32_t entry = 0x00ffffff&(*reinterpret_cast<volatile uint32_t *>(&m_ptr_vram[index*4]));
    return *reinterpret_cast<const VramEntry *>(&entry);
}

void VramController::setVramEntry(const int index, const VramEntry entry) const {
    m_ptr_vram[index*4] = entry.charCode;
    m_ptr_vram[index*4+1] = ((entry.g<<4)&0xf0)|(entry.b&0xf);
    m_ptr_vram[index*4+2] = (m_ptr_vram[index*4+2] & 0b11000000) | (entry.blink<<5) | (entry.inversion<<4) | (entry.r&0xf);
}

void VramController::setVramChar(const int index, const uint8_t charCode) const {
    m_ptr_vram[index*4] = charCode;
}

void VramController::setVramBlink(const int index, const bool blink) const {
    m_ptr_vram[index*4+2] = (m_ptr_vram[index*4+2]&0b11011111) | (blink<<5);
}

void VramController::copyVramEntry(const int dstIndex, const int srcIndex) const {
    m_ptr_vram[dstIndex*4] = m_ptr_vram[srcIndex*4];
    m_ptr_vram[dstIndex*4+1] = m_ptr_vram[srcIndex*4+1];
    m_ptr_vram[dstIndex*4+2] = m_ptr_vram[srcIndex*4+2];
}

void VramController::scrollVram() const {
    for (int i=0; i<NUM_VRAM_ENTRIES-NUM_COLS; ++i) {
        copyVramEntry(i, i+NUM_COLS);
    }
    for (int i=NUM_VRAM_ENTRIES-NUM_COLS; i<NUM_VRAM_ENTRIES; ++i) {
        setVramChar(i, ' ');
    }
}

void VramController::setVramDispRowOffset(uint8_t offset) {
    if (offset >= NUM_ROWS) {return;}
    m_dispRowOffset = offset;
    *m_ptr_dispConfReg = offset;
}