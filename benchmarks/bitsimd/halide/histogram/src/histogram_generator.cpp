#include "Halide.h"

using namespace Halide;

// To understanding rfactor scheduling directive for factoring reductions, 
// please see https://halide-lang.org/tutorials/tutorial_lesson_18_parallel_associative_reductions.html

class Histogram : public Generator<Histogram> {
public:
    GeneratorParam<int> matrix_size{"size", 1024};
    Input<Buffer<int32_t>> IMG{ "IMG", 3 };
    Output<Buffer<int32_t>> REDBIN{ "REDBIN", 1 };


    void generate() {
        RDom k(0, matrix_size, 0, matrix_size);
        const int32_t vectorization_factor = 32;

        Func red_hist("red_hist");
        red_hist(i) = 0;
        red_hist(clamp(IMG(k.x, k.y, 0), 0, 255)) += 1;
        Func intermediate_red = red_hist.update().rfactor({{k.x, u}});
        intermediate_red.compute_root().update().vectorize(u, vectorization_factor);
        intermediate_red
            .vectorize(i, vectorization_factor)
            ;
        red_hist
             .vectorize(i, vectorization_factor)
            ;
        REDBIN(x) = red_hist(x);
        
        // TODO: Extend REDBIN to be a tensor for all channels


    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, i{ "i" }, u { "u" }, v { "v" };
};

HALIDE_REGISTER_GENERATOR(Histogram, histogram)
