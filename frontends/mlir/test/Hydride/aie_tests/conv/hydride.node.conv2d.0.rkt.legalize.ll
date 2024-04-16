; ModuleID = '/tmp/hydride.node.conv2d.0.rkt.linked.ll'
source_filename = "/tmp/hydride.node.conv2d.0.rkt.linked.ll"
target triple = "unknown-unknown-unknown"

define <8 x i32> @hydride.node.conv2d.0(<8 x i32> %arg, <8 x i32> %arg.1, <8 x i32> %arg.2) {
entry:
  %0 = call <8 x i80> @v8acc80_mul32_wrapper(<8 x i32> %arg.2, <8 x i32> %arg.1)
  %1 = call <8 x i32> @llvm.hydride.srs_8_80_to_8_32_dsl(<8 x i80> %0)
  %2 = call <8 x i32> @v8int32_add8_wrapper(<8 x i32> %arg, <8 x i32> %1)
  ret <8 x i32> %2
}

declare <8 x i32> @llvm.hydride.srs_8_80_to_8_32_dsl(<8 x i80>)

declare <8 x i32> @v8int32_add8_wrapper(<8 x i32>, <8 x i32>)

declare <8 x i80> @v8acc80_mul32_wrapper(<8 x i32>, <8 x i32>)
