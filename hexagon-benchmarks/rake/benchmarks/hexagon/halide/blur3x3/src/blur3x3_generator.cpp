#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class HalideBlur : public Halide::Generator<HalideBlur> {
public:
    GeneratorParam<int> tile_x{"tile_x", 32}; // X tile.
    GeneratorParam<int> tile_y{"tile_y", 8};  // Y tile.

    Input<Buffer<uint16_t>>  input{"input", 2};
    Output<Buffer<uint16_t>> blur_y{"blur_y", 2};

    void generate() {

        Func read_input("read_input");
        read_input = Halide::BoundaryConditions::repeat_edge(input,
                {{input.dim(0).min(), input.dim(0).extent()},
                {input.dim(1).min(), input.dim(1).extent()}}
                );
        blur_x(x, y) = (read_input(x, y) + read_input(x+1, y) + read_input(x+2, y))/3;
        blur_y(x, y) = (blur_x(x, y) + blur_x(x, y+1) + blur_x(x, y+2))/3;

        Pipeline p(blur_y);
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
