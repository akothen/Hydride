#include "Halide.h"
#include "halide_benchmark.h"

using namespace Halide;
using namespace Halide::Tools;

int main() {
    Func rows{"rows"}, cols{"cols"}, bounded_input{"bounded_input"};
    Var x{"x"}, y{"y"};
    Var xi{"xi"}, yi{"yi"};

    ImageParam input(type_of<uint8_t>(), 2);
    Func output;

    input.dim(0).set_min(0);
    input.dim(1).set_min(0);

    output.dim(0).set_min(0);
    output.dim(1).set_min(0);

    bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

    Func input_16("input_16");
    input_16(x, y) = cast<int16_t>(bounded_input(x, y));

    rows(x, y) = input_16(x, y - 2) + 4 * input_16(x, y - 1) + 6 * input_16(x, y) + 4 * input_16(x, y + 1) + input_16(x, y + 2);
    cols(x, y) = rows(x - 2, y) + 4 * rows(x - 1, y) + 6 * rows(x, y) + 4 * rows(x + 1, y) + rows(x + 2, y);

    output(x, y) = cast<uint8_t>(cols(x, y) >> 8);

   printf("SCHEDUING OUTPUT\n");
   const int vector_size = 512;//natural_vector_size<uint8_t>();
    output
        .vectorize(x, vector_size)
        .parallel(y, 16);

   printf("OUTPUT SCHDULED\n");
   output.compile_jit();
  printf("KERNEL COMPILED\n");
  Target t("host-no_asserts-no_runtime-no_bounds_query");
  output.compile_to_assembly("/home/akashk4/598/Halide/build/test/performance/gaussian.s", output.infer_arguments(), t);
  printf("ASSEMBLY GENERATED\n");
  output.compile_to_bitcode("/home/akashk4/598/Halide/build/test/performance/gaussian.bc", output.infer_arguments(), t);
  printf("BITCODE GENERATED\n");
  return 0;

}
