#include <arm_neon.h>
#include <stdio.h>

int main()
{
    int16_t dataa[8] = {8, 1, 2, 3, 4, 5, 6, 7};
    int16_t datab[8] = {1, 2, 3, 4, 5, 6, 7, 8};
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