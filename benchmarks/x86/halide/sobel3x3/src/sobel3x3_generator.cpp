#include "Halide.h"


using namespace Halide;

class Sobel : public Generator<Sobel> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        input_16(x, y) = cast<uint16_t>(bounded_input(x, y));

        sobel_x_avg(x, y) = input_16(x - 1, y) + 2 * input_16(x, y) + input_16(x + 1, y);
        sobel_x(x, y) = absd(sobel_x_avg(x, y - 1), sobel_x_avg(x, y + 1));

        sobel_y_avg(x, y) = input_16(x, y - 1) + 2 * input_16(x, y) + input_16(x, y + 1);
        sobel_y(x, y) = absd(sobel_y_avg(x - 1, y), sobel_y_avg(x + 1, y));

        // This sobel implementation is non-standard in that it doesn't take the square root
        // of the gradient.
        output(x, y) = cast<uint8_t>(clamp(sobel_x(x, y) + sobel_y(x, y), 0, 255));

        // Schedules for x86
        output
            .tile(x, y, xi, yi, 32, 4, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .unroll(yi, 4);
        bounded_input
            .compute_at(output, y)
            .align_storage(x, 32)
            .vectorize(x, 32, TailStrategy::RoundUp);
            
        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"};
    Func sobel_x_avg{ "sobel_x_avg" }, sobel_y_avg{ "sobel_y_avg" };
    Func sobel_x{ "sobel_x" }, sobel_y{ "sobel_y" };
    Func bounded_input{ "bounded_input" }, input_16{ "input_16" };
};

HALIDE_REGISTER_GENERATOR(Sobel, sobel3x3)
