

define <256 x i8> @matmul_kernel(<64 x i32> %arg, <64 x i16> %arg.1, <64 x i16> %arg.2, <64 x i16> %arg.3, <64 x i16> %arg.4) {
entry:
  %0 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %arg)
  %1 = bitcast <64 x i16> %arg.1 to <32 x i32>
  %2 = tail call <64 x i32> @llvm.hexagon.V6.vzh.128B(<32 x i32> %1)
  %3 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %2)
  %4 = bitcast <64 x i16> %arg.2 to <32 x i32>
  %5 = tail call <64 x i32> @llvm.hexagon.V6.vzh.128B(<32 x i32> %4)
  %6 = tail call <32 x i32> @llvm.hexagon.V6.lo.128B(<64 x i32> %5)
  %7 = tail call <32 x i32> @llvm.hexagon.V6.vdmpyhvsat.acc.128B(<32 x i32> %0, <32 x i32> %3, <32 x i32> %6)
  %8 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %arg)
  %9 = bitcast <64 x i16> %arg.4 to <32 x i32>
  %10 = tail call <64 x i32> @llvm.hexagon.V6.vzh.128B(<32 x i32> %9)
  %11 = tail call <32 x i32> @llvm.hexagon.V6.hi.128B(<64 x i32> %10)
  %12 = bitcast <64 x i16> %arg.3 to <32 x i32>
  %13 = tail call <32 x i32> @llvm.hexagon.V6.vdmpyhvsat.acc.128B(<32 x i32> %8, <32 x i32> %12, <32 x i32> %11)
  %14 = tail call <64 x i32> @llvm.hexagon.V6.vcombine.128B(<32 x i32> %7, <32 x i32> %13)
  %15 = bitcast <64 x i32> %14 to <256 x i8>
  ret <256 x i8> %15
}
