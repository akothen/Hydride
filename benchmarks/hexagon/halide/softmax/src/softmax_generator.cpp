#include "Halide.h"
#include "../../hannk/common_halide.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

    class Softmax : public Generator<Softmax> {
        public:
            Input<Buffer<uint8_t>> input_{ "input", 2 };
            // The beta multiplier and shift should have an extra factor of log2(e).
            Input<int16_t> beta_multiplier_{ "beta_multiplier" };
            Input<uint16_t> beta_shift_{ "beta_shift" };

            Input<uint8_t> output_zero_{ "output_zero" };
            Input<int16_t> output_multiplier_{ "output_multiplier" };
            Input<uint16_t> output_shift_{ "output_shift" };
            Output<Buffer<uint8_t>> output_{ "output", 2 };

            void generate() {
                // The algorithm.
                Var x("x"), y("y");

                // On x86, this fixed point approximation is actually much slower
                // than just using floats, but producing identical results on all
                // targets is nice, and this op doesn't appear to be a significant
                // factor in overall performance.

                // Compute 2^input_(x, y) / sum(2^input_(rx, y)) by rewriting it
                // to 2^(input_(x, y) - max_x(y)) / sum(2^(input_(rx, y) - max_x(y)).
                // This makes it easier to compute in fixed point, because we know
                // that 2^x is less than 1.
                Func max_x("max_x");
                RDom rx(input_.dim(0).min(), input_.dim(0).extent());
                max_x(y) = u8(0);
                max_x(y) = max(max_x(y), input_(rx, y));

                Expr diff = (i16(input_(x, y)) - i16(max_x(y))) << 6;
                Expr diff_beta = multiply_2x_high(diff, beta_multiplier_);

                // Since we know that diff_beta is less than 0, we can use the full
                // range of an integer for the fractional part.
                constexpr int32_t q = 15;
                Func exp2_diff("exp2_diff");
                exp2_diff(x, y) = approx_exp2(q, diff_beta, beta_shift_, Int(16));

                // This could overflow if there are more than 2^16 values of x.
                Func sum_exp_row("sum_exp_row");
                sum_exp_row(y) += i32(exp2_diff(rx, y));

                // Below, we compute exp2_diff * inv_sum_exp_row / 2^15, so we need to
                // multiply by 2^(q + 15) to get a result of the correct quantization.
                // This doesn't overflow because we know the sum is greater than or equal
                // to 2^0*2^q, because we subtracted the max from the input.
                Func inv_sum_exp_row("inv_sum_exp_row");
                inv_sum_exp_row(y) = approx_reciprocal(q + 15, sum_exp_row(y), Int(16));

                static_assert(q == 15, "");
                Expr output = multiply_2x_high(exp2_diff(x, y), inv_sum_exp_row(y));
                output = multiply_2x_high(output, output_multiplier_);
                output = rounding_shift_right(output, output_shift_);
                output_(x, y) = u8_sat(saturating_add(output, output_zero_));

                // Schedule.
                const int vector_size = natural_vector_size<uint8_t>();

                output_.vectorize(x, vector_size, TailStrategy::Predicate);

                max_x.compute_at(output_, y)
                    .update()
                    .atomic()
                    .vectorize(rx, vector_size, TailStrategy::GuardWithIf);

                sum_exp_row.compute_at(output_, y)
                    .update()
                    .atomic()
                    .vectorize(rx, vector_size, TailStrategy::GuardWithIf);

                inv_sum_exp_row.compute_at(output_, y);
            }
    };

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Softmax, softmax)
