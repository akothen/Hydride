#include "Halide.h"

using namespace Halide;

class MatMul : public Halide::Generator<MatMul> {
public:
    GeneratorParam<int> matrix_size{"size", 128};
    Input<Buffer<uint16_t>> A{"A", 2};
    Input<Buffer<uint16_t>> B{"B", 2};

    Output<Buffer<uint16_t>> out{"out", 2};

    void generate() {

        Var x("x"), xi("xi"), xo("xo"), y("y"), yo("yo"), yi("yi"), yii("yii"), xii("xii");
        Func matrix_mul("matrix_mul");

        RDom k(0, matrix_size);
        RVar ki;

        matrix_mul(x, y) += A(k, y) * B(x, k);

        out(x, y) = matrix_mul(x, y);

        Var xy;

        out .tile(x, y, xi, yi, 48, 48)
            .fuse(x, y, xy)
            .parallel(xy)
            .split(yi, yi, yii, 4)
            .vectorize(xi, 32)
            .unroll(xi)
            .unroll(yii);

        matrix_mul.compute_at(out, yi)
           .vectorize(x, 32)
            .unroll(y);

        matrix_mul.update(0)
            .reorder(x, y, k)
            .vectorize(x, 32)
            .unroll(x)
            .unroll(y)
            .unroll(k, 4);

        out
            .bound(x, 0, matrix_size)
            .bound(y, 0, matrix_size);
    }

};

HALIDE_REGISTER_GENERATOR(MatMul, mat_mul);
