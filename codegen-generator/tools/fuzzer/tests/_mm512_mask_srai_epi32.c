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
__m512i a = _mm512_set_epi8((char)0x81,(char)0x80,(char)0x7f,(char)0x7e,(char)0x7d,(char)0x7c,(char)0x7b,(char)0x7a,(char)0x79,(char)0x78,(char)0x77,(char)0x76,(char)0x75,(char)0x74,(char)0x73,(char)0x72,(char)0x71,(char)0x70,(char)0x6f,(char)0x6e,(char)0x6d,(char)0x6c,(char)0x6b,(char)0x6a,(char)0x69,(char)0x68,(char)0x67,(char)0x66,(char)0x65,(char)0x64,(char)0x63,(char)0x62,(char)0x61,(char)0x60,(char)0x5f,(char)0x5e,(char)0x5d,(char)0x5c,(char)0x5b,(char)0x5a,(char)0x59,(char)0x58,(char)0x57,(char)0x56,(char)0x55,(char)0x54,(char)0x53,(char)0x52,(char)0x51,(char)0x50,(char)0x4f,(char)0x4e,(char)0x4d,(char)0x4c,(char)0x4b,(char)0x4a,(char)0x49,(char)0x48,(char)0x47,(char)0x46,(char)0x45,(char)0x44,(char)0x43,(char)0x42);
#define imm8 0x82
  __m512i ret = _mm512_mask_srai_epi32(src, k, a, imm8);
  hex_out(&ret, 64);
  return 0;
}