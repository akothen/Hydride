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
__m256i b = _mm256_set_epi32((int)0x403f3e3d,(int)0x3c3b3a39,(int)0x38373635,(int)0x34333231,(int)0x302f2e2d,(int)0x2c2b2a29,(int)0x28272625,(int)0x24232221);
  __m256i ret = _mm256_maskz_andnot_epi32(k, a, b);
  hex_out(&ret, 32);
  return 0;
}