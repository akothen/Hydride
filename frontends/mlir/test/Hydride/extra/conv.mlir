module {
  func.func @conv2d_nhwc_4x1x2x8_tensor(%arg0: tensor<4x1x6x3xf32>, %arg1: tensor<1x2x3x8xf32>, %arg2: tensor<4x1x2x8xf32>) -> tensor<4x1x2x8xf32> {
    %0 = tensor.extract_slice %arg0[0, 0, 0, 0] [4, 1, 6, 3] [1, 1, 1, 1] : tensor<4x1x6x3xf32> to tensor<4x6x3xf32>
    %1 = tensor.extract_slice %arg1[0, 0, 0, 0] [1, 2, 3, 8] [1, 1, 1, 1] : tensor<1x2x3x8xf32> to tensor<2x3x8xf32>
    %2 = tensor.extract_slice %arg2[0, 0, 0, 0] [4, 1, 2, 8] [1, 1, 1, 1] : tensor<4x1x2x8xf32> to tensor<4x2x8xf32>
    %3 = linalg.conv_1d_nwc_wcf {dilations = dense<3> : vector<1xi64>, strides = dense<2> : vector<1xi64>} ins(%0, %1 : tensor<4x6x3xf32>, tensor<2x3x8xf32>) outs(%2 : tensor<4x2x8xf32>) -> tensor<4x2x8xf32>
    %4 = tensor.insert_slice %3 into %arg2[0, 0, 0, 0] [4, 1, 2, 8] [1, 1, 1, 1] : tensor<4x2x8xf32> into tensor<4x1x2x8xf32>
    return %4 : tensor<4x1x2x8xf32>
  }
  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xf32>, %arg1: memref<1x3x8xf32>, %arg2: memref<4x2x8xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : memref<4x6x3xf32>, memref<1x3x8xf32>) outs(%arg2 : memref<4x2x8xf32>)
    return
  }
}