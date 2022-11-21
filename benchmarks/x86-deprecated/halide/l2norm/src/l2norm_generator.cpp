#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../common_params.h"
#include "../samples/batch_3_0/31/l2norm_batch_0003_sample_0031.schedule.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

namespace hannk {

class L2Normalization : public Generator<L2Normalization> {
public:
    Input<Buffer<uint8_t>> input_{ "input", 2 };
    Input<uint8_t> input_zero_{ "input_zero" };

    Output<Buffer<uint8_t>> output_{ "output", 2 };

    void generate() {
        Var x("x"), y("y");

        // We don't need the input scale, because the result of L2
        // normalization doesn't depend on it.
        Func input_zeroed("input_zeroed");
        input_zeroed(x, y) = i16(input_(x, y)) - i16(input_zero_);

        Func sum_input_sq("sum_input_sq");
        RDom rx(input_.dim(0).min(), input_.dim(0).extent());
        sum_input_sq(y) = i32(0);
        sum_input_sq(y) += pow(i32(input_zeroed(rx, y)), 2);

        Func inv_sqrt("inv_sqrt");
        const int q = 15;
        inv_sqrt(y) = approx_reciprocal_sqrt(q, sum_input_sq(y));

        // The output has a scale of 2^7 = 128 and offset of 128.
        Expr output = i32(input_zeroed(x, y)) * i32(inv_sqrt(y));
        output = i16_sat(rounding_shift_right(output, q - 7));
        output_(x, y) = u8_sat(saturating_add(output, i16(128)));
        Pipeline p(output_);
        apply_schedule_l2norm_batch_0003_sample_0031(p, target);
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L282
            input_.set_estimates({{0, stef_width}, {0, stef_height}});
            input_zero_.set_estimate(0);
            output_.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::L2Normalization, l2norm)
