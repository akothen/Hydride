#ifndef fully_connected_batch_0015_sample_0008_SCHEDULE_H
#define fully_connected_batch_0015_sample_0008_SCHEDULE_H

// MACHINE GENERATED -- DO NOT EDIT
// This schedule was automatically generated by Adams2019
// for target=x86-64-linux-avx-avx2-disable_llvm_loop_opt-f16c-fma-sse41  // NOLINT
// with machine_params=32,24000000,40

#include "Halide.h"


inline void apply_schedule_fully_connected_batch_0015_sample_0008(
    ::Halide::Pipeline pipeline,
    ::Halide::Target target
) {
    using ::Halide::Func;
    using ::Halide::MemoryType;
    using ::Halide::RVar;
    using ::Halide::TailStrategy;
    using ::Halide::Var;
    Func output = pipeline.get_func(8);
    Func multiplied = pipeline.get_func(7);
    Func repeat_edge_1 = pipeline.get_func(6);
    Func lambda_1 = pipeline.get_func(5);
    Func repeat_edge = pipeline.get_func(3);
    Func lambda_0 = pipeline.get_func(2);
    Var _0(repeat_edge_1.get_schedule().dims()[0].var);
    Var _0i("_0i");
    Var _1(repeat_edge_1.get_schedule().dims()[1].var);
    Var _1i("_1i");
    Var b(output.get_schedule().dims()[1].var);
    Var bi("bi");
    Var c(output.get_schedule().dims()[0].var);
    Var ci("ci");
    Var cii("cii");
    RVar r9_x(multiplied.update(0).get_schedule().dims()[0].var);
    output
        .split(b, b, bi, 4, TailStrategy::ShiftInwards)
        .split(c, c, ci, 96, TailStrategy::ShiftInwards)
        .split(ci, ci, cii, 32, TailStrategy::ShiftInwards)
        .unroll(ci)
        .unroll(bi)
        .vectorize(cii, 512 / 64) // Added vectorization factor
        .compute_root()
        .reorder({cii, ci, bi, c, b})
        .parallel(b);
    multiplied
        .store_in(MemoryType::Stack)
        .split(c, c, ci, 8, TailStrategy::ShiftInwards)
        .vectorize(ci, 512 / 64) // Added vectorization factor
        .compute_at(output, c)
        .reorder({ci, c, b});
    multiplied.update(0)
        .split(c, c, ci, 32, TailStrategy::RoundUp)
        .unroll(c)
        .unroll(b)
        .vectorize(ci, 512 / 64) // Added vectorization factor
        .reorder({ci, c, b, r9_x});
    repeat_edge_1
        .split(_0, _0, _0i, 60, TailStrategy::ShiftInwards)
        .split(_1, _1, _1i, 32, TailStrategy::ShiftInwards)
        .vectorize(_1i)
        .compute_root()
        .reorder({_1i, _1, _0i, _0})
        .parallel(_0)
        .reorder_storage(_1, _0);
    repeat_edge
        .split(_0, _0, _0i, 32, TailStrategy::ShiftInwards)
        .vectorize(_0i)
        .compute_at(output, b)
        .reorder({_0i, _0, _1});

}

#endif  // fully_connected_batch_0015_sample_0008_SCHEDULE_H