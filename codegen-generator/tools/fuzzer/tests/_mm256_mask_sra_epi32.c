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
__m256i src = _mm256_set_epi32((int)0x1f1e1d1c,(int)0x1b1a1918,(int)0x17161514,(int)0x13121110,(int)0x0f0e0d0c,(int)0x0b0a0908,(int)0x07060504,(int)0x03020100);
__mmask8 k = _cvtu32_mask8(0x20);
__m256i a = _mm256_set_epi8((char)0x40,(char)0x3f,(char)0x3e,(char)0x3d,(char)0x3c,(char)0x3b,(char)0x3a,(char)0x39,(char)0x38,(char)0x37,(char)0x36,(char)0x35,(char)0x34,(char)0x33,(char)0x32,(char)0x31,(char)0x30,(char)0x2f,(char)0x2e,(char)0x2d,(char)0x2c,(char)0x2b,(char)0x2a,(char)0x29,(char)0x28,(char)0x27,(char)0x26,(char)0x25,(char)0x24,(char)0x23,(char)0x22,(char)0x21);
__m128i count = _mm_set_epi64((__m64)0x504f4e4d4c4b4a49,(__m64)0x4847464544434241);
  __m256i ret = _mm256_mask_sra_epi32(src, k, a, count);
  hex_out(&ret, 32);
  return 0;
}