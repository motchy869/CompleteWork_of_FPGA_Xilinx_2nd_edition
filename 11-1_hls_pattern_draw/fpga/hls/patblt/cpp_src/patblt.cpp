#include "patblt.hpp"

void patblt(
    volatile ap_uint<BIT_WIDTH_PIXEL> *dst_out,
    const ap_uint<BIT_WIDTH_GEOMETRY> xpos,
    const ap_uint<BIT_WIDTH_GEOMETRY> ypos,
    const ap_uint<BIT_WIDTH_GEOMETRY> width,
    const ap_uint<BIT_WIDTH_GEOMETRY> height,
    const ap_uint<BIT_WIDTH_PIXEL> color
) {
    height_loop: for (ap_uint<BIT_WIDTH_GEOMETRY> y=0; y<height; ++y) {
        width_loop: for (ap_uint<BIT_WIDTH_GEOMETRY> x=0; x<width; ++x) {
            dst_out[(ypos + y)*DISPLAY_WIDTH + (xpos + x)] = color;
        }
    }
}
