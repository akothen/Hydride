; ModuleID = "sobel.lifted"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <16 x i32> @hydride.node.0(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

declare <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %arg, <32 x i16> %arg.1, <32 x i16> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %arg, <16 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %arg, <16 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

define <16 x i32> @hydride.node.1(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.2(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

declare <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %arg, <16 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

define <16 x i32> @hydride.node.3(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.4(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.5(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.6(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i8> @hydride.node.7(<16 x i8> %arg, <16 x i8> %arg.1, <16 x i8> %arg.2, <16 x i8> %arg.3, <16 x i8> %arg.4, <16 x i8> %arg.5, <16 x i8> %arg.6, <16 x i8> %arg.7, <16 x i8> %arg.8, <16 x i8> %arg.9)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %1 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %2 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %1, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %3 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %4 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %2, <16 x i16> %3, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %5 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %0, <16 x i16> %4, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %6 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %7 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %8 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %7, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %9 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %10 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %8, <16 x i16> %9, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %11 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %6, <16 x i16> %10, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %12 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %5, <16 x i16> %11, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %13 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %14 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.3, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %15 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %14, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %16 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %17 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %15, <16 x i16> %16, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %18 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %13, <16 x i16> %17, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %19 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %20 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %21 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %20, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %22 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %23 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %21, <16 x i16> %22, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %24 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %19, <16 x i16> %23, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %25 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %18, <16 x i16> %24, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %26 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %12, <16 x i16> %25, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %27 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %28 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.6, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %29 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %28, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %30 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %31 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %29, <16 x i16> %30, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %32 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %27, <16 x i16> %31, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %33 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %34 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.7, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %35 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %34, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %36 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %37 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %35, <16 x i16> %36, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %38 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %33, <16 x i16> %37, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %39 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %32, <16 x i16> %38, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %40 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %41 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %42 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %41, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %43 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %44 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %42, <16 x i16> %43, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %45 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %40, <16 x i16> %44, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %46 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %47 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %48 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %47, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %49 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %50 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %48, <16 x i16> %49, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %51 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %46, <16 x i16> %50, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %52 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %45, <16 x i16> %51, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %53 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %39, <16 x i16> %52, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %54 = call <16 x i16> @llvm.hydride._mm_sub_epi8_dsl(<16 x i16> %26, <16 x i16> %53, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %55 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <16 x i16> %54, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %56 = call <16 x i8> @llvm.hydride._mm256_cvtepi16_epi8_dsl(<16 x i16> %55, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  ret <16 x i8> %56
}

declare <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, <1 x i16> %arg.8, i32 %arg.9, i32 %arg.10)

declare <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i16> @llvm.hydride._mm_sub_epi8_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <16 x i8> @llvm.hydride._mm256_cvtepi16_epi8_dsl(<16 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

define <16 x i32> @hydride.node.8(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.9(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.10(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.11(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.12(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.13(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.14(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i8> @hydride.node.15(<16 x i8> %arg, <16 x i8> %arg.1, <16 x i8> %arg.2, <16 x i8> %arg.3, <16 x i8> %arg.4, <16 x i8> %arg.5, <16 x i8> %arg.6, <16 x i8> %arg.7, <16 x i8> %arg.8, <16 x i8> %arg.9)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %1 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %2 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %1, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %3 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %4 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %2, <16 x i16> %3, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %5 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %0, <16 x i16> %4, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %6 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %7 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %8 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %7, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %9 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %10 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %8, <16 x i16> %9, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %11 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %6, <16 x i16> %10, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %12 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %5, <16 x i16> %11, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %13 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %14 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.3, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %15 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %14, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %16 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %17 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %15, <16 x i16> %16, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %18 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %13, <16 x i16> %17, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %19 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %20 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %21 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %20, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %22 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %23 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %21, <16 x i16> %22, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %24 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %19, <16 x i16> %23, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %25 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %18, <16 x i16> %24, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %26 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %12, <16 x i16> %25, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %27 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %28 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.6, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %29 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %28, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %30 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %31 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %29, <16 x i16> %30, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %32 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %27, <16 x i16> %31, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %33 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %34 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.7, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %35 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %34, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %36 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %37 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %35, <16 x i16> %36, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %38 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %33, <16 x i16> %37, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %39 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %32, <16 x i16> %38, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %40 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %41 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %42 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %41, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %43 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %44 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %42, <16 x i16> %43, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %45 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %40, <16 x i16> %44, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %46 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %47 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %48 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %47, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %49 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %50 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %48, <16 x i16> %49, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %51 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %46, <16 x i16> %50, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %52 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %45, <16 x i16> %51, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %53 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %39, <16 x i16> %52, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %54 = call <16 x i16> @llvm.hydride._mm_sub_epi8_dsl(<16 x i16> %26, <16 x i16> %53, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %55 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <16 x i16> %54, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %56 = call <16 x i8> @llvm.hydride._mm256_cvtepi16_epi8_dsl(<16 x i16> %55, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  ret <16 x i8> %56
}

define <16 x i8> @hydride.node.16(<16 x i8> %arg, <16 x i8> %arg.1, <16 x i8> %arg.2, <16 x i8> %arg.3, <16 x i8> %arg.4, <16 x i8> %arg.5, <16 x i8> %arg.6, <16 x i8> %arg.7, <16 x i8> %arg.8, <16 x i8> %arg.9)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %1 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.7, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %2 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %1, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %3 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %4 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %2, <16 x i16> %3, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %5 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %0, <16 x i16> %4, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %6 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %7 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.6, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %8 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %7, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %9 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %10 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %8, <16 x i16> %9, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %11 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %6, <16 x i16> %10, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %12 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %5, <16 x i16> %11, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %13 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %14 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.3, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %15 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %14, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %16 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %17 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %15, <16 x i16> %16, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %18 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %13, <16 x i16> %17, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %19 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %20 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %21 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %20, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %22 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %23 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %21, <16 x i16> %22, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %24 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %19, <16 x i16> %23, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %25 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %18, <16 x i16> %24, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %26 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %12, <16 x i16> %25, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %27 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %28 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %29 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %28, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %30 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %31 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %29, <16 x i16> %30, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %32 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %27, <16 x i16> %31, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %33 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %34 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.3, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %35 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %34, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %36 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %37 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %35, <16 x i16> %36, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %38 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %33, <16 x i16> %37, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %39 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %32, <16 x i16> %38, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %40 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %41 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %42 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %41, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %43 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %44 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %42, <16 x i16> %43, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %45 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %40, <16 x i16> %44, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %46 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %47 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %48 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %47, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %49 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %50 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %48, <16 x i16> %49, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %51 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %46, <16 x i16> %50, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %52 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %45, <16 x i16> %51, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %53 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %39, <16 x i16> %52, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %54 = call <16 x i16> @llvm.hydride._mm_sub_epi8_dsl(<16 x i16> %26, <16 x i16> %53, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %55 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <16 x i16> %54, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %56 = call <16 x i8> @llvm.hydride._mm256_cvtepi16_epi8_dsl(<16 x i16> %55, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  ret <16 x i8> %56
}

define <16 x i32> @hydride.node.17(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.18(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.19(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.20(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.21(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.22(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.23(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i8> @hydride.node.24(<16 x i8> %arg, <16 x i8> %arg.1, <16 x i8> %arg.2, <16 x i8> %arg.3, <16 x i8> %arg.4, <16 x i8> %arg.5, <16 x i8> %arg.6, <16 x i8> %arg.7, <16 x i8> %arg.8, <16 x i8> %arg.9)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %1 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %2 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %1, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %3 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %4 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %2, <16 x i16> %3, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %5 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %0, <16 x i16> %4, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %6 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %7 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %8 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %7, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %9 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %10 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %8, <16 x i16> %9, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %11 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %6, <16 x i16> %10, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %12 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %5, <16 x i16> %11, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %13 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %14 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.3, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %15 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %14, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %16 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %17 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %15, <16 x i16> %16, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %18 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %13, <16 x i16> %17, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %19 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %20 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %21 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %20, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %22 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %23 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %21, <16 x i16> %22, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %24 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %19, <16 x i16> %23, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %25 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %18, <16 x i16> %24, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %26 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %12, <16 x i16> %25, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %27 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %28 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.6, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %29 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %28, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %30 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %31 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %29, <16 x i16> %30, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %32 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %27, <16 x i16> %31, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %33 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %34 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.7, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %35 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %34, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %36 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %37 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %35, <16 x i16> %36, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %38 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %33, <16 x i16> %37, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %39 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %32, <16 x i16> %38, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %40 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %41 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %42 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %41, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %43 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %44 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %42, <16 x i16> %43, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %45 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %40, <16 x i16> %44, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %46 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %47 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %48 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %47, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %49 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %50 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %48, <16 x i16> %49, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %51 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %46, <16 x i16> %50, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %52 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %45, <16 x i16> %51, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %53 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %39, <16 x i16> %52, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %54 = call <16 x i16> @llvm.hydride._mm_sub_epi8_dsl(<16 x i16> %26, <16 x i16> %53, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %55 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <16 x i16> %54, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %56 = call <16 x i8> @llvm.hydride._mm256_cvtepi16_epi8_dsl(<16 x i16> %55, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  ret <16 x i8> %56
}

define <16 x i32> @hydride.node.25(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.26(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.27(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.28(<1 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._mm512_dpwssd_epi32_dsl(<16 x i32> %0, <32 x i16> <i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1, i16 0, i16 1>, <32 x i16> <i16 0, i16 0, i16 0, i16 1, i16 0, i16 2, i16 0, i16 3, i16 0, i16 4, i16 0, i16 5, i16 0, i16 6, i16 0, i16 7, i16 0, i16 8, i16 0, i16 9, i16 0, i16 10, i16 0, i16 11, i16 0, i16 12, i16 0, i16 13, i16 0, i16 14, i16 0, i16 15>, i32 512, i32 32, i32 32, i32 16, i32 0, i32 0)
  %2 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %3 = call <16 x i32> @llvm.hydride._mm256_min_epi8_dsl(<16 x i32> %1, <16 x i32> %2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  %4 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.2, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %5 = call <16 x i32> @llvm.hydride._mm256_max_epi64_dsl(<16 x i32> %3, <16 x i32> %4, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %5
}

define <16 x i32> @hydride.node.29(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.30(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i32> @hydride.node.31(<16 x i32> %arg, <1 x i32> %arg.1)
{
entry:
  %0 = call <16 x i32> @llvm.hydride._mm512_broadcastd_epi32_dsl(<1 x i32> %arg.1, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0, i32 0)
  %1 = call <16 x i32> @llvm.hydride._m_paddd_dsl(<16 x i32> %0, <16 x i32> %arg, i32 512, i32 512, i32 512, i32 32, i32 0, i32 0)
  ret <16 x i32> %1
}

define <16 x i8> @hydride.node.32(<16 x i8> %arg, <16 x i8> %arg.1, <16 x i8> %arg.2, <16 x i8> %arg.3, <16 x i8> %arg.4, <16 x i8> %arg.5, <16 x i8> %arg.6, <16 x i8> %arg.7, <16 x i8> %arg.8, <16 x i8> %arg.9)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %1 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %2 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %1, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %3 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %4 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %2, <16 x i16> %3, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %5 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %0, <16 x i16> %4, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %6 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %7 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %8 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %7, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %9 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %10 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %8, <16 x i16> %9, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %11 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %6, <16 x i16> %10, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %12 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %5, <16 x i16> %11, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %13 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %14 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.3, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %15 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %14, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %16 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %17 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %15, <16 x i16> %16, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %18 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %13, <16 x i16> %17, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %19 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %20 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %21 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %20, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %22 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %23 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %21, <16 x i16> %22, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %24 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %19, <16 x i16> %23, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %25 = call <16 x i16> @llvm.hydride._mm512_max_epu32_dsl(<16 x i16> %18, <16 x i16> %24, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %26 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %12, <16 x i16> %25, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %27 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %28 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.6, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %29 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %28, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %30 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %31 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %29, <16 x i16> %30, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %32 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %27, <16 x i16> %31, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %33 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %34 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.7, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %35 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %34, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %36 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %37 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %35, <16 x i16> %36, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %38 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %33, <16 x i16> %37, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %39 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %32, <16 x i16> %38, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %40 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.4, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %41 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.8, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %42 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %41, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %43 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.1, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %44 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %42, <16 x i16> %43, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %45 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %40, <16 x i16> %44, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %46 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.5, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %47 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.9, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %48 = call <16 x i16> @llvm.hydride._mm_sllv_epi64_dsl(<16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %47, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, i32 256, i32 256, i32 256, i32 16, i32 0, <1 x i16> <i16 16>, i32 16, i32 0)
  %49 = call <16 x i16> @llvm.hydride._mm256_cvtepu8_epi16_dsl(<16 x i8> %arg.2, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  %50 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %48, <16 x i16> %49, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %51 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %46, <16 x i16> %50, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %52 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> %45, <16 x i16> %51, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %53 = call <16 x i16> @llvm.hydride._m_paddd_dsl.1(<16 x i16> %39, <16 x i16> %52, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %54 = call <16 x i16> @llvm.hydride._mm_sub_epi8_dsl(<16 x i16> %26, <16 x i16> %53, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %55 = call <16 x i16> @llvm.hydride._mm512_min_epu64_dsl(<16 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <16 x i16> %54, i32 256, i32 256, i32 256, i32 16, i32 0, i32 0)
  %56 = call <16 x i8> @llvm.hydride._mm256_cvtepi16_epi8_dsl(<16 x i16> %55, i32 256, i32 256, i32 128, i32 8, i32 0, i32 16, i32 0)
  ret <16 x i8> %56
}
