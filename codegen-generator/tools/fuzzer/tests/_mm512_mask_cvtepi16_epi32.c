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
__m512i src = _mm512_set_epi32((int)0x3f3e3d3c,(int)0x3b3a3938,(int)0x37363534,(int)0x33323130,(int)0x2f2e2d2c,(int)0x2b2a2928,(int)0x27262524,(int)0x23222120,(int)0x1f1e1d1c,(int)0x1b1a1918,(int)0x17161514,(int)0x13121110,(int)0x0f0e0d0c,(int)0x0b0a0908,(int)0x07060504,(int)0x03020100);
__mmask16 k = _cvtu32_mask16(0x4140);
__m256i a = _mm256_set_epi16((short)0x6160,(short)0x5f5e,(short)0x5d5c,(short)0x5b5a,(short)0x5958,(short)0x5756,(short)0x5554,(short)0x5352,(short)0x5150,(short)0x4f4e,(short)0x4d4c,(short)0x4b4a,(short)0x4948,(short)0x4746,(short)0x4544,(short)0x4342);
  __m512i ret = _mm512_mask_cvtepi16_epi32(src, k, a);
  hex_out(&ret, 64);
  return 0;
}