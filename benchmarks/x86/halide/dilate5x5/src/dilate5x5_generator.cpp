#include "Halide.h"
// #include "../../common_params.h"


using namespace Halide;

class Dilate5x5 : public Generator<Dilate5x5> {
public:
    Input<Buffer<uint8_t>> input{ "input", 2 };
    Output<Buffer<uint8_t>> output{ "output", 2 };

    void generate() {
        bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
        max_y(x, y) = max(bounded_input(x, y - 2), 
                            bounded_input(x, y - 1),
                            bounded_input(x, y),
                            bounded_input(x, y + 1),
                            bounded_input(x, y + 2)
                        );

        output(x, y) = max(bounded_input(x - 2, y), 
                            bounded_input(x - 1, y),
                            bounded_input(x, y),
                            bounded_input(x + 1, y),
                            bounded_input(x + 2, y)
                        );

        // Schedules for x86
        output
            .compute_root()
            .split(y, y, yi, 120, TailStrategy::ShiftInwards)
            .split(yi, yi, yii, 30, TailStrategy::ShiftInwards)
            .split(x, x, xi, 128, TailStrategy::ShiftInwards)
            .split(xi, xi, xii, 64, TailStrategy::RoundUp)
            .vectorize(xii, 64);
            //.parallel(y);
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
    Var x{ "x" }, y{ "y" }, yi{"yi"}, xi{"xi"}, yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
    Func max_y{ "max_y" }, bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Dilate5x5, dilate5x5)
