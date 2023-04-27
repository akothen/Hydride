module {
  func.func @contraction_matmul(%arg0: memref<1584x1584xi32>, %arg1: memref<1584x1584xi32>, %arg2: memref<1584x1584xi32>) {
    affine.for %arg3 = 0 to 1584 {
      affine.for %arg4 = 0 to 1584 step 8 {
        affine.for %arg5 = 0 to 1584 {
          %c0_i32 = arith.constant 0 : i32
          %0 = vector.transfer_read %arg0[%arg3, %arg5], %c0_i32 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_0 = arith.constant 0 : i32
          %1 = vector.transfer_read %arg1[%arg5, %arg4], %c0_i32_0 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_1 = arith.constant 0 : i32
          %2 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_1 : memref<1584x1584xi32>, vector<8xi32>
          %3 = arith.muli %0, %1 : vector<8xi32>
          %4 = arith.addi %2, %3 : vector<8xi32>
          vector.transfer_write %4, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
        }
      }
    }
    return
  }
}

