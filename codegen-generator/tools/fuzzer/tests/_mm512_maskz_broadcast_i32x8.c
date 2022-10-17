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
__m256i a = _mm256_set_epi32((int)0x21201f1e,(int)0x1d1c1b1a,(int)0x19181716,(int)0x15141312,(int)0x11100f0e,(int)0x0d0c0b0a,(int)0x09080706,(int)0x05040302);
  __m512i ret = _mm512_maskz_broadcast_i32x8(k, a);
  hex_out(&ret, 64);
  return 0;
}