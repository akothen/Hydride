#include <Halide.h>
#include <halide_image_io.h>
using namespace Halide;
using namespace Halide::Tools;

int main(int argc, char *argv[]) {
    Buffer<float> input = load_and_convert_image(argv[1]);

    Func max_channels, min_channels, chroma, result_hsl;
    Var x, y, c;

    Expr R = input(x, y, 0);
    Expr G = input(x, y, 1);
    Expr B = input(x, y, 2);

    max_channels(x, y) = max(R, G, B);
    min_channels(x, y) = min(R, G, B);
    chroma(x, y) = max_channels(x, y) - min_channels(x, y);

    Expr V = max_channels(x, y);
    Expr C = chroma(x, y);

    Expr H = select(C == 0, 0,
                    R == V, 60 * (0 + (G - B) / C),
                    G == V, 60 * (2 + (B - R) / C),
                    60 * (4 + (R - G) / C)) /
             360;
    Expr L = V - C / 2;
    Expr S = (V - L) / min(L, 1 - L);

    result_hsl(x, y, c) = select(
            c == 0, H,
            c == 1, S,
            L);

    result_hsl
            .bound(c, 0, 3)
            .reorder(c, x, y)
            .unroll(c, 3);

    Buffer<float> result = result_hsl.realize({input.width(), input.height(), 3});

    convert_and_save_image(result, argv[2]);
}

