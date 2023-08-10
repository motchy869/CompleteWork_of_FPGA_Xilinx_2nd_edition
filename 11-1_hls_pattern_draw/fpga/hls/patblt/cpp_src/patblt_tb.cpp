#include "patblt.hpp"

ap_uint<BIT_WIDTH_PIXEL> vram[DISPLAY_HEIGHT*DISPLAY_WIDTH];

int main() {
    /* Clear VRAM. */
    for (size_t i=0; i<DISPLAY_HEIGHT*DISPLAY_WIDTH; ++i) {
        vram[i] = 0;
    }

    /* Draw boxes. */
    patblt(vram,   0,   0, 320, 240, 0x00ff0000);
    patblt(vram, 160, 120, 320, 240, 0x0000ff00);
    patblt(vram, 320, 240, 320, 240, 0x000000ff);

    /* Output to a file. */
    FILE *fp = fopen("image_data.raw", "wb");
    for (size_t y=0; y<DISPLAY_HEIGHT; ++y) {
        for (size_t x=0; x<DISPLAY_WIDTH; ++x) {
            const ap_uint<BIT_WIDTH_PIXEL> pixel = vram[y*DISPLAY_WIDTH + x];
            fprintf(fp, "%c%c%c", static_cast<uint8_t>(pixel>>16), static_cast<uint8_t>(pixel>>8), static_cast<uint8_t>(pixel));
        }
    }
    fclose(fp);

    return EXIT_SUCCESS;
}
