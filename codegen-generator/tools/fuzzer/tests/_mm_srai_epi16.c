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
__m128i a = _mm_set_epi8((char)0x0f,(char)0x0e,(char)0x0d,(char)0x0c,(char)0x0b,(char)0x0a,(char)0x09,(char)0x08,(char)0x07,(char)0x06,(char)0x05,(char)0x04,(char)0x03,(char)0x02,(char)0x01,(char)0x00);
#define imm8 0x10
  __m128i ret = _mm_srai_epi16(a, imm8);
  hex_out(&ret, 16);
  return 0;
}