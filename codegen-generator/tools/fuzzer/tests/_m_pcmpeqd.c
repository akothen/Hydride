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
__m64 b = _mm_set_pi32((int)0x0f0e0d0c,(int)0x0b0a0908);
  __m64 ret = _m_pcmpeqd(a, b);
  hex_out(&ret, 8);
  return 0;
}