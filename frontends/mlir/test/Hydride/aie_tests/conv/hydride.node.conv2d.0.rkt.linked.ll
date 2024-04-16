; ModuleID = "/tmp/hydride.node.conv2d.0.rkt"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <8 x i32> @hydride.node.conv2d.0(<8 x i32> %arg, <8 x i32> %arg.1, <8 x i32> %arg.2)
{
entry:
  %0 = call <8 x i80> @llvm.hydride.v8acc80_mul32_dsl(<8 x i32> %arg.2, <8 x i32> %arg.1)
  %1 = call <8 x i32> @llvm.hydride.srs_8_80_to_8_32_dsl(<8 x i80> %0)
  %2 = call <8 x i32> @llvm.hydride.v8int32_add8_dsl(<8 x i32> %arg, <8 x i32> %1)
  ret <8 x i32> %2
}

declare <8 x i80> @llvm.hydride.v8acc80_mul32_dsl(<8 x i32> %arg, <8 x i32> %arg.1)

declare <8 x i32> @llvm.hydride.srs_8_80_to_8_32_dsl(<8 x i80> %arg)

declare <8 x i32> @llvm.hydride.v8int32_add8_dsl(<8 x i32> %arg, <8 x i32> %arg.1)
declare <16 x i32> @v16int32_add16_wrapper(<16 x i32>, <16 x i32>)
declare <16 x i32> @v16int32_sub16_wrapper(<16 x i32>, <16 x i32>)
declare <8 x i32> @v8int32_add8_wrapper(<8 x i32>, <8 x i32>)
declare <8 x i32> @srs_8_80_to_8_32_wrapper(<8 x i80>)
declare <8 x i80> @ups_8_32_to_8_80_wrapper(<8 x i32>)
declare <8 x i80> @v8acc80_mul32_wrapper(<8 x i32>, <8 x i32>)