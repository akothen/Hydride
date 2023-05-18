; ModuleID = "/tmp/gaussian5x5_hvx_depth3.ll"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <128 x i16> @hydride.node.gaussian5x5_hvx_depth3.0(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4)
{
entry:
  %0 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %1 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %2 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %3 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, <128 x i8> %2, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %4, <128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %6 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %7 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %5, <64 x i16> <i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542>, <128 x i8> %6, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %8 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %3, <128 x i16> %7, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %1, <128 x i16> %8, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %0, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  ret <128 x i16> %10
}

declare <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20)

declare <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %arg, <64 x i16> %arg.1, <128 x i8> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22, i32 %arg.23)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %arg, <128 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

define <128 x i16> @hydride.node.gaussian5x5_hvx_depth3.1(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4)
{
entry:
  %0 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %1 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %2 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %3 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, <128 x i8> %2, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %4, <128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %6 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %7 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %5, <64 x i16> <i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542>, <128 x i8> %6, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %8 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %3, <128 x i16> %7, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %1, <128 x i16> %8, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %0, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  ret <128 x i16> %10
}

define <128 x i16> @hydride.node.gaussian5x5_hvx_depth3.2(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4)
{
entry:
  %0 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %1 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %2 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %3 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, <128 x i8> %2, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %4, <128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %6 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %7 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %5, <64 x i16> <i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542>, <128 x i8> %6, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %8 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %3, <128 x i16> %7, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %1, <128 x i16> %8, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %0, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  ret <128 x i16> %10
}

define <128 x i16> @hydride.node.gaussian5x5_hvx_depth3.3(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4)
{
entry:
  %0 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %1 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %2 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %3 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, <128 x i8> %2, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %4, <128 x i8> <i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4, i8 4>, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 16, i32 1024, i32 1, i32 0, i32 8, i32 2, i32 0)
  %6 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %7 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %5, <64 x i16> <i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542, i16 1542>, <128 x i8> %6, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %8 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %3, <128 x i16> %7, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %1, <128 x i16> %8, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %0, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  ret <128 x i16> %10
}

define <128 x i8> @hydride.node.gaussian5x5_hvx_depth3.4(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, <64 x i16> %arg.3, <64 x i16> %arg.4, <64 x i16> %arg.5, <64 x i16> %arg.6, <64 x i16> %arg.7, <64 x i16> %arg.8, <64 x i16> %arg.9)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %1 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %0, <64 x i16> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %3 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %4 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %3, <64 x i16> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %6 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %7 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %8 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %7, <64 x i16> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %5, <128 x i16> %10, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %12 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %11, <256 x i8> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %15, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %18 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %19 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %17, <64 x i16> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %21 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %22 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %20, <64 x i16> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %23 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %24 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %25 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %26 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %24, <64 x i16> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %27 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %23, <128 x i16> %26, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %22, <128 x i16> %27, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %29 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %30 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %28, <256 x i8> %29, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %19, <128 x i16> %30, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %31, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %34 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<64 x i16> %16, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  ret <128 x i8> %34
}

declare <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10)

declare <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)

declare <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %arg, <128 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg, <256 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i16> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14)

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.5(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.6(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.7(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.8(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.9(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.10(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.11(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.12(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <128 x i8> @hydride.node.gaussian5x5_hvx_depth3.13(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, <64 x i16> %arg.3, <64 x i16> %arg.4, <64 x i16> %arg.5, <64 x i16> %arg.6, <64 x i16> %arg.7, <64 x i16> %arg.8, <64 x i16> %arg.9)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %1 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %0, <64 x i16> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %3 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %4 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %3, <64 x i16> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %6 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %7 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %8 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %7, <64 x i16> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %5, <128 x i16> %10, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %12 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %11, <256 x i8> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %15, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %18 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %19 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %17, <64 x i16> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %21 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %22 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %20, <64 x i16> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %23 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %24 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %25 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %26 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %24, <64 x i16> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %27 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %23, <128 x i16> %26, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %22, <128 x i16> %27, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %29 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %30 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %28, <256 x i8> %29, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %19, <128 x i16> %30, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %31, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %34 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<64 x i16> %16, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  ret <128 x i8> %34
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.14(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.15(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.16(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.17(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.18(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.19(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.20(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.21(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <128 x i8> @hydride.node.gaussian5x5_hvx_depth3.22(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, <64 x i16> %arg.3, <64 x i16> %arg.4, <64 x i16> %arg.5, <64 x i16> %arg.6, <64 x i16> %arg.7, <64 x i16> %arg.8, <64 x i16> %arg.9)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %1 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %0, <64 x i16> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %3 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %4 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %3, <64 x i16> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %6 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %7 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %8 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %7, <64 x i16> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %5, <128 x i16> %10, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %12 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %11, <256 x i8> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %15, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %18 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %19 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %17, <64 x i16> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %21 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %22 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %20, <64 x i16> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %23 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %24 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %25 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %26 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %24, <64 x i16> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %27 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %23, <128 x i16> %26, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %22, <128 x i16> %27, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %29 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %30 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %28, <256 x i8> %29, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %19, <128 x i16> %30, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %31, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %34 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<64 x i16> %16, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  ret <128 x i8> %34
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.23(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.24(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.25(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.26(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.27(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.28(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.29(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.30(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <128 x i8> @hydride.node.gaussian5x5_hvx_depth3.31(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, <64 x i16> %arg.3, <64 x i16> %arg.4, <64 x i16> %arg.5, <64 x i16> %arg.6, <64 x i16> %arg.7, <64 x i16> %arg.8, <64 x i16> %arg.9)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %1 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %0, <64 x i16> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %3 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %4 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %3, <64 x i16> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %6 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %7 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %8 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %7, <64 x i16> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %5, <128 x i16> %10, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %12 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %11, <256 x i8> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %15, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %18 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %19 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %17, <64 x i16> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %21 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6, i16 6>, <64 x i16> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %22 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %20, <64 x i16> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %23 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.6, <64 x i16> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %24 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %25 = call <64 x i16> @llvm.hydride.hexagon_V6_vmpyih_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <64 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 32, i32 1, i32 0)
  %26 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %24, <64 x i16> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %27 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<256 x i8> %23, <128 x i16> %26, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %22, <128 x i16> %27, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %29 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg.2, <64 x i16> %arg.3, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %30 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %28, <256 x i8> %29, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %19, <128 x i16> %30, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %31, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<64 x i16> <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>, <1 x i16> <i16 0>, <64 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %34 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl(<64 x i16> %16, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  ret <128 x i8> %34
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.32(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.33(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.34(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.35(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.36(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.37(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.38(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.gaussian5x5_hvx_depth3.39(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}
