#map0 = affine_map<(d0, d1) -> (0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0) -> (d0 + 3)>
module {
  func.func @contraction_matmul(%arg0: memref<1584x1584xi32>, %arg1: memref<1584x1584xi32>, %arg2: memref<1584x1584xi32>) {
    affine.for %arg3 = 0 to 1584 {
      affine.for %arg4 = 0 to 1584 step 8 {
        affine.for %arg5 = 0 to 1584 step 4 {
          %c0_i32 = arith.constant 0 : i32
          %0 = vector.transfer_read %arg0[%arg3, %arg5], %c0_i32 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_0 = arith.constant 0 : i32
          %1 = vector.transfer_read %arg1[%arg5, %arg4], %c0_i32_0 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_1 = arith.constant 0 : i32
          %2 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_1 : memref<1584x1584xi32>, vector<8xi32>
          %3 = arith.muli %0, %1 : vector<8xi32>
          %4 = arith.addi %2, %3 : vector<8xi32>
          vector.transfer_write %4, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
          %5 = affine.apply #map1(%arg5)
          %c0_i32_2 = arith.constant 0 : i32
          %6 = vector.transfer_read %arg0[%arg3, %5], %c0_i32_2 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_3 = arith.constant 0 : i32
          %7 = vector.transfer_read %arg1[%5, %arg4], %c0_i32_3 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_4 = arith.constant 0 : i32
          %8 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_4 : memref<1584x1584xi32>, vector<8xi32>
          %9 = arith.muli %6, %7 : vector<8xi32>
          %10 = arith.addi %8, %9 : vector<8xi32>
          vector.transfer_write %10, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
          %11 = affine.apply #map2(%arg5)
          %c0_i32_5 = arith.constant 0 : i32
          %12 = vector.transfer_read %arg0[%arg3, %11], %c0_i32_5 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_6 = arith.constant 0 : i32
          %13 = vector.transfer_read %arg1[%11, %arg4], %c0_i32_6 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_7 = arith.constant 0 : i32
          %14 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_7 : memref<1584x1584xi32>, vector<8xi32>
          %15 = arith.muli %12, %13 : vector<8xi32>
          %16 = arith.addi %14, %15 : vector<8xi32>
          vector.transfer_write %16, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
          %17 = affine.apply #map3(%arg5)
          %c0_i32_8 = arith.constant 0 : i32
          %18 = vector.transfer_read %arg0[%arg3, %17], %c0_i32_8 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_9 = arith.constant 0 : i32
          %19 = vector.transfer_read %arg1[%17, %arg4], %c0_i32_9 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_10 = arith.constant 0 : i32
          %20 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_10 : memref<1584x1584xi32>, vector<8xi32>
          %21 = arith.muli %18, %19 : vector<8xi32>
          %22 = arith.addi %20, %21 : vector<8xi32>
          vector.transfer_write %22, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
        }
      }
    }
    return
  }
}

