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
__m256i a = _mm256_set_epi32((int)0x201f1e1d,(int)0x1c1b1a19,(int)0x18171615,(int)0x14131211,(int)0x100f0e0d,(int)0x0c0b0a09,(int)0x08070605,(int)0x04030201);
  __m512i ret = _mm512_maskz_cvtepi32_epi64(k, a);
  hex_out(&ret, 64);
  return 0;
}