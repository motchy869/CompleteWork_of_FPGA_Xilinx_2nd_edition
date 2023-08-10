#pragma once

#include <cstddef>
#include <ap_int.h>
#include "common.hpp"

typedef ap_uint<8> u8;
typedef ap_uint<11> u11;
typedef ap_uint<32> u32;

void bitblt(
    volatile const u32 *src_in,
    volatile const u32 *dst_in,
    volatile u32 *dst_out,
    const u8 alpha,
    const u11 width,
    const u11 height
);
