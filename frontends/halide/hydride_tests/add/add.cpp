#include "Halide.h"
#include "hannk/common_halide.h"
#include "hannk/constants.h"
#include "hannk/interpreter/elementwise_program.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

class Add : public Generator<Add> {
public:
    // Input buffers and quantization parameters.
    Input<Buffer<uint8_t>> input1_{"input1", 2};

    Input<Buffer<uint8_t>> input2_{"input2", 2};

    Output<Buffer<uint8_t>> output_{"output", 2};

    void generate() {
        Var x("x"), y("y");


        output_(x,y) = input1_(x,y)  + input2_(x,y);

        // Schedule.
        const int vector_size = natural_vector_size<uint8_t>();

        output_
            .compute_root()
            .vectorize(x, vector_size, TailStrategy::Predicate);

    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Add, add)
