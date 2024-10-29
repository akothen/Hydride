#map0 = affine_map<(d0, d1, d2, d3) -> (d0 + d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2 + d3)>
#map2 = affine_map<(d0, d1) -> (d0 * 3 + d1)>
#map3 = affine_map<(d0) -> (0)>
module {
  func.func private @hydride.node.conv2d.0(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func @conv2d(%arg0: memref<2048x2048xi32>, %arg1: memref<9xi32>, %arg2: memref<2046x2046xi32>) {
    affine.for %arg3 = 0 to 2046 {
      affine.for %arg4 = 0 to 2046 step 8 {
        affine.for %arg5 = 0 to 3 {
          affine.for %arg6 = 0 to 3 {
            %c0_i32 = arith.constant 0 : i32
            %0 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32 : memref<2046x2046xi32>, vector<8xi32>
            %1 = affine.apply #map0(%arg3, %arg5, %arg4, %arg6)
            %2 = affine.apply #map1(%arg3, %arg5, %arg4, %arg6)
            %c0_i32_0 = arith.constant 0 : i32
            %3 = vector.transfer_read %arg0[%1, %2], %c0_i32_0 : memref<2048x2048xi32>, vector<8xi32>
            %4 = affine.apply #map2(%arg5, %arg6)
            %c0_i32_1 = arith.constant 0 : i32
            %5 = vector.transfer_read %arg1[%4], %c0_i32_1 {permutation_map = #map3} : memref<9xi32>, vector<8xi32>
            %6 = arith.muli %3, %5 : vector<8xi32>
            %7 = arith.addi %0, %6 : vector<8xi32>
            %8 = func.call @hydride.node.conv2d.0(%0, %3, %5) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
            vector.transfer_write %8, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
          }
        }
      }
    }
    return
  }
}

