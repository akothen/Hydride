
#include <arm_neon.h>
#include <stdio.h>

int main()
{
    int16_t dataa[8] = {(int16_t)58444UL, (int16_t)26801UL, (int16_t)43765UL, (int16_t)15896UL, (int16_t)51396UL, (int16_t)65055UL, (int16_t)38924UL, (int16_t)30413UL};
    int16_t datab[8] = {(int16_t)24619UL, (int16_t)42687UL, (int16_t)44194UL, (int16_t)56421UL, (int16_t)16309UL, (int16_t)4882UL, (int16_t)29817UL, (int16_t)58123UL};
    int16x8_t a = vld1q_s16(dataa);
    int16x8_t b = vld1q_s16(datab);
    int16x8_t ret = vsubq_s16(a, b);
    int16_t datac[8];
    vst1q_s16(datac, ret);
    for (int i = 0; i < 8; i++) {
        printf("%04x", (uint16_t)datac[i]);
    }
    return 0;
}
