#include <Halide.h>

using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;

class MatrixMultiplySimple : public Generator<MatrixMultiplySimple> {
public:
    // Two unsigned 8-bit input matrices, indexed by x, y.
    Input<Buffer<int32_t>> A{ "A", 2 };
    Input<Buffer<int32_t>> B{ "B", 2 };

    Output<Buffer<int32_t>> res{ "res", 2 };

    void generate() {
        Var x("x"), y("y");
        RDom k(0, A.dim(0).extent());

        res(x, y) = 0; 
        res(x, y) += A(k, y) * B(x, k);
    }
};

HALIDE_REGISTER_GENERATOR(MatrixMultiplySimple, matmul_simple)