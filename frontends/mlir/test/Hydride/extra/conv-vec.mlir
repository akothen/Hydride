func.func @conv1d_nwc_4x2x8_memref(%input: memref<4x6x3xi32>, %filter: memref<1x3x8xi32>, %output: memref<4x2x8xi32>) {
  linalg.conv_1d_nwc_wcf
    {dilations = dense<1> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>}
    ins(%input, %filter : memref<4x6x3xi32>, memref<1x3x8xi32>)
    outs(%output : memref<4x2x8xi32>)
  return
}