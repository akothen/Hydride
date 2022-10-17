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
__m256i a = _mm256_set_epi32((int)0x403f3e3d,(int)0x3c3b3a39,(int)0x38373635,(int)0x34333231,(int)0x302f2e2d,(int)0x2c2b2a29,(int)0x28272625,(int)0x24232221);
__m256i b = _mm256_set_epi32((int)0x605f5e5d,(int)0x5c5b5a59,(int)0x58575655,(int)0x54535251,(int)0x504f4e4d,(int)0x4c4b4a49,(int)0x48474645,(int)0x44434241);
  __m256i ret = _mm256_mask_unpackhi_epi32(src, k, a, b);
  hex_out(&ret, 32);
  return 0;
}