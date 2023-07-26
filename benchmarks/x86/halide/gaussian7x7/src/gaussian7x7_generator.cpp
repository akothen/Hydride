#include "Halide.h"

using namespace Halide;

using Halide::ConciseCasts::u8_sat;

class Gaussian7x7 : public Generator<Gaussian7x7> {
public:
    Input<Buffer<uint8_t>> input{"input", 2};
    Output<Buffer<uint8_t>> output{"output", 2};

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        input_32(x, y) = cast<int32_t>(bounded_input(x, y));

        rows(x, y) = input_32(x, y-3) + input_32(x, y-2) * 6 + input_32(x, y-1) * 15 + input_32(x, y) * 20 + 
                        input_32(x, y+1) * 15 + input_32(x, y+2) * 6 + input_32(x, y+3);
        
        cols(x,y) =  rows(x-3, y) + rows(x-2, y) * 6 + rows(x-1, y) * 15 + rows(x, y) * 20 + rows(x+1, y) * 15 + 
                        rows(x+2, y) * 6 + rows(x+3, y);

        output(x, y)  = u8_sat(cols(x, y) >> 12);

        // Schedules for x86
        output
            .tile(x, y, xi, yi, 32, 6, TailStrategy::RoundUp)
            .vectorize(xi, 16)
            .unroll(yi);
        rows
            .store_in(MemoryType::Stack)
            .compute_at(output, y)
            .tile(x, y, x, y, xi, yi, 32, 6, TailStrategy::RoundUp)
            .vectorize(xi, 16)
            .unroll(yi);
        bounded_input
            .store_in(MemoryType::Stack)
            .compute_at(output, y)
            .vectorize(x, 16);

        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{"x"}, y{"y"}, xi{"xi"}, xii{"xii"}, yi{"yi"}, yii{"yii"};
    Func rows{"rows"}, cols{"cols"}, input_32{"input_32"}, bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Gaussian7x7, gaussian7x7);
