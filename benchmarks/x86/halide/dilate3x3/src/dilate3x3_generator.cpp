#include "Halide.h"

using namespace Halide;

class Dilate3x3 : public Generator<Dilate3x3> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        max_y(x, y) = max(bounded_input(x, y - 1), bounded_input(x, y), bounded_input(x, y + 1));
        output(x, y) = max(max_y(x - 1, y), max_y(x, y), max_y(x + 1, y));
        
        // Schedules for x86
        output
            .tile(x, y, xi, yi, 64, 8, TailStrategy::RoundUp)
            .vectorize(xi, 64)
            .unroll(yi);
        bounded_input
            .compute_at(output, y)
            .align_storage(x, 64)
            .vectorize(x, 64, TailStrategy::RoundUp);

        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"};
    Func max_y{ "max_y" }, bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Dilate3x3, dilate3x3)
