#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Gaussian3x3 : public Generator<Gaussian3x3> {
public:
    Input<Buffer<uint8_t>> input{"input", 2};
    Output<Buffer<uint8_t>> output{"output", 2};

    void generate() {
        Func read_input("read_input");
        read_input = Halide::BoundaryConditions::repeat_edge(input,
                {{input.dim(0).min(), input.dim(0).extent()},
                {input.dim(1).min(), input.dim(1).extent()}}
                );
        input_16(x, y) = cast<int16_t>(read_input(x, y));

        rows(x, y) = input_16(x, y-1) + 2 * input_16(x, y) + input_16(x, y+1);
        cols(x,y) =  rows(x-1, y) + 2 * rows(x, y) + rows(x+1, y);

        output(x, y)  = cast<uint8_t> ((cols(x, y) + 8) >> 4);

        // Schedules for x86
        output
            .compute_root()
            .split(y, y, yi, 72, TailStrategy::ShiftInwards)
            .split(x, x, xi, 64, TailStrategy::ShiftInwards)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);
            //.parallel(y);
        cols
            .store_in(MemoryType::Stack)
            .compute_at(output, yi)
            .split(x, x, xi, 128, TailStrategy::RoundUp)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);
        rows
            .store_in(MemoryType::Stack)
            .compute_at(cols, x)
            .split(x, x, xi, 128, TailStrategy::RoundUp)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);
        input_16
            .store_in(MemoryType::Stack)
            .store_at(output, y)
            .compute_at(output, yi)
            .split(x, x, xi, 64, TailStrategy::RoundUp)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);

        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{"x"}, y{"y"}, xi{"xi"}, xii{"xii"}, yi{"yi"}, yii{"yii"};
    Func rows{"rows"}, cols{"cols"}, input_16{"input_16"};
};

HALIDE_REGISTER_GENERATOR(Gaussian3x3, gaussian3x3);
