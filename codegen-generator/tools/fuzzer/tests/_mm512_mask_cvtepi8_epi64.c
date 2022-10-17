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
__m128i a = _mm_set_epi8((char)0x50,(char)0x4f,(char)0x4e,(char)0x4d,(char)0x4c,(char)0x4b,(char)0x4a,(char)0x49,(char)0x48,(char)0x47,(char)0x46,(char)0x45,(char)0x44,(char)0x43,(char)0x42,(char)0x41);
  __m512i ret = _mm512_mask_cvtepi8_epi64(src, k, a);
  hex_out(&ret, 64);
  return 0;
}