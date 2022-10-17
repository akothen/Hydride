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
__m256i a = _mm256_set_epi16((short)0x201f,(short)0x1e1d,(short)0x1c1b,(short)0x1a19,(short)0x1817,(short)0x1615,(short)0x1413,(short)0x1211,(short)0x100f,(short)0x0e0d,(short)0x0c0b,(short)0x0a09,(short)0x0807,(short)0x0605,(short)0x0403,(short)0x0201);
__m256i b = _mm256_set_epi16((short)0x403f,(short)0x3e3d,(short)0x3c3b,(short)0x3a39,(short)0x3837,(short)0x3635,(short)0x3433,(short)0x3231,(short)0x302f,(short)0x2e2d,(short)0x2c2b,(short)0x2a29,(short)0x2827,(short)0x2625,(short)0x2423,(short)0x2221);
  __m256i ret = _mm256_maskz_madd_epi16(k, a, b);
  hex_out(&ret, 32);
  return 0;
}