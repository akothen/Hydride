#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Dilate5x5 : public Generator<Dilate5x5> {
    public:
        // Takes an 8 bit image; one channel.
        Input<Buffer<uint8_t>> input{ "input", 2 };
        // Outputs an 8 bit image; one channel.
        Output<Buffer<uint8_t>> output{ "output", 2 };

        void generate() {
            bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
            max_y(x, y) = max(bounded_input(x, y - 2), 
                              bounded_input(x, y - 1),
                              bounded_input(x, y),
                              bounded_input(x, y + 1),
                              bounded_input(x, y + 2)
                            );

            output(x, y) = max(bounded_input(x - 2, y), 
                              bounded_input(x - 1, y),
                              bounded_input(x, y),
                              bounded_input(x + 1, y),
                              bounded_input(x + 2, y)
                            );
        }

        void schedule() {
            if (auto_schedule) {
                // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L532
                input.set_estimates({{0, stef_width}, {0, stef_height}});
                output.set_estimates({{0, stef_width}, {0, stef_height}});
            }
        }

    private:
        Var x{ "x" }, y{ "y" };
        Func max_y{ "max_y" };
        Func bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Dilate5x5, dilate5x5)
