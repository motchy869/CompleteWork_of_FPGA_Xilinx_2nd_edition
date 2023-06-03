#pragma once

#include <stdint.h>
#include <xparameters.h>

extern volatile uint8_t *const VRAM;

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

/**
 * @brief Get the Vram entry.
 *
 * @param[in] index the index of the VRAM entry
 */
VramEntry getVramEntry(const int index);

/**
 * @brief Set the Vram entry.
 *
 * @param[in] index the index of the VRAM entry
 * @param[in] entry the VramEntry instance
 */
void setVramEntry(const int index, const VramEntry entry);

/**
 * @brief Set the character code of a VRAM entry.
 *
 * @param[in] index the index of the VRAM entry
 * @param[in] charCode the character code
 */
void setVramChar(const int index, const uint8_t charCode);

/**
 * @brief Set the blink flag of a VRAM entry.
 *
 * @param[in] index the index of the VRAM entry
 * @param[in] blink the blink flag
 */
void setVramBlink(const int index, const bool blink);

/**
 * @brief Copy a VRAM entry.
 *
 * @param[in] dstIndex the destination index
 * @param[in] srcIndex the source index
 */
void copyVramEntry(const int dstIndex, const int srcIndex);

/**
 * @brief Scroll and clear the bottom line.
 */
void scrollVram();
