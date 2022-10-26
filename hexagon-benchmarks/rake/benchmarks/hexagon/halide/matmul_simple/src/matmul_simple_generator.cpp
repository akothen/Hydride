#include <Halide.h>

using Halide::Generator;
using Halide::RVar;
using Halide::ConciseCasts::u8;
using Halide::ConciseCasts::u32;
using Halide::ConciseCasts::u8_sat;

class MatrixMultiplySimple : public Generator<MatrixMultiplySimple> {
    public:
        // Two unsigned 8-bit input matrices, indexed by x, y.
        GeneratorParam<int> matrix_size{"size", 128};
        Input<Buffer<int16_t>> A{ "A", 2 };
        Input<Buffer<int16_t>> B{ "B", 2 };


        Output<Buffer<int16_t>> res{ "res", 2 };

        int vector_size = 512 / 16;


        void generate() {

            //Var x("x"), xi("xi"), xo("xo"), y("y"), yo("yo"), yi("yi"), yii("yii"), xii("xii");

            //Var x("x"), y("y"), xi("xi"), yi("yi");
            Var x("x"), xi("xi"), xo("xo"), y("y"), yo("yo"), yi("yi"), yii("yii"), xii("xii");
            Func matrix_mul("matrix_mul");

            RDom k(0, matrix_size);
            RVar ki;

            bool A_row_major = true;
            bool B_row_major = true;

            /*
               if(A_row_major){
               A
               .dim(0)
               .set_bounds(0, matrix_size)
               .set_stride(matrix_size)
               .dim(1)
               .set_bounds(0, matrix_size)
               .set_stride(1);


               } else {
               A
               .dim(0)
               .set_bounds(0, matrix_size)
               .set_stride(1)
               .dim(1)
               .set_bounds(0, matrix_size)
               .set_stride(matrix_size);
               }


               if(B_row_major){
               B
               .dim(0)
               .set_bounds(0, matrix_size)
               .set_stride(matrix_size)
               .dim(1)
               .set_bounds(0, matrix_size)
               .set_stride(1);


               } else {
               B
               .dim(0)
               .set_bounds(0, matrix_size)
               .set_stride(1)
               .dim(1)
               .set_bounds(0, matrix_size)
               .set_stride(matrix_size);
               }*/



            //matrix_mul(x,y) = 0;
            matrix_mul(x, y) += A(k, y) * B(x,k);


            res(x, y) = matrix_mul(x, y);

            /*
            Var xy("xy");

            res 
                .tile(x,y, xi,yi, 32, 32)
                .fuse(x,y,xy)
                .parallel(xy)
                .split(yi, yi, yii,4)
                .vectorize(xi, vector_size)
                .unroll(xi)
                .unroll(yii);

            matrix_mul.compute_at(res, yi).vectorize(x, vector_size).unroll(y);
            matrix_mul.update(0)
                .reorder(y,x,k)
                .vectorize(x, vector_size).unroll(y,4).unroll(k,4);
                */

            int factor = 2;

            matrix_mul.update(0)
                .reorder(k,y,x)
                .atomic()
                .vectorize(k, factor)
                .vectorize(y, vector_size/factor)
                ;

            res.bound(x,0, matrix_size)
                .bound(y, 0, matrix_size);

        }

};

HALIDE_REGISTER_GENERATOR(MatrixMultiplySimple, matmul_simple)
