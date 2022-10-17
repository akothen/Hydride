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
  __m512i ret = _mm512_movm_epi8(k);
  hex_out(&ret, 64);
  return 0;
}