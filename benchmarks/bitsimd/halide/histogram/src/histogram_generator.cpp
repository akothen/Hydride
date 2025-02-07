#include "Halide.h"

using namespace Halide;

// To understanding rfactor scheduling directive for factoring reductions, 
// please see https://halide-lang.org/tutorials/tutorial_lesson_18_parallel_associative_reductions.html

class Histogram : public Generator<Histogram> {
public:
    GeneratorParam<int> matrix_size_x{"size_x", 1024};
    GeneratorParam<int> matrix_size_y{"size_y", 256};
    Input<Buffer<int32_t>> IMG{ "IMG", 3 };
    Output<Buffer<int32_t>> BINS{ "BINS", 2 };


    void generate() {
        RDom k(0, matrix_size_x, 0, matrix_size_y);
        const int32_t vectorization_factor = 1024;

        // Histogram Algorithm
        Func color_hist("color_hist");
        color_hist(i,c) = 0;
        //color_hist(IMG(k.x, k.y, c),c) += 1;
        color_hist(clamp(IMG(k.x, k.y, c), 0, 255), c) += 1;

        // Histogram Schedule
        Func intermediate_color = color_hist.update().rfactor({{k.x, u}});
        intermediate_color.compute_root().update().vectorize(u, vectorization_factor);
        intermediate_color
            .vectorize(i, vectorization_factor)
            ;
        color_hist
             .vectorize(i, vectorization_factor)
            ;


        // Final definition of output bins
        BINS(x, c) = color_hist(x,c);
        


    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, i{ "i" }, u { "u" }, v { "v" }, c {"c"};
};

HALIDE_REGISTER_GENERATOR(Histogram, histogram)
