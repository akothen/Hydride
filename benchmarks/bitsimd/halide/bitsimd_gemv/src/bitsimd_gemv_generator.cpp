#include "Halide.h"

using namespace Halide;

class Matmul : public Generator<Matmul> {
public:
    GeneratorParam<int> matrix_size{"size", 256};
    Input<Buffer<int32_t>> A{ "A", 2 };
    Input<Buffer<int32_t>> B{ "B", 1 };
    Output<Buffer<int32_t>> output{ "output", 2 };

    void generate() {
        RDom k(0, matrix_size);

        output(x, y) = 0;
        output(x, y) += A(x,k) * B(k);
        // Schedules for BitSIMD 
        output
            .update(0)
            .vectorize(x,32)
            .unroll(y,1)
            ;

    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"};
    Func max_y{ "max_y" }, bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Matmul, bitsimd_gemv)
