#include "Halide.h"

using namespace Halide;

class SimpleAdd : public Generator<SimpleAdd> {
public:
    Input<Buffer<int32_t>> A{ "A", 2 };
    Input<Buffer<int32_t>> B{ "B", 2 };
    Output<Buffer<int32_t>> output{ "output", 2 };

    void generate() {
        output(x, y) = A(x,y) + B(x,y);
        
        // Schedules for x86
        output
            .tile(x, y, xi, yi, 32, 8, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            ;

    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"};
    Func max_y{ "max_y" }, bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(SimpleAdd, simple_add)
