#include "Halide.h"

using namespace Halide;

class Conv3x3 : public Generator<Conv3x3> {
public:
  // Taken from here:
  // https://github.com/halide/Halide/blob/standalone_autoscheduler/apps/hexagon_benchmarks/Makefile#L26
  GeneratorParam<Type> accumulator_type{"accumulator_type", Int(16)};
  // Takes an 8 bit image; one channel.
  Input<Buffer<uint8_t>> input{"input", 2};
  Input<Buffer<int8_t>> mask{"mask", 2};
  // Outputs an 8 bit image; one channel.
  Output<Buffer<uint8_t>> output{"output", 2};

  GeneratorParam<bool> no_schedule{"no_schedule", false};

  void generate() {
    bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

    Expr sum = cast(accumulator_type, 0);
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        sum += cast<int16_t>(bounded_input(x + j, y + i)) *
               cast<int16_t>(mask(j + 1, i + 1));
      }
    }
    output(x, y) = cast<uint8_t>(clamp(sum >> 4, 0, 255));
  }

  void schedule() {
    Var xi{"xi"}, yi{"yi"};

    input.dim(0).set_min(0);
    input.dim(1).set_min(0);

    output.dim(0).set_min(0);
    output.dim(1).set_min(0);

    if (auto_schedule) {
      input.dim(0).set_bounds_estimate(0, 1024)
           .dim(1).set_bounds_estimate(0, 1024);
      output.dim(0).set_bounds_estimate(0, 1024)
            .dim(1).set_bounds_estimate(0, 1024);
    } else {
      const int vector_size = natural_vector_size<uint8_t>();
      output.vectorize(x, vector_size)
            .parallel(y, 16);
    }
  }

private:
  Var x{"x"}, y{"y"};
  Func bounded_input{"input_bounded"};
};

HALIDE_REGISTER_GENERATOR(Conv3x3, conv3x3a16)