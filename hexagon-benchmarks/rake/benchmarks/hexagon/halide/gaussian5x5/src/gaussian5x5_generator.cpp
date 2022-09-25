#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Gaussian5x5 : public Generator<Gaussian5x5> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    GeneratorParam<bool> use_parallel_sched{ "use_parallel_sched", true };
    GeneratorParam<bool> use_prefetch_sched{ "use_prefetch_sched", true };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

        Func input_16("input_16");
        input_16(x, y) = cast<int16_t>(bounded_input(x, y));

        rows(x, y) = input_16(x, y - 2) + 4 * input_16(x, y - 1) + 6 * input_16(x, y) + 4 * input_16(x, y + 1) + input_16(x, y + 2);
        cols(x, y) = rows(x - 2, y) + 4 * rows(x - 1, y) + 6 * rows(x, y) + 4 * rows(x + 1, y) + rows(x + 2, y);

        output(x, y) = cast<uint8_t>(cols(x, y) >> 8);
    }

    void schedule() {
        // NOTE(Stefanos): The auto-tuner seems to produce wrong schedules in this, with the error:
        // Error: Can only unroll for loops over a constant extent.
        // But it's only for few (actually, one) samples so we should be fine.
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L794
            input.set_estimates({{0, stef_width}, {0, stef_height}});
            output.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }

private:
    Func rows{ "rows" }, cols{ "cols" }, bounded_input{ "bounded_input" };
    Var x{ "x" }, y{ "y" };
};

HALIDE_REGISTER_GENERATOR(Gaussian5x5, gaussian5x5)