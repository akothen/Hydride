#include <immintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>


void hex_out(const uint8_t * buf, ssize_t sz) {
    for (ssize_t i = sz - 1; i >= 0; --i) {
        printf("%02x", buf[i]);
    }
    printf("\n");
}


int main() {
__m128i a = _mm_set_epi32(0x0f0e0d0c,0x0b0a0908,0x07060504,0x03020100);
__m128i b = _mm_set_epi32(0x1f1e1d1c,0x1b1a1918,0x17161514,0x13121110);
#define imm8 0x00
  __m128i ret = _mm_blend_epi32(a,b,imm8);
  hex_out(&ret, 16);
  return 0;
}