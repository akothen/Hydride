#include "Halide.h"
#include "utils.h"
#include "../../common_params.h"
#include "../samples/batch_56_0/26/median3x3_batch_0056_sample_0026.schedule.h"

using namespace Halide;

class Median3x3 : public Generator<Median3x3> {
private:
    static Expr mid(Expr a, Expr b, Expr c) {
        return max(min(max(a, b), c), min(a, b));
    }

public:
    // Takes an 8 bit image; one channel.
    Input<Buffer<uint8_t>> input{"input", 2};
    // Outputs an 8 bit image; one channel.
    Output<Buffer<uint8_t>> output{"output", 2};

    GeneratorParam<bool> use_parallel_sched{"use_parallel_sched", true};
    GeneratorParam<bool> use_prefetch_sched{"use_prefetch_sched", true};

    void generate() {
        Expr height = input.height();
        bounded_input(x, y) = repeat_edge_x(input)(x, y);
        max_y(x,y) = max(bounded_input(x ,clamp(y-1, 0, height-1)),
                         bounded_input(x, clamp(y, 0, height-1)),
                         bounded_input(x, clamp(y+1, 0, height-1)));
        min_y(x,y) = min(bounded_input(x, clamp(y-1, 0, height-1)),
                         bounded_input(x, clamp(y, 0, height-1)),
                         bounded_input(x, clamp(y+1, 0, height-1)));
        mid_y(x,y) = mid(bounded_input(x, clamp(y-1, 0, height-1)),
                         bounded_input(x, clamp(y, 0, height-1)),
                         bounded_input(x, clamp(y+1, 0, height-1)));

        minmax_x(x,y) = min(max_y(x-1, y), max_y(x, y), max_y(x+1, y));
        maxmin_x(x,y) = max(min_y(x-1, y), min_y(x, y), min_y(x+1, y));
        midmid_x(x,y) = mid(mid_y(x-1, y), mid_y(x, y), mid_y(x+1, y));

        output(x,y) = mid(minmax_x(x, y), maxmin_x(x, y), midmid_x(x, y));
        Pipeline p(output);
        // apply_schedule_median3x3_batch_0056_sample_0026(p, target);
        int vector_size = natural_vector_size<uint8_t>();
        output
            .tile(x, y, xi, yi, 64, 4, TailStrategy::RoundUp)
            .vectorize(xi, vector_size)
            .unroll(yi);
        bounded_input
            .compute_at(output, y)
            .align_storage(x, 64)
            .vectorize(x, vector_size, TailStrategy::RoundUp);
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L898
            input.set_estimates({{0, stef_width}, {0, stef_height}});
            output.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }
private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"};
    Func max_y{"max_y"}, min_y{"min_y"}, mid_y{"mid_y"},
        minmax_x{"minmax_x"}, maxmin_x{"maxmin_x"}, midmid_x{"midmid_x"}, 
        bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Median3x3, median3x3)
