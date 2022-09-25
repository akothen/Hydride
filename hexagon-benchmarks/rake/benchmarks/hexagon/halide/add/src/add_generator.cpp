#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../hannk/constants.h"
#include "../../hannk/interpreter/elementwise_program.h"
#include "../../common_params.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

class Add : public Generator<Add> {
public:
    // Input buffers and quantization parameters.
    Input<Buffer<uint8_t>> input1_{"input1", 2};
    Input<uint8_t> input1_zero_{"input1_zero"};
    Input<int16_t> input1_multiplier_{"input1_multiplier"};

    Input<Buffer<uint8_t>> input2_{"input2", 2};
    Input<uint8_t> input2_zero_{"input2_zero"};
    Input<int16_t> input2_multiplier_{"input2_multiplier"};

    Input<uint8_t> output_zero_{"output_zero"};
    Input<uint8_t> output_min_{"output_min"};
    Input<uint8_t> output_max_{"output_max"};

    Output<Buffer<uint8_t>> output_{"output", 2};

    void generate() {
        Var x("x"), y("y");

        Expr input1 = (i16(input1_(x, y)) - i16(input1_zero_)) << add_input_shift;
        Expr input2 = (i16(input2_(x, y)) - i16(input2_zero_)) << add_input_shift;

        input1 = widening_mul(input1, input1_multiplier_);
        input2 = widening_mul(input2, input2_multiplier_);
        Expr output = i16_sat(rounding_shift_right(input1 + input2, add_output_shift));

        output = u8_sat(saturating_add(output, output_zero_));
        output_(x, y) = clamp(output, output_min_, output_max_);

        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L161
            // NOTE(Stefanos): You have to look around a bit, e.g., for dims or width
            input1_.set_estimates({{0, stef_width}, {0, stef_height}});
            input1_zero_.set_estimate(0);
            input1_multiplier_.set_estimate(100);

            input2_.set_estimates({{0, stef_width}, {0, stef_height}});
            input2_zero_.set_estimate(0);
            input2_multiplier_.set_estimate(100);

            output_zero_.set_estimate(0);
            output_min_.set_estimate(5);
            output_max_.set_estimate(225);

            output_.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Add, add)