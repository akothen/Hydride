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
__m64 a = _mm_set_pi16((short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
  __m64 ret = _mm_abs_pi16(a);
  hex_out(&ret, 8);
  return 0;
}