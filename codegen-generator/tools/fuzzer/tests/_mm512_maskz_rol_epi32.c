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
__mmask16 k = _cvtu32_mask16(0x0100);
__m512i a = _mm512_set_epi32((int)0x41403f3e,(int)0x3d3c3b3a,(int)0x39383736,(int)0x35343332,(int)0x31302f2e,(int)0x2d2c2b2a,(int)0x29282726,(int)0x25242322,(int)0x21201f1e,(int)0x1d1c1b1a,(int)0x19181716,(int)0x15141312,(int)0x11100f0e,(int)0x0d0c0b0a,(int)0x09080706,(int)0x05040302);
#define imm8 0x42
  __m512i ret = _mm512_maskz_rol_epi32(k, a, imm8);
  hex_out(&ret, 64);
  return 0;
}