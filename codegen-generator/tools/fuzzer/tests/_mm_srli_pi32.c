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
__m64 a = _mm_set_pi32((int)0x07060504,(int)0x03020100);
#define imm8 0x08
  __m64 ret = _mm_srli_pi32(a, imm8);
  hex_out(&ret, 8);
  return 0;
}