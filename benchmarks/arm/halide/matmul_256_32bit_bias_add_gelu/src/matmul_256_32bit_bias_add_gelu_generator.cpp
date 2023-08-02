#include "Halide.h"
#include "../../hannk/common_halide.h"


using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;


using namespace Halide;
using namespace Halide::Internal;
using namespace hannk;

class MatrixMultiply256 : public Generator<MatrixMultiply256> {
public:
    // Two signed 16-bit input matrices, indexed by x, y.
    GeneratorParam<int> matrix_size{"size", 256};
    Input<Buffer<int16_t>> A{ "A", 3 };
    Input<Buffer<int16_t>> B{ "B", 3 };
    Input<Buffer<int32_t>> bias_{ "bias", 1 };

    Output<Buffer<int32_t>> output{ "output", 3 };

    void generate() {
        RDom k(0, matrix_size);

        matrix_mul(c, x, y) = 0;
        matrix_mul(c, x, y) += (cast<int32_t>(A(c, k, y)) * cast<int32_t>(B(c, x, k)));
        Expr bias_expr = matrix_mul(c, x, y);
        bias_expr += bias_(c);
        //Expr sqrt_2_over_pi = approx_reciprocal_sqrt(0, 3/2, Int(32));
        Expr sqrt_6283 = approx_reciprocal_sqrt(0, 6283, Int(32));
        Expr sqrt_1000 = approx_reciprocal_sqrt(0, 1000, Int(32));
        Expr sqrt_two_times_pi = sqrt_6283 / sqrt_1000;
        Expr one_half = approx_reciprocal(0, 2, Int(32));  // 1/2
        Expr one_third = approx_reciprocal(0, 3, Int(32));  // 1/3
        // Gelu approximation based on https://paperswithcode.com/method/gelu.
        output(c, x, y) = bias_expr * one_half 
                          * (1 
                             + bias_expr * one_third * sqrt_two_times_pi 
                              * (6 + bias_expr * bias_expr)
                            );

        RVar red_dim(matrix_mul.update(0).get_schedule().dims()[0].var);

        output
            .compute_root()
            .reorder(x, y, c)
            .split(y, y, yi, 4, TailStrategy::ShiftInwards)
            .split(x, x, xi, 64, TailStrategy::ShiftInwards)
            .split(xi, xi, xii, 16, TailStrategy::ShiftInwards)
            .vectorize(xii, 16)
            .reorder({xii, xi, yi, x, y})
            .unroll(xi)
            .unroll(yi);
        matrix_mul
            .store_in(MemoryType::Stack)
            .reorder(x, y, c)
            .compute_at(output, x)
            .split(x, x, xi, 16, TailStrategy::RoundUp)
            .vectorize(xi, 16)
            .unroll(x)
            .unroll(y);
        matrix_mul.update(0)
            .split(x, x, xi, 16, TailStrategy::GuardWithIf)
            .vectorize(xi, 16)
            .reorder({xi, x, y, red_dim})
            .unroll(x)
            .unroll(y);

        output.print_loop_nest();
    }   

    void schedule() {}

private:
    Func matrix_mul{"matrix_mul"};
    Var  c{ "c" }, x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"}, ci{"ci"}, 
        yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
};

HALIDE_REGISTER_GENERATOR(MatrixMultiply256, matmul_256_32bit_bias_add_gelu)
