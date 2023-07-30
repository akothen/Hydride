#include "Halide.h"
// #include "../../common_params.h"

using namespace Halide;

class HalideBlur7x7 : public Halide::Generator<HalideBlur7x7> {
public:
    Input<Buffer<uint16_t>>  input{"input", 2};
    Output<Buffer<uint16_t>> blur_y{"blur_y", 2};

    void generate() {
      read_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
      blur_x(x, y) = (read_input(x, y) + 
                      read_input(x+1, y) +
                      read_input(x+2, y) +
                      read_input(x+3, y) +
                      read_input(x+4, y) +
                      read_input(x+5, y) +
                      read_input(x+6, y)
                      )/7;
      blur_y(x, y) = (blur_x(x, y) +
                      blur_x(x, y+1) +
                      blur_x(x, y+2) +
                      blur_x(x, y+3) +
                      blur_x(x, y+4) +
                      blur_x(x, y+5) +
                      blur_x(x, y+6)
                      )/7;
 
        // Schedules for x86
        blur_y
            .split(y, y, yi, 32)
            .vectorize(x, 32)
            .unroll(yi);
        blur_x
            .store_in(MemoryType::Stack)
            .store_at(blur_y, y)
            .compute_at(blur_y, x)
            .vectorize(x, 32);
        read_input
            .store_in(MemoryType::Stack)
            .store_at(blur_y, y)
            .compute_at(blur_y, y)
            .vectorize(x, 32);

        blur_y.print_loop_nest();
    }

    void schedule() {}

private:
    Func blur_x{"blur_x"}, read_input{"read_input"};
    Var x{"x"}, y{"y"}, xi{"xi"}, yi{"yi"};
};

HALIDE_REGISTER_GENERATOR(HalideBlur7x7, blur7x7)
