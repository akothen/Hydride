#include "Halide.h"

using namespace Halide;

class FilterByKey : public Generator<FilterByKey> {
public:
    Input<Buffer<int32_t>> Input{ "Input", 1 };
    Output<Buffer<int32_t>> Output{ "Output", 1 };

    void generate() {
        int32_t key = 56;
        Output(x) = select(key > Input(x), 1, 0);
        // Schedules for BitSIMD 
        Output
            .compute_root()
            .vectorize(x,32)
            ;

    }
private:
    Var x{ "x" }, y{ "y" };
};
HALIDE_REGISTER_GENERATOR(FilterByKey, filter_by_key)
