#include <Halide.h>

using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;

class MatrixMultiply128 : public Generator<MatrixMultiply128> {
    public:
        // Two signed 16-bit input matrices, indexed by x, y.
        GeneratorParam<int> matrix_size{"size", 128};
        Input<Buffer<int16_t>> A{ "A", 2 };
        Input<Buffer<int16_t>> B{ "B", 2 };


        Output<Buffer<int16_t>> res{ "res", 2 };



        void generate() {

            Func matrix_mul("matrix_mul");

            RDom k(0, matrix_size);
            Var x("x"), y("y");

            matrix_mul(x, y) += A(k, y) * B(x,k);


            res(x, y) = matrix_mul(x, y);


            res.bound(x,0, matrix_size)
                .bound(y, 0, matrix_size);

        }

        void schedule() {
            if (auto_schedule) {
                A.set_estimates({{0, 128}, {0, 128}});
                B.set_estimates({{0, 128}, {0, 128}});
                res.set_estimates({{0, 128}, {0, 128}});
            }
        }

};

HALIDE_REGISTER_GENERATOR(MatrixMultiply128, matmul_128)