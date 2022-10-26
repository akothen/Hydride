; ModuleID = "max_pool"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <32 x i8> @hydride.node.0(<32 x i8> %arg, <32 x i8> %arg.1)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.1, <32 x i8> %arg, i32 256, i32 8)
  ret <32 x i8> %0
}

declare <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg, <32 x i8> %arg.1, i32 %arg.2, i32 %arg.3)

define <32 x i8> @hydride.node.1(<32 x i8> %arg, <1 x i8> %arg.1)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._mm_set1_pi8_dsl(<1 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %0, <32 x i8> %arg, i32 256, i32 8)
  ret <32 x i8> %1
}

declare <32 x i8> @llvm.hydride._mm_set1_pi8_dsl(<1 x i8> %arg, i32 %arg.1, i32 %arg.2)

declare <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg, <32 x i8> %arg.1, i32 %arg.2, i32 %arg.3)

define <32 x i8> @hydride.node.2(<32 x i8> %arg, <1 x i8> %arg.1)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._mm_set1_pi8_dsl(<1 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %0, <32 x i8> %arg, i32 256, i32 8)
  ret <32 x i8> %1
}
