#include "Halide.h"

using namespace Halide;

class Gaussian3x3 : public Generator<Gaussian3x3> {
public:
    Input<Buffer<uint8_t>> input{"input", 2};
    Output<Buffer<uint8_t>> output{"output", 2};

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        input_16(x, y) = cast<int16_t>(bounded_input(x, y));

        rows(x, y) = input_16(x, y-1) + 2 * input_16(x, y) + input_16(x, y+1);
        cols(x,y) =  rows(x-1, y) + 2 * rows(x, y) + rows(x+1, y);

        output(x, y)  = cast<uint8_t> ((cols(x, y) + 8) >> 4);

        // Schedules for x86
        output
            .tile(x, y, xi, yi, 32, 6, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .unroll(yi);
        rows
            .store_in(MemoryType::Stack)
            .compute_at(output, y)
            .tile(x, y, x, y, xi, yi, 32, 6, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .unroll(yi);
        bounded_input
            .store_in(MemoryType::Stack)
            .compute_at(output, y)
            .vectorize(x, 32);

        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{"x"}, y{"y"}, xi{"xi"}, xii{"xii"}, yi{"yi"}, yii{"yii"};
    Func rows{"rows"}, cols{"cols"}, input_16{"input_16"}, bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Gaussian3x3, gaussian3x3);
