; ModuleID = '/tmp/conv_nn_hvx_depth5.ll.linked.ll'
source_filename = "llvm-link"
target triple = "unknown-unknown-unknown"

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.0(<128 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %1 = bitcast <128 x i8> %arg to <32 x i32>
  %2 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %0, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.1(<32 x i32> %arg, <1 x i32> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %arg.2)
  %1 = bitcast <1 x i32> %arg.1 to i32
  %2 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %1)
  %3 = call <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32> %0, <32 x i32> %2)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.2(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.3(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.4(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.5(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.6(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.7(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.8(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.9(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.10(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.11(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.12(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.13(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.14(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.15(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.16(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.17(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.18(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.19(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.20(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.21(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.22(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.23(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.24(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.25(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.26(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.27(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.28(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.29(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.30(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.31(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.32(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.33(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.34(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.35(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.36(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.37(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.38(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.39(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.40(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.41(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.42(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.43(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.44(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.45(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.46(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.47(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.48(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.49(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.50(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.51(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.52(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.53(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.54(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.55(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.56(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.57(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.58(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.59(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.60(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.61(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.62(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.63(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.64(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.65(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.66(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.67(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.68(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.69(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.70(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.71(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.72(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.73(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.74(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.75(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.76(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.77(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.78(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.79(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.80(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.81(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.82(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.83(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.84(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.85(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.86(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.87(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.88(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.89(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.90(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.91(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.92(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.93(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.94(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.95(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.96(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.97(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.98(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.99(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.100(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.101(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.102(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <64 x i16> @hydride.node.conv_nn_hvx_depth5.103(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <64 x i16> %arg.5) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %7 = bitcast <1 x i32> %arg.4 to i32
  %8 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %9 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %9, <32 x i32> %6)
  %11 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %5, <32 x i32> %10)
  %12 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %11)
  %13 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %13, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %15 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %17 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %16)
  %18 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %17, <32 x i32> %15)
  %19 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %20 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %7)
  %21 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %20)
  %22 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %21, <32 x i32> %19)
  %23 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %18, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %23)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %25, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %27 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %14, <32 x i32> %26)
  %28 = bitcast <64 x i16> %arg.5 to <32 x i32>
  %29 = call <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32> %28, <32 x i32> %27)
  %30 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %31 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %30, <32 x i32> %29)
  %32 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %33 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %31, <32 x i32> %32)
  %34 = bitcast <32 x i32> %33 to <64 x i16>
  ret <64 x i16> %34
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.104(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.105(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.106(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.107(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.108(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.109(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.110(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.111(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.112(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.113(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.114(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.115(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.116(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.117(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.118(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.119(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.120(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.121(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.122(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.123(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.124(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.125(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.126(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.127(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.128(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.129(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.130(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.131(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.132(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.133(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.134(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.135(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <128 x i8> @hydride.node.conv_nn_hvx_depth5.136(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2, <32 x i32> %arg.3, <1 x i32> %arg.4, <32 x i32> %arg.5, <1 x i32> %arg.6, <32 x i32> %arg.7, <1 x i32> %arg.8, <128 x i16> %arg.9, <128 x i8> %arg.10, <128 x i8> %arg.11) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %8 = bitcast <1 x i32> %arg.4 to i32
  %9 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %10 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %9)
  %11 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %10, <32 x i32> %7)
  %12 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %11, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %13 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %6, <32 x i32> %12)
  %14 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %13)
  %15 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %14, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %16 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %17 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %18 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %17)
  %19 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %18, <32 x i32> %16)
  %20 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %19, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %21 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %22 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %23 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %22)
  %24 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %23, <32 x i32> %21)
  %25 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %24, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %26 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %20, <32 x i32> %25)
  %27 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %26)
  %28 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %27, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %29 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %15, <32 x i32> %28)
  %30 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %29)
  %31 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %32 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %33 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %32)
  %34 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %33, <32 x i32> %31)
  %35 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %34, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %36 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %37 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %38 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %37)
  %39 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %38, <32 x i32> %36)
  %40 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %39, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %41 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %35, <32 x i32> %40)
  %42 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %41)
  %43 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %42, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %44 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %45 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %46 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %45)
  %47 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %46, <32 x i32> %44)
  %48 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %47, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %49 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %50 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %51 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %50)
  %52 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %51, <32 x i32> %49)
  %53 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %52, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %54 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %48, <32 x i32> %53)
  %55 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %54)
  %56 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %55, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %57 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %43, <32 x i32> %56)
  %58 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %57)
  %59 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %30, <32 x i32> %58)
  %60 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %61 = bitcast <1 x i32> %arg.6 to i32
  %62 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %63 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %62)
  %64 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %63, <32 x i32> %60)
  %65 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %64, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %66 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %67 = bitcast <1 x i32> %arg.8 to i32
  %68 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %69 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %68)
  %70 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %69, <32 x i32> %66)
  %71 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %70, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %72 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %65, <32 x i32> %71)
  %73 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %72)
  %74 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %73, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %75 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %76 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %77 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %76)
  %78 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %77, <32 x i32> %75)
  %79 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %78, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %80 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %81 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %82 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %81)
  %83 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %82, <32 x i32> %80)
  %84 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %83, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %85 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %79, <32 x i32> %84)
  %86 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %85)
  %87 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %86, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %88 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %74, <32 x i32> %87)
  %89 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %88)
  %90 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %91 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %92 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %91)
  %93 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %92, <32 x i32> %90)
  %94 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %93, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %95 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %96 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %97 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %96)
  %98 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %97, <32 x i32> %95)
  %99 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %98, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %100 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %94, <32 x i32> %99)
  %101 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %100)
  %102 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %101, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %103 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %104 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %105 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %104)
  %106 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %105, <32 x i32> %103)
  %107 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %106, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %108 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %109 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %110 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %109)
  %111 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %110, <32 x i32> %108)
  %112 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %111, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %113 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %107, <32 x i32> %112)
  %114 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %113)
  %115 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %114, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %116 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %102, <32 x i32> %115)
  %117 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %116)
  %118 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %89, <32 x i32> %117)
  %119 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %59, <32 x i32> %118)
  %120 = bitcast <128 x i16> %arg.9 to <64 x i32>
  %121 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %119)
  %122 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %121)
  %123 = bitcast <64 x i16> <i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255> to <32 x i32>
  %124 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %122)
  %125 = bitcast <64 x i16> zeroinitializer to <32 x i32>
  %126 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %124)
  %127 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %128 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %129 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %128)
  %130 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %129, <32 x i32> %127)
  %131 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %130, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %132 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %133 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %134 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %133)
  %135 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %134, <32 x i32> %132)
  %136 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %135, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %137 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %131, <32 x i32> %136)
  %138 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %137)
  %139 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %138, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %140 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %141 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %142 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %141)
  %143 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %142, <32 x i32> %140)
  %144 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %143, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %145 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %146 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %147 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %146)
  %148 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %147, <32 x i32> %145)
  %149 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %148, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %150 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %144, <32 x i32> %149)
  %151 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %150)
  %152 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %151, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %153 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %139, <32 x i32> %152)
  %154 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %153)
  %155 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %156 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %157 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %156)
  %158 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %157, <32 x i32> %155)
  %159 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %158, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %160 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %161 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %162 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %161)
  %163 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %162, <32 x i32> %160)
  %164 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %163, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %165 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %159, <32 x i32> %164)
  %166 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %165)
  %167 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %166, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %168 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %169 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %170 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %169)
  %171 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %170, <32 x i32> %168)
  %172 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %171, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %173 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %174 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %175 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %174)
  %176 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %175, <32 x i32> %173)
  %177 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %176, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %178 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %172, <32 x i32> %177)
  %179 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %178)
  %180 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %179, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %181 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %167, <32 x i32> %180)
  %182 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %181)
  %183 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %154, <32 x i32> %182)
  %184 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %185 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %186 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %185)
  %187 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %186, <32 x i32> %184)
  %188 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %187, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %189 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %190 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %191 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %190)
  %192 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %191, <32 x i32> %189)
  %193 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %192, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %194 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %188, <32 x i32> %193)
  %195 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %194)
  %196 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %195, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %197 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %198 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %199 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %198)
  %200 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %199, <32 x i32> %197)
  %201 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %200, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %202 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %203 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %204 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %203)
  %205 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %204, <32 x i32> %202)
  %206 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %205, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %207 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %201, <32 x i32> %206)
  %208 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %207)
  %209 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %208, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %210 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %196, <32 x i32> %209)
  %211 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %210)
  %212 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %213 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %214 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %213)
  %215 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %214, <32 x i32> %212)
  %216 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %215, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %217 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %218 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %219 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %218)
  %220 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %219, <32 x i32> %217)
  %221 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %220, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %222 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %216, <32 x i32> %221)
  %223 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %222)
  %224 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %223, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %225 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %226 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %227 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %226)
  %228 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %227, <32 x i32> %225)
  %229 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %228, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %230 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %231 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %232 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %231)
  %233 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %232, <32 x i32> %230)
  %234 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %233, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %235 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %229, <32 x i32> %234)
  %236 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %235)
  %237 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %236, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %238 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %224, <32 x i32> %237)
  %239 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %238)
  %240 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %211, <32 x i32> %239)
  %241 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %183, <32 x i32> %240)
  %242 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %241)
  %243 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %242)
  %244 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %243)
  %245 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %244)
  %246 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %126, <32 x i32> %245)
  %247 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %246)
  %248 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %249 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %250 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %249)
  %251 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %250, <32 x i32> %248)
  %252 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %251, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %253 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %254 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %255 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %254)
  %256 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %255, <32 x i32> %253)
  %257 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %256, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %258 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %252, <32 x i32> %257)
  %259 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %258)
  %260 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %259, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %261 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %262 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %263 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %262)
  %264 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %263, <32 x i32> %261)
  %265 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %264, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %266 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %267 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %268 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %267)
  %269 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %268, <32 x i32> %266)
  %270 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %269, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %271 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %265, <32 x i32> %270)
  %272 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %271)
  %273 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %272, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %274 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %260, <32 x i32> %273)
  %275 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %274)
  %276 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %277 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %278 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %277)
  %279 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %278, <32 x i32> %276)
  %280 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %279, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %281 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %282 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %283 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %282)
  %284 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %283, <32 x i32> %281)
  %285 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %284, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %286 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %280, <32 x i32> %285)
  %287 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %286)
  %288 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %287, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %289 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %290 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %291 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %290)
  %292 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %291, <32 x i32> %289)
  %293 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %292, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %294 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %295 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %296 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %295)
  %297 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %296, <32 x i32> %294)
  %298 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %297, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %299 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %293, <32 x i32> %298)
  %300 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %299)
  %301 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %300, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %302 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %288, <32 x i32> %301)
  %303 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %302)
  %304 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %275, <32 x i32> %303)
  %305 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %306 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %307 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %306)
  %308 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %307, <32 x i32> %305)
  %309 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %308, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %310 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %311 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %312 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %311)
  %313 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %312, <32 x i32> %310)
  %314 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %313, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %315 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %309, <32 x i32> %314)
  %316 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %315)
  %317 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %316, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %318 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %319 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %320 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %319)
  %321 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %320, <32 x i32> %318)
  %322 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %321, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %323 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %324 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %325 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %324)
  %326 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %325, <32 x i32> %323)
  %327 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %326, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %328 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %322, <32 x i32> %327)
  %329 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %328)
  %330 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %329, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %331 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %317, <32 x i32> %330)
  %332 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %331)
  %333 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %334 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %335 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %334)
  %336 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %335, <32 x i32> %333)
  %337 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %336, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %338 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %339 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %340 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %339)
  %341 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %340, <32 x i32> %338)
  %342 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %341, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %343 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %337, <32 x i32> %342)
  %344 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %343)
  %345 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %344, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %346 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %347 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %348 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %347)
  %349 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %348, <32 x i32> %346)
  %350 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %349, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %351 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %352 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %353 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %352)
  %354 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %353, <32 x i32> %351)
  %355 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %354, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %356 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %350, <32 x i32> %355)
  %357 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %356)
  %358 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %357, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %359 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %345, <32 x i32> %358)
  %360 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %359)
  %361 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %332, <32 x i32> %360)
  %362 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %304, <32 x i32> %361)
  %363 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %362)
  %364 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %363)
  %365 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %364)
  %366 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %365)
  %367 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %368 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %369 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %368)
  %370 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %369, <32 x i32> %367)
  %371 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %370, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %372 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %373 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %374 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %373)
  %375 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %374, <32 x i32> %372)
  %376 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %375, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %377 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %371, <32 x i32> %376)
  %378 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %377)
  %379 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %378, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %380 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %381 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %382 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %381)
  %383 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %382, <32 x i32> %380)
  %384 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %383, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %385 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %386 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %387 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %386)
  %388 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %387, <32 x i32> %385)
  %389 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %388, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %390 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %384, <32 x i32> %389)
  %391 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %390)
  %392 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %391, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %393 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %379, <32 x i32> %392)
  %394 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %393)
  %395 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %396 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %397 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %396)
  %398 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %397, <32 x i32> %395)
  %399 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %398, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %400 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %401 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %402 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %401)
  %403 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %402, <32 x i32> %400)
  %404 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %403, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %405 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %399, <32 x i32> %404)
  %406 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %405)
  %407 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %406, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %408 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %409 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %410 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %409)
  %411 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %410, <32 x i32> %408)
  %412 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %411, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %413 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %414 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %8)
  %415 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.3, <32 x i32> %414)
  %416 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %415, <32 x i32> %413)
  %417 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %416, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %418 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %412, <32 x i32> %417)
  %419 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %418)
  %420 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %419, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %421 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %407, <32 x i32> %420)
  %422 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %421)
  %423 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %394, <32 x i32> %422)
  %424 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %425 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %426 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %425)
  %427 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %426, <32 x i32> %424)
  %428 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %427, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %429 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %430 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %431 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %430)
  %432 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %431, <32 x i32> %429)
  %433 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %432, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %434 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %428, <32 x i32> %433)
  %435 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %434)
  %436 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %435, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %437 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %438 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %439 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %438)
  %440 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %439, <32 x i32> %437)
  %441 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %440, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %442 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %443 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %444 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %443)
  %445 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %444, <32 x i32> %442)
  %446 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %445, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %447 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %441, <32 x i32> %446)
  %448 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %447)
  %449 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %448, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %450 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %436, <32 x i32> %449)
  %451 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %450)
  %452 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %453 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %454 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %453)
  %455 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %454, <32 x i32> %452)
  %456 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %455, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %457 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %458 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %459 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %458)
  %460 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %459, <32 x i32> %457)
  %461 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %460, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %462 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %456, <32 x i32> %461)
  %463 = call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %462)
  %464 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %463, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %465 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %466 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %61)
  %467 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.5, <32 x i32> %466)
  %468 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %467, <32 x i32> %465)
  %469 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %468, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %470 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %471 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %67)
  %472 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg.7, <32 x i32> %471)
  %473 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %472, <32 x i32> %470)
  %474 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %473, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %475 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %469, <32 x i32> %474)
  %476 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %475)
  %477 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> %476, <32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>)
  %478 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %464, <32 x i32> %477)
  %479 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %478)
  %480 = call <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32> %451, <32 x i32> %479)
  %481 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %423, <32 x i32> %480)
  %482 = call <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32> %120, <64 x i32> %481)
  %483 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %482)
  %484 = call <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32> %123, <32 x i32> %483)
  %485 = call <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32> %125, <32 x i32> %484)
  %486 = call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %366, <32 x i32> %485)
  %487 = call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %486)
  %488 = call <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32> %247, <32 x i32> %487)
  %489 = bitcast <128 x i8> %arg.10 to <32 x i32>
  %490 = call <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32> %489, <32 x i32> %488)
  %491 = bitcast <128 x i8> %arg.11 to <32 x i32>
  %492 = call <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32> %490, <32 x i32> %491)
  %493 = bitcast <32 x i32> %492 to <128 x i8>
  ret <128 x i8> %493
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.137(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.138(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.139(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.140(<32 x i32> %arg, <1 x i32> %arg.1) {
entry:
  %0 = bitcast <1 x i32> %arg.1 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = call <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32> %arg, <32 x i32> %1)
  ret <32 x i32> %2
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.141(<4 x i8> %arg, <128 x i8> %arg.1, <32 x i32> %arg.2) {
entry:
  %0 = bitcast <4 x i8> %arg to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <128 x i8> %arg.1 to <32 x i32>
  %3 = call <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32> %arg.2, <32 x i32> %2, <32 x i32> %1)
  ret <32 x i32> %3
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.142(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

define <32 x i32> @hydride.node.conv_nn_hvx_depth5.143(<32 x i32> %arg, <1 x i32> %arg.1, <1 x i32> %arg.2) {
entry:
  %0 = bitcast <1 x i32> %arg.2 to i32
  %1 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %0)
  %2 = bitcast <1 x i32> %arg.1 to i32
  %3 = call <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32 %2)
  %4 = call <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32> %arg, <32 x i32> %3)
  %5 = call <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32> %4, <32 x i32> %1)
  %6 = call <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32> %5, <32 x i32> <i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767, i32 32767>)
  %7 = call <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32> <i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768, i32 -32768>, <32 x i32> %6)
  ret <32 x i32> %7
}

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vrmpyubv.acc.128B(<32 x i32>, <32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vsubw.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lvsplatw.128B(i32) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vaddw.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vaddwsat.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vasrwv.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vminw.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmaxw.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vpackeh.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <64 x i32> @llvm.hexagon.V6.vaddhsat.dv.128B(<64 x i32>, <64 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vminh.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmaxh.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vpackeb.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vminub.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vmaxub.128B(<32 x i32>, <32 x i32>) #0

; Function Attrs: nounwind readnone
declare <32 x i32> @llvm.hexagon.V6.vaddhsat.128B(<32 x i32>, <32 x i32>) #0

attributes #0 = { nounwind readnone }
