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
__m512i a = _mm512_set_epi8((char)0x47,(char)0x46,(char)0x45,(char)0x44,(char)0x43,(char)0x42,(char)0x41,(char)0x40,(char)0x3f,(char)0x3e,(char)0x3d,(char)0x3c,(char)0x3b,(char)0x3a,(char)0x39,(char)0x38,(char)0x37,(char)0x36,(char)0x35,(char)0x34,(char)0x33,(char)0x32,(char)0x31,(char)0x30,(char)0x2f,(char)0x2e,(char)0x2d,(char)0x2c,(char)0x2b,(char)0x2a,(char)0x29,(char)0x28,(char)0x27,(char)0x26,(char)0x25,(char)0x24,(char)0x23,(char)0x22,(char)0x21,(char)0x20,(char)0x1f,(char)0x1e,(char)0x1d,(char)0x1c,(char)0x1b,(char)0x1a,(char)0x19,(char)0x18,(char)0x17,(char)0x16,(char)0x15,(char)0x14,(char)0x13,(char)0x12,(char)0x11,(char)0x10,(char)0x0f,(char)0x0e,(char)0x0d,(char)0x0c,(char)0x0b,(char)0x0a,(char)0x09,(char)0x08);
  __m512i ret = _mm512_maskz_abs_epi8(k, a);
  hex_out(&ret, 64);
  return 0;
}