func.func @depthwise_conv_1d_nw_tensor(%input: tensor<1x113x96xi32>, %filter: tensor<3x96xi32>) -> tensor<1x56x96xi32> {
  %init = linalg.init_tensor [1, 56, 96] : tensor<1x56x96xi32>
  %0 = linalg.depthwise_conv_1d_nwc_wc {dilations = dense<1> : vector<1xi64>, strides = dense<2> : vector<1xi64>}
         ins(%input, %filter: tensor<1x113x96xi32>, tensor<3x96xi32>)
         outs(%init: tensor<1x56x96xi32>) -> tensor<1x56x96xi32>
  return %0: tensor<1x56x96xi32>
}