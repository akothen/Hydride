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
__m512i a = _mm512_set_epi32((int)0x83828180,(int)0x7f7e7d7c,(int)0x7b7a7978,(int)0x77767574,(int)0x73727170,(int)0x6f6e6d6c,(int)0x6b6a6968,(int)0x67666564,(int)0x63626160,(int)0x5f5e5d5c,(int)0x5b5a5958,(int)0x57565554,(int)0x53525150,(int)0x4f4e4d4c,(int)0x4b4a4948,(int)0x47464544);
__m512i b = _mm512_set_epi32((int)0xc3c2c1c0,(int)0xbfbebdbc,(int)0xbbbab9b8,(int)0xb7b6b5b4,(int)0xb3b2b1b0,(int)0xafaeadac,(int)0xabaaa9a8,(int)0xa7a6a5a4,(int)0xa3a2a1a0,(int)0x9f9e9d9c,(int)0x9b9a9998,(int)0x97969594,(int)0x93929190,(int)0x8f8e8d8c,(int)0x8b8a8988,(int)0x87868584);
  __m512i ret = _mm512_mask_packs_epi32(src, k, a, b);
  hex_out(&ret, 64);
  return 0;
}