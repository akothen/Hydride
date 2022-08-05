#include <assert.h>
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "halide_benchmark.h"
#include "proc_common.h"

void bench_pipeline(PipelineDescriptorBase *p) {
    p->init();

#ifdef HALIDE_RUNTIME_HEXAGON
    // To avoid the cost of powering HVX on in each call of the
    // pipeline, power it on once now. Also, set Hexagon performance to turbo.
    halide_hexagon_set_performance_mode(NULL, halide_hexagon_power_turbo);
    halide_hexagon_power_hvx_on(NULL);
#endif

    double time = Halide::Tools::benchmark(iterations, 10, [&]() {
      int result = p->run();
      if (result != 0) {
        printf("pipeline failed! %d\n", result);
      }
    });
    printf("%g", time);

#ifdef HALIDE_RUNTIME_HEXAGON
    // We're done with HVX, power it off, and reset the performance mode
    // to default to save power.
    halide_hexagon_power_hvx_off(NULL);
    halide_hexagon_set_performance_mode(NULL, halide_hexagon_power_default);
#endif

    if (!p->verify(W, H)) {
      abort();
    }
    p->finalize();
}