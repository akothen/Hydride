#include <immintrin.h>
#include <stdio.h>
#include <stdint.h>


void hex_out(const uint8_t * buf, ssize_t sz) {
    for (ssize_t i = sz - 1; i >= 0; --i) {
        printf("%02x", buf[i]);
    }
    printf("\n");
}


int main() {
__mmask8 k = _cvtu32_mask8(0x00);
__m512i a = _mm512_set_epi64((__int64_t)0x403f3e3d3c3b3a39,(__int64_t)0x3837363534333231,(__int64_t)0x302f2e2d2c2b2a29,(__int64_t)0x2827262524232221,(__int64_t)0x201f1e1d1c1b1a19,(__int64_t)0x1817161514131211,(__int64_t)0x100f0e0d0c0b0a09,(__int64_t)0x0807060504030201);
  __m128i ret = _mm512_maskz_cvtepi64_epi8(k, a);
  hex_out(&ret, 16);
  return 0;
}