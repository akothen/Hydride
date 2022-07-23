#include <assert.h>
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "../proc_common.h"
#include "HalideBuffer.h"
#include "dilate3x3.h"

class Dilate3x3Descriptor : public PipelineDescriptorBase {
  Halide::Runtime::Buffer<uint8_t, 2> u8_in, u8_out;

private:
  static uint8_t max3(uint8_t a, uint8_t b, uint8_t c) {
    return std::max(std::max(a, b), c);
  }

public:
  Dilate3x3Descriptor(int W, int H)
      : u8_in(nullptr, W, H), u8_out(nullptr, W, H) {}

  void init() {
#ifdef HALIDE_RUNTIME_HEXAGON
    u8_in.device_malloc(halide_hexagon_device_interface());
    u8_out.device_malloc(halide_hexagon_device_interface());
#else
    u8_in.allocate();
    u8_out.allocate();
#endif

    u8_in.for_each_value([&](uint8_t &x) { x = static_cast<uint8_t>(rand()); });
    u8_out.fill(0);
  }

  const char *name() { return "dilate3x3"; }

  bool verify(const int W, const int H) {
    u8_out.copy_to_host();
    u8_out.for_each_element([&](int x, int y) {
      auto u8_in_bounded = [&](int x_, int y_) {
        return u8_in(clamp(x_, 0, W - 1), clamp(y_, 0, H - 1));
      };

      uint8_t max_y[3];
      max_y[0] = max3(u8_in_bounded(x - 1, y - 1), u8_in_bounded(x - 1, y),
                      u8_in_bounded(x - 1, y + 1));

      max_y[1] = max3(u8_in_bounded(x, y - 1), u8_in_bounded(x, y),
                      u8_in_bounded(x, y + 1));

      max_y[2] = max3(u8_in_bounded(x + 1, y - 1), u8_in_bounded(x + 1, y),
                      u8_in_bounded(x + 1, y + 1));

      uint8_t max_val = max3(max_y[0], max_y[1], max_y[2]);

      uint8_t out_xy = u8_out(x, y);
      if (max_val != out_xy) {
        printf("Dilate3x3: Mismatch at %d %d : %d != %d\n", x, y, out_xy,
               max_val);
        abort();
      }
    });
    return true;
  }

  int run() {
    return dilate3x3(u8_in, u8_out);
  }
  void finalize() {
    u8_in.device_free();
    u8_out.device_free();
  }
};

int main(void) {
  Dilate3x3Descriptor p(W, H);
  bench_pipeline(&p);
  return 0;
}