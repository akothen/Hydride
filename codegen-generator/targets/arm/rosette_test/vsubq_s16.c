
#include <arm_neon.h>
#include <stdio.h>

int main()
{
    int16_t dataa[8] = {(int16_t)57042, (int16_t)9299, (int16_t)61134, (int16_t)31975, (int16_t)6476, (int16_t)16896, (int16_t)18792, (int16_t)49565};
    int16_t datab[8] = {(int16_t)58831, (int16_t)27991, (int16_t)45356, (int16_t)12504, (int16_t)34201, (int16_t)56726, (int16_t)53569, (int16_t)44802};
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
