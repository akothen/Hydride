#include "Halide.h"
#include "utils.h"
#include "../../common_params.h"

using namespace Halide;

class Gaussian3x3 : public Generator<Gaussian3x3> {
    public:
        Input<Buffer<uint8_t>> input{"input", 2};
        Output<Buffer<uint8_t>> output{"output", 2};

        GeneratorParam<bool> use_prefetch_sched{"use_prefetch_sched", true};


        void generate() {

            //input_16(x, y) = cast<int16_t>(input(x, y));
            Func read_input("read_input");
            read_input = Halide::BoundaryConditions::repeat_edge(input,
                    {{input.dim(0).min(), input.dim(0).extent()},
                    {input.dim(1).min(), input.dim(1).extent()}}
                    );
            input_16(x, y) = cast<int16_t>(read_input(x, y));


            rows(x, y) = input_16(x, y-1) + 2 * input_16(x, y) + input_16(x, y+1);
            cols(x,y) =  rows(x-1, y) + 2 * rows(x, y) + rows(x+1, y);

            output(x, y)  = cast<uint8_t> ((cols(x, y) + 8) >> 4);

            Pipeline p(output);
        }

        void schedule() {
            // NOTE(Stefanos): The auto-tuner seems to produce wrong schedules in this, with the error:
            // Error: Can only unroll for loops over a constant extent.
            // But it's only for few (actually, one) samples so we should be fine.
            if (auto_schedule) {
                // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L762
                input.set_estimates({{0, stef_width}, {0, stef_height}});
                output.set_estimates({{0, stef_width}, {0, stef_height}});
            }
        }
    private:
        Var x{"x"}, y{"y"};
        Func rows{"rows"}, cols{"cols"};
        Func input_16{"input_16"};
};

HALIDE_REGISTER_GENERATOR(Gaussian3x3, gaussian3x3);
