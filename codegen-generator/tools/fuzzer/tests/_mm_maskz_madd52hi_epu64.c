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
__m128i a = _mm_set_epi64((__m64)0x100f0e0d0c0b0a09,(__m64)0x0807060504030201);
__m128i b = _mm_set_epi64((__m64)0x201f1e1d1c1b1a19,(__m64)0x1817161514131211);
__m128i c = _mm_set_epi64((__m64)0x302f2e2d2c2b2a29,(__m64)0x2827262524232221);
  __m128i ret = _mm_maskz_madd52hi_epu64(k, a, b, c);
  hex_out(&ret, 16);
  return 0;
}