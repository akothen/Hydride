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
__m256i src = _mm256_set_epi64x((__int64_t)0x1f1e1d1c1b1a1918,(__int64_t)0x1716151413121110,(__int64_t)0x0f0e0d0c0b0a0908,(__int64_t)0x0706050403020100);
__mmask8 k = _cvtu32_mask8(0x20);
__m128i a = _mm_set_epi8((char)0x30,(char)0x2f,(char)0x2e,(char)0x2d,(char)0x2c,(char)0x2b,(char)0x2a,(char)0x29,(char)0x28,(char)0x27,(char)0x26,(char)0x25,(char)0x24,(char)0x23,(char)0x22,(char)0x21);
  __m256i ret = _mm256_mask_cvtepu8_epi64(src, k, a);
  hex_out(&ret, 32);
  return 0;
}