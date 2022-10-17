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
int8_t a = 0x00;
  __m64 ret = _mm_set1_pi8(a);
  hex_out(&ret, 8);
  return 0;
}