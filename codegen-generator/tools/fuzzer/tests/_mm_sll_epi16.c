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
__m128i a = _mm_set_epi16((short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908,(short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
__m128i count = _mm_set_epi64((__m64)0x1f1e1d1c1b1a1918,(__m64)0x1716151413121110);
  __m128i ret = _mm_sll_epi16(a, count);
  hex_out(&ret, 16);
  return 0;
}