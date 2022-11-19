#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../common_params.h"
#include "../samples/batch_9_0/25/average_pool_batch_0009_sample_0025.schedule.h"

using namespace Halide;
using namespace Halide::BoundaryConditions;
using namespace Halide::ConciseCasts;

namespace hannk {

class AveragePool : public Generator<AveragePool> {
public:
    // Unsigned 8-bit input tensor, indexed by c, x, y, b.
    Input<Buffer<uint8_t>> input_{ "input", 4 };

    // The stride specifies how the input [x, y] are sub-subsampled. For every
    // spatial location [x, y] in the output buffer, the input buffer is sampled
    // spatially at [x * stride, y * stride].
    Input<int> stride_x_{ "stride_x" };
    Input<int> stride_y_{ "stride_y" };
    Input<int> filter_width_{ "filter_width" };
    Input<int> filter_height_{ "filter_height" };

    Input<uint8_t> output_min_{ "output_min" };
    Input<uint8_t> output_max_{ "output_max" };

    Output<Buffer<uint8_t>> output_{ "output", 4 };


    void generate() {
        // The algorithm.
        Var c("c"), x("x"), y("y"), b("b");

        Expr min_x = input_.dim(1).min();
        Expr max_x = input_.dim(1).max();
        Expr min_y = input_.dim(2).min();
        Expr max_y = input_.dim(2).max();

        // This pipeline conceptually requires a zero padding boundary condition.
        // However, zero padding is messy. To avoid this, we'll just use a clamp to
        // avoid out of bounds reads, and then use 'where' on the RDom to avoid
        // including these values in the reduction.
        Func input_bounded("input_bounded");
        input_bounded(c, x, y, b) =
            input_(c, clamp(x, min_x, max_x), clamp(y, min_y, max_y), b);

        RDom r(0, filter_width_, 0, filter_height_);
        Expr x_rx = x * stride_x_ + r.x;
        Expr y_ry = y * stride_y_ + r.y;
        r.where(min_x <= x_rx && x_rx <= max_x && min_y <= y_ry && y_ry <= max_y);

        // Accumulating in 16 bits limits filter_width * filter_height <= 256.
        Func sum("sum");
        sum(c, x, y, b) += u16(input_bounded(c, x_rx, y_ry, b));

        // TODO: We should probably specialize/optimize for the case
        // where filter_count = filter_width * filter_height.
        Expr x_start = max(x * stride_x_, min_x);
        Expr x_end = min(x * stride_x_ + filter_width_, max_x + 1);
        Expr y_start = max(y * stride_y_, min_y);
        Expr y_end = min(y * stride_y_ + filter_height_, max_y + 1);
        Expr filter_count = (x_end - x_start) * (y_end - y_start);
        // We assume here that filter_count is not greater than 256 above.
        // This means that we can compute the result to within 1 bit by using an
        // integer reciprocal of 16 bits. This reciprocal can be computed once for
        // each value of (x, y).
        const int log2_numerator = 16;
        // Compute (2*2^log2_numerator + filter_count) / (2 * filter_count) to avoid
        // error in the rounding term.
        Expr inv_filter_count =
            u16_sat(((2 << log2_numerator) + filter_count) / (2 * filter_count));
        Expr average =
            rounding_mul_shift_right(sum(c, x, y, b), inv_filter_count, log2_numerator);

        output_(c, x, y, b) = clamp(u8_sat(average), output_min_, output_max_);

        Pipeline p(output_);
        apply_schedule_average_pool_batch_0009_sample_0025(p, target);

        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L228
            input_.set_estimates({{0, 1024}, {0, stef_width/32}, {0, stef_height/32}, {0, 1}});
            
            stride_x_.set_estimate(2);
            stride_y_.set_estimate(2);
            filter_width_.set_estimate(8);
            filter_height_.set_estimate(8);

            output_min_.set_estimate(5);
            output_max_.set_estimate(225);

            output_.set_estimates({{0, 1024}, {0, stef_width/32}, {0, stef_height/32}, {0, 1}});
        }

    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::AveragePool, average_pool)
