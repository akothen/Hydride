#include "Halide.h"
#include "../../hannk/common_halide.h"
// #include "../../common_params.h"


using namespace Halide;
using namespace Halide::BoundaryConditions;
using namespace Halide::ConciseCasts;

namespace hannk {

class MaxPool : public Generator<MaxPool> {
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
        Expr min_x = input_.dim(1).min();
        Expr max_x = input_.dim(1).max();
        Expr min_y = input_.dim(2).min();
        Expr max_y = input_.dim(2).max();

        Func input_bounded("input_bounded");
        input_bounded(c, x, y, b) =
            input_(c, clamp(x, min_x, max_x), clamp(y, min_y, max_y), b);

        Func maximum("maximum");
        RDom r(0, filter_width_, 0, filter_height_);
        Expr x_rx = x * stride_x_ + r.x;
        Expr y_ry = y * stride_y_ + r.y;
        // Unlike pools that sum the input, we can use a clamp boundary condition
        // here. However, it still seems faster to include this where clause.
        r.where(min_x <= x_rx && x_rx <= max_x && min_y <= y_ry && y_ry <= max_y);
        maximum(c, x, y, b) = output_min_;
        maximum(c, x, y, b) = max(maximum(c, x, y, b), input_bounded(c, x_rx, y_ry, b));

        output_(c, x, y, b) = min(maximum(c, x, y, b), output_max_);

        // Schedules for x86
        output_
            .compute_root()
            .reorder(c, b, x, y)
            .vectorize(c, 64);

        output_.print_loop_nest();
    }

    void schedule() {}

private:
    Var c{"c"}, x{"x"}, y{"y"}, b{"b"};
    Func sum{"sum"}, input_bounded{"input_bounded"};
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::MaxPool, max_pool)
