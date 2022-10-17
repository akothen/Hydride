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
__mmask32 k = _cvtu32_mask32(0x03020100);
int8_t a = 0x04;
  __m256i ret = _mm256_maskz_set1_epi8(k, a);
  hex_out(&ret, 32);
  return 0;
}