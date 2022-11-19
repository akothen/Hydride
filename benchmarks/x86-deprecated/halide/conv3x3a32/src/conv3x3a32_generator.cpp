#include "Halide.h"
#include "utils.h"
#include "../../common_params.h"

using namespace Halide;

class Conv3x3 : public Generator<Conv3x3> {
public:
    GeneratorParam<Type> accumulator_type{ "accumulator_type", Int(32) };
    // Takes an 8 bit image; one channel.
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Input<Buffer<int8_t>> mask{ "mask", 2 };
    // Outputs an 8 bit image; one channel.
    Output<Buffer<uint8_t>> output{ "output", 2 };

    GeneratorParam<bool> use_parallel_sched{ "use_parallel_sched", true };
    GeneratorParam<bool> use_prefetch_sched{ "use_prefetch_sched", true };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

        Expr sum = cast(accumulator_type, 0);
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                sum += cast<int16_t>(bounded_input(x + j, y + i)) * cast<int16_t>(i+3 * j+3 + 5);
            }
        }
        output(x, y) = cast<uint8_t>(clamp(sum >> 4, 0, 255));
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/1f99df1fe16c3f66702ed87f8c9f9c503286aa87/benchmarks/hexagon/halide/test/run.cpp#L646
            input.set_estimates({{0, stef_width}, {0, stef_height}});
            mask.set_estimates({{0, 3}, {0, 3}});
            output.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }

private:
    Var x{ "x" }, y{ "y" };
    Func bounded_input{ "input_bounded" };
};

HALIDE_REGISTER_GENERATOR(Conv3x3, conv3x3a32)