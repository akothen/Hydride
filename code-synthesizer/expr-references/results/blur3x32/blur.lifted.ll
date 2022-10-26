; ModuleID = "blur"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <16 x i16> @hydride.node.0(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.1, <16 x i16> %arg.2, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg, <16 x i16> %0, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm512_div_epu16_dsl(<16 x i16> %1, <16 x i16> <i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3>, i32 256, i32 16, i32 32)
  ret <16 x i16> %2
}

declare <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3)

declare <16 x i16> @llvm.hydride._mm512_div_epu16_dsl(<16 x i16> %arg, <16 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4)

define <16 x i16> @hydride.node.1(<16 x i16> %arg, <16 x i16> %arg.1, <16 x i16> %arg.2)
{
entry:
  %0 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg.1, <16 x i16> %arg.2, i32 256, i32 16)
  %1 = call <16 x i16> @llvm.hydride._mm256_add_epi8_dsl(<16 x i16> %arg, <16 x i16> %0, i32 256, i32 16)
  %2 = call <16 x i16> @llvm.hydride._mm512_div_epu16_dsl(<16 x i16> %1, <16 x i16> <i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3, i16 3>, i32 256, i32 16, i32 32)
  ret <16 x i16> %2
}
