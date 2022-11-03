#include <Halide.h>

using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;

class MatrixMultiply256 : public Generator<MatrixMultiply256> {
    public:
        // Two signed 16-bit input matrices, indexed by x, y.
        GeneratorParam<int> matrix_size{"size", 256};
        Input<Buffer<int16_t>> A{ "A", 2 };
        Input<Buffer<int16_t>> B{ "B", 2 };


        Output<Buffer<int32_t>> res{ "res", 2 };



        void generate() {

            Func matrix_mul("matrix_mul");

            RDom k(0, matrix_size);
            Var x("x"), y("y");

            matrix_mul(x, y) += A(k, y) * B(x,k);


            res(x, y) = cast<int32_t>(matrix_mul(x, y));


            res.bound(x,0, matrix_size)
                .bound(y, 0, matrix_size);

        }

        void schedule() {
            if (auto_schedule) {
                A.set_estimates({{0, 256}, {0, 256}});
                B.set_estimates({{0, 256}, {0, 256}});
                res.set_estimates({{0, 256}, {0, 256}});
            }
        }

};

HALIDE_REGISTER_GENERATOR(MatrixMultiply256, matmul_256_32bit)
