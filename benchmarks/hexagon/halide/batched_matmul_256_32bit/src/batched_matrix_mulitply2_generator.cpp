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

    Output<Buffer<int32_t>> res{ "res", 3 };

    void generate() {
        RDom k(0, matrix_size);
        //matrix_mul(x, y) += cast<int32_t>(A(k, y)) * cast<int32_t>(B(x,k));

        matrix_mul(x, y, b) = 0;
        matrix_mul(x, y, b) += (cast<int32_t>(A(k, y, b)) * cast<int32_t>(B(x, k, b)));
        res(x, y, b) = matrix_mul(x, y, b);

        RVar red_loop(matrix_mul.update(0).get_schedule().dims()[0].var);

        res
            .compute_root()
            .split(y, y, yi, 4, TailStrategy::ShiftInwards)
            .split(x, x, xi, 64, TailStrategy::ShiftInwards)
            .split(xi, xi, xii, 16, TailStrategy::ShiftInwards)
            .vectorize(xii, 16)
            .reorder({xii, xi, yi, x, y})
            //.reorder({xii, yi, xi, x, y})
            .unroll(xi);
            //.parallel(y);
        matrix_mul.update(0)
            .split(x, x, xi, 16, TailStrategy::GuardWithIf)
            .split(y, y, yi, 16, TailStrategy::GuardWithIf)
            .reorder({xi, x, yi, y, red_loop})
            //.reorder({xi, x, y, red_loop})
            .vectorize(xi, 16)
            .unroll(y)
            .unroll(yi)
            .unroll(x)
            .unroll(red_loop, 4)
            ;
        matrix_mul
            .store_in(MemoryType::Stack)
            .compute_at(res, x)
            //.compute_at(res, xi)
            //.compute_at(res, yi)
            .split(x, x, xi, 16, TailStrategy::RoundUp)
            .reorder({xi, x, y})
            .vectorize(xi, 16)
            .unroll(y);

        res
            .bound(x,0, matrix_size)
            .bound(y, 0, matrix_size);

        res.print_loop_nest();
    }   

    void schedule() {}

private:
    Func matrix_mul{"matrix_mul"};
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"}, yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
};

HALIDE_REGISTER_GENERATOR(MatrixMultiply256, matmul_256_32bit)
