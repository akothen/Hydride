module {
  func.func @contraction_matmul(%arg0: memref<1584x1584xi32>, %arg1: memref<1584x1584xi32>, %arg2: memref<1584x1584xi32>) {
    affine.for %arg3 = 0 to 1584 {
      affine.for %arg4 = 0 to 1584 {
        affine.for %arg5 = 0 to 1584 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<1584x1584xi32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<1584x1584xi32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<1584x1584xi32>
          %3 = arith.muli %0, %1 : i32
          %4 = arith.addi %2, %3 : i32
          affine.store %4, %arg2[%arg3, %arg4] : memref<1584x1584xi32>
        }
      }
    }
    return
  }
}

