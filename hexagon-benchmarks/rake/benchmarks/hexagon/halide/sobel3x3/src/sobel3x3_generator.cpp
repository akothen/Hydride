#include "Halide.h"
#include "../../test/common_params.h"

using namespace Halide;

class Sobel : public Generator<Sobel> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    GeneratorParam<bool> use_parallel_sched{ "use_parallel_sched", true };
    GeneratorParam<bool> use_prefetch_sched{ "use_prefetch_sched", true };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

        Func input_16{ "input_16" };
        input_16(x, y) = cast<uint16_t>(bounded_input(x, y));

        sobel_x_avg(x, y) = input_16(x - 1, y) + 2 * input_16(x, y) + input_16(x + 1, y);
        sobel_x(x, y) = absd(sobel_x_avg(x, y - 1), sobel_x_avg(x, y + 1));

        sobel_y_avg(x, y) = input_16(x, y - 1) + 2 * input_16(x, y) + input_16(x, y + 1);
        sobel_y(x, y) = absd(sobel_y_avg(x - 1, y), sobel_y_avg(x + 1, y));

        // This sobel implementation is non-standard in that it doesn't take the square root
        // of the gradient.
        output(x, y) = cast<uint8_t>(clamp(sobel_x(x, y) + sobel_y(x, y), 0, 255));
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L710
            input.set_estimates({{0, stef_width}, {0, stef_height}});
            output.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }

private:
    Var x{ "x" }, y{ "y" };
    Func sobel_x_avg{ "sobel_x_avg" }, sobel_y_avg{ "sobel_y_avg" };
    Func sobel_x{ "sobel_x" }, sobel_y{ "sobel_y" };
    Func bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Sobel, sobel3x3)