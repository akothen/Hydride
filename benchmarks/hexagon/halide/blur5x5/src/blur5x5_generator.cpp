#include "Halide.h"

using namespace Halide;

class HalideBlur5x5 : public Halide::Generator<HalideBlur5x5> {
public:
    Input<Buffer<uint16_t>>  input{"input", 2};
    Output<Buffer<uint16_t>> blur_y{"blur_y", 2};

    void generate() {

        Func read_input("read_input");
        read_input = Halide::BoundaryConditions::repeat_edge(input,
                {{input.dim(0).min(), input.dim(0).extent()},
                {input.dim(1).min(), input.dim(1).extent()}}
                );
        blur_x(x, y) = (read_input(x, y) + 
                        read_input(x+1, y) +
                        read_input(x+2, y) +
                        read_input(x+3, y) +
                        read_input(x+4, y)
                       )/5;
        blur_y(x, y) = (blur_x(x, y) +
                        blur_x(x, y+1) +
                        blur_x(x, y+2) +
                        blur_x(x, y+3) +
                        blur_x(x, y+4)
                       )/5;


        if (get_target().has_feature(Target::HVX)) {
            const int vector_size = 64;

            blur_y.compute_root()
                .hexagon()
                .prefetch(input, y, 2)
                .split(y, y, yi, 128)
                .parallel(y)
                .vectorize(x, vector_size);
            blur_x
                .store_at(blur_y, y)
                .compute_at(blur_y, yi)
                .vectorize(x, vector_size);
        }
    }

    void schedule() {
    }

private:
    Func blur_x{"blur_x"};
    Var x{"x"}, y{"y"}, xi{"xi"}, yi{"yi"};
};

HALIDE_REGISTER_GENERATOR(HalideBlur5x5, blur5x5)
