module {
  func.func @depthwise_conv_1d_nw_tensor(%arg0: tensor<1x113x96xi32>, %arg1: tensor<3x96xi32>) -> tensor<1x56x96xi32> {
    %0 = bufferization.to_memref %arg1 : memref<3x96xi32>
    %1 = bufferization.to_memref %arg0 : memref<1x113x96xi32>
    %2 = linalg.init_tensor [1, 56, 96] : tensor<1x56x96xi32>
    %3 = bufferization.to_memref %2 : memref<1x56x96xi32>
    %4 = memref.alloc() {alignment = 128 : i64} : memref<1x56x96xi32>
    memref.copy %3, %4 : memref<1x56x96xi32> to memref<1x56x96xi32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_0 = arith.constant 1 : index
    scf.for %arg2 = %c0 to %c1 step %c1_0 {
      %c0_1 = arith.constant 0 : index
      %c56 = arith.constant 56 : index
      %c1_2 = arith.constant 1 : index
      scf.for %arg3 = %c0_1 to %c56 step %c1_2 {
        %c0_3 = arith.constant 0 : index
        %c96 = arith.constant 96 : index
        %c1_4 = arith.constant 1 : index
        scf.for %arg4 = %c0_3 to %c96 step %c1_4 {
          %c0_5 = arith.constant 0 : index
          %c3 = arith.constant 3 : index
          %c1_6 = arith.constant 1 : index
          scf.for %arg5 = %c0_5 to %c3 step %c1_6 {
            %c2 = arith.constant 2 : index
            %6 = arith.muli %arg3, %c2 : index
            %7 = arith.addi %6, %arg5 : index
            %8 = memref.load %1[%arg2, %7, %arg4] : memref<1x113x96xi32>
            %9 = memref.load %0[%arg5, %arg4] : memref<3x96xi32>
            %10 = memref.load %4[%arg2, %arg3, %arg4] : memref<1x56x96xi32>
            %11 = arith.muli %8, %9 : i32
            %12 = arith.addi %10, %11 : i32
            memref.store %12, %4[%arg2, %arg3, %arg4] : memref<1x56x96xi32>
          }
        }
      }
    }
    %5 = bufferization.to_tensor %4 : memref<1x56x96xi32>
    return %5 : tensor<1x56x96xi32>
  }
}

