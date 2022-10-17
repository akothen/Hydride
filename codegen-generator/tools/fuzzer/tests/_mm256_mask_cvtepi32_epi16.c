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
__m128i src = _mm_set_epi16((short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908,(short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
__mmask8 k = _cvtu32_mask8(0x10);
__m256i a = _mm256_set_epi32((int)0x302f2e2d,(int)0x2c2b2a29,(int)0x28272625,(int)0x24232221,(int)0x201f1e1d,(int)0x1c1b1a19,(int)0x18171615,(int)0x14131211);
  __m128i ret = _mm256_mask_cvtepi32_epi16(src, k, a);
  hex_out(&ret, 16);
  return 0;
}