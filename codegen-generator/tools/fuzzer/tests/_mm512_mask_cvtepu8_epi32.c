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
__m128i a = _mm_set_epi8((char)0x51,(char)0x50,(char)0x4f,(char)0x4e,(char)0x4d,(char)0x4c,(char)0x4b,(char)0x4a,(char)0x49,(char)0x48,(char)0x47,(char)0x46,(char)0x45,(char)0x44,(char)0x43,(char)0x42);
  __m512i ret = _mm512_mask_cvtepu8_epi32(src, k, a);
  hex_out(&ret, 64);
  return 0;
}