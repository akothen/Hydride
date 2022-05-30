#include <hexagon_types.h>
#include <hexagon_protos.h>
#include <hvx_hexagon_protos.h>
#include <stdio.h>

void hex_out(const HVX_Vector buf, size_t sz) {
    for (size_t i = 0; i < sz; i++) {
        printf("%02lx", buf[i]);
    }
    printf("\n");
}


int main() {
  int32_t Rt = { 6925 };

  HVX_Vector ret = __builtin_HEXAGON_V6_lvsplatb_128B(Rt);
  hex_out(ret, 32);
  return 0;
}