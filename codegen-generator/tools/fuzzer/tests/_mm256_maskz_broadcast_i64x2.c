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
__m128i a = _mm_set_epi64((__m64)0x100f0e0d0c0b0a09,(__m64)0x0807060504030201);
  __m256i ret = _mm256_maskz_broadcast_i64x2(k, a);
  hex_out(&ret, 32);
  return 0;
}