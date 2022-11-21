#include "Halide.h"
#include "halide_benchmark.h"

using namespace Halide;
using namespace Halide::Tools;

int main() {
    ImageParam input(type_of<uint16_t>(), 2);
    Func blur_y("blur_y");
    Func blur_x("blur_x");
    Var x("x"), y("y"), xi("xi"), yi("yi");
    blur_x(x, y) = (input(x, y) + input(x + 1, y) + input(x + 2, y)) / 3;
    blur_y(x, y) = (blur_x(x, y) + blur_x(x, y + 1) + blur_x(x, y + 2)) / 3;
            blur_y
                .split(y, y, yi, 32)
                .parallel(y)
                .vectorize(x, 16);
            blur_x
                .store_at(blur_y, y)
                .compute_at(blur_y, x)
                .vectorize(x, 16);
   blur_y.compile_jit();

  Target t("host-no_asserts-no_runtime-no_bounds_query");
  blur_y.compile_to_assembly("/home/akashk4/598/Halide/build/test/performance/blur.s", blur_y.infer_arguments(), t);
  blur_y.compile_to_bitcode("/home/akashk4/598/Halide/build/test/performance/blur.bc", blur_y.infer_arguments(), t);

  return 0;
}
