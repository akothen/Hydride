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
__mmask64 k = _cvtu64_mask64(0x0706050403020100);
__m128i a = _mm_set_epi8((char)0x17,(char)0x16,(char)0x15,(char)0x14,(char)0x13,(char)0x12,(char)0x11,(char)0x10,(char)0x0f,(char)0x0e,(char)0x0d,(char)0x0c,(char)0x0b,(char)0x0a,(char)0x09,(char)0x08);
  __m512i ret = _mm512_maskz_broadcastb_epi8(k, a);
  hex_out(&ret, 64);
  return 0;
}