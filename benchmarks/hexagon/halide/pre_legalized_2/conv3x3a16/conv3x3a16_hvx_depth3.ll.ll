; ModuleID = "/tmp/conv3x3a16_hvx_depth3.ll"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <128 x i8> @hydride.node.conv3x3a16_hvx_depth3.0(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4, <128 x i8> %arg.5, <128 x i8> %arg.6, <128 x i8> %arg.7, <128 x i8> %arg.8, <128 x i8> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11, <128 x i8> %arg.12, <128 x i8> %arg.13, <128 x i8> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16, <128 x i8> %arg.17)
{
entry:
  %0 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %3 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %6 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %5, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %8 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %7, <128 x i8> %8, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %12 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %11, <128 x i8> %12, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %10, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %16 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %17 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %14, <128 x i8> %15, <128 x i8> %16, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %18 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %19 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %20 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %18, <128 x i8> %19, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %21 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %17, <128 x i16> %20, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %22 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %23 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %24 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %22, <128 x i8> %23, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %25 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %21, <128 x i16> %24, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %26 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %27 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %25, <128 x i8> %26, <128 x i8> %27, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %29 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %30 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %29, <128 x i8> %30, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %32 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %28, <128 x i16> %31, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %34 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %35 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %36 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %37 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %35, <128 x i8> %36, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %38 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %39 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %40 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %38, <128 x i8> %39, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %41 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %37, <128 x i16> %40, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %42 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %43 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %44 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %42, <128 x i8> %43, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %45 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %41, <128 x i16> %44, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %47 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %48 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %46, <128 x i8> %47, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %49 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %45, <128 x i16> %48, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %50 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %51 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %52 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %49, <128 x i8> %50, <128 x i8> %51, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %53 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %54 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %55 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %53, <128 x i8> %54, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %56 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %52, <128 x i16> %55, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %57 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %58 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %57, <128 x i8> %58, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %60 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %56, <128 x i16> %59, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %62 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %63 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %60, <128 x i8> %61, <128 x i8> %62, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %64 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %65 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %66 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %64, <128 x i8> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %67 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %63, <128 x i16> %66, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %68 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %69 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %68, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %70 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %34, <64 x i16> %69, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  ret <128 x i8> %70
}

declare <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %arg, <128 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22, i32 %arg.23)

declare <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> %arg, <1 x i16> %arg.1, <64 x i16> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18)

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.1(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

declare <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.2(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.3(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.4(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.5(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.6(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <128 x i8> @hydride.node.conv3x3a16_hvx_depth3.7(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4, <128 x i8> %arg.5, <128 x i8> %arg.6, <128 x i8> %arg.7, <128 x i8> %arg.8, <128 x i8> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11, <128 x i8> %arg.12, <128 x i8> %arg.13, <128 x i8> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16, <128 x i8> %arg.17)
{
entry:
  %0 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %3 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %6 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %5, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %8 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %7, <128 x i8> %8, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %12 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %11, <128 x i8> %12, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %10, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %16 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %17 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %14, <128 x i8> %15, <128 x i8> %16, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %18 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %19 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %20 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %18, <128 x i8> %19, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %21 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %17, <128 x i16> %20, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %22 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %23 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %24 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %22, <128 x i8> %23, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %25 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %21, <128 x i16> %24, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %26 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %27 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %25, <128 x i8> %26, <128 x i8> %27, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %29 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %30 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %29, <128 x i8> %30, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %32 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %28, <128 x i16> %31, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %34 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %35 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %36 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %37 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %35, <128 x i8> %36, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %38 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %39 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %40 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %38, <128 x i8> %39, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %41 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %37, <128 x i16> %40, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %42 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %43 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %44 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %42, <128 x i8> %43, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %45 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %41, <128 x i16> %44, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %47 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %48 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %46, <128 x i8> %47, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %49 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %45, <128 x i16> %48, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %50 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %51 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %52 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %49, <128 x i8> %50, <128 x i8> %51, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %53 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %54 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %55 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %53, <128 x i8> %54, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %56 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %52, <128 x i16> %55, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %57 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %58 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %57, <128 x i8> %58, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %60 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %56, <128 x i16> %59, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %62 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %63 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %60, <128 x i8> %61, <128 x i8> %62, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %64 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %65 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %66 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %64, <128 x i8> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %67 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %63, <128 x i16> %66, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %68 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %69 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %68, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %70 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %34, <64 x i16> %69, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  ret <128 x i8> %70
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.8(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.9(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.10(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.11(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.12(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.13(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <128 x i8> @hydride.node.conv3x3a16_hvx_depth3.14(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4, <128 x i8> %arg.5, <128 x i8> %arg.6, <128 x i8> %arg.7, <128 x i8> %arg.8, <128 x i8> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11, <128 x i8> %arg.12, <128 x i8> %arg.13, <128 x i8> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16, <128 x i8> %arg.17)
{
entry:
  %0 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %3 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %6 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %5, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %8 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %7, <128 x i8> %8, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %12 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %11, <128 x i8> %12, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %10, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %16 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %17 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %14, <128 x i8> %15, <128 x i8> %16, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %18 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %19 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %20 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %18, <128 x i8> %19, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %21 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %17, <128 x i16> %20, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %22 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %23 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %24 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %22, <128 x i8> %23, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %25 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %21, <128 x i16> %24, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %26 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %27 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %25, <128 x i8> %26, <128 x i8> %27, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %29 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %30 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %29, <128 x i8> %30, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %32 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %28, <128 x i16> %31, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %34 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %35 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %36 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %37 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %35, <128 x i8> %36, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %38 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %39 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %40 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %38, <128 x i8> %39, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %41 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %37, <128 x i16> %40, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %42 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %43 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %44 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %42, <128 x i8> %43, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %45 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %41, <128 x i16> %44, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %47 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %48 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %46, <128 x i8> %47, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %49 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %45, <128 x i16> %48, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %50 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %51 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %52 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %49, <128 x i8> %50, <128 x i8> %51, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %53 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %54 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %55 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %53, <128 x i8> %54, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %56 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %52, <128 x i16> %55, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %57 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %58 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %57, <128 x i8> %58, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %60 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %56, <128 x i16> %59, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %62 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %63 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %60, <128 x i8> %61, <128 x i8> %62, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %64 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %65 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %66 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %64, <128 x i8> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %67 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %63, <128 x i16> %66, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %68 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %69 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %68, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %70 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %34, <64 x i16> %69, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  ret <128 x i8> %70
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.15(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.16(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.17(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.18(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.19(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.20(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <128 x i8> @hydride.node.conv3x3a16_hvx_depth3.21(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4, <128 x i8> %arg.5, <128 x i8> %arg.6, <128 x i8> %arg.7, <128 x i8> %arg.8, <128 x i8> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11, <128 x i8> %arg.12, <128 x i8> %arg.13, <128 x i8> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16, <128 x i8> %arg.17)
{
entry:
  %0 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %2 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %3 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %6 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %2, <128 x i16> %5, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %8 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %9 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %7, <128 x i8> %8, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %6, <128 x i16> %9, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %11 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %12 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %13 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %11, <128 x i8> %12, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %14 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %10, <128 x i16> %13, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %15 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %16 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %17 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %14, <128 x i8> %15, <128 x i8> %16, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %18 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %19 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %20 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %18, <128 x i8> %19, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %21 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %17, <128 x i16> %20, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %22 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %23 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %24 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %22, <128 x i8> %23, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %25 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %21, <128 x i16> %24, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %26 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %27 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %28 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %25, <128 x i8> %26, <128 x i8> %27, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %29 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %30 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %29, <128 x i8> %30, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %32 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %28, <128 x i16> %31, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %33 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %32, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %34 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %35 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.16, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %36 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.17, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %37 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %35, <128 x i8> %36, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %38 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.14, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %39 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.15, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %40 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %38, <128 x i8> %39, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %41 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %37, <128 x i16> %40, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %42 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.12, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %43 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.13, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %44 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %42, <128 x i8> %43, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %45 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %41, <128 x i16> %44, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.10, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %47 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.11, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %48 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %46, <128 x i8> %47, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %49 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %45, <128 x i16> %48, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %50 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.8, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %51 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.9, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %52 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %49, <128 x i8> %50, <128 x i8> %51, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %53 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %54 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %55 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %53, <128 x i8> %54, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %56 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %52, <128 x i16> %55, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %57 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %58 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %57, <128 x i8> %58, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %60 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %56, <128 x i16> %59, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %62 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %63 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<128 x i16> %60, <128 x i8> %61, <128 x i8> %62, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 -1, i32 1, i32 0, i32 16, i32 -1, i32 1, i32 0, i32 8, i32 1024, i32 2, i32 0)
  %64 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %65 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %66 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpybv_128B_dsl(<128 x i8> %64, <128 x i8> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 1, i32 16, i32 1024, i32 1, i32 1, i32 8, i32 2, i32 0)
  %67 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %63, <128 x i16> %66, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %68 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %69 = call <64 x i16> @llvm.hydride.hexagon_V6_vlsrwv_128B_dsl(<64 x i16> <i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4, i16 4>, <1 x i16> <i16 0>, <64 x i16> %68, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %70 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %34, <64 x i16> %69, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  ret <128 x i8> %70
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.22(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.23(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.24(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.25(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.26(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

define <256 x i8> @hydride.node.conv3x3a16_hvx_depth3.27(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}
