#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Chroma : public Generator<Chroma> {
    public:
        // uint16_t because the values used below are out of uint8_t.
        Input<Buffer<uint16_t>> input{ "input", 3 };
        Output<Buffer<uint16_t>> output{ "output", 3 };

        void generate() {
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

            output(x, y, c) = select(
                    c == 0, H,
                    c == 1, S,
                    L);
        }

        void schedule() {
            if (auto_schedule) {
                input.set_estimates({{0, stef_width/2}, {0, stef_height/2}, {0, 3}});
                output.set_estimates({{0, stef_width/2}, {0, stef_height/2}, {0, 3}});
            }
        }
};

HALIDE_REGISTER_GENERATOR(Chroma, chroma)
