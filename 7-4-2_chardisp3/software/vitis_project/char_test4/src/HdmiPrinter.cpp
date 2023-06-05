#include "VramController.hpp"
#include "HdmiPrinter.hpp"
#include <cassert>

HdmiPrinter::HdmiPrinter(const uint8_t numRows, const uint8_t numCols, VramController &vramController) : NUM_ROWS(numRows), NUM_COLS(numCols), m_vramController(vramController) {
    writeCursorMark();
}

void HdmiPrinter::setColor(const uint8_t r, const uint8_t g, const uint8_t b) {
    m_r = r;
    m_g = g;
    m_b = b;
}

void HdmiPrinter::setInversion(const bool inversion) {
    m_inversion = inversion;
}

void HdmiPrinter::setBlink(const bool blink) {
    m_blink = blink;
}

void HdmiPrinter::printOneChar(const uint8_t charCode) {
    /* Set VRAM entry. */
    if (isVisibleChar(charCode)) {
        const int index = cursorPosToVramIndex(m_cursorPos);
        const VramController::VramEntry entry = {
            .charCode = charCode,
            .b = m_b,
            .g = m_g,
            .r = m_r,
            .inversion = m_inversion,
            .blink = m_blink
        };
        m_vramController.setVramEntry(index, entry);
    }

    /* Update cursor position. */
    switch (charCode) {
        case CR:
            eraseOneChar(); /* Erase cursor mark. */
            setCursorPos(m_cursorPos.row, 0);
            break;

        case LF:
            eraseOneChar(); /* Erase cursor mark. */
            if (m_cursorPos.row < NUM_ROWS-1) {
                setCursorPos(m_cursorPos.row + 1, m_cursorPos.col);
            } else {
                scrollDisplay();
                writeCursorMark();
            }
            break;

        default:
            if (isVisibleChar(charCode)) {
                if (m_cursorPos.col < NUM_COLS-1) {
                    setCursorPos(m_cursorPos.row, m_cursorPos.col + 1);
                } else {
                    m_cursorPos.col = 0;
                    if (m_cursorPos.row < NUM_ROWS-1) {
                        setCursorPos(m_cursorPos.row + 1, m_cursorPos.col);
                    } else {
                        scrollDisplay();
                        writeCursorMark();
                    }
                }
            }
            break;
    }
}

int HdmiPrinter::cursorPosToVramIndex(const CursorPos cursorPos) const {
    const int rowIdx_virtual = m_vramController.getVramDispRowOffset() + cursorPos.row;
    const int rowIdx_cyclic = rowIdx_virtual < NUM_ROWS ? rowIdx_virtual : rowIdx_virtual - NUM_ROWS;
    return (rowIdx_cyclic*NUM_COLS) + cursorPos.col;
}

void HdmiPrinter::writeCursorMark() const {
    const int index = cursorPosToVramIndex(m_cursorPos);
    const VramController::VramEntry entry = {
        .charCode = '_',
        .b = m_b,
        .g = m_g,
        .r = m_r,
        .inversion = false,
        .blink = true
    };
    m_vramController.setVramEntry(index, entry);
}

void HdmiPrinter::eraseOneChar() const {
    const int index = cursorPosToVramIndex(m_cursorPos);
    const VramController::VramEntry entry = {
        .charCode = ' ',
        .b = m_b,
        .g = m_g,
        .r = m_r,
        .inversion = false,
        .blink = false
    };
    m_vramController.setVramEntry(index, entry);
}

void HdmiPrinter::setCursorPos(const uint8_t row, const uint8_t col) {
    assert(row < NUM_ROWS);
    assert(col < NUM_COLS);

    m_cursorPos.row = row;
    m_cursorPos.col = col;

    writeCursorMark();
}

void HdmiPrinter::scrollDisplay() {
    /* Erase the top line. */
    const VramController::VramEntry entry = {
        .charCode = ' ',
        .b = m_b,
        .g = m_g,
        .r = m_r,
        .inversion = false,
        .blink = false
    };
    for (uint8_t j=0; j<NUM_COLS; ++j) {
        const CursorPos cursorPos = {.row = 0, .col = j};
        m_vramController.setVramEntry(cursorPosToVramIndex(cursorPos), entry);
    }

    /* Update FPGA setting. */
    const uint8_t offset_virtual = m_vramController.getVramDispRowOffset() + 1;
    const uint8_t offset_cyclic = offset_virtual < NUM_ROWS ? offset_virtual : offset_virtual - NUM_ROWS;
    m_vramController.setVramDispRowOffset(offset_cyclic);
}

bool HdmiPrinter::isVisibleChar(const uint8_t charCode) {
    return (charCode >= 0x20) && (charCode <= 0x7f);
}
