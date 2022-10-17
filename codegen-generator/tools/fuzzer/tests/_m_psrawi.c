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
__m64 a = _mm_set_pi8((char)0x07,(char)0x06,(char)0x05,(char)0x04,(char)0x03,(char)0x02,(char)0x01,(char)0x00);
#define imm8 0x08
  __m64 ret = _m_psrawi(a, imm8);
  hex_out(&ret, 8);
  return 0;
}