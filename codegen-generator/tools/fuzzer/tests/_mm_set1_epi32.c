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
int a = 0x03020100;
  __m128i ret = _mm_set1_epi32(a);
  hex_out(&ret, 16);
  return 0;
}