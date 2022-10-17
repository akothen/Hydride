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
__mmask8 k = _cvtu32_mask8(0x10);
__m128i a = _mm_set_epi32((int)0x201f1e1d,(int)0x1c1b1a19,(int)0x18171615,(int)0x14131211);
__m128i b = _mm_set_epi32((int)0x302f2e2d,(int)0x2c2b2a29,(int)0x28272625,(int)0x24232221);
  __m128i ret = _mm_mask_unpacklo_epi32(src, k, a, b);
  hex_out(&ret, 16);
  return 0;
}