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
__m128i a = _mm_set_epi64((__m64)0x0f0e0d0c0b0a0908,(__m64)0x0706050403020100);
__m128i b = _mm_set_epi64((__m64)0x1f1e1d1c1b1a1918,(__m64)0x1716151413121110);
__m128i c = _mm_set_epi64((__m64)0x2f2e2d2c2b2a2928,(__m64)0x2726252423222120);
  __m128i ret = _mm_madd52hi_epu64(a, b, c);
  hex_out(&ret, 16);
  return 0;
}