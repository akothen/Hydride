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
            matrix_mul(x, y) += cast<int32_t>(A(k, y)) * cast<int32_t>(B(x,k));


            res(x, y) = matrix_mul(x, y);



            Var xi("xi");
            Var xii("xii");
            Var yi("yi");
            RVar r8_x(matrix_mul.update(0).get_schedule().dims()[0].var);
            res
                .split(x, x, xi, 256, TailStrategy::ShiftInwards)
                .split(y, y, yi, 4, TailStrategy::ShiftInwards)
                .split(xi, xi, xii, 16, TailStrategy::ShiftInwards)
                .unroll(yi)
                .vectorize(xii)
                .compute_root()
                .reorder({xii, yi, xi, x, y})
                //.fuse(x, y, x)
                //.parallel(x);
                ;
            matrix_mul.update(0)
                .split(x, x, xi, 16, TailStrategy::GuardWithIf)
                .unroll(y)
                .vectorize(xi)
                .reorder({xi, x, y, r8_x})
                .unroll(r8_x,2)
                ;
            matrix_mul
                .store_in(MemoryType::Stack)
                .split(x, x, xi, 16, TailStrategy::RoundUp)
                .unroll(y)
                .vectorize(xi)
                .compute_at(res, xi)
                .reorder({xi, x, y});


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