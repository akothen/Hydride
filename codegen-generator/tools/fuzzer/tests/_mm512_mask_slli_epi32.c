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
__m512i a = _mm512_set_epi32((int)0x81807f7e,(int)0x7d7c7b7a,(int)0x79787776,(int)0x75747372,(int)0x71706f6e,(int)0x6d6c6b6a,(int)0x69686766,(int)0x65646362,(int)0x61605f5e,(int)0x5d5c5b5a,(int)0x59585756,(int)0x55545352,(int)0x51504f4e,(int)0x4d4c4b4a,(int)0x49484746,(int)0x45444342);
#define imm8 0x82
  __m512i ret = _mm512_mask_slli_epi32(src, k, a, imm8);
  hex_out(&ret, 64);
  return 0;
}