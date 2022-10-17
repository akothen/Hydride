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
__m256i a = _mm256_set_epi16((short)0x403f,(short)0x3e3d,(short)0x3c3b,(short)0x3a39,(short)0x3837,(short)0x3635,(short)0x3433,(short)0x3231,(short)0x302f,(short)0x2e2d,(short)0x2c2b,(short)0x2a29,(short)0x2827,(short)0x2625,(short)0x2423,(short)0x2221);
__m256i b = _mm256_set_epi16((short)0x605f,(short)0x5e5d,(short)0x5c5b,(short)0x5a59,(short)0x5857,(short)0x5655,(short)0x5453,(short)0x5251,(short)0x504f,(short)0x4e4d,(short)0x4c4b,(short)0x4a49,(short)0x4847,(short)0x4645,(short)0x4443,(short)0x4241);
  __m256i ret = _mm256_mask_dpwssds_epi32(src, k, a, b);
  hex_out(&ret, 32);
  return 0;
}