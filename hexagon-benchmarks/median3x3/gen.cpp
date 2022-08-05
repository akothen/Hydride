#include "Halide.h"

using namespace Halide;

class Median3x3 : public Generator<Median3x3> {
private:
  static Expr mid(Expr a, Expr b, Expr c) {
    return max(min(max(a, b), c), min(a, b));
  }

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
    min_y(x, y) = min(bounded_input(x, y - 1), bounded_input(x, y),
                      bounded_input(x, y + 1));
    mid_y(x, y) = mid(bounded_input(x, y - 1), bounded_input(x, y),
                      bounded_input(x, y + 1));

    minmax_x(x, y) = min(max_y(x - 1, y), max_y(x, y), max_y(x + 1, y));
    maxmin_x(x, y) = max(min_y(x - 1, y), min_y(x, y), min_y(x + 1, y));
    midmid_x(x, y) = mid(mid_y(x - 1, y), mid_y(x, y), mid_y(x + 1, y));

    output(x, y) = mid(minmax_x(x, y), maxmin_x(x, y), midmid_x(x, y));
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
    } else if (no_schedule) {
    } else {
      const int vector_size = natural_vector_size<uint8_t>();
      output.vectorize(x, vector_size).parallel(y, 16);
    }
  }

private:
  Var x{"x"}, y{"y"};
  Func max_y{"max_y"}, min_y{"min_y"}, mid_y{"mid_y"};
  Func minmax_x{"minmax_x"}, maxmin_x{"maxmin_x"}, midmid_x{"midmid_x"};
  Func bounded_input{"bounded_input"};
};

HALIDE_REGISTER_GENERATOR(Median3x3, median3x3)