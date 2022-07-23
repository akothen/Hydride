#include <assert.h>
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "../proc_common.h"
#include "HalideBuffer.h"
#include "gaussian5x5.h"

class Gaussian5x5Descriptor : public PipelineDescriptorBase {
    Halide::Runtime::Buffer<uint8_t, 2> u8_in, u8_out;

public:
    Gaussian5x5Descriptor(int W, int H)
        : u8_in(nullptr, W, H),
          u8_out(nullptr, W, H) {
    }

    void init() {
#ifdef HALIDE_RUNTIME_HEXAGON
        u8_in.device_malloc(halide_hexagon_device_interface());
        u8_out.device_malloc(halide_hexagon_device_interface());
#else
        u8_in.allocate();
        u8_out.allocate();
#endif

        u8_in.for_each_value([&](uint8_t &x) {
            x = static_cast<uint8_t>(rand());
        });
        u8_out.fill(0);
    }

    const char *name() {
        return "gaussian5x5";
    };

    bool verify(const int W, const int H) {
        const int16_t coeffs[5] = {1, 4, 6, 4, 1};
        u8_out.copy_to_host();
        u8_out.for_each_element([&](int x, int y) {
            int16_t blur = 0;
            for (int rx = -2; rx < 3; ++rx) {
                int16_t blur_y = 0;
                for (int ry = -2; ry < 3; ++ry) {
                    int16_t val = static_cast<int16_t>(u8_in(clamp(x + rx, 0, W - 1), clamp(y + ry, 0, H - 1)));
                    blur_y += val * coeffs[ry + 2];
                }
                blur += blur_y * coeffs[rx + 2];
            }
            uint8_t blur_val = blur >> 8;
            uint8_t out_xy = u8_out(x, y);
            if (blur_val != out_xy) {
                printf("Gaussian5x5: Mismatch at %d %d : %d != %d\n", x, y, out_xy, blur_val);
                abort();
            }
        });
        return true;
    }

    int run() {
        return gaussian5x5(u8_in, u8_out);
    }
    void finalize() {
        u8_in.device_free();
        u8_out.device_free();
    }
};

int main(void) {
  Gaussian5x5Descriptor p(W, H);
  bench_pipeline(&p);
  return 0;
}