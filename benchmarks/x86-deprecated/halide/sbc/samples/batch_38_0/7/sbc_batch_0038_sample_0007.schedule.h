#ifndef sbc_batch_0038_sample_0007_SCHEDULE_H
#define sbc_batch_0038_sample_0007_SCHEDULE_H

// MACHINE GENERATED -- DO NOT EDIT
// This schedule was automatically generated by Adams2019
// for target=x86-64-linux-avx-avx2-avx512-avx512_sapphirerapids-avx512_skylake-disable_llvm_loop_opt-f16c-fma-sse41  // NOLINT
// with machine_params=10,16777216,40

#include "Halide.h"


inline void apply_schedule_sbc_batch_0038_sample_0007(
    ::Halide::Pipeline pipeline,
    ::Halide::Target target
) {
    using ::Halide::Func;
    using ::Halide::MemoryType;
    using ::Halide::RVar;
    using ::Halide::TailStrategy;
    using ::Halide::Var;
    Func output = pipeline.get_func(7);
    Func t3_0 = pipeline.get_func(6);
    Func t2_0 = pipeline.get_func(5);
    Func t1_0 = pipeline.get_func(4);
    Func in = pipeline.get_func(3);
    Func consts = pipeline.get_func(1);
    Var r14_x(output.update(0).get_schedule().dims()[0].var);
    Var r20_x(t3_0.update(0).get_schedule().dims()[0].var);
    Var r8_x(t1_0.update(0).get_schedule().dims()[0].var);
    Var x(output.get_schedule().dims()[0].var);
    Var xi("xi");
    RVar r20_y(t3_0.update(0).get_schedule().dims()[1].var);
    RVar r8_y(t1_0.update(0).get_schedule().dims()[1].var);
    output
        .split(x, x, xi, 16, TailStrategy::GuardWithIf)
        .vectorize(xi)
        .compute_root()
        .reorder({xi, x});
    output.update(0)
        .reorder({r14_x});
    t3_0
        .split(x, x, xi, 16, TailStrategy::RoundUp)
        .vectorize(xi)
        .compute_root()
        .reorder({xi, x});
    t3_0.update(0)
        .reorder({r20_x, r20_y});
    t3_0.update(1)
        .reorder({r20_x, r20_y});
    t2_0
        .split(x, x, xi, 32, TailStrategy::RoundUp)
        .vectorize(xi)
        .compute_root()
        .reorder({xi, x});
    t2_0.update(0)
        .reorder({r14_x});
    t1_0
        .split(x, x, xi, 16, TailStrategy::RoundUp)
        .vectorize(xi)
        .compute_root()
        .reorder({xi, x});
    t1_0.update(0)
        .reorder({r8_x, r8_y});
    t1_0.update(1)
        .reorder({r8_x, r8_y});

}

#endif  // sbc_batch_0038_sample_0007_SCHEDULE_H