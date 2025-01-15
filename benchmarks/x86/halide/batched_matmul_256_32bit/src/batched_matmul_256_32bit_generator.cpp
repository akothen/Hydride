#include "Halide.h"


using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;

class MatrixMultiply256 : public Generator<MatrixMultiply256> {
public:
    // Two signed 16-bit input matrices, indexed by x, y.
    GeneratorParam<int> matrix_size{"size", 256};
    Input<Buffer<int16_t>> A{ "A", 3 };
    Input<Buffer<int16_t>> B{ "B", 3 };

    Output<Buffer<int32_t>> output{ "output", 3 };

    void generate() {
        RDom k(0, matrix_size);
        //matrix_mul(x, y) += cast<int32_t>(A(k, y)) * cast<int32_t>(B(x,k));

        matrix_mul(x, y, b) = 0;
        matrix_mul(x, y, b) += (cast<int32_t>(A(k, y, b)) * cast<int32_t>(B(x, k, b)));
        output(x, y, b) = matrix_mul(x, y, b);

        RVar red_dim(matrix_mul.update(0).get_schedule().dims()[0].var);

        output
            .compute_root()
            .split(y, y, yi, 4, TailStrategy::ShiftInwards)
            .split(x, x, xi, 64, TailStrategy::ShiftInwards)
            .split(xi, xi, xii, 16, TailStrategy::ShiftInwards)
            .vectorize(xii, 16)
            .reorder({xii, xi, yi, x, y})
            .unroll(xi)
            .unroll(yi);
            //.parallel(y);
        matrix_mul.update(0)
            .split(x, x, xi, 16, TailStrategy::GuardWithIf)
            .vectorize(xi, 16)
            .reorder({xi, x, y, red_dim})
            .unroll(x)
            .unroll(y);
        matrix_mul
            .store_in(MemoryType::Stack)
            .compute_at(output, x)
            .split(x, x, xi, 16, TailStrategy::RoundUp)
            .vectorize(xi, 16)
            .unroll(x)
            .unroll(y);

        output.print_loop_nest();
    }   

    void schedule() {}

private:
    Func matrix_mul{"matrix_mul"};
    Var  b{ "b" }, x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"}, 
        yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
};

HALIDE_REGISTER_GENERATOR(MatrixMultiply256, batched_matmul_256_32bit)
