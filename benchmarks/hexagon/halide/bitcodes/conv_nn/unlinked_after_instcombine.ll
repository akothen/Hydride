; ModuleID = 'conv_nn.ll'
source_filename = "llvm-link"
target triple = "unknown-unknown-unknown"

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.0(<128 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybv_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <128 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

declare <32 x i32> @llvm.hydride.hexagon_V6_vrmpybv_128B_dsl(<32 x i32>, <128 x i8>, <128 x i8>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.1(<32 x i32> %arg, <1 x i32> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg.2, <32 x i32> %arg, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %0, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %2
}

declare <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32>, <32 x i32>, i32, i32, i32, i32, i32, i32, i32)

declare <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32>, i32, i32, i32, i32, i32, i32)

declare <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32>, <32 x i32>, i32, i32, i32, i32, i32, i32, i32)

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.2(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.3(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.4(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.5(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.6(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.7(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.8(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.9(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.10(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.11(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.12(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.13(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.14(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.15(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.16(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.17(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.18(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.19(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.20(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.21(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.22(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.23(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.24(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.25(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.26(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.27(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.28(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.29(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.30(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.31(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.32(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.33(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.34(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.35(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.36(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.37(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.38(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.39(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.40(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.41(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.42(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.43(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.44(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.45(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.46(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.47(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.48(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.49(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.50(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %18, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %17, <1 x i32> zeroinitializer, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %24, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %23, <1 x i32> zeroinitializer, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %27, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %22, <32 x i32> %28, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %30 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %31 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %30, <64 x i16> %29, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = bitcast <64 x i16> %32 to <128 x i8>
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %34, <1 x i32> zeroinitializer, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %40, <1 x i32> zeroinitializer, <32 x i32> %42, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %43, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %44, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %46 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %39, <32 x i32> %45, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %47 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %48 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %46, <128 x i8> %47, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %49 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %49, <1 x i32> zeroinitializer, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %52, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %53, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %55, <1 x i32> zeroinitializer, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %58, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %59, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %61 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %54, <32 x i32> %60, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %62 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %63 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %62, <64 x i16> %61, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %64 = bitcast <64 x i16> %63 to <128 x i8>
  %65 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %64, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %66 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %65, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %67 = bitcast <64 x i16> %66 to <128 x i8>
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.1(<128 x i8> %33, <128 x i8> %67, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %69 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %68, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %70 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %69, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %70
}

declare <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32>, <1 x i32>, <32 x i32>, i32, i32, i32, i32, i32, i32, i32)

declare <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32>, <32 x i32>, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.23(<256 x i8>, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.13(<256 x i8>, i32, i32, i32, i32, i32, i32)

declare <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16>, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16>, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.1(<128 x i8>, <128 x i8>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8>, <128 x i8>, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8>, <128 x i8>, i32, i32, i32, i32, i32, i32, i32)

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.51(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %18, <1 x i32> zeroinitializer, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %24, <1 x i32> zeroinitializer, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %28, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %30 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %23, <32 x i32> %29, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %31 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %31, <64 x i16> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = bitcast <64 x i16> %32 to <128 x i8>
  %34 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %33, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %35 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %34, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %36 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %17, <64 x i16> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %38, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %37, <1 x i32> zeroinitializer, <32 x i32> %39, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %45 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %46 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %43, <1 x i32> zeroinitializer, <32 x i32> %45, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %47 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %46, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %47, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %49 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %42, <32 x i32> %48, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %50 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %51 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %49, <128 x i8> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %52 = bitcast <64 x i16> %51 to <128 x i8>
  %53 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %52, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %54 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %53, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %55, <1 x i32> zeroinitializer, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %58, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %59, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %61 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %62 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %63 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %62, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %64 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %61, <1 x i32> zeroinitializer, <32 x i32> %63, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %65 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %64, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %66 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %65, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %67 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %60, <32 x i32> %66, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %69 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %68, <64 x i16> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %70 = bitcast <64 x i16> %69 to <128 x i8>
  %71 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %70, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %72 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %71, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %73 = call <256 x i8> @llvm.hydride.hexagon_V6_vcombine_128B_dsl.1(<64 x i16> %54, <64 x i16> %72, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %74 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.23(<256 x i8> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %75 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.13(<256 x i8> %73, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %76 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.1(<128 x i8> %74, <128 x i8> %75, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %77 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %76, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %78 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %77, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %78
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.52(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %18, <1 x i32> zeroinitializer, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %24, <1 x i32> zeroinitializer, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %28, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %30 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %23, <32 x i32> %29, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %31 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %31, <64 x i16> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %34, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %33, <1 x i32> zeroinitializer, <32 x i32> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %39, <1 x i32> zeroinitializer, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %42, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %43, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %45 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %38, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %47 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %45, <128 x i8> %46, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %49 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %49, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %48, <1 x i32> zeroinitializer, <32 x i32> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %52, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %54, <1 x i32> zeroinitializer, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %58, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %53, <32 x i32> %59, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %62 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %61, <64 x i16> %60, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %63 = bitcast <64 x i16> %62 to <128 x i8>
  %64 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %63, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %65 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %64, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %66 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.73(<64 x i16> %17, <64 x i16> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %67 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %66, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %68
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.53(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %18, <1 x i32> zeroinitializer, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %24, <1 x i32> zeroinitializer, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %28, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %30 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %23, <32 x i32> %29, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %31 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %31, <64 x i16> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %34, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %33, <1 x i32> zeroinitializer, <32 x i32> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %39, <1 x i32> zeroinitializer, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %42, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %43, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %45 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %38, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %47 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %45, <128 x i8> %46, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %49 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %49, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %48, <1 x i32> zeroinitializer, <32 x i32> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %52, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %54, <1 x i32> zeroinitializer, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %58, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %53, <32 x i32> %59, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %62 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %61, <64 x i16> %60, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %63 = bitcast <64 x i16> %62 to <128 x i8>
  %64 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %63, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %65 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %64, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %66 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.73(<64 x i16> %17, <64 x i16> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %67 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %66, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %68
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.54(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %18, <1 x i32> zeroinitializer, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %24, <1 x i32> zeroinitializer, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %28, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %30 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %23, <32 x i32> %29, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %31 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %31, <64 x i16> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %34, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %33, <1 x i32> zeroinitializer, <32 x i32> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %39, <1 x i32> zeroinitializer, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %42, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %43, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %45 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %38, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %47 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %45, <128 x i8> %46, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %49 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %49, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %48, <1 x i32> zeroinitializer, <32 x i32> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %52, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %54, <1 x i32> zeroinitializer, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %58, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %53, <32 x i32> %59, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %62 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %61, <64 x i16> %60, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %63 = bitcast <64 x i16> %62 to <128 x i8>
  %64 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %63, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %65 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %64, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %66 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.73(<64 x i16> %17, <64 x i16> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %67 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %66, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %68
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.55(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %18, <1 x i32> zeroinitializer, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %24, <1 x i32> zeroinitializer, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %28, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %30 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %23, <32 x i32> %29, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %31 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %31, <64 x i16> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %34, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %33, <1 x i32> zeroinitializer, <32 x i32> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %39, <1 x i32> zeroinitializer, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %42, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %43, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %45 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %38, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %47 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %45, <128 x i8> %46, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %49 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %49, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %48, <1 x i32> zeroinitializer, <32 x i32> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %52, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %54, <1 x i32> zeroinitializer, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %58, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %53, <32 x i32> %59, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %62 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %61, <64 x i16> %60, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %63 = bitcast <64 x i16> %62 to <128 x i8>
  %64 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %63, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %65 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %64, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %66 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.73(<64 x i16> %17, <64 x i16> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %67 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %66, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %68
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.56(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.57(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.58(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.59(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.60(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.61(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.62(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.63(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.64(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.65(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.66(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.67(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.68(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.69(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.70(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.71(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.72(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.73(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.74(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.75(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.76(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.77(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.78(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.79(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.80(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.81(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.82(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.83(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.84(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.85(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.86(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.87(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.88(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

declare <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32>, <32 x i32>, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32>, <32 x i32>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32)

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.89(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.90(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.91(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.92(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.93(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.94(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.95(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.96(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.97(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.98(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.99(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.100(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.101(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.102(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.103(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 32767, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %10, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.2(<64 x i16> %arg.5, <64 x i16> %12, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.5(<64 x i16> %13, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> zeroinitializer, <64 x i16> %14, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  ret <64 x i16> %15
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.104(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.105(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.106(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.107(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.108(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.109(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.110(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.111(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.112(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.113(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.114(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.115(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.116(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.117(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.118(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.119(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.120(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.121(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.122(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.123(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.124(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.125(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.126(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.127(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.128(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.129(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.130(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.131(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.132(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.133(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.134(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.135(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.136(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %6 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %7 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %8 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %7, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %9 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %6, <1 x i32> zeroinitializer, <32 x i32> %8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %10 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %9, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %11 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %10, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %12 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %5, <32 x i32> %11, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %13 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %14 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %12, <128 x i8> %13, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %15 = bitcast <64 x i16> %14 to <128 x i8>
  %16 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %15, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %17 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %16, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %18 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %19 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %20 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %19, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %21 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %18, <1 x i32> zeroinitializer, <32 x i32> %20, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %22 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %21, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %23 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %22, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %24 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %25 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %26 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %25, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %27 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %24, <1 x i32> zeroinitializer, <32 x i32> %26, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %28 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %27, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %29 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %28, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %30 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %23, <32 x i32> %29, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %31 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %32 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %31, <64 x i16> %30, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %33 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %34 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %35 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %34, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %36 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %33, <1 x i32> zeroinitializer, <32 x i32> %35, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %37 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %36, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %38 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %37, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %39 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %40 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.4, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %41 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.3, <32 x i32> %40, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %42 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %39, <1 x i32> zeroinitializer, <32 x i32> %41, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %43 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %42, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %44 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %43, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %45 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %38, <32 x i32> %44, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %46 = call <128 x i8> @llvm.hydride.hexagon_V6_lo_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 1024, i32 0)
  %47 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16> %45, <128 x i8> %46, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %48 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %49 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.6, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %50 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.5, <32 x i32> %49, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %51 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %48, <1 x i32> zeroinitializer, <32 x i32> %50, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %52 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %51, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %53 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, <32 x i32> %52, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %54 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %55 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.8, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %56 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg.7, <32 x i32> %55, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %57 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %54, <1 x i32> zeroinitializer, <32 x i32> %56, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %58 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %57, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %59 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %58, <32 x i32> <i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -32768, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %60 = call <64 x i16> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.2(<32 x i32> %53, <32 x i32> %59, i32 1024, i32 1024, i32 0, i32 512, i32 16, i32 0, i32 512, i32 16, i32 2, i32 32, i32 2, i32 16, i32 0)
  %61 = call <128 x i8> @llvm.hydride.hexagon_V6_vassign_128B_dsl.1(<128 x i16> %arg.9, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0)
  %62 = call <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8> %61, <64 x i16> %60, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %63 = bitcast <64 x i16> %62 to <128 x i8>
  %64 = call <64 x i16> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.1(<128 x i8> %63, <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %65 = call <64 x i16> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.1(<64 x i16> %64, <64 x i16> zeroinitializer, i32 1024, i32 1024, i32 0, i32 1024, i32 16, i32 1, i32 0)
  %66 = call <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.73(<64 x i16> %17, <64 x i16> %65, i32 1024, i32 1024, i32 0, i32 512, i32 8, i32 0, i32 512, i32 8, i32 2, i32 64, i32 2, i32 8, i32 0)
  %67 = call <128 x i8> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.2(<128 x i8> %66, <128 x i8> %arg.10, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  %68 = call <128 x i8> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.2(<128 x i8> %arg.11, <128 x i8> %67, i32 1024, i32 1024, i32 0, i32 1024, i32 8, i32 0, i32 0)
  ret <128 x i8> %68
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.137(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.138(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.139(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.140(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_vsubh_128B_dsl(<32 x i32> %arg, <32 x i32> %0, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 -1, i32 0)
  ret <32 x i32> %1
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.141(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32> %arg.2, <128 x i8> %arg.1, <4 x i8> %arg, i32 1024, i32 32, i32 0, i32 32, i32 8, i32 -1, i32 0, i32 0, i32 16, i32 0, i32 0)
  ret <32 x i32> %0
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.142(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.143(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %1 = call <32 x i32> @llvm.hydride.hexagon_V6_lvsplatw_128B_dsl(<1 x i32> %arg.1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 0)
  %2 = call <32 x i32> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.15(<32 x i32> %arg, <32 x i32> %1, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %3 = call <32 x i32> @llvm.hydride.hexagon_V6_vasrhv_128B_dsl(<32 x i32> %0, <1 x i32> zeroinitializer, <32 x i32> %2, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %4 = call <32 x i32> @llvm.hydride.hexagon_V6_vminuh_128B_dsl.7(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %3, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  %5 = call <32 x i32> @llvm.hydride.hexagon_V6_vmaxw_128B_dsl.3(<32 x i32> %4, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, i32 1024, i32 1024, i32 0, i32 1024, i32 32, i32 1, i32 0)
  ret <32 x i32> %5
}

declare <32 x i32> @llvm.hydride.hexagon_V6_vrmpybus_acc_128B_dsl(<32 x i32>, <128 x i8>, <4 x i8>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.21(<128 x i8>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32)

declare <64 x i16> @llvm.hydride.hexagon_V6_vaddhsat_128B_dsl.27(<64 x i16>, <128 x i8>, i32, i32, i32, i32, i32, i32, i32)

declare <128 x i8> @llvm.hydride.hexagon_V6_vpackeh_128B_dsl.73(<64 x i16>, <64 x i16>, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)
