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
__m128i src = _mm_set_epi16((short)0x0f0e,(short)0x0d0c,(short)0x0b0a,(short)0x0908,(short)0x0706,(short)0x0504,(short)0x0302,(short)0x0100);
__mmask8 k = _cvtu32_mask8(0x10);
__m512i a = _mm512_set_epi64((__int64_t)0x504f4e4d4c4b4a49,(__int64_t)0x4847464544434241,(__int64_t)0x403f3e3d3c3b3a39,(__int64_t)0x3837363534333231,(__int64_t)0x302f2e2d2c2b2a29,(__int64_t)0x2827262524232221,(__int64_t)0x201f1e1d1c1b1a19,(__int64_t)0x1817161514131211);
  __m128i ret = _mm512_mask_cvtusepi64_epi16(src, k, a);
  hex_out(&ret, 16);
  return 0;
}