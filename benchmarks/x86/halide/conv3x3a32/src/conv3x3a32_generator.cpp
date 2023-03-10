#include "Halide.h"
#include "utils.h"

using namespace Halide;

class Conv3x3 : public Generator<Conv3x3> {
public:
    GeneratorParam<Type> accumulator_type{ "accumulator_type", Int(32) };
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Input<Buffer<int8_t>> mask{ "mask", 2 };

    Output<Buffer<uint8_t>> output{ "output", 2 };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);

        Expr sum = cast(accumulator_type, 0);
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                sum += cast<int16_t>(bounded_input(x + j, y + i)) * cast<int16_t>(i+3 * j+3 + 5);
            }
        }
        output(x, y) = cast<uint8_t>(clamp(sum >> 4, 0, 255));

        // Schedule for x86
        output
            .tile(x, y, xi, yi, 32, 16, TailStrategy::RoundUp)
            .vectorize(xi, 32)
            .unroll(yi);
        bounded_input
            .store_in(MemoryType::Stack)
            .compute_at(output, y)
            .align_storage(x, 32)
            .vectorize(x, 32, TailStrategy::RoundUp);

        output.print_loop_nest();
    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, xi{"xi"}, yi{"yi"};
    Func bounded_input{ "input_bounded" };
};

HALIDE_REGISTER_GENERATOR(Conv3x3, conv3x3a32)
