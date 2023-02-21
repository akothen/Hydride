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
            .compute_root()
            .split(y, y, yi, 36, TailStrategy::ShiftInwards)
            .split(yi, yi, yii, 9, TailStrategy::ShiftInwards)
            .split(x, x, xi, 192, TailStrategy::ShiftInwards)
            .split(xi, xi, xii, 64, TailStrategy::RoundUp)
            .vectorize(xii, 64)
            .reorder({xii, xi, x, yii, yi, y});
            //.parallel(y);
        sobel_y
            .store_in(MemoryType::Stack)
            .compute_at(output, yii)
            .split(x, x, xi, 128, TailStrategy::RoundUp)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);
        sobel_y_avg
            .store_in(MemoryType::Stack)
            .compute_at(sobel_y, x)
            .split(x, x, xi, 32, TailStrategy::RoundUp)
            .vectorize(xi, 32);
        sobel_x
            .store_in(MemoryType::Stack)
            .compute_at(output, x)
            .split(x, x, xi, 32, TailStrategy::RoundUp)
            .vectorize(xi, 32);
        sobel_x_avg
            .store_in(MemoryType::Stack)
            .compute_at(output, x)
            .split(x, x, xi, 32, TailStrategy::RoundUp)
            .vectorize(xi, 32);
        input_16
            .store_in(MemoryType::Stack)
            .store_at(output, y)
            .compute_at(output, yi)
            .split(x, x, xi, 32, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .reorder({xi, y, x});
        
        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"}, yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
    Func sobel_x_avg{ "sobel_x_avg" }, sobel_y_avg{ "sobel_y_avg" };
    Func sobel_x{ "sobel_x" }, sobel_y{ "sobel_y" };
    Func bounded_input{ "bounded_input" }, input_16{ "input_16" };
};

HALIDE_REGISTER_GENERATOR(Sobel, sobel3x3)
