// Halide matmul implementation

#include "Halide.h"
#include "halide_benchmark.h"
#include <cstdio>
#include <chrono>

#define clock_type std::chrono::high_resolution_clock

using namespace Halide;
using namespace Halide::Tools;

int matmul_benchmark(int matrix_size) {
    ImageParam A(type_of<int16_t>(), 2);
    ImageParam B(type_of<int16_t>(), 2);

    Var x("x"), xi("xi"), xo("xo"), y("y"), yo("yo"), yi("yi"), yii("yii"), xii("xii");
    Func matrix_mul("matrix_mul");

    RDom k(0, matrix_size);
    RVar ki;

    Buffer<int32_t> output(matrix_size, matrix_size);

    matrix_mul(x, y) += cast<int32_t>(A(k, y)) * cast<int32_t>(B(x,k));

    Func out;
    out(x, y) = matrix_mul(x, y);

    Var xy;

    out.tile(x, y, xi, yi, 32, 32)
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

    out.compile_jit();

    //out.realize(output);

    //double t = benchmark([&]() {
    //    out.realize(output);
    //});


    //float gflops = 2.0f * matrix_size * matrix_size * matrix_size / 1e9f;

    //printf("Matmul execution time for %dx%dx%d: %fms, %f GFLOP/s\n\n",
    //       matrix_size, matrix_size, matrix_size, t * 1e3, (gflops / t));

    //printf("Success!\n");
    return 0;
}



int main(int argc, char **argv) {
    //matmul_benchmark(512);
    for (int i = 0; i < 100 ; i++)
      matmul_benchmark(1024);
    //matmul_benchmark(2048);
    return 0;
}
