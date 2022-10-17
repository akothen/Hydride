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
__m128i src = _mm_set_epi64((__m64)0x0f0e0d0c0b0a0908,(__m64)0x0706050403020100);
__mmask8 k = _cvtu32_mask8(0x10);
int64_t a = _mm_set_pi8(0x18,0x17,0x16,0x15,0x14,0x13,0x12,0x11);
  __m128i ret = _mm_mask_set1_epi64(src, k, a);
  hex_out(&ret, 16);
  return 0;
}