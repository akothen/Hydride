#include "Halide.h"

using namespace Halide;

class Dilate7x7 : public Generator<Dilate7x7> {
    public:
        // Takes an 8 bit image; one channel.
        Input<Buffer<uint8_t>> input{ "input", 2 };
        // Outputs an 8 bit image; one channel.
        Output<Buffer<uint8_t>> output{ "output", 2 };

    GeneratorParam<bool> use_parallel_sched{ "use_parallel_sched", true };
    GeneratorParam<bool> use_prefetch_sched{ "use_prefetch_sched", true };

        void generate() {
            bounded_input(x, y) = BoundaryConditions::repeat_edge(input)(x, y);
            max_y(x, y) = max(
                              bounded_input(x, y - 3), 
                              bounded_input(x, y - 2), 
                              bounded_input(x, y - 1),
                              bounded_input(x, y),
                              bounded_input(x, y + 1),
                              bounded_input(x, y + 2),
                              bounded_input(x, y + 3)
                            );

            output(x, y) = max(
                              max_y(x - 3, y), 
                              max_y(x - 2, y), 
                              max_y(x - 1, y),
                              max_y(x, y),
                              max_y(x + 1, y),
                              max_y(x + 2, y),
                              max_y(x + 3, y)
                            );
        }

        void schedule() {

        Var xi{ "xi" }, yi{ "yi" };

        input.dim(0).set_min(0);
        input.dim(1).set_min(0);

        output.dim(0).set_min(0);
        output.dim(1).set_min(0);



            // const int vector_size = 64;
            // Expr input_stride = input.dim(1).stride();
            // input.dim(1).set_stride((input_stride / vector_size) * vector_size);

            // Expr output_stride = output.dim(1).stride();
            // output.dim(1).set_stride((output_stride / vector_size) * vector_size);
            // bounded_input
            //     .compute_at(Func(output), y)
            //     .align_storage(x, 64)
            //     .vectorize(x, vector_size, TailStrategy::RoundUp);
            // output
            //     // .hexagon()
            //     .tile(x, y, xi, yi, vector_size, 4)
            //     .vectorize(xi)
            //     .unroll(yi);
            // if (use_prefetch_sched) {
            //     output.prefetch(input, y, 2);
            // }
            // if (use_parallel_sched) {
            //     Var yo;
            //     output.split(y, yo, y, 64).parallel(yo);
            // }
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

        }

    private:
        Var x{ "x" }, y{ "y" },  yi{"yi"}, xi{"xi"}, yii{"yii"}, xii{"xii"}, yiii{"yiii"}, xiii{"xiii"};
        Func max_y{ "max_y" };
        Func bounded_input{ "bounded_input" };
};

HALIDE_REGISTER_GENERATOR(Dilate7x7, dilate7x7)
