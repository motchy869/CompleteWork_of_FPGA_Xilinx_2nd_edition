#include "bitblt.hpp"

namespace {
    u32 blend_pixel(const u32 src, const u32 dst, const u8 alpha) {
        const u32 src_r = (src >> 16) & 0xff;
        const u32 src_g = (src >> 8) & 0xff;
        const u32 src_b = src & 0xff;

        u32 dst_r = (dst >> 16) & 0xff;
        u32 dst_g = (dst >> 8) & 0xff;
        u32 dst_b = dst & 0xff;

        const u8 c_alpha = 255 - alpha;
        dst_r = (alpha*src_r + c_alpha*dst_r)/255;
        dst_g = (alpha*src_g + c_alpha*dst_g)/255;
        dst_b = (alpha*src_b + c_alpha*dst_b)/255;

        return ((dst_r<<16)&0xff0000) | ((dst_g<<8)&0x00ff00) | (dst_b&0x0000ff);
    }
}

void bitblt(
    volatile const u32 *src_in,
    volatile const u32 *dst_in,
    volatile u32 *dst_out,
    const u8 alpha,
    const u11 width,
    const u11 height
) {
    vert_loop: for (size_t y=0; y<height; ++y) {
        horiz_loop: for (size_t x=0; x<width; ++x) {
            const size_t index = y*DISPLAY_WIDTH + x;
            dst_out[index] = blend_pixel(src_in[index], dst_in[index], alpha);
        }
    }
}
