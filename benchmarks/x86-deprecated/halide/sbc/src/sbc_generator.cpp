#include "Halide.h"
#include "../../hannk/common_halide.h"
#include "../../common_params.h"

using namespace Halide;
using namespace Halide::ConciseCasts;

class SBC : public Generator<SBC> {
public:
    Input<Buffer<int16_t>> input_i16{ "input_i16", 1 };
    Input<Buffer<int16_t>> consts_i16{ "consts_i16", 1 };
    Output<Buffer<int32_t>> output_{ "output", 1 };

    void generate() {
        // Cast both to i32 and only down-cast if needed.
        // In C, because of "usual arithmetic conversions", even if you
        // multiply two i16, they both first get converted to i32, the operation
        // happens in 32-bit, and only if the target is i16, we have a downcast.
        Func in("in"), consts("consts");

        Var x("x");

        in(x) = ConciseCasts::i32(input_i16(x));
        consts(x) = ConciseCasts::i32(consts_i16(x));

        Func t1("t1"), t2("t2"), t3("t3");

        //                i    hop
        RDom filter_loop(0, 4, 0, 5);

        t1(x) = cast<int32_t>(1 << (SBC_PROTO_FIXED_SCALE - 1));
        t1(filter_loop.x) += in(2*4*filter_loop.y + 2*filter_loop.x) * 
                              consts(2*4*filter_loop.y + 2*filter_loop.x);
        t1(filter_loop.x) += in(2*4*filter_loop.y + 2*filter_loop.x+1) *
                              consts(2*4*filter_loop.y + 2*filter_loop.x+1);

        RDom i(0, 4);
        // t2 is int16_t in the original
        t2(x) = cast<int16_t>(0);
        t2(i) = ConciseCasts::i16(t1(i) >> SBC_PROTO_FIXED_SCALE);

        RDom cos_loop(0, 4, 0, 4/2);

        // In the original, they re-initialize the t1 to 0, but I don't
        // know what's the correct way to do that in Halide. So, I just
        // use a new Func.
        t3(x) = 0;
        t3(cos_loop.x) += ConciseCasts::i32(t2(cos_loop.y*2 + ((2*cos_loop.x) & 1))) * 
                  consts(10*4 + cos_loop.y*2*4 + 2*cos_loop.x);
        t3(cos_loop.x) += ConciseCasts::i32(t2(cos_loop.y*2 + ((2*cos_loop.x+1) & 1))) *
                  consts(10*4 + cos_loop.y*2*4 + 2*cos_loop.x+1);

        output_(x) = cast<int32_t>(0);
        output_(i) = t3(i) >> (SBC_COS_TABLE_FIXED_SCALE - SCALE_OUT_BITS);
    }

    void schedule() {
      if (auto_schedule) {
        input_i16.set_estimates({{0, 64}});
        consts_i16.set_estimates({{0, 64}});
        output_.set_estimates({{0, 4}});
      }
    }

private:
  static constexpr int SBC_COS_TABLE_FIXED_SCALE = 15;
  static constexpr int SBC_PROTO_FIXED_SCALE = 16;
  static constexpr int SCALE_OUT_BITS = 15;
};

HALIDE_REGISTER_GENERATOR(SBC, sbc)