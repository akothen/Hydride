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
__m512i a = _mm512_set_epi32((int)0x403f3e3d,(int)0x3c3b3a39,(int)0x38373635,(int)0x34333231,(int)0x302f2e2d,(int)0x2c2b2a29,(int)0x28272625,(int)0x24232221,(int)0x201f1e1d,(int)0x1c1b1a19,(int)0x18171615,(int)0x14131211,(int)0x100f0e0d,(int)0x0c0b0a09,(int)0x08070605,(int)0x04030201);
__m512i b = _mm512_set_epi32((int)0x807f7e7d,(int)0x7c7b7a79,(int)0x78777675,(int)0x74737271,(int)0x706f6e6d,(int)0x6c6b6a69,(int)0x68676665,(int)0x64636261,(int)0x605f5e5d,(int)0x5c5b5a59,(int)0x58575655,(int)0x54535251,(int)0x504f4e4d,(int)0x4c4b4a49,(int)0x48474645,(int)0x44434241);
  __m512i ret = _mm512_maskz_mul_epu32(k, a, b);
  hex_out(&ret, 64);
  return 0;
}