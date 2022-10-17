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
__m256i a = _mm256_set_epi16((short)0x3f3e,(short)0x3d3c,(short)0x3b3a,(short)0x3938,(short)0x3736,(short)0x3534,(short)0x3332,(short)0x3130,(short)0x2f2e,(short)0x2d2c,(short)0x2b2a,(short)0x2928,(short)0x2726,(short)0x2524,(short)0x2322,(short)0x2120);
__m256i b = _mm256_set_epi16((short)0x5f5e,(short)0x5d5c,(short)0x5b5a,(short)0x5958,(short)0x5756,(short)0x5554,(short)0x5352,(short)0x5150,(short)0x4f4e,(short)0x4d4c,(short)0x4b4a,(short)0x4948,(short)0x4746,(short)0x4544,(short)0x4342,(short)0x4140);
  __m256i ret = _mm256_dpwssds_epi32(src, a, b);
  hex_out(&ret, 32);
  return 0;
}