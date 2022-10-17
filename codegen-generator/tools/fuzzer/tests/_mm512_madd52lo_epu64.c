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
__m512i a = _mm512_set_epi64((__int64_t)0x3f3e3d3c3b3a3938,(__int64_t)0x3736353433323130,(__int64_t)0x2f2e2d2c2b2a2928,(__int64_t)0x2726252423222120,(__int64_t)0x1f1e1d1c1b1a1918,(__int64_t)0x1716151413121110,(__int64_t)0x0f0e0d0c0b0a0908,(__int64_t)0x0706050403020100);
__m512i b = _mm512_set_epi64((__int64_t)0x7f7e7d7c7b7a7978,(__int64_t)0x7776757473727170,(__int64_t)0x6f6e6d6c6b6a6968,(__int64_t)0x6766656463626160,(__int64_t)0x5f5e5d5c5b5a5958,(__int64_t)0x5756555453525150,(__int64_t)0x4f4e4d4c4b4a4948,(__int64_t)0x4746454443424140);
__m512i c = _mm512_set_epi64((__int64_t)0xbfbebdbcbbbab9b8,(__int64_t)0xb7b6b5b4b3b2b1b0,(__int64_t)0xafaeadacabaaa9a8,(__int64_t)0xa7a6a5a4a3a2a1a0,(__int64_t)0x9f9e9d9c9b9a9998,(__int64_t)0x9796959493929190,(__int64_t)0x8f8e8d8c8b8a8988,(__int64_t)0x8786858483828180);
  __m512i ret = _mm512_madd52lo_epu64(a, b, c);
  hex_out(&ret, 64);
  return 0;
}