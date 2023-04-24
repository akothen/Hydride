#include <Halide.h>

using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;

class HandTuneMatmul: public Generator<HandTuneMatmul> {
    public:
        // Two signed 16-bit input matrices, indexed by x, y.
        GeneratorParam<int> matrix_size{"size", 1024};
        Input<Buffer<int16_t>> A{ "A", 2 };
        Input<Buffer<int16_t>> B{ "B", 2 };


        Output<Buffer<int32_t>> res{ "res", 2 };



        void generate() {

            Func matrix_mul("matrix_mul");

            RDom k(0, matrix_size);
            Var x("x"), y("y");

            //matrix_mul(x,y) = (int32_t)0;
            matrix_mul(x, y) += cast<int32_t>(A(k, y)) * cast<int32_t>(B(x,k));


            res(x, y) = matrix_mul(x, y);

            Var xy("xy");
            

            Var  xi("xi"), xo("xo"), yo("yo"), yi("yi"), yii("yii"), xii("xii");

            res.tile(x, y, xi, yi, 32, 32)
            .fuse(x, y, xy)
            .parallel(xy)
            .split(yi, yi, yii, 4)
            .vectorize(xi, 32) 
            .unroll(xi)
            .unroll(yii)
            ;

            matrix_mul.compute_at(res, yi)
            .vectorize(x, 16)//32) // Changed vectorization factor
            .unroll(y)
            ;

            matrix_mul.update(0)
            .reorder(x, y, k)
            .vectorize(x, 16)//32)
            .unroll(x)
            .unroll(y)
            .unroll(k, 2) // Changed unroll factor to 2, to use existing synthesized result
            ;

            res
                .bound(x, 0, matrix_size)
                .bound(y, 0, matrix_size);





        }

        void schedule() {
            if (auto_schedule) {
                /*
                A.set_estimates({{0, 1024}, {0, 1024}});
                B.set_estimates({{0, 1024}, {0, 1024}});
                res.set_estimates({{0, 1024}, {0, 1024}});
                */
            }
        }

};

HALIDE_REGISTER_GENERATOR(HandTuneMatmul, handtune_matmul)
