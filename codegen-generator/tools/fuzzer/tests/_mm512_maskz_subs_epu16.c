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
__mmask32 k = _cvtu32_mask32(0x03020100);
__m512i a = _mm512_set_epi16((short)0x4342,(short)0x4140,(short)0x3f3e,(short)0x3d3c,(short)0x3b3a,(short)0x3938,(short)0x3736,(short)0x3534,(short)0x3332,(short)0x3130,(short)0x2f2e,(short)0x2d2c,(short)0x2b2a,(short)0x2928,(short)0x2726,(short)0x2524,(short)0x2322,(short)0x2120,(short)0x1f1e,(short)0x1d1c,(short)0x1b1a,(short)0x1918,(short)0x1716,(short)0x1514,(short)0x1312,(short)0x1110,(short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908,(short)0x0706,(short)0x0504);
__m512i b = _mm512_set_epi16((short)0x8382,(short)0x8180,(short)0x7f7e,(short)0x7d7c,(short)0x7b7a,(short)0x7978,(short)0x7776,(short)0x7574,(short)0x7372,(short)0x7170,(short)0x6f6e,(short)0x6d6c,(short)0x6b6a,(short)0x6968,(short)0x6766,(short)0x6564,(short)0x6362,(short)0x6160,(short)0x5f5e,(short)0x5d5c,(short)0x5b5a,(short)0x5958,(short)0x5756,(short)0x5554,(short)0x5352,(short)0x5150,(short)0x4f4e,(short)0x4d4c,(short)0x4b4a,(short)0x4948,(short)0x4746,(short)0x4544);
  __m512i ret = _mm512_maskz_subs_epu16(k, a, b);
  hex_out(&ret, 64);
  return 0;
}