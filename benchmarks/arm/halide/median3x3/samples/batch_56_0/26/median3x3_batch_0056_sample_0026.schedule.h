#ifndef median3x3_batch_0056_sample_0026_SCHEDULE_H
#define median3x3_batch_0056_sample_0026_SCHEDULE_H

// MACHINE GENERATED -- DO NOT EDIT
// This schedule was automatically generated by Adams2019
// for target=x86-64-linux-avx-avx2-disable_llvm_loop_opt-f16c-fma-sse41  // NOLINT
// with machine_params=32,24000000,40

#include "Halide.h"


inline void apply_schedule_median3x3_batch_0056_sample_0026(
    ::Halide::Pipeline pipeline,
    ::Halide::Target target
) {
    using ::Halide::Func;
    using ::Halide::MemoryType;
    using ::Halide::RVar;
    using ::Halide::TailStrategy;
    using ::Halide::Var;
    Func output = pipeline.get_func(10);
    Func minmax_x = pipeline.get_func(9);
    Func max_y = pipeline.get_func(8);
    Func midmid_x = pipeline.get_func(7);
    Func mid_y = pipeline.get_func(6);
    Func maxmin_x = pipeline.get_func(5);
    Func min_y = pipeline.get_func(4);
    Func bounded_input = pipeline.get_func(3);
    Func repeat_edge = pipeline.get_func(2);
    Func lambda_0 = pipeline.get_func(1);
    Var x(output.get_schedule().dims()[0].var);
    Var xi("xi");
    Var y(output.get_schedule().dims()[1].var);
    Var yi("yi");
    Var yii("yii");
    Var yiii("yiii");
    output
        .split(y, y, yi, 34, TailStrategy::ShiftInwards)
        .split(yi, yi, yii, 17, TailStrategy::ShiftInwards)
        .split(yii, yii, yiii, 2, TailStrategy::ShiftInwards)
        .split(x, x, xi, 32, TailStrategy::ShiftInwards)
        .vectorize(xi)
        .compute_root()
        .reorder({xi, x, yiii, yii, yi, y})
        .parallel(y);
    minmax_x
        .store_in(MemoryType::Stack)
        .split(x, x, xi, 32, TailStrategy::RoundUp)
        .vectorize(xi)
        .compute_at(output, x)
        .reorder({xi, x, y});
    max_y
        .store_in(MemoryType::Stack)
        .split(x, x, xi, 32, TailStrategy::RoundUp)
        .vectorize(xi)
        .compute_at(output, yi)
        .reorder({xi, x, y});
    min_y
        .store_in(MemoryType::Stack)
        .split(x, x, xi, 32, TailStrategy::RoundUp)
        .vectorize(xi)
        .compute_at(output, yii)
        .reorder({xi, x, y});
    bounded_input
        .store_in(MemoryType::Stack)
        .split(x, x, xi, 32, TailStrategy::ShiftInwards)
        .vectorize(xi)
        .compute_at(output, yi)
        .store_at(output, y)
        .reorder({xi, x, y});

}

#endif  // median3x3_batch_0056_sample_0026_SCHEDULE_H
