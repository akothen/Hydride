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
__m256i src = _mm256_set_epi64x((__int64_t)0x1f1e1d1c1b1a1918,(__int64_t)0x1716151413121110,(__int64_t)0x0f0e0d0c0b0a0908,(__int64_t)0x0706050403020100);
__mmask8 k = _cvtu32_mask8(0x20);
int64_t a = _mm_set_pi8(0x28,0x27,0x26,0x25,0x24,0x23,0x22,0x21);
  __m256i ret = _mm256_mask_set1_epi64(src, k, a);
  hex_out(&ret, 32);
  return 0;
}