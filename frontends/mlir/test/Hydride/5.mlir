#map0 = affine_map<(d0, d1) -> (0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0) -> (d0 + 3)>
module {
  llvm.func @hydride.node.contraction_matmul.3(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @hydride.node.contraction_matmul.2(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @hydride.node.contraction_matmul.1(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @hydride.node.contraction_matmul.0(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
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
          %5 = llvm.call @hydride.node.contraction_matmul.0(%2, %0, %1) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
          vector.transfer_write %5, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
          %6 = affine.apply #map1(%arg5)
          %c0_i32_2 = arith.constant 0 : i32
          %7 = vector.transfer_read %arg0[%arg3, %6], %c0_i32_2 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_3 = arith.constant 0 : i32
          %8 = vector.transfer_read %arg1[%6, %arg4], %c0_i32_3 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_4 = arith.constant 0 : i32
          %9 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_4 : memref<1584x1584xi32>, vector<8xi32>
          %10 = arith.muli %7, %8 : vector<8xi32>
          %11 = arith.addi %9, %10 : vector<8xi32>
          %12 = llvm.call @hydride.node.contraction_matmul.1(%9, %7, %8) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
          vector.transfer_write %12, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
          %13 = affine.apply #map2(%arg5)
          %c0_i32_5 = arith.constant 0 : i32
          %14 = vector.transfer_read %arg0[%arg3, %13], %c0_i32_5 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_6 = arith.constant 0 : i32
          %15 = vector.transfer_read %arg1[%13, %arg4], %c0_i32_6 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_7 = arith.constant 0 : i32
          %16 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_7 : memref<1584x1584xi32>, vector<8xi32>
          %17 = arith.muli %14, %15 : vector<8xi32>
          %18 = arith.addi %16, %17 : vector<8xi32>
          %19 = llvm.call @hydride.node.contraction_matmul.2(%16, %14, %15) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
          vector.transfer_write %19, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
          %20 = affine.apply #map3(%arg5)
          %c0_i32_8 = arith.constant 0 : i32
          %21 = vector.transfer_read %arg0[%arg3, %20], %c0_i32_8 {permutation_map = #map0} : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_9 = arith.constant 0 : i32
          %22 = vector.transfer_read %arg1[%20, %arg4], %c0_i32_9 : memref<1584x1584xi32>, vector<8xi32>
          %c0_i32_10 = arith.constant 0 : i32
          %23 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_10 : memref<1584x1584xi32>, vector<8xi32>
          %24 = arith.muli %21, %22 : vector<8xi32>
          %25 = arith.addi %23, %24 : vector<8xi32>
          %26 = llvm.call @hydride.node.contraction_matmul.3(%23, %21, %22) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
          vector.transfer_write %26, %arg2[%arg3, %arg4] : vector<8xi32>, memref<1584x1584xi32>
        }
      }
    }
    return
  }
}

