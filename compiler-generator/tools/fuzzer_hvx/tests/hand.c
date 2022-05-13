#include <hexagon_types.h>
#include <hexagon_protos.h>
#include <hvx_hexagon_protos.h>
#include <stdio.h>

void hex_out(const HVX_VectorPred buf, size_t sz) {
    for (size_t i = 0; i < sz; i++) {
        printf("%02lx", buf[i]);
    }
    printf("\n");
}


int main() {
  HVX_Vector Vu = { 22677,6870,7234,58826,63208,13943,60937,13613,4472,7421,6134,22439,1260,36462,45068,43993,24915,39331,34128,50005,19847,12160,55146,34177,47850,13733,22068,63643,22312,4378,51258,18130 };

  HVX_Vector Vv = { 22677,6870,3732,53426,53670,65075,44854,32932,35257,32168,11452,14501,54533,9006,53976,40177,49795,58545,8668,20981,12047,60443,59874,45850,52100,36320,37590,31170,4791,44643,34467,39664 };

  HVX_VectorPred ret = __builtin_HEXAGON_V6_veqw_128B(Vu,Vv);
  hex_out(ret, 4);
  return 0;
}