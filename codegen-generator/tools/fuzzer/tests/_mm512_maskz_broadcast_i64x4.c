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
__m256i a = _mm256_set_epi64x((__int64_t)0x201f1e1d1c1b1a19,(__int64_t)0x1817161514131211,(__int64_t)0x100f0e0d0c0b0a09,(__int64_t)0x0807060504030201);
  __m512i ret = _mm512_maskz_broadcast_i64x4(k, a);
  hex_out(&ret, 64);
  return 0;
}