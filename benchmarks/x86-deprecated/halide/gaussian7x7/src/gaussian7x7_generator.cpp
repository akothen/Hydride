#include "Halide.h"
#include "utils.h"
#include "../../common_params.h"

using namespace Halide;

using Halide::ConciseCasts::u8_sat;

class Gaussian7x7 : public Generator<Gaussian7x7> {
public:
    Input<Buffer<uint8_t>> input{"input", 2};
    Output<Buffer<uint8_t>> output{"output", 2};

    GeneratorParam<bool> use_parallel_sched{"use_parallel_sched", true};
    GeneratorParam<bool> use_prefetch_sched{"use_prefetch_sched", true};

    void generate() {
        input_32(x, y) = cast<int32_t>(input(x, y));

        rows(x, y) = input_32(x, y-3) + input_32(x, y-2) * 6 + input_32(x, y-1) * 15 + input_32(x, y) * 20 + 
                        input_32(x, y+1) * 15 + input_32(x, y+2) * 6 + input_32(x, y+3);
        
        cols(x,y) =  rows(x-3, y) + rows(x-2, y) * 6 + rows(x-1, y) * 15 + rows(x, y) * 20 + rows(x+1, y) * 15 + 
                        rows(x+2, y) * 6 + rows(x+3, y);

        output(x, y)  = u8_sat(cols(x, y) >> 12);
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/2b499110cecfee875edf392306b41be8d6cc2567/benchmarks/hexagon/halide/test/run.cpp#L846
            input.set_estimates({{0, stef_width}, {0, stef_height}});
            output.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }
    
private:
    Var x{"x"}, y{"y"};
    Func rows{"rows"}, cols{"cols"};
    Func input_32{"input_32"}, bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Gaussian7x7, gaussian7x7);