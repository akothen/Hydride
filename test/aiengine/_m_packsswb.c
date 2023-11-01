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
// __m64 a = _mm_set_pi16((short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
// __m64 b = _mm_set_pi16((short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908);
// __m64 ret = _m_packsswb(a, b);
__m64 a = _mm_set_pi16((short)0xaaaa,(short)0xaaaa,(short)0xaaaa,(short)0xaaaa);
__m64 b = _mm_set_pi16((short)0x5555,(short)0x5555,(short)0x5555,(short)0x5555);
__m64 ret = _mm_add_pi16(a, b);
  hex_out(&a, 8);
  hex_out(&b, 8);
  hex_out(&ret, 8);
  return 0;
}