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
__mmask8 k = _cvtu32_mask8(0x00);
int16_t a = 0x0201;
  __m128i ret = _mm_maskz_set1_epi16(k, a);
  hex_out(&ret, 16);
  return 0;
}