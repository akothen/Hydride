#map = affine_map<(d0, d1) -> (d0 * 2 + d1)>
module {
  func.func @depthwise_conv_1d_nw_tensor(%arg0: tensor<1x113x96xi32>, %arg1: tensor<3x96xi32>) -> tensor<1x56x96xi32> {
    %0 = bufferization.to_memref %arg1 : memref<3x96xi32>
    %1 = bufferization.to_memref %arg0 : memref<1x113x96xi32>
    %2 = linalg.init_tensor [1, 56, 96] : tensor<1x56x96xi32>
    %3 = bufferization.to_memref %2 : memref<1x56x96xi32>
    %4 = memref.alloc() {alignment = 128 : i64} : memref<1x56x96xi32>
    memref.copy %3, %4 : memref<1x56x96xi32> to memref<1x56x96xi32>
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 56 {
        affine.for %arg4 = 0 to 96 {
          affine.for %arg5 = 0 to 3 {
            %6 = affine.apply #map(%arg3, %arg5)
            %7 = affine.load %1[%arg2, %6, %arg4] : memref<1x113x96xi32>
            %8 = affine.load %0[%arg5, %arg4] : memref<3x96xi32>
            %9 = affine.load %4[%arg2, %arg3, %arg4] : memref<1x56x96xi32>
            %10 = arith.muli %7, %8 : i32
            %11 = arith.addi %9, %10 : i32
            affine.store %11, %4[%arg2, %arg3, %arg4] : memref<1x56x96xi32>
          }
        }
      }
    }
    %5 = bufferization.to_tensor %4 : memref<1x56x96xi32>
    return %5 : tensor<1x56x96xi32>
  }
}

