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
__mmask8 k = _cvtu32_mask8(0x00);
__m512i a = _mm512_set_epi64((__int64_t)0x403f3e3d3c3b3a39,(__int64_t)0x3837363534333231,(__int64_t)0x302f2e2d2c2b2a29,(__int64_t)0x2827262524232221,(__int64_t)0x201f1e1d1c1b1a19,(__int64_t)0x1817161514131211,(__int64_t)0x100f0e0d0c0b0a09,(__int64_t)0x0807060504030201);
__m512i b = _mm512_set_epi64((__int64_t)0x807f7e7d7c7b7a79,(__int64_t)0x7877767574737271,(__int64_t)0x706f6e6d6c6b6a69,(__int64_t)0x6867666564636261,(__int64_t)0x605f5e5d5c5b5a59,(__int64_t)0x5857565554535251,(__int64_t)0x504f4e4d4c4b4a49,(__int64_t)0x4847464544434241);
  __m512i ret = _mm512_maskz_mullo_epi64(k, a, b);
  hex_out(&ret, 64);
  return 0;
}