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
__m512i src = _mm512_set_epi64((__int64_t)0x3f3e3d3c3b3a3938,(__int64_t)0x3736353433323130,(__int64_t)0x2f2e2d2c2b2a2928,(__int64_t)0x2726252423222120,(__int64_t)0x1f1e1d1c1b1a1918,(__int64_t)0x1716151413121110,(__int64_t)0x0f0e0d0c0b0a0908,(__int64_t)0x0706050403020100);
__mmask8 k = _cvtu32_mask8(0x40);
__m512i a = _mm512_set_epi32((int)0x807f7e7d,(int)0x7c7b7a79,(int)0x78777675,(int)0x74737271,(int)0x706f6e6d,(int)0x6c6b6a69,(int)0x68676665,(int)0x64636261,(int)0x605f5e5d,(int)0x5c5b5a59,(int)0x58575655,(int)0x54535251,(int)0x504f4e4d,(int)0x4c4b4a49,(int)0x48474645,(int)0x44434241);
__m512i b = _mm512_set_epi32((int)0xc0bfbebd,(int)0xbcbbbab9,(int)0xb8b7b6b5,(int)0xb4b3b2b1,(int)0xb0afaead,(int)0xacabaaa9,(int)0xa8a7a6a5,(int)0xa4a3a2a1,(int)0xa09f9e9d,(int)0x9c9b9a99,(int)0x98979695,(int)0x94939291,(int)0x908f8e8d,(int)0x8c8b8a89,(int)0x88878685,(int)0x84838281);
  __m512i ret = _mm512_mask_mul_epu32(src, k, a, b);
  hex_out(&ret, 64);
  return 0;
}