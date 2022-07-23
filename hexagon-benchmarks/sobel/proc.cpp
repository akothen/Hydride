#include "../proc_common.h"
#include "HalideBuffer.h"
#include "sobel.h"

class SobelDescriptor : public PipelineDescriptorBase {
  Halide::Runtime::Buffer<uint8_t, 2> u8_in, u8_out;

public:
  SobelDescriptor(int W, int H) : u8_in(nullptr, W, H), u8_out(nullptr, W, H) {}

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

  const char *name() { return "sobel"; };

  uint16_t sobel3(uint16_t a, uint16_t b, uint16_t c) {
    return (a + 2 * b + c);
  }

  bool verify(const int W, const int H) {
    u8_out.copy_to_host();
    u8_out.for_each_element([&](int x, int y) {
      auto u16_in_bounded = [&](int x_, int y_) {
        return static_cast<uint16_t>(
            u8_in(clamp(x_, 0, W - 1), clamp(y_, 0, H - 1)));
      };

      uint16_t sobel_x_avg0 =
          sobel3(u16_in_bounded(x - 1, y - 1), u16_in_bounded(x, y - 1),
                 u16_in_bounded(x + 1, y - 1));
      uint16_t sobel_x_avg1 =
          sobel3(u16_in_bounded(x - 1, y + 1), u16_in_bounded(x, y + 1),
                 u16_in_bounded(x + 1, y + 1));
      uint16_t sobel_x = abs(sobel_x_avg0 - sobel_x_avg1);

      uint16_t sobel_y_avg0 =
          sobel3(u16_in_bounded(x - 1, y - 1), u16_in_bounded(x - 1, y),
                 u16_in_bounded(x - 1, y + 1));
      uint16_t sobel_y_avg1 =
          sobel3(u16_in_bounded(x + 1, y - 1), u16_in_bounded(x + 1, y),
                 u16_in_bounded(x + 1, y + 1));
      uint16_t sobel_y = abs(sobel_y_avg0 - sobel_y_avg1);

      uint8_t sobel_val =
          static_cast<uint8_t>(clamp(sobel_x + sobel_y, 0, 255));

      uint8_t out_xy = u8_out(x, y);
      if (sobel_val != out_xy) {
        printf("Sobel: Mismatch at %d %d : %d != %d\n", x, y, out_xy,
               sobel_val);
        abort();
      }
    });
    return true;
  }

  int run() { return sobel(u8_in, u8_out); }
  void finalize() {
    u8_in.device_free();
    u8_out.device_free();
  }
};

int main(void) {
  SobelDescriptor p(W, H);
  bench_pipeline(&p);
  return 0;
}