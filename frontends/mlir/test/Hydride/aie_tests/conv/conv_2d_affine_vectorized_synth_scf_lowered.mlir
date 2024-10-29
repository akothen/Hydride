#map = affine_map<(d0) -> (0)>
module {
  func.func private @hydride.node.conv2d.0(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func @conv2d(%arg0: memref<2048x2048xi32>, %arg1: memref<9xi32>, %arg2: memref<2046x2046xi32>) {
    %c0 = arith.constant 0 : index
    %c2046 = arith.constant 2046 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0 to %c2046 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c2046_1 = arith.constant 2046 : index
      %c8 = arith.constant 8 : index
      scf.for %arg4 = %c0_0 to %c2046_1 step %c8 {
        %c0_2 = arith.constant 0 : index
        %c3 = arith.constant 3 : index
        %c1_3 = arith.constant 1 : index
        scf.for %arg5 = %c0_2 to %c3 step %c1_3 {
          %c0_4 = arith.constant 0 : index
          %c3_5 = arith.constant 3 : index
          %c1_6 = arith.constant 1 : index
          scf.for %arg6 = %c0_4 to %c3_5 step %c1_6 {
            %c0_i32 = arith.constant 0 : i32
            %0 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32 : memref<2046x2046xi32>, vector<8xi32>
            %1 = arith.addi %arg3, %arg5 : index
            %2 = arith.addi %arg4, %arg6 : index
            %c0_i32_7 = arith.constant 0 : i32
            %3 = vector.transfer_read %arg0[%1, %2], %c0_i32_7 : memref<2048x2048xi32>, vector<8xi32>
            %c3_8 = arith.constant 3 : index
            %4 = arith.muli %arg5, %c3_8 : index
            %5 = arith.addi %4, %arg6 : index
            %c0_i32_9 = arith.constant 0 : i32
            %6 = vector.transfer_read %arg1[%5], %c0_i32_9 {permutation_map = #map} : memref<9xi32>, vector<8xi32>
            %7 = arith.muli %3, %6 : vector<8xi32>
            %8 = arith.addi %0, %7 : vector<8xi32>
            %9 = func.call @hydride.node.conv2d.0(%0, %3, %6) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
            vector.transfer_write %9, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
          }
        }
      }
    }
    return
  }
}

