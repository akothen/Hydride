; ModuleID = "hydride.node.1.module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <32 x i16> @hydride.node.1(<32 x i16> %arg, <32 x i16> %arg.1, <32 x i16> %arg.2, <32 x i16> %arg.3, <32 x i16> %arg.4, <32 x i16> %arg.5, <32 x i16> %arg.6, <32 x i16> %arg.7, <32 x i16> %arg.8, <32 x i16> %arg.9)
{
entry:
  %0 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.9, <32 x i16> %arg.8, i32 512, i32 512, i32 512, i32 16, i32 0)
  %1 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %0, <32 x i16> %arg.7, i32 512, i32 512, i32 512, i32 16, i32 0)
  %2 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.2, <32 x i16> %arg.6, i32 512, i32 512, i32 512, i32 16, i32 0)
  %3 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.5, <32 x i16> %2, i32 512, i32 512, i32 512, i32 16, i32 0)
  %4 = call <32 x i16> @llvm.hydride._m_pmaxub_dsl(<32 x i16> %1, <32 x i16> %3, i32 512, i32 512, i32 512, i32 16, i32 0)
  %5 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.9, <32 x i16> %arg.8, i32 512, i32 512, i32 512, i32 16, i32 0)
  %6 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %5, <32 x i16> %arg.7, i32 512, i32 512, i32 512, i32 16, i32 0)
  %7 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.2, <32 x i16> %arg.6, i32 512, i32 512, i32 512, i32 16, i32 0)
  %8 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.5, <32 x i16> %7, i32 512, i32 512, i32 512, i32 16, i32 0)
  %9 = call <32 x i16> @llvm.hydride._mm512_min_epu64_dsl(<32 x i16> %6, <32 x i16> %8, i32 512, i32 512, i32 512, i32 16, i32 0)
  %10 = call <32 x i16> @llvm.hydride._mm512_sub_epi8_dsl(<32 x i16> %4, <32 x i16> %9, i32 512, i32 512, i32 512, i32 16, i32 0)
  %11 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg, <32 x i16> %arg.1, i32 512, i32 512, i32 512, i32 16, i32 0)
  %12 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %11, <32 x i16> %arg.2, i32 512, i32 512, i32 512, i32 16, i32 0)
  %13 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.3, <32 x i16> %arg.4, i32 512, i32 512, i32 512, i32 16, i32 0)
  %14 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %13, <32 x i16> %arg.5, i32 512, i32 512, i32 512, i32 16, i32 0)
  %15 = call <32 x i16> @llvm.hydride._m_pmaxub_dsl(<32 x i16> %12, <32 x i16> %14, i32 512, i32 512, i32 512, i32 16, i32 0)
  %16 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg.3, <32 x i16> %arg.4, i32 512, i32 512, i32 512, i32 16, i32 0)
  %17 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %16, <32 x i16> %arg.5, i32 512, i32 512, i32 512, i32 16, i32 0)
  %18 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg, <32 x i16> %arg.1, i32 512, i32 512, i32 512, i32 16, i32 0)
  %19 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %18, <32 x i16> %arg.2, i32 512, i32 512, i32 512, i32 16, i32 0)
  %20 = call <32 x i16> @llvm.hydride._mm512_min_epu64_dsl(<32 x i16> %17, <32 x i16> %19, i32 512, i32 512, i32 512, i32 16, i32 0)
  %21 = call <32 x i16> @llvm.hydride._mm512_sub_epi8_dsl(<32 x i16> %15, <32 x i16> %20, i32 512, i32 512, i32 512, i32 16, i32 0)
  %22 = call <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %10, <32 x i16> %21, i32 512, i32 512, i32 512, i32 16, i32 0)
  %23 = call <32 x i16> @llvm.hydride._mm512_min_epu64_dsl(<32 x i16> %22, <32 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 512, i32 512, i32 512, i32 16, i32 0)
  ret <32 x i16> %23
}

declare <32 x i16> @llvm.hydride._m_paddw_dsl(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <32 x i16> @llvm.hydride._m_pmaxub_dsl(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <32 x i16> @llvm.hydride._mm512_min_epu64_dsl(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <32 x i16> @llvm.hydride._mm512_sub_epi8_dsl(<32 x i16> %arg, <32 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)
