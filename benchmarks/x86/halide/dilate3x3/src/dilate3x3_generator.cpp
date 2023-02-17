#include "Halide.h"
#include "../../common_params.h"

using namespace Halide;

class Dilate3x3 : public Generator<Dilate3x3> {
private:
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"}, yii{"yii"}, xii{"xii"};
    Func max_y{ "max_y" }, bounded_input{ "bounded_input" };
    
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        max_y(x, y) = max(bounded_input(x, y - 1), bounded_input(x, y), bounded_input(x, y + 1));
        output(x, y) = max(max_y(x - 1, y), max_y(x, y), max_y(x + 1, y));
        
        output
            .compute_root()
            .split(y, y, yi, 36, TailStrategy::ShiftInwards)
            .split(x, x, xi, 32, TailStrategy::RoundUp)
            .vectorize(xi, 32);
            //.parallel(y);
        max_y
            .store_in(MemoryType::Stack)
            .compute_at(output, yi)
            .split(x, x, xi, 128, TailStrategy::RoundUp)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);
        bounded_input
            .store_in(MemoryType::Stack)
            .store_at(output, y)
            .compute_at(output, yi)
            .split(x, x, xi, 64, TailStrategy::RoundUp)
            .split(xi, xi, xii, 32, TailStrategy::RoundUp)
            .vectorize(xii, 32);

        output.print_loop_nest();
    }

    void schedule() {}
};

HALIDE_REGISTER_GENERATOR(Dilate3x3, dilate3x3)
