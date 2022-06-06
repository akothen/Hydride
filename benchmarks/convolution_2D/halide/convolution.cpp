#include "Halide.h"
#include "halide_benchmark.h"

using namespace Halide;
using namespace Halide::Tools;

int main() {
    Var x{"x"}, y{"y"};
    Func bounded_input{"input_bounded"};

    Var xi{"xi"}, yi{"yi"};

    GeneratorParam<Type> accumulator_type{"accumulator_type", Int(16)};
    // Takes an 8 bit image; one channel.
    ImageParam input(type_of<uint8_t>(), 2);
    ImageParam mask(type_of<int8_t>(), 2);

    // Outputs an 8 bit image; one channel.
    Func output;

    input.dim(0).set_min(0);
    input.dim(1).set_min(0);

    output.dim(0).set_min(0);
    output.dim(1).set_min(0);

    bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

    Expr sum = cast(accumulator_type, 0);
    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            sum += cast<int16_t>(bounded_input(x + j, y + i)) * cast<int16_t>(mask(j + 1, i + 1));
        }
    }
    output(x, y) = cast<uint8_t>(clamp(sum >> 4, 0, 255));

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

