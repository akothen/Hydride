#include "Halide.h"
#include "hannk/common_halide.h"
#include "hannk/constants.h"
#include "hannk/interpreter/elementwise_program.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

class Complex : public Generator<Complex> {
public:
    // Input buffers and quantization parameters.
    Input<Buffer<uint16_t>> input1_{"input1", 2};
    Input<Buffer<uint16_t>> input2_{"input2", 2};
    Input<Buffer<uint16_t>> input3_{"input3", 2};
    Input<Buffer<uint16_t>> input4_{"input4", 2};



    Output<Buffer<uint16_t>> output_{"output", 2};

    void generate() {
        Var x("x"), y("y");


        output_(x,y) = cast<uint16_t>((cast<uint32_t>(input1_(x,y)) + cast<uint32_t>(input1_(x,y))   ) * (cast<uint32_t>(input2_(x,y)) + cast<uint32_t>(input3_(x,y)) ));

        // Schedule.
        const int vector_size = 512 / 16 ; //natural_vector_size<uint16_t>();

        output_
            .compute_root()
            .vectorize(x, vector_size, TailStrategy::Predicate);

    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Complex, complex)
