#include "Halide.h"
#include "../../hannk/common_halide.h"

using namespace Halide;
using namespace Halide::BoundaryConditions;
using namespace Halide::ConciseCasts;

namespace hannk {

class DepthwiseConv : public Generator<DepthwiseConv> {
public:
    // If positive, a constant inverse depth multiplier.
    GeneratorParam<int> inv_depth_multiplier_{ "inv_depth_multiplier", -1 };

    // Unsigned 8-bit input tensor, indexed by ci, x, y, b.
    Input<Buffer<uint8_t>> input_{ "input", 4 };
    Input<uint8_t> input_zero_{ "input_zero" };

    // A 3D array of 8-bit filter coefficients indexed by co, x, y.
    Input<Buffer<uint8_t>> filter_{ "filter", 3 };
    Input<uint8_t> filter_zero_{ "filter_zero" };

    // A 1D array of 32-bit biases indexed by co.
    Input<Buffer<int32_t>> bias_{ "bias", 1 };

    // The depth multiplier specifies the ratio between co and ci.
    Input<int> depth_multiplier_{ "depth_multiplier" };

    // The stride specifies how the input [x, y] are sub-subsampled. For every
    // spatial location [x, y] in the output buffer, the input buffer is sampled
    // spatially at [x * stride, y * stride]. The caller should ensure that
    // [x * stride, y * stride] is a valid spatial location in the input buffer.
    // Generally, this means setting the output buffer's [width, height] to be
    // the input buffer's [width, height] / stride.
    Input<int> stride_x_{ "stride_x" };
    Input<int> stride_y_{ "stride_y" };
    Input<int> dilation_x_{ "dilation_x" };
    Input<int> dilation_y_{ "dilation_y" };

    Input<int32_t> output_multiplier_{ "output_multiplier" };
    Input<uint32_t> output_shift_{ "output_shift" };
    Input<uint8_t> output_zero_{ "output_zero" };
    Input<uint8_t> output_min_{ "output_min" };
    Input<uint8_t> output_max_{ "output_max" };

    Output<Buffer<uint8_t>> output_{ "output", 4 };

    void generate() {
        // The algorithm.

        // Some free variables, where x and y represent the spatial dimensions.
        Var x("x"), y("y"), c("c"), b("b");

        // Apply the c multiplier.
        Func resampled_input("resampled_input");
        Expr c_resampled = inv_depth_multiplier_ >= 0 ? c * inv_depth_multiplier_ : c / depth_multiplier_;
        resampled_input(c, x, y, b) = input_(c_resampled, x, y, b);

        Func filter_zeroed("filter_zeroed");
        filter_zeroed(c, x, y) = i16(filter_(c, x, y)) - i16(filter_zero_);

        // Do the convolution in 32-bit.
        filter_.dim(1).set_min(0);
        filter_.dim(2).set_min(0);
        Expr filter_width = filter_.dim(1).extent();
        Expr filter_height = filter_.dim(2).extent();
        RDom r(0, filter_width, 0, filter_height);
        Expr filter_zeroed_rdxy = filter_zeroed(c, r.x, r.y);

        // We want to compute the reduction:
        // convolved(c, x, y, b) = bias_(c)
        // convolved(c, x, y, b) +=
        //    i32(filter_zeroed_rdxy) *
        //    (i32(input_rdxy) - i32(input_zero_))
        //
        // However, this requires subtracting the input zero at every output.
        // We can factor the reduction like so:
        //
        // convolved(c, x, y, b) = bias_(c)
        // convolved(c, x, y, b) +=
        //    i32(filter_zeroed_rdxy) * i32(input_rdxyc) -
        //    i32(filter_zeroed_rdxy) * i32(input_zero_)
        //
        // The latter reduction can be computed once per output channel.
        Func sum_filter("sum_filter");
        sum_filter(c) += i32(filter_zeroed_rdxy);

        Func offset_c("offset_c");
        offset_c(c) = bias_(c) - sum_filter(c) * i32(input_zero_);

        Expr input_rdxy =
            resampled_input(c, x * stride_x_ + r.x * dilation_x_, y * stride_y_ + r.y * dilation_y_, b);
        Func convolved("convolved");
        convolved(c, x, y, b) = offset_c(c);
        convolved(c, x, y, b) += i32(filter_zeroed_rdxy) * i32(input_rdxy);

        // Saturate and narrow the output.
        Expr output = multiply_2x_high(convolved(c, x, y, b), output_multiplier_);
        output = i16_sat(rounding_shift_right(output, output_shift_));
        output = u8_sat(saturating_add(output, output_zero_));
        output_(c, x, y, b) = clamp(output, output_min_, output_max_);
    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from conv_nn
            int custom_width = 128;
            int custom_height = 128;
            input_.set_estimates({{0, 1024}, {0, custom_width/32}, {0, custom_height/32}, {0, 1}});
            input_zero_.set_estimate(3);

            filter_.set_estimates({{0, 4}, {0, 4}, {0, 4}});
            filter_zero_.set_estimate(5);

            bias_.set_estimates({{0, custom_width*custom_height}});
            depth_multiplier_.set_estimate(1);

            stride_x_.set_estimate(1);
            stride_y_.set_estimate(1);
            dilation_x_.set_estimate(1);
            dilation_y_.set_estimate(1);

            output_multiplier_.set_estimate(32767);
            output_shift_.set_estimate(1);
            output_zero_.set_estimate(3);
            output_min_.set_estimate(5);
            output_max_.set_estimate(250);

            output_.set_estimates({{0, 1024}, {0, custom_width/32}, {0, custom_height/32}, {0, 1}});
        }
    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::DepthwiseConv, depthwise_conv)