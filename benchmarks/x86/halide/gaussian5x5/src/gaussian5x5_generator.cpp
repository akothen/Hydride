#include "Halide.h"

using namespace Halide;

class Gaussian5x5 : public Generator<Gaussian5x5> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

        Func input_16("input_16");
        input_16(x, y) = cast<int16_t>(bounded_input(x, y));

        rows(x, y) = input_16(x, y - 2) + 4 * input_16(x, y - 1) + 6 * input_16(x, y) 
                    + 4 * input_16(x, y + 1) + input_16(x, y + 2);
        cols(x, y) = rows(x - 2, y) + 4 * rows(x - 1, y) + 6 * rows(x, y) 
                    + 4 * rows(x + 1, y) + rows(x + 2, y);

        output(x, y) = cast<uint8_t>(cols(x, y) >> 8);

        // Schedules for x86
        output
            .tile(x, y, xi, yi, 32, 4, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .unroll(yi);
        rows
            .compute_at(output, y)
            .tile(x, y, x, y, xi, yi, 32, 4, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .unroll(yi)
            .align_storage(x, 32);
        bounded_input
            .compute_at(output, y)
            .align_storage(x, 32)
            .vectorize(x, 32, TailStrategy::RoundUp);

        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{"x"}, y{"y"}, xi{"xi"}, xii{"xii"}, yi{"yi"}, yii{"yii"};
    Func rows{"rows"}, cols{"cols"}, bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Gaussian5x5, gaussian5x5)
