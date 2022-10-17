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
__m256i src = _mm256_set_epi16((short)0x1f1e,(short)0x1d1c,(short)0x1b1a,(short)0x1918,(short)0x1716,(short)0x1514,(short)0x1312,(short)0x1110,(short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908,(short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
__mmask16 k = _cvtu32_mask16(0x2120);
__m256i a = _mm256_set_epi32((int)0x41403f3e,(int)0x3d3c3b3a,(int)0x39383736,(int)0x35343332,(int)0x31302f2e,(int)0x2d2c2b2a,(int)0x29282726,(int)0x25242322);
__m256i b = _mm256_set_epi32((int)0x61605f5e,(int)0x5d5c5b5a,(int)0x59585756,(int)0x55545352,(int)0x51504f4e,(int)0x4d4c4b4a,(int)0x49484746,(int)0x45444342);
  __m256i ret = _mm256_mask_packus_epi32(src, k, a, b);
  hex_out(&ret, 32);
  return 0;
}