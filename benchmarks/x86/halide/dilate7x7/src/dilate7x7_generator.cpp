#include "Halide.h"
// #include "../../common_params.h"

using namespace Halide;

class Dilate7x7 : public Generator<Dilate7x7> {
    public:
        // Takes an 8 bit image; one channel.
        Input<Buffer<uint8_t>> input{ "input", 2 };
        // Outputs an 8 bit image; one channel.
        Output<Buffer<uint8_t>> output{ "output", 2 };

        void generate() {
            bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
            max_y(x, y) = max(bounded_input(x, y - 3),
                              bounded_input(x, y - 2),
                              bounded_input(x, y - 1),
                              bounded_input(x, y),
                              bounded_input(x, y + 1),
                              bounded_input(x, y + 2),
                              bounded_input(x, y + 3)
                            );

            output(x, y) = max(bounded_input(x - 3, y),
                              bounded_input(x - 2, y),
                              bounded_input(x - 1, y),
                              bounded_input(x, y),
                              bounded_input(x + 1, y),
                              bounded_input(x + 2, y),
                              bounded_input(x + 3, y)
                            );

            // Schedules for x86
            output
                .compute_root()
                .split(y, y, yi, 180, TailStrategy::ShiftInwards)
                .split(yi, yi, yii, 30, TailStrategy::ShiftInwards)
                .split(x, x, xi, 384, TailStrategy::ShiftInwards)
                .split(xi, xi, xii, 128, TailStrategy::RoundUp)
                .vectorize(xii, 64);
            max_y
                .store_in(MemoryType::Stack)
                .compute_at(output, yi)
                .split(x, x, xi, 64, TailStrategy::RoundUp)
                .vectorize(xi, 64);
            bounded_input
                .store_in(MemoryType::Stack)
                .store_at(output, y)
                .compute_at(output, yi)
                .split(x, x, xi, 64, TailStrategy::RoundUp)
                .vectorize(xi, 64);
            
            output.print_loop_nest();  
        }

        void schedule() {}

    private:
        Var x{ "x" }, y{ "y" },  yi{"yi"}, xi{"xi"}, yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
        Func max_y{ "max_y" }, bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Dilate7x7, dilate7x7)
