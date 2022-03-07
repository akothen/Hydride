
#include <immintrin.h>
#include <smmintrin.h>
#include <xmmintrin.h>
//#include <x86gprintrin.h>
#include <avx512vbmivlintrin.h>
#include <clwbintrin.h>
#include <gfniintrin.h>
#include <nmmintrin.h>
#include <wbnoinvdintrin.h>
//#include <avx512vbmi2vlintrin.h>
//#include <keylockerintrin.h>
#include <avx512erintrin.h>
#include <avx512fintrin.h>
#include <pkuintrin.h>
//#include <avxvnniintrin.h>
#include <ammintrin.h>
#include <avx512bf16intrin.h>
#include <avx512dqintrin.h>
#include <avx512ifmaintrin.h>
#include <emmintrin.h>
#include <popcntintrin.h>
#include <wmmintrin.h>
#include <xsaveintrin.h>
#include <xsavesintrin.h>
//#include <avx512vp2intersectvlintrin.h>
#include <adxintrin.h>
#include <avx512bwintrin.h>
#include <avx512cdintrin.h>
#include <avx512vlintrin.h>
#include <avxintrin.h>
#include <cldemoteintrin.h>
#include <clzerointrin.h>
#include <f16cintrin.h>
#include <fmaintrin.h>
#include <mmintrin.h>
#include <movdirintrin.h>
//#include <avx512bf16vlintrin.h>
#include <avx2intrin.h>
#include <pmmintrin.h>
//#include <amxtileintrin.h>
//#include <lwpintrin.h>
#include <avx512vnniintrin.h>
//#include <uintrintrin.h>
#include <avx512vlbwintrin.h>
#include <avx512vp2intersectintrin.h>
#include <avx512vpopcntdqvlintrin.h>
#include <clflushoptintrin.h>
#include <lzcntintrin.h>
#include <tmmintrin.h>
//#include <amxbf16intrin.h>
#include <avx512vldqintrin.h>
#include <rtmintrin.h>
//#include <avx512vnnivlintrin.h>
#include <rdseedintrin.h>
#include <serializeintrin.h>
#include <shaintrin.h>
//#include <hresetintrin.h>
#include <avx512bitalgintrin.h>
#include <avx512ifmavlintrin.h>
#include <avx512vbmi2intrin.h>
#include <bmiintrin.h>
#include <x86intrin.h>
#include <xsaveoptintrin.h>
//#include <amxint8intrin.h>
#include <sgxintrin.h>
#include <tbmintrin.h>
#include <vaesintrin.h>
#include <waitpkgintrin.h>

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>

// (bv #x00000000000000000000000500000005 128)
void
hex_out(const uint8_t * buf, ssize_t sz) {
    for (ssize_t i = sz - 1; i >= 0; --i) {
        printf("%02x", buf[i]);
    }
}
