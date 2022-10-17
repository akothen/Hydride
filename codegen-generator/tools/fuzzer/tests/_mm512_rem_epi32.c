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
__m512i a = _mm512_set_epi32((int)0x3f3e3d3c,(int)0x3b3a3938,(int)0x37363534,(int)0x33323130,(int)0x2f2e2d2c,(int)0x2b2a2928,(int)0x27262524,(int)0x23222120,(int)0x1f1e1d1c,(int)0x1b1a1918,(int)0x17161514,(int)0x13121110,(int)0x0f0e0d0c,(int)0x0b0a0908,(int)0x07060504,(int)0x03020100);
__m512i b = _mm512_set_epi32((int)0x7f7e7d7c,(int)0x7b7a7978,(int)0x77767574,(int)0x73727170,(int)0x6f6e6d6c,(int)0x6b6a6968,(int)0x67666564,(int)0x63626160,(int)0x5f5e5d5c,(int)0x5b5a5958,(int)0x57565554,(int)0x53525150,(int)0x4f4e4d4c,(int)0x4b4a4948,(int)0x47464544,(int)0x43424140);
  __m512i ret = _mm512_rem_epi32(a, b);
  hex_out(&ret, 64);
  return 0;
}