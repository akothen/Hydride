; ModuleID = "/tmp/sobel3x3_hvx_depth3.ll"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <128 x i8> @hydride.node.sobel3x3_hvx_depth3.0(<128 x i8> %arg, <128 x i8> %arg.1, <128 x i8> %arg.2, <128 x i8> %arg.3, <128 x i8> %arg.4, <128 x i8> %arg.5, <128 x i8> %arg.6, <128 x i8> %arg.7)
{
entry:
  %0 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %1 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %2 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %3 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %2, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %4 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %1, <128 x i16> %3, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %5 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %0, <128 x i16> %4, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %6 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %7 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %8 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %9 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %10 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %9, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %11 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %8, <128 x i16> %10, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %12 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %7, <128 x i16> %11, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %6, <64 x i16> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %15 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %16 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %17 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %18 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %17, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %19 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %16, <128 x i16> %18, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %20 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %15, <128 x i16> %19, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %21 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %22 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %23 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %24 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %25 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %24, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %26 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %23, <128 x i16> %25, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %27 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %22, <128 x i16> %26, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %29 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %21, <64 x i16> %28, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %30 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %14, <64 x i16> %29, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %31 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %32 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %33 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %34 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %33, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %35 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %32, <128 x i16> %34, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %36 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %31, <128 x i16> %35, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %37 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %38 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %39 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %40 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %41 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %40, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %42 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %39, <128 x i16> %41, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %43 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %38, <128 x i16> %42, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %44 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %43, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %45 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %37, <64 x i16> %44, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %46 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %47 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %48 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %49 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %48, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %50 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %47, <128 x i16> %49, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %51 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %46, <128 x i16> %50, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %52 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %53 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %54 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %55 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %56 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %55, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %57 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %54, <128 x i16> %56, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %53, <128 x i16> %57, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %59 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %58, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %52, <64 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %61 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %45, <64 x i16> %60, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %62 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %30, <128 x i16> %61, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %63 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %62, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %64 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %65 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %66 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %67 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %66, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %68 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %65, <128 x i16> %67, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %69 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %64, <128 x i16> %68, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %70 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %69, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %71 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %72 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %73 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %74 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %73, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %75 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %72, <128 x i16> %74, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %76 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %71, <128 x i16> %75, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %77 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %76, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %78 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %70, <64 x i16> %77, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %79 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %80 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %81 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %82 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %81, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %83 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %80, <128 x i16> %82, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %84 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %79, <128 x i16> %83, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %85 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %84, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %86 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %87 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %88 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.3, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %89 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %88, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %90 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %87, <128 x i16> %89, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %91 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %86, <128 x i16> %90, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %92 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %91, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %93 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %85, <64 x i16> %92, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %94 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %78, <64 x i16> %93, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %95 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %96 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %97 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %98 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %97, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %99 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %96, <128 x i16> %98, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %100 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %95, <128 x i16> %99, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %101 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %102 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %103 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %104 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %105 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %104, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %106 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %103, <128 x i16> %105, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %107 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %102, <128 x i16> %106, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %108 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %107, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %109 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %101, <64 x i16> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %110 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %111 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %112 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.6, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %113 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %112, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %114 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %111, <128 x i16> %113, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %115 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %110, <128 x i16> %114, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %116 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %117 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.5, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %118 = call <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 16, i32 1, i32 0, i32 0)
  %119 = call <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg.7, i32 1024, i32 16, i32 0, i32 16, i32 8, i32 16, i32 8, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %119, <4 x i8> <i8 2, i8 2, i8 2, i8 2>, i32 32, i32 32, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 16, i32 1, i32 1, i32 0, i32 4, i32 4, i32 16, i32 1024, i32 1, i32 0, i32 4, i32 1, i32 4, i32 8, i32 2, i32 0)
  %121 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %118, <128 x i16> %120, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %122 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %117, <128 x i16> %121, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %123 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %124 = call <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %116, <64 x i16> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 -1, i32 0, i32 0)
  %125 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %109, <64 x i16> %124, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %126 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %94, <128 x i16> %125, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 -1, i32 0)
  %127 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %126, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %128 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %63, <64 x i16> %127, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  ret <128 x i8> %128
}

declare <128 x i16> @llvm.hydride.hexagon_V6_vunpackh_128B_dsl(<128 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <128 x i8> @llvm.hydride.hexagon_V6_vshuffh_128B_dsl(<128 x i8> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i16> @llvm.hydride.hexagon_V6_vmpyub_128B_dsl(<128 x i8> %arg, <4 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22, i32 %arg.23, i32 %arg.24, i32 %arg.25)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<128 x i16> %arg, <128 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <64 x i16> @llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10)

declare <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18)

define <256 x i8> @hydride.node.sobel3x3_hvx_depth3.1(<128 x i8> %arg, <128 x i8> %arg.1)
{
entry:
  %0 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<128 x i8> %arg, <128 x i8> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  ret <256 x i8> %0
}

declare <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)
