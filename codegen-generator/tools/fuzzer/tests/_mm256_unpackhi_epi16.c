#include <immintrin.h>
#include <stdint.h>
#include <stdio.h>

void hex_out(const uint8_t *buf, ssize_t sz) {
    for (ssize_t i = sz - 1; i >= 0; --i) {
        printf("%02x", buf[i]);
    }
    printf("\n");
}

int main() {
    int stride = 8;
    __m256 vec0 = _mm256_set_ps(4.5, 6.3, 43.6, 43.0, 6.4, 43.7, 32.5, 0.9);
    __m256 vec1 = _mm256_set_ps(43.5, 32.5, 2.5, 3.6, 35.3, 4.5, 4.4, 5.6);
    __m256 vec2 = _mm256_set_ps(2.3, 4.4, 4.23, 55.5, 34.3, 32.3, 23.43, 23.0);
    __m256 vec3 = _mm256_set_ps(23.42, 4.43, 4.23, 55.5, 34.3, 32.3, 23.43, 23.0);
    __m256 vec4 = _mm256_set_ps(23.42, 4.43, 4.23, 55.5, 34.3, 32.3, 23.43, 23.0);
    __m256 vec5 = _mm256_set_ps(23.42, 4.43, 4.23, 55.5, 34.3, 32.3, 23.43, 23.0);
    __m256 vec6 = _mm256_set_ps(23.42, 4.43, 4.23, 55.5, 34.3, 32.3, 23.43, 23.0);
    __m256 vec7 = _mm256_set_ps(23.42, 4.43, 4.23, 55.5, 34.3, 32.3, 23.43, 23.0);
    __m256 __t0, __t1, __t2, __t3, __t4, __t5, __t6, __t7;
    __m256 __tt0, __tt1, __tt2, __tt3, __tt4, __tt5;

    __t0 = _mm256_unpacklo_ps(vec0, vec1);
    __t1 = _mm256_unpackhi_ps(vec0, vec1);
    __t2 = _mm256_unpacklo_ps(vec2, vec3);
    __t3 = _mm256_unpackhi_ps(vec2, vec3);
    __t4 = _mm256_unpacklo_ps(vec4, vec5);
    __t5 = _mm256_unpackhi_ps(vec4, vec5);

    __tt0 = _mm256_shuffle_ps(__t0, __t2, _MM_SHUFFLE(1, 0, 1, 0));
    __tt1 = _mm256_shuffle_ps(__t0, __t2, _MM_SHUFFLE(3, 2, 3, 2));
    __tt2 = _mm256_shuffle_ps(__t1, __t3, _MM_SHUFFLE(1, 0, 1, 0));
    __tt3 = _mm256_shuffle_ps(__t1, __t3, _MM_SHUFFLE(3, 2, 3, 2));
    __tt4 = _mm256_shuffle_ps(__t4, _mm256_setzero_ps(), _MM_SHUFFLE(1, 0, 1, 0));
    __tt5 = _mm256_shuffle_ps(__t5, _mm256_setzero_ps(), _MM_SHUFFLE(3, 2, 3, 2));

    vec0 = _mm256_permute2f128_ps(__tt0, __tt4, 0x20);
    vec1 = _mm256_permute2f128_ps(__tt1, __tt5, 0x20);
    vec2 = _mm256_permute2f128_ps(__tt2, _mm256_setzero_ps(), 0x20);
    vec3 = _mm256_permute2f128_ps(__tt3, _mm256_setzero_ps(), 0x20);
    vec4 = _mm256_permute2f128_ps(__tt0, __tt4, 0x31);
    vec5 = _mm256_permute2f128_ps(__tt1, __tt5, 0x31);
    vec6 = _mm256_permute2f128_ps(__tt2, _mm256_setzero_ps(), 0x31;
    vec7 = _mm256_permute2f128_ps(__tt3, _mm256_setzero_ps(), 0x31);



    return 0;
}