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
__m64 a = _mm_set_pi8(0x07,0x06,0x05,0x04,0x03,0x02,0x01,0x00);
__m64 b = _mm_set_pi8(0x0f,0x0e,0x0d,0x0c,0x0b,0x0a,0x09,0x08);
  __m64 ret = _mm_sub_si64(a, b);
  hex_out(&ret, 8);
  return 0;
}