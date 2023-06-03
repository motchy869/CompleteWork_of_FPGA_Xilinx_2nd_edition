#pragma once

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
        HdmiPrinter(const uint8_t numRows, const uint8_t numCols);
        CursorPos getCursorPos() const {return m_cursorPos;}
        void setColor(const uint8_t r, const uint8_t g, const uint8_t b);
        void setInversion(const bool inversion);
        void setBlink(const bool blink);
        void printOneChar(const uint8_t charCode);

    private:
        const uint8_t NUM_ROWS, NUM_COLS;
        CursorPos m_cursorPos = {0, 0}; /* current cursor position */
        uint8_t m_r = 0xf, m_g = 0xf, m_b = 0xf;
        bool m_inversion = false, m_blink = false;
        void writeCursorMark();
        void eraseCursorMark();
        void setCursorPos(const uint8_t row, const uint8_t col);
};
