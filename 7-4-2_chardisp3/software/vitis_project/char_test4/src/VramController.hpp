#pragma once

#include <stdint.h>
#include <xparameters.h>

class VramController {
    public:
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

        static constexpr int NUM_ROWS = 50, NUM_COLS = 80;
        static constexpr int NUM_VRAM_ENTRIES = NUM_ROWS*NUM_COLS;

        VramController() {};

        /**
         * @brief Get the Vram entry.
         *
         * @param[in] index the index of the VRAM entry
         */
        VramEntry getVramEntry(const int index) const;

        /**
         * @brief Set the Vram entry.
         *
         * @param[in] index the index of the VRAM entry
         * @param[in] entry the VramEntry instance
         */
        void setVramEntry(const int index, const VramEntry entry) const;

        /**
         * @brief Set the character code of a VRAM entry.
         *
         * @param[in] index the index of the VRAM entry
         * @param[in] charCode the character code
         */
        void setVramChar(const int index, const uint8_t charCode) const;

        /**
         * @brief Set the blink flag of a VRAM entry.
         *
         * @param[in] index the index of the VRAM entry
         * @param[in] blink the blink flag
         */
        void setVramBlink(const int index, const bool blink) const;

        /**
         * @brief Copy a VRAM entry.
         *
         * @param[in] dstIndex the destination index
         * @param[in] srcIndex the source index
         */
        void copyVramEntry(const int dstIndex, const int srcIndex) const;

        /**
         * @brief Scroll and clear the bottom line.
         */
        void scrollVram() const;

        /**
         * @brief Set the Vram display row offset to FPGA.
         * @param[in] offset the offset, must be in [0, 49), otherwise the function immediately returns and nothing happens.
         */
        void setVramDispRowOffset(uint8_t offset);

        /**
         * @brief Get the Vram display row offset
         *
         * @return the Vram display row offset
         */
        uint8_t getVramDispRowOffset() const {return m_dispRowOffset;}

    private:
        volatile uint8_t *const m_ptr_vram = reinterpret_cast<volatile uint8_t *>(XPAR_CHARDISP_IP_0_BASEADDR);
        volatile uint8_t *const m_ptr_dispConfReg = m_ptr_vram + 0x4000;
        uint8_t m_dispRowOffset = 0;
};
