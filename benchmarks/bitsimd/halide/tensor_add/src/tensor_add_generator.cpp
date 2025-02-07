#include "Halide.h"

using namespace Halide;

class TensorAdd : public Generator<TensorAdd> {
public:
    Input<Buffer<int32_t>> A{ "A", 2 };
    Input<Buffer<int32_t>> B{ "B", 2 };
    Output<Buffer<int32_t>> output{ "output", 2 };

    void generate() {
        output(x, y) = A(x,y) + B(x,y);
        // Schedules for BitSIMD 
        output
            .compute_root()
            .reorder({y,x})
            .vectorize(x,1024)
            ;

    }
private:
    Var x{ "x" }, y{ "y" };
};
HALIDE_REGISTER_GENERATOR(TensorAdd, tensor_add)
