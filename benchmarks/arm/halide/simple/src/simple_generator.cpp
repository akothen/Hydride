#include "Halide.h"
#include "../../hannk/common_halide.h"

using namespace Halide;
using namespace Halide::BoundaryConditions;
using namespace Halide::ConciseCasts;

namespace hannk {

class Simple : public Generator<Simple> {
public:
    // Unsigned 8-bit input tensor, indexed by c, x, y, b.
    Input<Buffer<uint8_t>> input_1{ "input_1", 2 };
    Input<Buffer<uint8_t>> input_2{ "input_2", 2 };

    // The stride specifies how the input [x, y] are sub-subsampled. For every
    // spatial location [x, y] in the output buffer, the input buffer is sampled
    // spatially at [x * stride, y * stride].
    Input<int> stride_x_{ "stride_x" };
    Input<int> stride_y_{ "stride_y" };
    Input<int> filter_width_{ "filter_width" };
    Input<int> filter_height_{ "filter_height" };

    Input<uint8_t> output_min_{ "output_min" };
    Input<uint8_t> output_max_{ "output_max" };

    Output<Buffer<uint8_t>> output_{ "output", 2};

    void generate() {
        // The algorithm.
        Var c("c"), x("x"), y("y"), b("b");
        int vector_size = natural_vector_size<uint8_t>();

        output_(x,y) = input_1(x,y) >> input_2(x,y);
        output_.vectorize(x,  vector_size);

    }
};

}  // namespace hannk

HALIDE_REGISTER_GENERATOR(hannk::Simple, simple)
