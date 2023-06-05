#pragma once

#include "VramController.hpp"
#include <stdint.h>
#include <xparameters.h>

class HdmiPrinter {
    public:
        static constexpr uint8_t CR = 0x0d;
        static constexpr uint8_t LF = 0x0a;
        struct CursorPos {
            uint8_t row;
            uint8_t col;
        };
        HdmiPrinter(const uint8_t numRows, const uint8_t numCols, VramController &vramController);
        CursorPos getCursorPos() const {return m_cursorPos;}
        void setColor(const uint8_t r, const uint8_t g, const uint8_t b);
        void setInversion(const bool inversion);
        void setBlink(const bool blink);
        void printOneChar(const uint8_t charCode);

    private:
        const uint8_t NUM_ROWS, NUM_COLS;
        VramController &m_vramController;
        CursorPos m_cursorPos = {0, 0}; /* current cursor position in display (NOT in actual VRAM coordinate) */
        uint8_t m_r = 0xf, m_g = 0xf, m_b = 0xf;
        bool m_inversion = false, m_blink = false;
        int cursorPosToVramIndex(const CursorPos cursorPos) const;
        void writeCursorMark() const;
        void eraseOneChar() const;
        void setCursorPos(const uint8_t row, const uint8_t col);
        void scrollDisplay();
        static bool isVisibleChar(const uint8_t charCode);
};
