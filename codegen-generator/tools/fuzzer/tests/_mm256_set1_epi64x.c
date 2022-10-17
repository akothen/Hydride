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
long long a = _mm_set_pi8(0x07,0x06,0x05,0x04,0x03,0x02,0x01,0x00);
  __m256i ret = _mm256_set1_epi64x(a);
  hex_out(&ret, 32);
  return 0;
}