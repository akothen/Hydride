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
__m128i src = _mm_set_epi8((char)0x0f,(char)0x0e,(char)0x0d,(char)0x0c,(char)0x0b,(char)0x0a,(char)0x09,(char)0x08,(char)0x07,(char)0x06,(char)0x05,(char)0x04,(char)0x03,(char)0x02,(char)0x01,(char)0x00);
__mmask16 k = _cvtu32_mask16(0x1110);
__m512i a = _mm512_set_epi32((int)0x51504f4e,(int)0x4d4c4b4a,(int)0x49484746,(int)0x45444342,(int)0x41403f3e,(int)0x3d3c3b3a,(int)0x39383736,(int)0x35343332,(int)0x31302f2e,(int)0x2d2c2b2a,(int)0x29282726,(int)0x25242322,(int)0x21201f1e,(int)0x1d1c1b1a,(int)0x19181716,(int)0x15141312);
  __m128i ret = _mm512_mask_cvtsepi32_epi8(src, k, a);
  hex_out(&ret, 16);
  return 0;
}