#include "Halide.h"
#include "hannk/common_halide.h"
#include "hannk/constants.h"
#include "hannk/interpreter/elementwise_program.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

    class Blur : public Generator<Blur> {
        public:
            // Input buffers and quantization parameters.
            Output<Buffer<int16_t>> output_{"output", 2};
            Input<Buffer<int16_t>> input{"input", 2};

            const int vector_size = 512 / 16 ; //natural_vector_size<uint16_t>();

            void generate() {

                Func blur_x("blur_x");
                Var x("x"), y("y"), xi("xi"), yi("yi");
                blur_x(x, y) = (input(x, y) + input(x + 1, y) + input(x + 2, y)) / 6;


                output_(x, y) = (blur_x(x, y) + blur_x(x, y + 1) + blur_x(x, y + 2)) / 3;


                output_
                    .split(y, y, yi, 32)
                    .parallel(y)
                    .vectorize(x, vector_size);
                blur_x
                    .store_at(output_, y)
                    .compute_at(output_, x)
                    .vectorize(x, vector_size);


                // Schedule.

                //blur_x.compute_root()
                 //   .vectorize(x, vector_size, TailStrategy::Predicate);

                // blur_y.compile_jit();

            }
    };

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Blur, box_blur)
