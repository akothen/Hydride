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
__m512i src = _mm512_set_epi16((short)0x3f3e,(short)0x3d3c,(short)0x3b3a,(short)0x3938,(short)0x3736,(short)0x3534,(short)0x3332,(short)0x3130,(short)0x2f2e,(short)0x2d2c,(short)0x2b2a,(short)0x2928,(short)0x2726,(short)0x2524,(short)0x2322,(short)0x2120,(short)0x1f1e,(short)0x1d1c,(short)0x1b1a,(short)0x1918,(short)0x1716,(short)0x1514,(short)0x1312,(short)0x1110,(short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908,(short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
__mmask32 k = _cvtu32_mask32(0x43424140);
__m128i a = _mm_set_epi16((short)0x5352,(short)0x5150,(short)0x4f4e,(short)0x4d4c,(short)0x4b4a,(short)0x4948,(short)0x4746,(short)0x4544);
  __m512i ret = _mm512_mask_broadcastw_epi16(src, k, a);
  hex_out(&ret, 64);
  return 0;
}