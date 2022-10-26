; ModuleID = "median"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <32 x i8> @hydride.node.0(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %arg.1, i32 256, i32 8)
  ret <32 x i8> %1
}

declare <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg, <32 x i8> %arg.1, i32 %arg.2, i32 %arg.3)

define <32 x i8> @hydride.node.1(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %0, <32 x i8> %arg, i32 256, i32 8)
  ret <32 x i8> %1
}

declare <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg, <32 x i8> %arg.1, i32 %arg.2, i32 %arg.3)

define <32 x i8> @hydride.node.2(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %0, <32 x i8> %arg, i32 256, i32 8)
  ret <32 x i8> %1
}

define <32 x i8> @hydride.node.3(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %arg.1, i32 256, i32 8)
  ret <32 x i8> %1
}

define <32 x i8> @hydride.node.4(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.1, <32 x i8> %arg.2, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %2 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %1, <32 x i8> %arg, i32 256, i32 8)
  %3 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %2, i32 256, i32 8)
  ret <32 x i8> %3
}

define <32 x i8> @hydride.node.5(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.1, <32 x i8> %arg.2, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %2 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %1, <32 x i8> %arg, i32 256, i32 8)
  %3 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %2, i32 256, i32 8)
  ret <32 x i8> %3
}

define <32 x i8> @hydride.node.6(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2, <32 x i8> %arg.3, <32 x i8> %arg.4, <32 x i8> %arg.5, <32 x i8> %arg.6)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg, <32 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.2, <32 x i8> %arg.3, i32 256, i32 8)
  %2 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.5, <32 x i8> %arg.6, i32 256, i32 8)
  %3 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.6, <32 x i8> %arg.5, i32 256, i32 8)
  %4 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %3, <32 x i8> %arg.4, i32 256, i32 8)
  %5 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %2, <32 x i8> %4, i32 256, i32 8)
  %6 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.3, <32 x i8> %arg.2, i32 256, i32 8)
  %7 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %5, <32 x i8> %6, i32 256, i32 8)
  %8 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %1, <32 x i8> %7, i32 256, i32 8)
  %9 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.1, <32 x i8> %arg, i32 256, i32 8)
  %10 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %8, <32 x i8> %9, i32 256, i32 8)
  %11 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %10, i32 256, i32 8)
  ret <32 x i8> %11
}

define <32 x i8> @hydride.node.7(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %0, <32 x i8> %arg, i32 256, i32 8)
  ret <32 x i8> %1
}

define <32 x i8> @hydride.node.8(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %arg.1, i32 256, i32 8)
  ret <32 x i8> %1
}

define <32 x i8> @hydride.node.9(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.1, <32 x i8> %arg.2, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %2 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %1, <32 x i8> %arg, i32 256, i32 8)
  %3 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %2, i32 256, i32 8)
  ret <32 x i8> %3
}

define <32 x i8> @hydride.node.10(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.1, <32 x i8> %arg.2, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.2, <32 x i8> %arg.1, i32 256, i32 8)
  %2 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %1, <32 x i8> %arg, i32 256, i32 8)
  %3 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %2, i32 256, i32 8)
  ret <32 x i8> %3
}

define <32 x i8> @hydride.node.11(<32 x i8> %arg, <32 x i8> %arg.1, <32 x i8> %arg.2, <32 x i8> %arg.3, <32 x i8> %arg.4, <32 x i8> %arg.5, <32 x i8> %arg.6)
{
entry:
  %0 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg, <32 x i8> %arg.1, i32 256, i32 8)
  %1 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.2, <32 x i8> %arg.3, i32 256, i32 8)
  %2 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %arg.5, <32 x i8> %arg.6, i32 256, i32 8)
  %3 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.6, <32 x i8> %arg.5, i32 256, i32 8)
  %4 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %3, <32 x i8> %arg.4, i32 256, i32 8)
  %5 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %2, <32 x i8> %4, i32 256, i32 8)
  %6 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.3, <32 x i8> %arg.2, i32 256, i32 8)
  %7 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %5, <32 x i8> %6, i32 256, i32 8)
  %8 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %1, <32 x i8> %7, i32 256, i32 8)
  %9 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %arg.1, <32 x i8> %arg, i32 256, i32 8)
  %10 = call <32 x i8> @llvm.hydride._m_pminub_dsl(<32 x i8> %8, <32 x i8> %9, i32 256, i32 8)
  %11 = call <32 x i8> @llvm.hydride._mm512_max_epu64_dsl(<32 x i8> %0, <32 x i8> %10, i32 256, i32 8)
  ret <32 x i8> %11
}
