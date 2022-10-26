; ModuleID = "sobel"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <32 x i16> @hydride.node.0(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

declare <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3)

define <32 x i16> @hydride.node.1(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.2(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.3(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.4(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.5(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.6(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.7(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.8(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.9(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <32 x i16> @hydride.node.10(<32 x i8> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_cvtepu16_epi32_dsl(<32 x i8> %arg, i32 256, i32 8, i32 16)
  ret <32 x i16> %0
}

define <16 x i16> @hydride.node.11(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

declare <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2, <16 x i16> %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

define <16 x i16> @hydride.node.12(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.13(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.14(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.15(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.16(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.17(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.18(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.19(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.20(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

declare <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

declare <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

declare <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

define <16 x i16> @hydride.node.21(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.22(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.23(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.24(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.25(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.26(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.27(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.28(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.29(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.30(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.31(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.32(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.33(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.34(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.35(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.36(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.37(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.38(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.39(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.40(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.41(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.42(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.43(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <32 x i8> @hydride.node.44(<32 x i16> %arg, <32 x i16> %arg.1)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg.1, <32 x i16> %arg, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._m_pminub_dsl.1(<32 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <32 x i16> %0, i32 512, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

declare <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

declare <32 x i16> @llvm.hydride._m_pminub_dsl.1(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

declare <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4)

define <32 x i8> @hydride.node.45(<32 x i16> %arg, <32 x i16> %arg.1)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg.1, <32 x i16> %arg, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._m_pminub_dsl.1(<32 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <32 x i16> %0, i32 512, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <16 x i16> @hydride.node.46(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.47(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.48(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.49(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.50(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.51(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.52(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.53(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.54(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.55(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.56(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.57(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.58(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.59(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.60(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.61(<16 x i16> %arg, <16 x i16> %arg.1)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_max_epu64_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._m_pminub_dsl(<16 x i16> %arg.1, <16 x i16> %arg, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm_sub_pi16_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <32 x i8> @hydride.node.62(<32 x i16> %arg, <32 x i16> %arg.1)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg.1, <32 x i16> %arg, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._m_pminub_dsl.1(<32 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <32 x i16> %0, i32 512, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <32 x i8> @hydride.node.63(<32 x i16> %arg, <32 x i16> %arg.1)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg.1, <32 x i16> %arg, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._m_pminub_dsl.1(<32 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, <32 x i16> %0, i32 512, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}
