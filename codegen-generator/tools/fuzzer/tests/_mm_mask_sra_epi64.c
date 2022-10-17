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
__m128i src = _mm_set_epi64((__m64)0x0f0e0d0c0b0a0908,(__m64)0x0706050403020100);
__mmask8 k = _cvtu32_mask8(0x10);
__m128i a = _mm_set_epi8((char)0x20,(char)0x1f,(char)0x1e,(char)0x1d,(char)0x1c,(char)0x1b,(char)0x1a,(char)0x19,(char)0x18,(char)0x17,(char)0x16,(char)0x15,(char)0x14,(char)0x13,(char)0x12,(char)0x11);
__m128i count = _mm_set_epi64((__m64)0x302f2e2d2c2b2a29,(__m64)0x2827262524232221);
  __m128i ret = _mm_mask_sra_epi64(src, k, a, count);
  hex_out(&ret, 16);
  return 0;
}