#map0 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1 * 3 + d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map3 = affine_map<(d0, d1, d2) -> (0)>
module {
  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xi32>, %arg1: memref<1x3x8xi32>, %arg2: memref<4x2x8xi32>) {
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 2 {
        affine.for %arg5 = 0 to 8 step 8 {
          affine.for %arg6 = 0 to 1 {
            affine.for %arg7 = 0 to 3 {
              %0 = affine.apply #map0(%arg3, %arg4, %arg6, %arg7)
              %1 = affine.apply #map1(%arg3, %arg4, %arg6, %arg7)
              %2 = affine.apply #map2(%arg3, %arg4, %arg6, %arg7)
              %c0_i32 = arith.constant 0 : i32
              %3 = vector.transfer_read %arg0[%0, %1, %2], %c0_i32 {permutation_map = #map3} : memref<4x6x3xi32>, vector<8xi32>
              %c0_i32_0 = arith.constant 0 : i32
              %4 = vector.transfer_read %arg1[%arg6, %arg7, %arg5], %c0_i32_0 : memref<1x3x8xi32>, vector<8xi32>
              %c0_i32_1 = arith.constant 0 : i32
              %5 = vector.transfer_read %arg2[%arg3, %arg4, %arg5], %c0_i32_1 : memref<4x2x8xi32>, vector<8xi32>
              %6 = arith.muli %3, %4 : vector<8xi32>
              %7 = arith.addi %5, %6 : vector<8xi32>
              vector.transfer_write %7, %arg2[%arg3, %arg4, %arg5] : vector<8xi32>, memref<4x2x8xi32>
            }
          }
        }
      }
    }
    return  
  }
}

