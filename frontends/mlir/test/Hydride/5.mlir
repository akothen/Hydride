#map0 = affine_map<(d0, d1, d2, d3) -> (d0 + d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2 + d3)>
#map2 = affine_map<(d0, d1) -> (d0 * 16 + d1 * 2)>
#map3 = affine_map<(d0) -> (0)>
module {
  llvm.func @hydride.node.conv2d.0(vector<8xi8>, vector<8xi8>, vector<8xi8>) -> vector<8xi8>
  func.func @conv2d(%arg0: memref<18x288xi8>, %arg1: memref<48xi8>, %arg2: memref<16x256xi8>) {
    affine.for %arg3 = 0 to 16 {
      affine.for %arg4 = 0 to 256 step 8 {
        affine.for %arg5 = 0 to 3 {
          affine.for %arg6 = 0 to 3 {
            %c0_i8 = arith.constant 0 : i8
            %0 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i8 : memref<16x256xi8>, vector<8xi8>
            %1 = affine.apply #map0(%arg3, %arg5, %arg4, %arg6)
            %2 = affine.apply #map1(%arg3, %arg5, %arg4, %arg6)
            %c0_i8_0 = arith.constant 0 : i8
            %3 = vector.transfer_read %arg0[%1, %2], %c0_i8_0 : memref<18x288xi8>, vector<8xi8>
            %4 = affine.apply #map2(%arg5, %arg6)
            %c0_i8_1 = arith.constant 0 : i8
            %5 = vector.transfer_read %arg1[%4], %c0_i8_1 {permutation_map = #map3} : memref<48xi8>, vector<8xi8>
            %6 = arith.muli %3, %5 : vector<8xi8>
            %7 = arith.addi %0, %6 : vector<8xi8>
            %8 = llvm.call @hydride.node.conv2d.0(%0, %3, %5) : (vector<8xi8>, vector<8xi8>, vector<8xi8>) -> vector<8xi8>
            vector.transfer_write %8, %arg2[%arg3, %arg4] : vector<8xi8>, memref<16x256xi8>
          }
        }
      }
    }
    return
  }
}

