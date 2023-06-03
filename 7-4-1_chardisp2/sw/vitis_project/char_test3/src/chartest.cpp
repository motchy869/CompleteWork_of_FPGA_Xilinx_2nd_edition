#include "vramOperation.hpp"
#include "HdmiPrinter.hpp"
#include <cassert>
#include <cstdio>
#include <xparameters.h>
#include <xil_printf.h>

void printLinesToUart(const int numLines) {
    for (int i=0; i<numLines; ++i) {
        const VramEntry entry = getVramEntry(i);
        xil_printf("VRAM[%d]: r=%02x, g=%02x, b=%02x, charCode=%02x\n", i, entry.r, entry.g, entry.b, entry.charCode);
    }
}

int main() {
    HdmiPrinter::CursorPos cursorPos;
    HdmiPrinter printer(50, 80);

    /* test 0: one character */
    printer.printOneChar('a');
    /* Check cursor position. */
    cursorPos = printer.getCursorPos();
    assert(cursorPos.row == 0);
    assert(cursorPos.col == 1);

    /* test 1: more two characters */
    printer.printOneChar('b');
    printer.printOneChar('c');
    /* Check cursor position. */
    cursorPos = printer.getCursorPos();
    assert(cursorPos.row == 0);
    assert(cursorPos.col == 3);

    /* test 2: CR */
    printer.printOneChar(HdmiPrinter::CR);
    printer.printOneChar('B');
    /* Check cursor position. */
    cursorPos = printer.getCursorPos();
    assert(cursorPos.row == 0);
    assert(cursorPos.col == 1);

    /* test 3: LF */
    printer.printOneChar(HdmiPrinter::LF);
    printer.printOneChar('A');
    /* Check cursor position. */
    cursorPos = printer.getCursorPos();
    assert(cursorPos.row == 1);
    assert(cursorPos.col == 2);

    /* test 4: wrap */
    for (uint8_t j=2; j<80; ++j) {
        printer.printOneChar('B');
    }
    printer.printOneChar('0');
    /* Check cursor position. */
    cursorPos = printer.getCursorPos();
    assert(cursorPos.row == 2);
    assert(cursorPos.col == 1);

    /* test 5: scroll caused by LF */
    {
        for (uint8_t i=1; i<49; ++i) {
            printer.printOneChar('0' + (i%10));
            printer.printOneChar(HdmiPrinter::LF);
        }
        /* Check cursor position. */
        cursorPos = printer.getCursorPos();
        assert(cursorPos.row == 49);
        assert(cursorPos.col == 49);

        printer.printOneChar('9');
        printer.printOneChar(HdmiPrinter::LF);
        /* Check cursor position. */
        cursorPos = printer.getCursorPos();
        assert(cursorPos.row == 49);
        assert(cursorPos.col == 50);
    }

    /* test 6: scroll caused by wrap */
    {
        for (uint8_t j=50; j<79; ++j) {
            printer.printOneChar('0' + (j%10));
        }
        /* Check cursor position. */
        cursorPos = printer.getCursorPos();
        assert(cursorPos.row == 49);
        assert(cursorPos.col == 79);

        printer.printOneChar('!');
        /* Check cursor position. */
        cursorPos = printer.getCursorPos();
        assert(cursorPos.row == 49);
        assert(cursorPos.col == 0);
    }

    /* Display input from UART. */
    while (true) {
        const uint8_t c = getc(stdin);
        printer.printOneChar(c);
    }

    return 0;
}
