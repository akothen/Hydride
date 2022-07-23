#include "Halide.h"

using namespace Halide;

class Conv3x3 : public Generator<Conv3x3> {
public:
  GeneratorParam<Type> accumulator_type{"accumulator_type", Int(16)};
  // Takes an 8 bit image; one channel.
  Input<Buffer<uint8_t, 2>> input{"input"};
  Input<Buffer<int8_t, 2>> mask{"mask"};
  // Outputs an 8 bit image; one channel.
  Output<Buffer<uint8_t, 2>> output{"output"};

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
      input.set_estimates({{0, 1024}, {0, 1024}});
      output.set_estimates({{0, 1024}, {0, 1024}});
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

HALIDE_REGISTER_GENERATOR(Conv3x3, conv3x3)