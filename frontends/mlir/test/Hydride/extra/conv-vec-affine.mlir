#map = affine_map<(d0) -> (d0 * 3)>
module {
  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xi32>, %arg1: memref<1x3x8xi32>, %arg2: memref<4x2x8xi32>) {
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    scf.parallel (%arg3, %arg4, %arg5) = (%c0, %c0, %c0) to (%c4, %c2, %c8) step (%c1, %c1, %c1) {
      scf.for %arg6 = %c0 to %c3 step %c1 {
        %0 = affine.apply #map(%arg4)
        %1 = memref.load %arg0[%arg3, %0, %arg6] : memref<4x6x3xi32>
        %2 = memref.load %arg1[%c0, %arg6, %arg5] : memref<1x3x8xi32>
        %3 = memref.load %arg2[%arg3, %arg4, %arg5] : memref<4x2x8xi32>
        %4 = arith.muli %1, %2 : i32
        %5 = arith.addi %3, %4 : i32
        memref.store %5, %arg2[%arg3, %arg4, %arg5] : memref<4x2x8xi32>
      }
      scf.yield
    }
    return
  }
}

