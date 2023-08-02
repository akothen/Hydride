#include <arm_neon.h>
#include <stdio.h>
#include <random>
#include <cstdlib>
#include <random>
using namespace std;

mt19937 mt(time(nullptr));
#define RegisterPrintVector(Type, Store, cType, spec)         \
    void printVector(Type ret)                                \
    {                                                         \
        cType data[sizeof(ret) / sizeof(cType)];              \
        Store(data, ret);                                     \
        for (int i = sizeof(ret) / sizeof(cType) - 1; i >= 0; i--) \
            printf(spec, data[i]);                            \
    }
#define RegisterRandomVector(Type, Load, cType) \
    Type random_##Type()                        \
    {                                           \
        char a[sizeof(Type)];                   \
        for (int i = 0; i < sizeof(Type); i++)  \
            a[i] = mt();                        \
        return Load((cType const *)a);          \
    }
#define RegisterRandomScalar(Type)             \
    Type random_##Type()                       \
    {                                          \
        char a[sizeof(Type)];                  \
        for (int i = 0; i < sizeof(Type); i++) \
            a[i] = mt();                       \
        return *((Type *)a);                   \
    }
#define RegisterPrintScalar(Type, cType, spec) \
    void printVector(Type ret)                 \
    {                                          \
        printf(spec, (cType)ret);              \
    }
RegisterPrintVector(int8x16_t, vst1q_u8, uint8_t, "%02x");
RegisterPrintVector(uint8x16_t, vst1q_u8, uint8_t, "%02x");
RegisterPrintVector(int16x8_t, vst1q_u16, uint16_t, "%04x");
RegisterPrintVector(uint16x8_t, vst1q_u16, uint16_t, "%04x");
RegisterPrintVector(int32x4_t, vst1q_u32, uint32_t, "%08x");
RegisterPrintVector(uint32x4_t, vst1q_u32, uint32_t, "%08x");
RegisterPrintVector(int64x2_t, vst1q_u64, uint64_t, "%016llx");
RegisterPrintVector(uint64x2_t, vst1q_u64, uint64_t, "%016llx");
RegisterPrintVector(int8x8_t, vst1_u8, uint8_t, "%02x");
RegisterPrintVector(uint8x8_t, vst1_u8, uint8_t, "%02x");
RegisterPrintVector(int16x4_t, vst1_u16, uint16_t, "%04x");
RegisterPrintVector(uint16x4_t, vst1_u16, uint16_t, "%04x");
RegisterPrintVector(int32x2_t, vst1_u32, uint32_t, "%08x");
RegisterPrintVector(uint32x2_t, vst1_u32, uint32_t, "%08x");
RegisterPrintVector(int64x1_t, vst1_u64, uint64_t, "%016llx");
RegisterPrintVector(uint64x1_t, vst1_u64, uint64_t, "%016llx");
RegisterPrintScalar(uint8_t, uint8_t, "%02x");
RegisterPrintScalar(uint16_t, uint16_t, "%04x");
RegisterPrintScalar(uint32_t, uint32_t, "%08x");
RegisterPrintScalar(uint64_t, uint64_t, "%016llx");
RegisterPrintScalar(int8_t, uint8_t, "%02x");
RegisterPrintScalar(int16_t, uint16_t, "%04x");
RegisterPrintScalar(int32_t, uint32_t, "%08x");
RegisterPrintScalar(int64_t, uint64_t, "%016llx");
RegisterRandomVector(int8x16_t, vld1q_u8, uint8_t);
RegisterRandomVector(uint8x16_t, vld1q_u8, uint8_t);
RegisterRandomVector(int16x8_t, vld1q_u16, uint16_t);
RegisterRandomVector(uint16x8_t, vld1q_u16, uint16_t);
RegisterRandomVector(int32x4_t, vld1q_u32, uint32_t);
RegisterRandomVector(uint32x4_t, vld1q_u32, uint32_t);
RegisterRandomVector(int64x2_t, vld1q_u64, uint64_t);
RegisterRandomVector(uint64x2_t, vld1q_u64, uint64_t);
RegisterRandomVector(int8x8_t, vld1_u8, uint8_t);
RegisterRandomVector(uint8x8_t, vld1_u8, uint8_t);
RegisterRandomVector(int16x4_t, vld1_u16, uint16_t);
RegisterRandomVector(uint16x4_t, vld1_u16, uint16_t);
RegisterRandomVector(int32x2_t, vld1_u32, uint32_t);
RegisterRandomVector(uint32x2_t, vld1_u32, uint32_t);
RegisterRandomVector(int64x1_t, vld1_u64, uint64_t);
RegisterRandomVector(uint64x1_t, vld1_u64, uint64_t);
RegisterRandomScalar(uint8_t);
RegisterRandomScalar(uint16_t);
RegisterRandomScalar(uint32_t);
RegisterRandomScalar(uint64_t);
RegisterRandomScalar(int8_t);
RegisterRandomScalar(int16_t);
RegisterRandomScalar(int32_t);
RegisterRandomScalar(int64_t);

#define TESTNUM 3

#define TestV(intrin, Type1, TypeRet,ename)              \
    for (int _ = 0; _ < TESTNUM; _++)                    \
    {                                               \
        Type1 a = random_##Type1();                 \
        TypeRet ret = intrin(a);                    \
        printf("(assert (eq? (" #ename " (bv #x"); \
        printVector(a);                             \
        printf(" %lu)) (bv #x", sizeof(Type1) * 8);  \
        printVector(ret);                           \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);   \
    }
#define TestVV(intrin, Type1, Type2, TypeRet,ename)       \
    for (int _ = 0; _ < TESTNUM; _++)                    \
    {                                               \
        Type1 a = random_##Type1();                 \
        Type2 b = random_##Type2();                 \
        TypeRet ret = intrin(a, b);                 \
        printf("(assert (eq? (" #ename " (bv #x"); \
        printVector(a);                             \
        printf(" %lu) (bv #x", sizeof(Type1) * 8);  \
        printVector(b);                             \
        printf(" %lu)) (bv #x", sizeof(Type2) * 8); \
        printVector(ret);                           \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);   \
    }
#define TestVVV(intrin, Type1, Type2, Type3, TypeRet,ename) \
    for (int _ = 0; _ < TESTNUM; _++)                     \
    {                                                \
        Type1 a = random_##Type1();                  \
        Type2 b = random_##Type2();                  \
        Type3 c = random_##Type3();                  \
        TypeRet ret = intrin(a, b, c);               \
        printf("(assert (eq? (" #ename " (bv #x");  \
        printVector(a);                              \
        printf(" %lu) (bv #x", sizeof(Type1) * 8);   \
        printVector(b);                              \
        printf(" %lu) (bv #x", sizeof(Type2) * 8);  \
        printVector(c);                              \
        printf(" %lu)) (bv #x", sizeof(Type3) * 8);  \
        printVector(ret);                            \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);    \
    }
#define TestVVVI(intrin, Type1, Type2, Type3, n, TypeRet, ename) \
    {                                                \
        Type1 a = random_##Type1();                  \
        Type2 b = random_##Type2();                  \
        Type3 c = random_##Type3();                  \
        TypeRet ret = intrin(a, b, c, n);               \
        printf("(assert (eq? (" #ename " (bv #x");  \
        printVector(a);                              \
        printf(" %lu) (bv #x", sizeof(Type1) * 8);   \
        printVector(b);                              \
        printf(" %lu) (bv #x", sizeof(Type2) * 8);  \
        printVector(c);                              \
        printf(" %lu) (bv %d 64)) (bv #x", sizeof(Type3) * 8, n);  \
        printVector(ret);                            \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);    \
    }
#define TestVIVI(intrin, Type1, n, Type2, m, TypeRet,ename)       \
    {                                               \
        Type1 a = random_##Type1();                 \
        Type2 b = random_##Type2();                 \
        TypeRet ret = intrin(a, n, b, m);                 \
        printf("(assert (eq? (" #ename " (bv #x"); \
        printVector(a);                             \
        printf(" %lu) (bv %d 64)) (bv #x", sizeof(Type1) * 8, n);  \
        printVector(b);                             \
        printf(" %lu) (bv %d 64)) (bv #x", sizeof(Type2) * 8, m);  \
        printVector(ret);                           \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);   \
    }
#define TestVVI(intrin, Type1, Type2, n, TypeRet, ename)       \
    {                                               \
        Type1 a = random_##Type1();                 \
        Type2 b = random_##Type2();                 \
        TypeRet ret = intrin(a, b, n);                 \
        printf("(assert (eq? (" #ename " (bv #x"); \
        printVector(a);                             \
        printf(" %lu) (bv #x", sizeof(Type1) * 8);  \
        printVector(b);                             \
        printf(" %lu) (bv %d 64)) (bv #x", sizeof(Type2) * 8, n);  \
        printVector(ret);                           \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);   \
    }
#define TestVI(intrin, Type1, n, TypeRet, ename)              \
    {                                               \
        Type1 a = random_##Type1();                 \
        TypeRet ret = intrin(a, n);                    \
        printf("(assert (eq? (" #ename " (bv #x"); \
        printVector(a);                             \
        printf(" %lu) (bv %d 64)) (bv #x", sizeof(Type1) * 8, n);  \
        printVector(ret);                           \
        printf(" %lu)))\n", sizeof(TypeRet) * 8);   \
    }