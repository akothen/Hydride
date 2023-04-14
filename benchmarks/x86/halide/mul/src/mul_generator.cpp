#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../hannk/constants.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

class Mul : public Generator<Mul> {
public:
    Input<Buffer<uint8_t>> input1_{ "input1", 2 };
    Input<uint8_t> input1_zero_{ "input1_zero" };

    Input<Buffer<uint8_t>> input2_{ "input2", 2 };
    Input<uint8_t> input2_zero_{ "input2_zero" };

    Input<uint8_t> output_zero_{ "output_zero" };
    Input<int32_t> output_multiplier_{ "output_multiplier" };
    Input<uint32_t> output_shift_{ "output_shift" };
    Input<uint8_t> output_min_{ "output_min" };
    Input<uint8_t> output_max_{ "output_max" };

    Output<Buffer<uint8_t>> output_{ "output", 2 };

    void generate() {
        Expr input1 = (i16(input1_(x, y)) - i16(input1_zero_)) << mul_input_shift;
        Expr input2 = (i16(input2_(x, y)) - i16(input2_zero_)) << mul_input_shift;

        Expr output = multiply_2x_high(i32(input1) * i32(input2), output_multiplier_);
        output = i16_sat(rounding_shift_right(output, min(15, output_shift_)));
        output = u8_sat(saturating_add(output, output_zero_));
        output_(x, y) = clamp(output, output_min_, output_max_);

        // Schedules for x86
        output_
            .compute_root()
            .vectorize(x, 64);

        output_.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" };
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Mul, mul)
