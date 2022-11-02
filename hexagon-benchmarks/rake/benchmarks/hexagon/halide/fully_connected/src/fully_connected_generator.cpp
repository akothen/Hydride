#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../common_params.h"

using namespace Halide;
using namespace Halide::BoundaryConditions;
using namespace Halide::ConciseCasts;

namespace hannk {

// There are two codepaths in this generator. On targets with widening
// 8-bit multiplies, we implement the reduction by expanding the subtraction
// of the offsets into 4 reductions involving 8-bit multiplies. On targets
// without widening 8-bit multiplication, it's faster to just subtract the
// offsets and use 16-bit multiplications.
bool use_8bit_multiply(const Target& target) {
    return target.arch != Target::X86 || target.has_feature(Target::AVX512_SapphireRapids);
}

class FullyConnected : public Generator<FullyConnected> {
public:
    Input<Buffer<uint8_t>> input_{ "input", 2 };
    Input<uint8_t> input_zero_{ "input_zero" };

    Input<Buffer<uint8_t>> filter_{ "filter", 2 };
    Input<uint8_t> filter_zero_{ "filter_zero" };

    Input<Buffer<int32_t>> bias_{ "bias", 1 };

    Input<uint8_t> output_zero_{ "output_zero" };
    Input<int32_t> output_multiplier_{ "output_multiplier" };
    // TODO: We only need this to be a signed shift for exactly one known network.
    // Figure out if there is something else we should be doing instead.
    Input<int32_t> output_shift_{ "output_shift" };
    Input<uint8_t> output_min_{ "output_min" };
    Input<uint8_t> output_max_{ "output_max" };

    // https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/Makefile#L72
    Output<Buffer<uint8_t>> output_{ "output", 2 };

    void generate() {
        Var c("c"), b("b");

        // We require the reduction dimension to be aligned to a uint8 vector.
        Expr filter_extent = align(filter_.dim(0).extent(), natural_vector_size<uint8_t>());
        filter_.dim(0).set_min(0);
        RDom rc(0, filter_extent);

        Func read_input("read_input");

        read_input = Halide::BoundaryConditions::repeat_edge(filter_,
                {{filter_.dim(0).min(), filter_.dim(0).extent()},
                {filter_.dim(1).min(), filter_.dim(1).extent()}}
                );

        Func read_filter("read_filter");

        read_filter = Halide::BoundaryConditions::repeat_edge(input_,
                {{input_.dim(0).min(), input_.dim(0).extent()},
                {input_.dim(1).min(), input_.dim(1).extent()}}
                );

        Func sum_input("sum_input");
        Func sum_filter("sum_filter");
        Func multiplied("multiplied");
        if (use_8bit_multiply(target)) {
            // We want to compute the reduction:
            // multiplied(c, b) = bias_(c)
            // multiplied(c, b) +=
            //    (i32(input) - i32(input_zero_)) *
            //    (i32(filter) - i32(filter_zero_))
            //
            // However, this precludes using efficient dot product instructions. To
            // fix this, expand the expression:
            //
            // multiplied(c, b) = bias_(c)
            // multiplied(c, b) +=
            //    i32(filter(rc, c)) * i32(input(rc, b)) -
            //    i32(filter(rc, c)) * i32(input_zero_) -
            //    i32(filter_zero_) * i32(input(rc, b)) +
            //    i32(filter_zero_) * i32(input_zero_)
            //
            // We can then separate this into several reductions. The last reduction
            // is a constant, and the middle two reductions can be computed once for
            // each c or b, instead of each (c, b).
            sum_input(b) += u32(read_input(rc, b));
            sum_filter(c) += u32(read_filter(rc, c));

            multiplied(c, b) =
                bias_(c) + filter_extent * filter_zero_ * input_zero_ -
                i32(sum_input(b)) * filter_zero_;

            multiplied(c, b) += i32(u16(read_filter(rc, c)) * u16(read_input(rc, b)));

            // TODO: This subtract happens after the total vector reductions from the
            // above reduction. It would be a lot better if we could do this subtract
            // first somehow.
            multiplied(c, b) = multiplied(c, b) - i32(sum_filter(c)) * i32(input_zero_);
        }
        else {
            multiplied(c, b) = bias_(c);
            multiplied(c, b) +=
                i32(i16(read_filter(rc, c)) - i16(filter_zero_)) *
                i32(i16(read_input(rc, b)) - i16(input_zero_));
        }

        // Saturate and narrow the output.
        Expr output = multiply_2x_high(multiplied(c, b), output_multiplier_);
        output = i16_sat(rounding_shift_right(output, output_shift_));
        if (output_.type() == halide_type_of<uint8_t>()) {
            output = u8_sat(saturating_add(output, output_zero_));
            output = clamp(output, output_min_, output_max_);
        }
        output_(c, b) = output;
        Pipeline p(output_);

    }

    void schedule() {
        if (auto_schedule) {
            // Estimates taken from here: https://github.com/uwplse/rake/blob/hvx-artifact/benchmarks/hexagon/halide/test/run.cpp#L352
            input_.set_estimates({{0, stef_width}, {0, stef_height}});
            input_zero_.set_estimate(3);

            filter_.set_estimates({{0, stef_width}, {0, stef_height}});
            filter_zero_.set_estimate(5);

            bias_.set_estimates({{0, stef_width*stef_height}});

            output_zero_.set_estimate(7);
            output_multiplier_.set_estimate(32767);
            output_shift_.set_estimate(1);
            output_min_.set_estimate(5);
            output_max_.set_estimate(250);

            output_.set_estimates({{0, stef_width}, {0, stef_height}});
        }
    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::FullyConnected, fully_connected)
