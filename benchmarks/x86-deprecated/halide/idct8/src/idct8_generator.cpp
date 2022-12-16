#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../common_params.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

class Idct8 : public Generator<Idct8> {
public:
    Input<Buffer<int16_t>> input_{ "input", 2 };
    Output<Buffer<int16_t>> output_{ "output", 2 };

    void generate() {
        constexpr int shift = 7;
        constexpr int add = 1 << (shift - 1);
        constexpr int line = 8;

        Var x("x"), y("y");

        Expr EO_0("EO_0"), EO_1("EO_1");
        Expr EE_0("EE_0"), EE_1("EE_1");
        Expr E_0("E_0"), E_1("E_1"), E_2("E_2"), E_3("E_3");
        Expr O_0("O_0"), O_1("O_1"), O_2("O_2"), O_3("O_3");

        Func src("src");
        
        // Cast to i32 and only down-cast if needed.
        // In C, because of "usual arithmetic conversions", even if you
        // multiply two i16, they both first get converted to i32, the operation
        // happens in 32-bit, and only if the target is i16, we have a downcast.
        src(x, y) = ConciseCasts::i32(input_(x, y));

        O_0 = g_t8[1][0] * src(x, 1) + g_t8[3][0] * src(x, 3) +
              g_t8[5][0] * src(x, 5) + g_t8[7][0] * src(x, 7);
        O_1 = g_t8[1][1] * src(x, 1) + g_t8[3][1] * src(x, 3) +
              g_t8[5][1] * src(x, 5) + g_t8[7][1] * src(x, 7);
        O_2 = g_t8[1][2] * src(x, 1) + g_t8[3][2] * src(x, 3) +
              g_t8[5][2] * src(x, 5) + g_t8[7][2] * src(x, 7);
        O_3 = g_t8[1][3] * src(x, 1) + g_t8[3][3] * src(x, 3) +
              g_t8[5][3] * src(x, 5) + g_t8[7][3] * src(x, 7);


        EO_0 = g_t8[2][0] * src(x, 2) + g_t8[6][0] * src(x, 6);
        EO_1 = g_t8[2][1] * src(x, 2) + g_t8[6][1] * src(x, 6);
        EE_0 = g_t8[0][0] * src(x, 0) + g_t8[4][0] * src(x, 4);
        EE_1 = g_t8[0][1] * src(x, 0) + g_t8[4][1] * src(x, 4);


        E_0 = EE_0 + EO_0;
        E_3 = EE_0 - EO_0;
        E_1 = EE_1 + EO_1;
        E_2 = EE_1 - EO_1;


        output_(x, y) = select(
          y == 0, ConciseCasts::i16_sat((E_0 + O_0 + add) >> shift),
          y == 1, ConciseCasts::i16_sat((E_1 + O_1 + add) >> shift),
          y == 2, ConciseCasts::i16_sat((E_2 + O_2 + add) >> shift),
          y == 3, ConciseCasts::i16_sat((E_3 + O_3 + add) >> shift),

          y == 4, ConciseCasts::i16_sat((E_3 - O_3 + add) >> shift),
          y == 5, ConciseCasts::i16_sat((E_2 - O_2 + add) >> shift),
          y == 6, ConciseCasts::i16_sat((E_1 - O_1 + add) >> shift),
          ConciseCasts::i16_sat((E_0 - O_0 + add) >> shift)
        );
    }

    void schedule() {
        if (auto_schedule) {
          input_.set_estimates({{0, 8}, {0, 8}});
          output_.set_estimates({{0, 8}, {0, 8}});
        }
    }

private:
  static constexpr int16_t g_t8[8][8] = {
    {65, 65, 65, 65, 65, 65, 65, 65},     {89, 75, 50, 18, -18, -50, -75, -89},
    {83, 36, -36, -83, -83, -36, 36, 83}, {75, -18, -89, -50, 50, 89, 18, -75},
    {65, -65, -65, 65, 65, -65, -65, 65}, {50, -89, 18, 75, -75, -18, 89, -50},
    {36, -83, 83, -36, -36, 83, -83, 36}, {18, -50, 75, -89, 89, -75, 50, -18}
  };
};

HALIDE_REGISTER_GENERATOR(Idct8, idct8)