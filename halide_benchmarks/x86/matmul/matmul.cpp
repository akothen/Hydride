// Halide matmul implementation

#include "Halide.h"
#include "halide_benchmark.h"
#include <cstdio>
#include <chrono>

#define clock_type std::chrono::high_resolution_clock

using namespace Halide;
using namespace Halide::Tools;

void reference_matmul(float *A, float *B, float *C, int width, int stride) {
    for (int iy = 0; iy < width; iy++) {
        for (int ix = 0; ix < width; ix++) {
            float *cc = C + iy * stride + ix;
            *cc = 0.0f;
            for (int ik = 0; ik < width; ik++) {
                *cc = *cc + A[iy * stride + ik] * B[ik * stride + ix];
            }
        }
    }
}

int matmul_benchmark(int matrix_size) {
    Target target = get_jit_target_from_environment();
    if (target.arch == Target::WebAssembly) {
        printf("[SKIP] Performance tests are meaningless and/or misleading under WebAssembly interpreter.\n");
        return 0;
    }

    ImageParam A(type_of<float>(), 2);
    ImageParam B(type_of<float>(), 2);

    Var x("x"), xi("xi"), xo("xo"), y("y"), yo("yo"), yi("yi"), yii("yii"), xii("xii");
    Func matrix_mul("matrix_mul");

    RDom k(0, matrix_size);
    RVar ki;

    matrix_mul(x, y) += A(k, y) * B(x, k);

    Func out;
    out(x, y) = matrix_mul(x, y);

    Var xy;

    out.tile(x, y, xi, yi, 48, 48)
        .fuse(x, y, xy)
        .parallel(xy)
        .split(yi, yi, yii, 4)
        .vectorize(xi, 16)
        .unroll(xi)
        .unroll(yii);

    matrix_mul.compute_at(out, yi)
        .vectorize(x, 16)
        .unroll(y);

    matrix_mul.update(0)
        .reorder(x, y, k)
        .vectorize(x, 16)
        .unroll(x)
        .unroll(y)
        .unroll(k, 4);

    out
        .bound(x, 0, matrix_size)
        .bound(y, 0, matrix_size);

    out.compile_jit();

    Buffer<float> mat_A(matrix_size, matrix_size);
    Buffer<float> mat_B(matrix_size, matrix_size);
    Buffer<float> output(matrix_size, matrix_size);

    // init randomly
    for (int iy = 0; iy < matrix_size; iy++) {
        for (int ix = 0; ix < matrix_size; ix++) {
            mat_A(ix, iy) = (rand() % 256) / 256.0f;
            mat_B(ix, iy) = (rand() % 256) / 256.0f;
        }
    }

    A.set(mat_A);
    B.set(mat_B);

    //std::chrono::time_point<clock_type> start_time_ = clock_type::now();
    out.realize(output);
    //std::chrono::time_point<clock_type> stop_time_ = clock_type::now();
    //std::chrono::duration<double, std::milli> duration_milli = stop_time_ - start_time_;
    //double t = duration_milli.count();

    double t = benchmark([&]() {
        out.realize(output);
    });

    // check results
    Buffer<float> output_ref(matrix_size, matrix_size);
    Buffer<float> output_halide(matrix_size, matrix_size);

    reference_matmul(mat_A.data(), mat_B.data(), output_ref.data(), mat_A.width(), mat_A.stride(1));
    out.realize(output_halide);

    bool halide_correct = true;
    for (int iy = 0; iy < matrix_size && halide_correct; iy++) {
        for (int ix = 0; ix < matrix_size; ix++) {
            halide_correct = halide_correct && (std::abs(output_ref(ix, iy) - output_halide(ix, iy)) < 0.001f);
        }
    }

    if (halide_correct) {
        printf("Halide results - OK\n");
    } else {
        printf("Halide results - FAIL\n");
        return 1;
    }

    {
        Target t("host-no_asserts-no_runtime-no_bounds_query");
        out.compile_to_assembly("/home/akashk4/598/Halide/build/test/performance/matmul.s", matrix_mul.infer_arguments(), t);
        out.compile_to_bitcode("/home/akashk4/598/Halide/build/test/performance/matmul.bc", matrix_mul.infer_arguments(), t);
    }

    float gflops = 2.0f * matrix_size * matrix_size * matrix_size / 1e9f;

    printf("Matmul execution time for %dx%dx%d: %fms, %f GFLOP/s\n\n",
           matrix_size, matrix_size, matrix_size, t * 1e3, (gflops / t));

    printf("Success!\n");
    return 0;
}



int main(int argc, char **argv) {
    matmul_benchmark(512);
    matmul_benchmark(1024);
    matmul_benchmark(2048);
    return 0;
}
