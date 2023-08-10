#include <type_traits>

#include <ap_int.h>
#include "util.hpp"

constexpr size_t DISPLAY_WIDTH = 640;
constexpr size_t DISPLAY_HEIGHT = 480;
constexpr size_t BIT_WIDTH_GEOMETRY = clog2<decltype(DISPLAY_WIDTH)>(DISPLAY_WIDTH+1);
constexpr size_t BIT_WIDTH_PIXEL = 32;

void patblt(
    volatile ap_uint<BIT_WIDTH_PIXEL> *dst_out,
    const ap_uint<BIT_WIDTH_GEOMETRY> xpos,
    const ap_uint<BIT_WIDTH_GEOMETRY> ypos,
    const ap_uint<BIT_WIDTH_GEOMETRY> width,
    const ap_uint<BIT_WIDTH_GEOMETRY> height,
    const ap_uint<BIT_WIDTH_PIXEL> color
);
