#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../common_params.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

class Idct4 : public Generator<Idct4> {
public:
    Input<Buffer<int16_t>> input_{ "input", 2 };
    Output<Buffer<int16_t>> output_{ "output", 2 };

    void generate() {
        constexpr int shift = 7;
        constexpr int add = 1 << (shift - 1);

        Var x("x"), y("y");

        Expr O_0("O_0"), O_1("O_1");
        Expr E_0("E_0"), E_1("E_1");
        Func src("src");

        // Cast to i32 and only down-cast if needed.
        // In C, because of "usual arithmetic conversions", even if you
        // multiply two i16, they both first get converted to i32, the operation
        // happens in 32-bit, and only if the target is i16, we have a downcast.
        src(x, y) = ConciseCasts::i32(input_(x, y));

        O_0 = g_t4[1][0] * src(x, 1) + g_t4[3][0] * src(x, 3);
        O_1 = g_t4[1][1] * src(x, 1) + g_t4[3][1] * src(x, 3);

        E_0 = g_t4[0][0] * src(x, 0) + g_t4[2][0] * src(x, 2);
        E_1 = g_t4[0][1] * src(x, 0) + g_t4[2][1] * src(x, 2);

        output_(x, y) = select(
          y == 0, ConciseCasts::i16_sat((E_0 + O_0 + add) >> shift),
          y == 1, ConciseCasts::i16_sat((E_1 + O_1 + add) >> shift),
          y == 2, ConciseCasts::i16_sat((E_1 - O_1 + add) >> shift),
          ConciseCasts::i16_sat((E_0 - O_0 + add) >> shift)
        );
    }

    void schedule() {
        if (auto_schedule) {
          input_.set_estimates({{0, 4}, {0, 4}});
          output_.set_estimates({{0, 4}, {0, 4}});
        }
    }

private:
  static constexpr int16_t g_t4[4][4] = {{65, 65, 65, 65},
                                        {83, 36, -36, -83},
                                        {65, -65, -65, 65},
                                        {36, -83, 83, -36}};
};

HALIDE_REGISTER_GENERATOR(Idct4, idct4)