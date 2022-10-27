#include "Halide.h"
#include "../../common_params.h"
#include "../samples/batch_64_0/24/blur3x3_batch_0064_sample_0024.schedule.h"

using namespace Halide;

class HalideBlur : public Halide::Generator<HalideBlur> {
public:
    GeneratorParam<int> tile_x{"tile_x", 32}; // X tile.
    GeneratorParam<int> tile_y{"tile_y", 8};  // Y tile.

    Input<Buffer<uint16_t>>  input{"input", 2};
    Output<Buffer<uint16_t>> blur_y{"blur_y", 2};

    void generate() {
        blur_x(x, y) = (input(x, y) + input(x+1, y) + input(x+2, y))/3;
        blur_y(x, y) = (blur_x(x, y) + blur_x(x, y+1) + blur_x(x, y+2))/3;

        Pipeline p(blur_y);
        apply_schedule_blur3x3_batch_0064_sample_0024(p, target);
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L506
            input.set_estimates({{0, stef_width/2}, {0, stef_height}});
            blur_y.set_estimates({{0, stef_width/2}, {0, stef_height}});
        }
    }

private:
    Func blur_x{"blur_x"};
    Var x{"x"}, y{"y"}, xi{"xi"}, yi{"yi"};
};

HALIDE_REGISTER_GENERATOR(HalideBlur, blur3x3)
