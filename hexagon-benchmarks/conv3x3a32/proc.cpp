#include <assert.h>
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "../proc_common.h"
#include "HalideBuffer.h"
#include "conv3x3a32.h"

class Conv3x3a32Descriptor : public PipelineDescriptorBase {
  Halide::Runtime::Buffer<uint8_t, 2> u8_in, u8_out;
  Halide::Runtime::Buffer<int8_t, 2> i8_mask;

public:
  Conv3x3a32Descriptor(int W, int H)
      : u8_in(nullptr, W, H), u8_out(nullptr, W, H), i8_mask(nullptr, 3, 3) {}

  void init() {
#ifdef HALIDE_RUNTIME_HEXAGON
    u8_in.device_malloc(halide_hexagon_device_interface());
    u8_out.device_malloc(halide_hexagon_device_interface());
    i8_mask.device_malloc(halide_hexagon_device_interface());
#else
    u8_in.allocate();
    u8_out.allocate();
    i8_mask.allocate();
#endif

    u8_in.for_each_value([&](uint8_t &x) { x = static_cast<uint8_t>(rand()); });
    u8_out.fill(0);

    i8_mask(0, 0) = 1;
    i8_mask(1, 0) = -4;
    i8_mask(2, 0) = 7;

    i8_mask(0, 1) = 2;
    i8_mask(1, 1) = -5;
    i8_mask(2, 1) = 8;

    i8_mask(0, 2) = 3;
    i8_mask(1, 2) = -6;
    i8_mask(2, 2) = 9;
  }

  const char *name() { return "conv3x3a16"; }

  bool verify(const int W, const int H) {
    u8_out.copy_to_host();
    u8_out.for_each_element([&](int x, int y) {
      int16_t sum = 0;
      for (int ry = -1; ry <= 1; ry++) {
        for (int rx = -1; rx <= 1; rx++) {
          sum += static_cast<int16_t>(
                     u8_in(clamp(x + rx, 0, W - 1), clamp(y + ry, 0, H - 1))) *
                 static_cast<int16_t>(i8_mask(rx + 1, ry + 1));
        }
      }
      sum = sum >> 4;
      sum = clamp<int16_t>(sum, 0, 255);
      uint8_t out_xy = u8_out(x, y);
      if (sum != out_xy) {
        printf("Conv3x3a16: Mismatch at %d %d : %d != %d\n", x, y, out_xy, sum);
        abort();
      }
    });
    return true;
  }

  int run() {
    return conv3x3a32(u8_in, i8_mask, u8_out);
  }
  void finalize() {
    u8_in.device_free();
    i8_mask.device_free();
    u8_out.device_free();
  }
};

int main(void) {
  Conv3x3a32Descriptor p(W, H);
  bench_pipeline(&p);
  return 0;
}