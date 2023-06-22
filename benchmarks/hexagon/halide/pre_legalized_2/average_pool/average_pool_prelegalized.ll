; ModuleID = "/tmp/average_pool_hvx_depth3.ll"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <128 x i16> @hydride.node.average_pool_hvx_depth3.0(<128 x i16> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %1 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %0, <128 x i16> %arg, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  ret <128 x i16> %1
}

declare <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %arg, <128 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

define <128 x i8> @hydride.node.average_pool_hvx_depth3.1(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, <64 x i16> %arg.3, <128 x i8> %arg.4, <128 x i8> %arg.5)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %2 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %4 = call <64 x i32> @llvm.hydride.hexagon_V6_vshuffvdd_128B_dsl(<32 x i32> %1, <32 x i32> %3, <4 x i8> <i8 252, i8 255, i8 255, i8 255>, i32 2048, i32 2048, i32 0, i32 1024, i32 8, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_vavgwrnd_128B_dsl(<1 x i32> <i32 1>, <1 x i32> <i32 2>, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %5, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0, i32 -1, i32 -1, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<32 x i32> <i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15>, <1 x i32> <i32 0>, <32 x i32> %6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %8 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %10 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vshuffvdd_128B_dsl(<32 x i32> %9, <32 x i32> %11, <4 x i8> <i8 252, i8 255, i8 255, i8 255>, i32 2048, i32 2048, i32 0, i32 1024, i32 8, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_vavgwrnd_128B_dsl(<1 x i32> <i32 1>, <1 x i32> <i32 2>, <32 x i32> %13, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0, i32 -1, i32 -1, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<32 x i32> <i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15>, <1 x i32> <i32 0>, <32 x i32> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<32 x i32> %7, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<64 x i16> %16, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0, i32 0)
  %18 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %20 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %22 = call <64 x i32> @llvm.hydride.hexagon_V6_vshuffvdd_128B_dsl(<32 x i32> %19, <32 x i32> %21, <4 x i8> <i8 252, i8 255, i8 255, i8 255>, i32 2048, i32 2048, i32 0, i32 1024, i32 8, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_vavgwrnd_128B_dsl(<1 x i32> <i32 1>, <1 x i32> <i32 2>, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %23, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0, i32 -1, i32 -1, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<32 x i32> <i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15>, <1 x i32> <i32 0>, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %26 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %28 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 32, i32 1024, i32 1, i32 1, i32 16, i32 2, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %28, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %30 = call <64 x i32> @llvm.hydride.hexagon_V6_vshuffvdd_128B_dsl(<32 x i32> %27, <32 x i32> %29, <4 x i8> <i8 252, i8 255, i8 255, i8 255>, i32 2048, i32 2048, i32 0, i32 1024, i32 8, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_vavgwrnd_128B_dsl(<1 x i32> <i32 1>, <1 x i32> <i32 2>, <32 x i32> %31, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0, i32 -1, i32 -1, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<32 x i32> <i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15, i32 15>, <1 x i32> <i32 0>, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %34 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<32 x i32> %25, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %35 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<64 x i16> %34, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0, i32 0)
  %36 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.1(<64 x i16> %17, <64 x i16> %35, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %37 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %arg.4, <128 x i8> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %38 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.5, <128 x i8> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %38
}

declare <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20)

declare <32 x i32> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <32 x i32> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <64 x i32> @llvm.hydride.hexagon_V6_vshuffvdd_128B_dsl(<32 x i32> %arg, <32 x i32> %arg.1, <4 x i8> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <32 x i32> @llvm.hydride.hexagon_V6_vavgwrnd_128B_dsl(<1 x i32> %arg, <1 x i32> %arg.1, <32 x i32> %arg.2, <32 x i32> %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12)

declare <32 x i32> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<32 x i32> %arg, <1 x i32> %arg.1, <32 x i32> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<32 x i32> %arg, <32 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14)

declare <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14)

declare <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)
