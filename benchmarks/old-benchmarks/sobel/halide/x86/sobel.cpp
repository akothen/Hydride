#include "Halide.h"
#include "halide_benchmark.h"

using namespace Halide;
using namespace Halide::Tools;

int main() {
    ImageParam input(type_of<uint16_t>(), 2);
    Func output;
    //Input<Buffer<uint8_t>> input{"input", 2};
    //Output<Buffer<uint8_t>> output{"output", 2};
    
    Var x{"x"}, y{"y"};
    Func sobel_x_avg{"sobel_x_avg"}, sobel_y_avg{"sobel_y_avg"};
    Func sobel_x{"sobel_x"}, sobel_y{"sobel_y"};
    Func bounded_input{"bounded_input"};

   Var xi{ "xi" }, yi{ "yi" };
   input.dim(0).set_min(0);
   input.dim(1).set_min(0);
   bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
   Func input_16{"input_16"};
   input_16(x, y) = cast<uint16_t>(bounded_input(x, y));

   sobel_x_avg(x, y) = input_16(x - 1, y) + 2 * input_16(x, y) + input_16(x + 1, y);
   sobel_x(x, y) = absd(sobel_x_avg(x, y - 1), sobel_x_avg(x, y + 1));

   sobel_y_avg(x, y) = input_16(x, y - 1) + 2 * input_16(x, y) + input_16(x, y + 1);
   sobel_y(x, y) = absd(sobel_y_avg(x - 1, y), sobel_y_avg(x + 1, y));

   // This sobel implementation is non-standard in that it doesn't take the square root
   // of the gradient.
   output(x, y) = cast<uint8_t>(clamp(sobel_x(x, y) + sobel_y(x, y), 0, 255));

   printf("SCHEDUING OUTPUT\n");
   const int vector_size = 512;//natural_vector_size<uint8_t>();
   output
       .tile(x, y, xi, yi, vector_size, 4, TailStrategy::RoundUp)
       .vectorize(xi, vector_size)
       .unroll(yi)
       .parallel(yi, 16);

   printf("OUTPUT SCHDULED\n");
   output.compile_jit();
  printf("KERNEL COMPILED\n");
  Target t("host-no_asserts-no_runtime-no_bounds_query");
  output.compile_to_assembly("/home/akashk4/598/Halide/build/test/performance/sobel.s", output.infer_arguments(), t);
  printf("ASSEMBLY GENERATED\n");
  output.compile_to_bitcode("/home/akashk4/598/Halide/build/test/performance/sobel.bc", output.infer_arguments(), t);
  printf("BITCODE GENERATED\n");
  return 0;

}
