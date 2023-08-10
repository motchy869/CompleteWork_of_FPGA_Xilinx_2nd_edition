#include "patblt.hpp"
#include "bitblt.hpp"

constexpr size_t BOX_WIDTH = 320;
constexpr size_t BOX_HEIGHT = 240;

/* the start address of source and destination */
constexpr size_t SRC0 = 0;
constexpr size_t SRC1 = 320 + 0*DISPLAY_WIDTH;
constexpr size_t DST0 = 80 + 60*DISPLAY_WIDTH;
constexpr size_t DST1 = 240 + 180*DISPLAY_WIDTH;

u32 g_vram[DISPLAY_WIDTH*DISPLAY_HEIGHT];
u32 g_texture[DISPLAY_WIDTH*DISPLAY_HEIGHT];

int main() {
    /* Clear the display. */
    patblt(g_vram, 0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0x00000000);

    /* Draw boxes on the texture buffer. */
    patblt(&g_texture[SRC0],  0,  0, BOX_WIDTH, BOX_HEIGHT, 0x00ff0000);
    patblt(&g_texture[SRC1],  0,  0, BOX_WIDTH, BOX_HEIGHT, 0x000000ff);

    /* Copy the boxes from the texture buffer. */
    bitblt(&g_texture[SRC0], &g_vram[DST0], &g_vram[DST0], 255, BOX_WIDTH, BOX_HEIGHT);
    bitblt(&g_texture[SRC1], &g_vram[DST1], &g_vram[DST1], 128, BOX_WIDTH, BOX_HEIGHT);

    /* Output to a file. */
    FILE *fp = fopen("image_data.raw", "wb");
    for (size_t y=0; y<DISPLAY_HEIGHT; ++y) {
        for (size_t x=0; x<DISPLAY_WIDTH; ++x) {
            const u32 pixel = g_vram[y*DISPLAY_WIDTH + x];
            fprintf(fp, "%c%c%c", static_cast<uint8_t>(pixel>>16), static_cast<uint8_t>(pixel>>8), static_cast<uint8_t>(pixel));
        }
    }
    fclose(fp);

    return EXIT_SUCCESS;
}
