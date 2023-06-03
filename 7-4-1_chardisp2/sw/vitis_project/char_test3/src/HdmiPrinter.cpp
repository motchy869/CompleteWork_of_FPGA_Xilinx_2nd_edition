#include "vramOperation.hpp"
#include "HdmiPrinter.hpp"
#include <cassert>

namespace {
    bool isVisibleChar(const uint8_t charCode) {
        return (charCode >= 0x20) && (charCode <= 0x7f);
    }
}

HdmiPrinter::HdmiPrinter(const uint8_t numRows, const uint8_t numCols) : NUM_ROWS(numRows), NUM_COLS(numCols) {
    // Nothing to do here.
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
        const int index = (m_cursorPos.row*NUM_COLS) + m_cursorPos.col;
        const VramEntry entry = {
            .charCode = charCode,
            .b = m_b,
            .g = m_g,
            .r = m_r,
            .inversion = m_inversion,
            .blink = m_blink
        };
        setVramEntry(index, entry);
    }

    /* Update cursor position. */
    switch (charCode) {
        case CR:
            setCursorPos(m_cursorPos.row, 0);
            break;

        case LF:
            if (m_cursorPos.row < NUM_ROWS-1) {
                setCursorPos(m_cursorPos.row + 1, m_cursorPos.col);
            } else {
                scrollVram();
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
                        scrollVram();
                    }
                }
            }
            break;
    }
}

void HdmiPrinter::setCursorPos(const uint8_t row, const uint8_t col) {
    assert(row < NUM_ROWS);
    assert(col < NUM_COLS);
    m_cursorPos.row = row;
    m_cursorPos.col = col;
}
