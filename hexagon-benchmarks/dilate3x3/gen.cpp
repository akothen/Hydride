#include "Halide.h"

using namespace Halide;

class Dilate3x3 : public Generator<Dilate3x3> {
public:
  // Takes an 8 bit image; one channel.
  Input<Buffer<uint8_t, 2>> input{"input"};
  // Outputs an 8 bit image; one channel.
  Output<Buffer<uint8_t, 2>> output{"output"};

  GeneratorParam<bool> use_parallel_sched{"use_parallel_sched", true};
  GeneratorParam<bool> use_prefetch_sched{"use_prefetch_sched", true};

  void generate() {
    bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
    max_y(x, y) = max(bounded_input(x, y - 1), bounded_input(x, y),
                      bounded_input(x, y + 1));

    output(x, y) = max(max_y(x - 1, y), max_y(x, y), max_y(x + 1, y));
  }

  void schedule() {
    Var xi{"xi"}, yi{"yi"};

    input.dim(0).set_min(0);
    input.dim(1).set_min(0);

    output.dim(0).set_min(0);
    output.dim(1).set_min(0);

    if (auto_schedule) {
      input.set_estimates({{0, 1024}, {0, 1024}});
      output.set_estimates({{0, 1024}, {0, 1024}});
    } else {
      const int vector_size = natural_vector_size<uint8_t>();
      output.vectorize(x, vector_size).parallel(y, 16);
    }
  }

private:
  Var x{"x"}, y{"y"};
  Func max_y{"max_y"};
  Func bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Dilate3x3, dilate3x3)