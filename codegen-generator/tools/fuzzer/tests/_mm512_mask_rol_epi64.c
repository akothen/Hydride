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
__m512i a = _mm512_set_epi64((__int64_t)0x807f7e7d7c7b7a79,(__int64_t)0x7877767574737271,(__int64_t)0x706f6e6d6c6b6a69,(__int64_t)0x6867666564636261,(__int64_t)0x605f5e5d5c5b5a59,(__int64_t)0x5857565554535251,(__int64_t)0x504f4e4d4c4b4a49,(__int64_t)0x4847464544434241);
#define imm8 0x81
  __m512i ret = _mm512_mask_rol_epi64(src, k, a, imm8);
  hex_out(&ret, 64);
  return 0;
}