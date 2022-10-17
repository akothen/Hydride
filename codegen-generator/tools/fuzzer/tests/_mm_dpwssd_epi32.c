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
__m128i src = _mm_set_epi32((int)0x0f0e0d0c,(int)0x0b0a0908,(int)0x07060504,(int)0x03020100);
__m128i a = _mm_set_epi16((short)0x1f1e,(short)0x1d1c,(short)0x1b1a,(short)0x1918,(short)0x1716,(short)0x1514,(short)0x1312,(short)0x1110);
__m128i b = _mm_set_epi16((short)0x2f2e,(short)0x2d2c,(short)0x2b2a,(short)0x2928,(short)0x2726,(short)0x2524,(short)0x2322,(short)0x2120);
  __m128i ret = _mm_dpwssd_epi32(src, a, b);
  hex_out(&ret, 16);
  return 0;
}