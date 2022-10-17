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
__m128i a = _mm_set_epi32((int)0x11100f0e,(int)0x0d0c0b0a,(int)0x09080706,(int)0x05040302);
  __m512i ret = _mm512_maskz_broadcast_i32x4(k, a);
  hex_out(&ret, 64);
  return 0;
}