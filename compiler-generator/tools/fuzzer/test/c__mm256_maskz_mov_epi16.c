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
__mmask16 k = _cvtu32_mask16(0x0100);
__m256i a = _mm256_set_epi16(0x2120,0x1f1e,0x1d1c,0x1b1a,0x1918,0x1716,0x1514,0x1312,0x1110,0x0f0e,0x0d0c,0x0b0a,0x0908,0x0706,0x0504,0x0302);
  __m256i ret = _mm256_maskz_mov_epi16(k, a);
  hex_out(&ret, 32);
  return 0;
}