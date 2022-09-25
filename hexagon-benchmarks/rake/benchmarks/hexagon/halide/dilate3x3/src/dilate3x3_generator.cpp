#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Dilate3x3 : public Generator<Dilate3x3> {
public:
    // Takes an 8 bit image; one channel.
    Input<Buffer<uint8_t>> input{ "input", 2 };
    // Outputs an 8 bit image; one channel.
    Output<Buffer<uint8_t>> output{ "output", 2 };

    GeneratorParam<bool> use_parallel_sched{ "use_parallel_sched", true };
    GeneratorParam<bool> use_prefetch_sched{ "use_prefetch_sched", true };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        max_y(x, y) = max(bounded_input(x, y - 1), bounded_input(x, y), bounded_input(x, y + 1));

        output(x, y) = max(max_y(x - 1, y), max_y(x, y), max_y(x + 1, y));
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

HALIDE_REGISTER_GENERATOR(Dilate3x3, dilate3x3)