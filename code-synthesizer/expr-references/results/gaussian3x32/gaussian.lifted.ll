; ModuleID = "gaussian"
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

define <16 x i16> @hydride.node.2(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

declare <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2, <16 x i16> %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

define <16 x i16> @hydride.node.3(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.4(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.5(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.6(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.7(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.8(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.9(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.10(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <32 x i8> @hydride.node.11(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

declare <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

declare <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> %arg, <32 x i16> %arg.1, <1 x i16> %arg.2, <32 x i16> %arg.3, <1 x i16> %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4)

define <32 x i8> @hydride.node.12(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <32 x i8> @hydride.node.13(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <32 x i8> @hydride.node.14(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
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

define <16 x i16> @hydride.node.20(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.21(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <16 x i16> @hydride.node.22(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm512_sllv_epi64_dsl(<1 x i16> <i16 16>, <16 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>, <16 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, <16 x i16> %arg, i32 256, i32 16, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.2, <16 x i16> %arg.1, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %0, <16 x i16> %1, i32 256, i32 16)
  ret <16 x i16> %2
}

define <32 x i8> @hydride.node.23(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <32 x i8> @hydride.node.24(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <32 x i8> @hydride.node.25(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}

define <32 x i8> @hydride.node.26(<32 x i16> %arg)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._mm256_add_epi8_dsl.1(<32 x i16> %arg, <32 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, i32 512, i32 16)
  %1 = call <32 x i16> @llvm.hydride._mm512_srav_epi64_dsl(<1 x i16> <i16 16>, <32 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 65535>, <32 x i16> %0, <1 x i16> <i16 0>, i32 512, i32 16, i32 16)
  %2 = call <32 x i8> @llvm.hydride._mm_cvtepi64_epi32_dsl(<32 x i16> %1, i32 256, i32 8, i32 16, i32 0)
  ret <32 x i8> %2
}
