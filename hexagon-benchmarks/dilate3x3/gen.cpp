#include "Halide.h"

using namespace Halide;

class Dilate3x3 : public Generator<Dilate3x3> {
public:
  // Takes an 8 bit image; one channel.
  Input<Buffer<uint8_t>> input{"input", 2};
  // Outputs an 8 bit image; one channel.
  Output<Buffer<uint8_t>> output{"output", 2};

  GeneratorParam<bool> no_schedule{"no_schedule", false};

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
      input.dim(0).set_bounds_estimate(0, 1024)
           .dim(1).set_bounds_estimate(0, 1024);
      output.dim(0).set_bounds_estimate(0, 1024)
            .dim(1).set_bounds_estimate(0, 1024);
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