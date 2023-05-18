; ModuleID = "/tmp/depthwise_conv_hvx_depth3.ll"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.0(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

declare <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.1(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.2(<64 x i32> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl(<64 x i32> %arg, <64 x i16> %arg.1, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 -1, i32 32, i32 -1, i32 1, i32 -1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

declare <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl(<64 x i32> %arg, <64 x i16> %arg.1, <32 x i32> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22, i32 %arg.23)

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.3(<64 x i32> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl(<64 x i32> %arg, <64 x i16> %arg.1, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 -1, i32 32, i32 -1, i32 1, i32 -1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.4(<64 x i32> %arg, <64 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %2, <32 x i32> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %6, <128 x i8> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %8, <32 x i32> %9, <128 x i8> %10, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 32, i32 -1, i32 0)
  ret <64 x i32> %13
}

declare <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> %arg, <32 x i32> %arg.1, <128 x i8> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13)

declare <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %arg, <32 x i32> %arg.1, <128 x i8> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16)

declare <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %arg, <32 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)

declare <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.5(<64 x i32> %arg, <64 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %2, <32 x i32> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %6, <128 x i8> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %8, <32 x i32> %9, <128 x i8> %10, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 32, i32 -1, i32 0)
  ret <64 x i32> %13
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.6(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

declare <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22, i32 %arg.23)

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.7(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.8(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.9(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.10(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.11(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.12(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.13(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.14(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.15(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.16(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.17(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.18(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.19(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.20(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.21(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.22(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.23(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.24(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.25(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.26(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.27(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.28(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.29(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.30(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.31(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.32(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.33(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.34(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.35(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.36(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.37(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.38(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.39(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.40(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.41(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.42(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.43(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.44(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.45(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.46(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.47(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.48(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.49(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.50(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.51(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.52(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.53(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.54(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.55(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.56(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.57(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.58(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.59(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.60(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.61(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.62(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.63(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.64(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.65(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.66(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.67(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.68(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.69(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.70(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.71(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.72(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.73(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.74(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.75(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.76(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.77(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.78(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.79(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.80(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.81(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.82(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.83(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.84(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.85(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <128 x i8> @hydride.node.depthwise_conv_hvx_depth3.86(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <32 x i32> %arg.6, <1 x i32> %arg.7, <32 x i32> %arg.8, <32 x i32> %arg.9, <1 x i32> %arg.10, <32 x i32> %arg.11, <32 x i32> %arg.12, <1 x i32> %arg.13, <128 x i16> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %2, <32 x i32> %arg.5, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> <i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %8, <32 x i32> %arg.5, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> <i32 0>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %16 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %16, <32 x i32> %arg, <32 x i32> %17, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %14, <1 x i32> <i32 0>, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %23, <32 x i32> %arg, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %21, <1 x i32> <i32 0>, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %20, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %13, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %30 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %30, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %31, <32 x i32> %arg.11, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %29, <1 x i32> <i32 0>, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %37, <32 x i32> %arg.11, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %35, <1 x i32> <i32 0>, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %34, <64 x i16> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %45, <32 x i32> %arg.8, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> <i32 0>, <32 x i32> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %52, <32 x i32> %arg.8, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %50, <1 x i32> <i32 0>, <32 x i32> %54, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %49, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %57 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %42, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %28, <64 x i16> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %58, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %63, <32 x i32> %arg.5, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> <i32 0>, <32 x i32> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %68 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %69 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %68, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %70 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %71 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %69, <32 x i32> %arg.5, <32 x i32> %70, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %72 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %67, <1 x i32> <i32 0>, <32 x i32> %71, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %73 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %74 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %66, <64 x i16> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %75 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %76 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %77 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %76, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %78 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %79 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %77, <32 x i32> %arg, <32 x i32> %78, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %80 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %75, <1 x i32> <i32 0>, <32 x i32> %79, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %81 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %80, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %82 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %83 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %84 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %83, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %85 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %86 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %84, <32 x i32> %arg, <32 x i32> %85, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %87 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %82, <1 x i32> <i32 0>, <32 x i32> %86, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %88 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %81, <32 x i32> %87, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %89 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %74, <32 x i32> %88, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %90 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %91 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %92 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %91, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %93 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %94 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %92, <32 x i32> %arg.11, <32 x i32> %93, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %95 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %90, <1 x i32> <i32 0>, <32 x i32> %94, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %96 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %97 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %98 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %97, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %99 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %100 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %98, <32 x i32> %arg.11, <32 x i32> %99, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %101 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %96, <1 x i32> <i32 0>, <32 x i32> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %102 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %101, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %103 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %95, <64 x i16> %102, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %104 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %105 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %106 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %105, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %107 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %108 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %106, <32 x i32> %arg.8, <32 x i32> %107, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %109 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %104, <1 x i32> <i32 0>, <32 x i32> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %110 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %109, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %111 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %112 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %113 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %112, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %114 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %115 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %113, <32 x i32> %arg.8, <32 x i32> %114, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %116 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %111, <1 x i32> <i32 0>, <32 x i32> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %117 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %110, <32 x i32> %116, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %118 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %103, <32 x i32> %117, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %119 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %89, <64 x i16> %118, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %119, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %121 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %120, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %122 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %60, <64 x i16> %121, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  %123 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg.15, <128 x i8> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %124 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.16, <128 x i8> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %124
}

declare <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> %arg, <32 x i32> %arg.1, <32 x i32> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13)

declare <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> %arg, <1 x i64> %arg.1, <1 x i64> %arg.2, <32 x i32> %arg.3, <32 x i32> %arg.4, <32 x i32> %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22)

declare <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %arg, <1 x i32> %arg.1, <32 x i32> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9)

declare <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg, <32 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %arg, <32 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %arg, <32 x i32> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12)

declare <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11)

declare <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg, <128 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18)

declare <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

declare <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg, <128 x i8> %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8)

define <128 x i8> @hydride.node.depthwise_conv_hvx_depth3.87(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <32 x i32> %arg.6, <1 x i32> %arg.7, <32 x i32> %arg.8, <32 x i32> %arg.9, <1 x i32> %arg.10, <32 x i32> %arg.11, <32 x i32> %arg.12, <1 x i32> %arg.13, <128 x i16> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %2, <32 x i32> %arg.5, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> <i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %8, <32 x i32> %arg.5, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> <i32 0>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %16 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %16, <32 x i32> %arg, <32 x i32> %17, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %14, <1 x i32> <i32 0>, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %23, <32 x i32> %arg, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %21, <1 x i32> <i32 0>, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %20, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %13, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %30 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %30, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %31, <32 x i32> %arg.11, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %29, <1 x i32> <i32 0>, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %37, <32 x i32> %arg.11, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %35, <1 x i32> <i32 0>, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %34, <64 x i16> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %45, <32 x i32> %arg.8, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> <i32 0>, <32 x i32> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %52, <32 x i32> %arg.8, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %50, <1 x i32> <i32 0>, <32 x i32> %54, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %49, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %57 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %42, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %28, <64 x i16> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %58, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %63, <32 x i32> %arg.5, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> <i32 0>, <32 x i32> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %68 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %69 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %68, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %70 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %71 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %69, <32 x i32> %arg.5, <32 x i32> %70, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %72 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %67, <1 x i32> <i32 0>, <32 x i32> %71, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %73 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %74 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %66, <64 x i16> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %75 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %76 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %77 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %76, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %78 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %79 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %77, <32 x i32> %arg, <32 x i32> %78, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %80 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %75, <1 x i32> <i32 0>, <32 x i32> %79, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %81 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %80, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %82 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %83 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %84 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %83, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %85 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %86 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %84, <32 x i32> %arg, <32 x i32> %85, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %87 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %82, <1 x i32> <i32 0>, <32 x i32> %86, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %88 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %81, <32 x i32> %87, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %89 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %74, <32 x i32> %88, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %90 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %91 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %92 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %91, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %93 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %94 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %92, <32 x i32> %arg.11, <32 x i32> %93, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %95 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %90, <1 x i32> <i32 0>, <32 x i32> %94, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %96 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %97 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %98 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %97, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %99 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %100 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %98, <32 x i32> %arg.11, <32 x i32> %99, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %101 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %96, <1 x i32> <i32 0>, <32 x i32> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %102 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %101, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %103 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %95, <64 x i16> %102, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %104 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %105 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %106 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %105, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %107 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %108 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %106, <32 x i32> %arg.8, <32 x i32> %107, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %109 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %104, <1 x i32> <i32 0>, <32 x i32> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %110 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %109, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %111 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %112 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %113 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %112, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %114 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %115 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %113, <32 x i32> %arg.8, <32 x i32> %114, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %116 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %111, <1 x i32> <i32 0>, <32 x i32> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %117 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %110, <32 x i32> %116, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %118 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %103, <32 x i32> %117, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %119 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %89, <64 x i16> %118, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %119, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %121 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %120, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %122 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %60, <64 x i16> %121, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  %123 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg.15, <128 x i8> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %124 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.16, <128 x i8> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %124
}

define <128 x i8> @hydride.node.depthwise_conv_hvx_depth3.88(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <32 x i32> %arg.6, <1 x i32> %arg.7, <32 x i32> %arg.8, <32 x i32> %arg.9, <1 x i32> %arg.10, <32 x i32> %arg.11, <32 x i32> %arg.12, <1 x i32> %arg.13, <128 x i16> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %2, <32 x i32> %arg.5, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> <i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %8, <32 x i32> %arg.5, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> <i32 0>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %16 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %16, <32 x i32> %arg, <32 x i32> %17, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %14, <1 x i32> <i32 0>, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %23, <32 x i32> %arg, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %21, <1 x i32> <i32 0>, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %20, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %13, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %30 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %30, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %31, <32 x i32> %arg.11, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %29, <1 x i32> <i32 0>, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %37, <32 x i32> %arg.11, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %35, <1 x i32> <i32 0>, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %34, <64 x i16> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %45, <32 x i32> %arg.8, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> <i32 0>, <32 x i32> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %52, <32 x i32> %arg.8, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %50, <1 x i32> <i32 0>, <32 x i32> %54, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %49, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %57 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %42, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %28, <64 x i16> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %58, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %63, <32 x i32> %arg.5, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> <i32 0>, <32 x i32> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %68 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %69 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %68, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %70 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %71 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %69, <32 x i32> %arg.5, <32 x i32> %70, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %72 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %67, <1 x i32> <i32 0>, <32 x i32> %71, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %73 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %74 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %66, <64 x i16> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %75 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %76 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %77 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %76, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %78 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %79 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %77, <32 x i32> %arg, <32 x i32> %78, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %80 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %75, <1 x i32> <i32 0>, <32 x i32> %79, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %81 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %80, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %82 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %83 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %84 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %83, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %85 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %86 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %84, <32 x i32> %arg, <32 x i32> %85, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %87 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %82, <1 x i32> <i32 0>, <32 x i32> %86, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %88 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %81, <32 x i32> %87, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %89 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %74, <32 x i32> %88, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %90 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %91 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %92 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %91, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %93 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %94 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %92, <32 x i32> %arg.11, <32 x i32> %93, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %95 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %90, <1 x i32> <i32 0>, <32 x i32> %94, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %96 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %97 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %98 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %97, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %99 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %100 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %98, <32 x i32> %arg.11, <32 x i32> %99, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %101 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %96, <1 x i32> <i32 0>, <32 x i32> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %102 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %101, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %103 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %95, <64 x i16> %102, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %104 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %105 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %106 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %105, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %107 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %108 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %106, <32 x i32> %arg.8, <32 x i32> %107, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %109 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %104, <1 x i32> <i32 0>, <32 x i32> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %110 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %109, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %111 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %112 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %113 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %112, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %114 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %115 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %113, <32 x i32> %arg.8, <32 x i32> %114, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %116 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %111, <1 x i32> <i32 0>, <32 x i32> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %117 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %110, <32 x i32> %116, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %118 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %103, <32 x i32> %117, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %119 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %89, <64 x i16> %118, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %119, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %121 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %120, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %122 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %60, <64 x i16> %121, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  %123 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg.15, <128 x i8> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %124 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.16, <128 x i8> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %124
}

define <128 x i8> @hydride.node.depthwise_conv_hvx_depth3.89(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <32 x i32> %arg.6, <1 x i32> %arg.7, <32 x i32> %arg.8, <32 x i32> %arg.9, <1 x i32> %arg.10, <32 x i32> %arg.11, <32 x i32> %arg.12, <1 x i32> %arg.13, <128 x i16> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %2, <32 x i32> %arg.5, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> <i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %8, <32 x i32> %arg.5, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> <i32 0>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %16 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %16, <32 x i32> %arg, <32 x i32> %17, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %14, <1 x i32> <i32 0>, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %23, <32 x i32> %arg, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %21, <1 x i32> <i32 0>, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %20, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %13, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %30 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %30, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %31, <32 x i32> %arg.11, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %29, <1 x i32> <i32 0>, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %37, <32 x i32> %arg.11, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %35, <1 x i32> <i32 0>, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %34, <64 x i16> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %45, <32 x i32> %arg.8, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> <i32 0>, <32 x i32> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %52, <32 x i32> %arg.8, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %50, <1 x i32> <i32 0>, <32 x i32> %54, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %49, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %57 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %42, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %28, <64 x i16> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %58, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %63, <32 x i32> %arg.5, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> <i32 0>, <32 x i32> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %68 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %69 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %68, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %70 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %71 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %69, <32 x i32> %arg.5, <32 x i32> %70, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %72 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %67, <1 x i32> <i32 0>, <32 x i32> %71, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %73 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %74 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %66, <64 x i16> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %75 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %76 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %77 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %76, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %78 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %79 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %77, <32 x i32> %arg, <32 x i32> %78, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %80 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %75, <1 x i32> <i32 0>, <32 x i32> %79, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %81 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %80, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %82 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %83 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %84 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %83, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %85 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %86 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %84, <32 x i32> %arg, <32 x i32> %85, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %87 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %82, <1 x i32> <i32 0>, <32 x i32> %86, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %88 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %81, <32 x i32> %87, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %89 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %74, <32 x i32> %88, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %90 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %91 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %92 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %91, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %93 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %94 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %92, <32 x i32> %arg.11, <32 x i32> %93, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %95 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %90, <1 x i32> <i32 0>, <32 x i32> %94, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %96 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %97 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %98 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %97, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %99 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %100 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %98, <32 x i32> %arg.11, <32 x i32> %99, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %101 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %96, <1 x i32> <i32 0>, <32 x i32> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %102 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %101, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %103 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %95, <64 x i16> %102, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %104 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %105 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %106 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %105, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %107 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %108 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %106, <32 x i32> %arg.8, <32 x i32> %107, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %109 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %104, <1 x i32> <i32 0>, <32 x i32> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %110 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %109, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %111 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %112 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %113 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %112, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %114 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %115 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %113, <32 x i32> %arg.8, <32 x i32> %114, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %116 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %111, <1 x i32> <i32 0>, <32 x i32> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %117 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %110, <32 x i32> %116, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %118 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %103, <32 x i32> %117, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %119 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %89, <64 x i16> %118, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %119, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %121 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %120, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %122 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %60, <64 x i16> %121, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  %123 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg.15, <128 x i8> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %124 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.16, <128 x i8> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %124
}

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.90(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.91(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.92(<64 x i32> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl(<64 x i32> %arg, <64 x i16> %arg.1, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 -1, i32 32, i32 -1, i32 1, i32 -1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.93(<64 x i32> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl(<64 x i32> %arg, <64 x i16> %arg.1, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 -1, i32 32, i32 -1, i32 1, i32 -1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.94(<64 x i32> %arg, <64 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %2, <32 x i32> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %6, <128 x i8> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %8, <32 x i32> %9, <128 x i8> %10, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 32, i32 -1, i32 0)
  ret <64 x i32> %13
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.95(<64 x i32> %arg, <64 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %2, <32 x i32> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %6, <128 x i8> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %8, <32 x i32> %9, <128 x i8> %10, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 32, i32 -1, i32 0)
  ret <64 x i32> %13
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.96(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.97(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.98(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.99(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.100(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.101(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.102(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.103(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.104(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.105(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.106(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.107(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.108(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.109(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.110(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.111(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.112(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.113(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.114(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.115(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <128 x i8> @hydride.node.depthwise_conv_hvx_depth3.116(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <32 x i32> %arg.6, <1 x i32> %arg.7, <32 x i32> %arg.8, <32 x i32> %arg.9, <1 x i32> %arg.10, <32 x i32> %arg.11, <32 x i32> %arg.12, <1 x i32> %arg.13, <128 x i16> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %2, <32 x i32> %arg.5, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> <i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %8, <32 x i32> %arg.5, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> <i32 0>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %16 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %16, <32 x i32> %arg, <32 x i32> %17, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %14, <1 x i32> <i32 0>, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %23, <32 x i32> %arg, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %21, <1 x i32> <i32 0>, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %20, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %13, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %30 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %30, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %31, <32 x i32> %arg.11, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %29, <1 x i32> <i32 0>, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %37, <32 x i32> %arg.11, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %35, <1 x i32> <i32 0>, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %34, <64 x i16> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %45, <32 x i32> %arg.8, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> <i32 0>, <32 x i32> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %52, <32 x i32> %arg.8, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %50, <1 x i32> <i32 0>, <32 x i32> %54, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %49, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %57 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %42, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %28, <64 x i16> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %58, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %63, <32 x i32> %arg.5, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> <i32 0>, <32 x i32> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %68 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %69 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %68, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %70 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %71 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %69, <32 x i32> %arg.5, <32 x i32> %70, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %72 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %67, <1 x i32> <i32 0>, <32 x i32> %71, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %73 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %74 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %66, <64 x i16> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %75 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %76 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %77 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %76, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %78 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %79 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %77, <32 x i32> %arg, <32 x i32> %78, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %80 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %75, <1 x i32> <i32 0>, <32 x i32> %79, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %81 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %80, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %82 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %83 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %84 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %83, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %85 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %86 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %84, <32 x i32> %arg, <32 x i32> %85, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %87 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %82, <1 x i32> <i32 0>, <32 x i32> %86, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %88 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %81, <32 x i32> %87, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %89 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %74, <32 x i32> %88, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %90 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %91 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %92 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %91, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %93 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %94 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %92, <32 x i32> %arg.11, <32 x i32> %93, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %95 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %90, <1 x i32> <i32 0>, <32 x i32> %94, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %96 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %97 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %98 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %97, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %99 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %100 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %98, <32 x i32> %arg.11, <32 x i32> %99, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %101 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %96, <1 x i32> <i32 0>, <32 x i32> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %102 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %101, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %103 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %95, <64 x i16> %102, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %104 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %105 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %106 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %105, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %107 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %108 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %106, <32 x i32> %arg.8, <32 x i32> %107, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %109 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %104, <1 x i32> <i32 0>, <32 x i32> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %110 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %109, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %111 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %112 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %113 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %112, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %114 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %115 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %113, <32 x i32> %arg.8, <32 x i32> %114, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %116 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %111, <1 x i32> <i32 0>, <32 x i32> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %117 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %110, <32 x i32> %116, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %118 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %103, <32 x i32> %117, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %119 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %89, <64 x i16> %118, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %119, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %121 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %120, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %122 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %60, <64 x i16> %121, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  %123 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg.15, <128 x i8> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %124 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.16, <128 x i8> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %124
}

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.117(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.118(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

define <64 x i16> @hydride.node.depthwise_conv_hvx_depth3.119(<64 x i16> %arg, <64 x i16> %arg.1)
{
entry:
  %0 = call <64 x i16> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<64 x i16> %arg, <64 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 -1, i32 0)
  ret <64 x i16> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.120(<64 x i32> %arg, <128 x i16> %arg.1)
{
entry:
  %0 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.2(<128 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %1 = call <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl.1(<64 x i32> %arg, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <128 x i8> %0, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 -1, i32 32, i32 -1, i32 1, i32 -1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %1
}

declare <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.2(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7)

declare <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl.1(<64 x i32> %arg, <32 x i32> %arg.1, <128 x i8> %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6, i32 %arg.7, i32 %arg.8, i32 %arg.9, i32 %arg.10, i32 %arg.11, i32 %arg.12, i32 %arg.13, i32 %arg.14, i32 %arg.15, i32 %arg.16, i32 %arg.17, i32 %arg.18, i32 %arg.19, i32 %arg.20, i32 %arg.21, i32 %arg.22, i32 %arg.23)

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.121(<64 x i32> %arg, <128 x i16> %arg.1)
{
entry:
  %0 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.2(<128 x i16> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %1 = call <64 x i32> @llvm.hydride.hexagon_V6_vaddubh_acc_128B_dsl.1(<64 x i32> %arg, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <128 x i8> %0, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 -1, i32 32, i32 -1, i32 1, i32 -1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %1
}

declare <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.2(<128 x i16> %arg, i32 %arg.1, i32 %arg.2, i32 %arg.3, i32 %arg.4, i32 %arg.5, i32 %arg.6)

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.122(<64 x i32> %arg, <64 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %2, <32 x i32> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %6, <128 x i8> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %8, <32 x i32> %9, <128 x i8> %10, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 32, i32 -1, i32 0)
  ret <64 x i32> %13
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.123(<64 x i32> %arg, <64 x i32> %arg.1, <1 x i32> %arg.2)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %0, <128 x i8> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %2, <32 x i32> %3, <128 x i8> %4, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl(<2 x i16> <i16 16, i16 0>, <32 x i32> %6, <128 x i8> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 1, i32 16, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl(<64 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyiewh_acc_128B_dsl(<32 x i32> %8, <32 x i32> %9, <128 x i8> %10, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 0)
  %12 = call <64 x i32> @llvm.hydride.hexagon_V6_vcombine_128B_dsl(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %13 = call <64 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl.1(<64 x i32> %arg, <64 x i32> %12, i32 2048, i32 2048, i32 0, i32 2048, i32 32, i32 -1, i32 0)
  ret <64 x i32> %13
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.124(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.125(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.126(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.127(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.128(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.129(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.130(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.131(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.132(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.133(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.134(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.135(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.136(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.137(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.138(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.139(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.140(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.141(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.142(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <64 x i32> @hydride.node.depthwise_conv_hvx_depth3.143(<64 x i16> %arg, <64 x i16> %arg.1, <64 x i32> %arg.2)
{
entry:
  %0 = call <64 x i32> @llvm.hydride.hexagon_V6_vmpybv_acc_128B_dsl(<64 x i32> %arg.2, <64 x i16> %arg.1, <64 x i16> %arg, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 32, i32 1, i32 -1, i32 1, i32 1, i32 32, i32 -1, i32 1, i32 1, i32 16, i32 1024, i32 2, i32 0)
  ret <64 x i32> %0
}

define <128 x i8> @hydride.node.depthwise_conv_hvx_depth3.144(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <32 x i32> %arg.6, <1 x i32> %arg.7, <32 x i32> %arg.8, <32 x i32> %arg.9, <1 x i32> %arg.10, <32 x i32> %arg.11, <32 x i32> %arg.12, <1 x i32> %arg.13, <128 x i16> %arg.14, <128 x i8> %arg.15, <128 x i8> %arg.16)
{
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %2, <32 x i32> %arg.5, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> <i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %8, <32 x i32> %arg.5, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> <i32 0>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %13 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %14 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %15 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %16 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %15, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %16, <32 x i32> %arg, <32 x i32> %17, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %14, <1 x i32> <i32 0>, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %23, <32 x i32> %arg, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %21, <1 x i32> <i32 0>, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %20, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %28 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %13, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %30 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %31 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %30, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %32 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %31, <32 x i32> %arg.11, <32 x i32> %32, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %29, <1 x i32> <i32 0>, <32 x i32> %33, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %37, <32 x i32> %arg.11, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %35, <1 x i32> <i32 0>, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %34, <64 x i16> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %45, <32 x i32> %arg.8, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> <i32 0>, <32 x i32> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %52, <32 x i32> %arg.8, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %50, <1 x i32> <i32 0>, <32 x i32> %54, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %49, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %57 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %42, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %58 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %28, <64 x i16> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %59 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %58, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %63, <32 x i32> %arg.5, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> <i32 0>, <32 x i32> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %68 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %69 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.5, <32 x i32> %68, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %70 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %71 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %69, <32 x i32> %arg.5, <32 x i32> %70, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %72 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %67, <1 x i32> <i32 0>, <32 x i32> %71, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %73 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.6, <32 x i32> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %74 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %66, <64 x i16> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %75 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %76 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %77 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %76, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %78 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %79 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %77, <32 x i32> %arg, <32 x i32> %78, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %80 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %75, <1 x i32> <i32 0>, <32 x i32> %79, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %81 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.3, <32 x i32> %80, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %82 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %83 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %84 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg, <32 x i32> %83, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %85 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %86 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %84, <32 x i32> %arg, <32 x i32> %85, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %87 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %82, <1 x i32> <i32 0>, <32 x i32> %86, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %88 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %81, <32 x i32> %87, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %89 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %74, <32 x i32> %88, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %90 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %91 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %92 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %91, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %93 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %94 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %92, <32 x i32> %arg.11, <32 x i32> %93, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %95 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %90, <1 x i32> <i32 0>, <32 x i32> %94, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %96 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.13, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %97 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %98 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.11, <32 x i32> %97, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %99 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %100 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %98, <32 x i32> %arg.11, <32 x i32> %99, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %101 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %96, <1 x i32> <i32 0>, <32 x i32> %100, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %102 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.12, <32 x i32> %101, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %103 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl(<32 x i32> %95, <64 x i16> %102, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %104 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %105 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %106 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %105, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %107 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %108 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %106, <32 x i32> %arg.8, <32 x i32> %107, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %109 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %104, <1 x i32> <i32 0>, <32 x i32> %108, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %110 = call <64 x i16> @llvm.hydride.hexagon_V6_pred_and_128B_dsl(<32 x i32> %arg.9, <32 x i32> %109, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 0)
  %111 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %112 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %113 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl(<1 x i64> <i64 16>, <32 x i32> %arg.8, <32 x i32> %112, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 0, i32 64, i32 1, i32 0)
  %114 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %115 = call <32 x i32> @llvm.hydride.hexagon_V6_vmpyowh_rnd_sacc_128B_dsl(<1 x i64> <i64 14>, <1 x i64> <i64 1>, <1 x i64> <i64 1>, <32 x i32> %113, <32 x i32> %arg.8, <32 x i32> %114, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 32, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 64, i32 1, i32 64, i32 1, i32 16, i32 0)
  %116 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %111, <1 x i32> <i32 0>, <32 x i32> %115, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %117 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.1(<64 x i16> %110, <32 x i32> %116, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %118 = call <64 x i16> @llvm.hydride.hexagon_V6_vsathub_128B_dsl(<32 x i32> %103, <32 x i32> %117, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 16, i32 1, i32 32, i32 1, i32 1, i32 0)
  %119 = call <128 x i16> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %89, <64 x i16> %118, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %120 = call <128 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<128 x i16> %arg.14, <128 x i16> %119, i32 2048, i32 2048, i32 0, i32 2048, i32 16, i32 1, i32 0)
  %121 = call <64 x i16> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %120, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %122 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackwuh_sat_128B_dsl(<64 x i16> %60, <64 x i16> %121, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 0, i32 16, i32 1, i32 64, i32 0, i32 16, i32 1, i32 8, i32 0)
  %123 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl(<128 x i8> %arg.15, <128 x i8> %122, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %124 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl(<128 x i8> %arg.16, <128 x i8> %123, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %124
}
