#include "Halide.h"
#include "hannk/common_halide.h"
#include "hannk/constants.h"
#include "hannk/interpreter/elementwise_program.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

    class Sobel : public Generator<Sobel> {
        public:
            // Input buffers and quantization parameters.
            Output<Buffer<uint16_t>> output_{"output", 2};
            Input<Buffer<uint16_t>> input{"input", 2};

            

            const int vector_size = 512 / 16;//natural_vector_size<int8_t>();

            void generate() {
                Var x("x"), y("y"), xi("xi"), yi("yi");
                Func in16("in16"), x_avg("x_avg"), y_avg("y_avg"), sobel_x("sobel_x"), sobel_y("sobel_y");

                in16(x,y) = (input(x,y));

                x_avg(x,y) = in16(x-1, y) + ( 2 * in16(x,y) ) + in16(x+1, y);
                sobel_x(x,y) = absd(x_avg(x, y-1), x_avg(x, y+1));


                y_avg(x,y) = in16(x, y-1) + ( 1 * in16(x,y) ) + in16(x, y+1);
                sobel_y(x,y) = absd(y_avg(x-1, y), x_avg(x+1, y));



                output_(x,y) = (clamp(sobel_x(x,y) + sobel_y(x,y), 0, 255));

                output_
                    .split(y, y, yi, 32)
                    .parallel(y)
                    .vectorize(x, vector_size);
                




            }
    };

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Sobel, sobel)
