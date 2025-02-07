#include "Halide.h"

using namespace Halide;


class Convolution : public Generator<Convolution> {
public:
    GeneratorParam<int> stride_x{"stride_x", 1};
    GeneratorParam<int> stride_y{"stride_y", 1};
    Input<Buffer<int32_t>> IMG{ "IMG", 3 };
    Input<Buffer<int32_t>> Filter{ "Filter", 3 };
    Output<Buffer<int32_t>> Output{ "Output", 3 };


    void generate() {

        auto filter_x = Filter.dim(0).extent();
        auto filter_y = Filter.dim(1).extent();
        auto filter_z = Filter.dim(2).extent();
        auto image_z = IMG.dim(2).extent();

        RDom r(0, filter_x, 0, filter_y, 0, image_z);

        // Built-in Halide helper function for defining boundary conditions
        Func bounded_input = BoundaryConditions::repeat_edge(IMG);
        Output(x,y,c_out) = 0; 
        Output(x, y, c_out) += Filter(r.x , r.y, c_out)  *  bounded_input(
                                                                        x - r.x + filter_x / 2, 
                                                                        y - r.y + filter_y / 2, 
                                                                        r.z)   ;

        auto vector_size = 16384;




        // Schedule
        Output
            .update()
            .fuse(x, y, x)
            .fuse(x, c_out, x)
            .vectorize(x, vector_size)
            ;



    }

    void schedule() {}

private:
    Var x{ "x" }, y{ "y" }, i{ "i" }, u { "u" }, v { "v" }, c_out {"c_out"}, c_in {"c_in"};
};

HALIDE_REGISTER_GENERATOR(Convolution, convolution)
