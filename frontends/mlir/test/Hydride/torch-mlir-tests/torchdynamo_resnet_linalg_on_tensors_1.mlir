#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (0, d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, 0, 0)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map6 = affine_map<(d0, d1, d2, d3) -> (d0, d1, 0, 0)>
#map7 = affine_map<(d0, d1, d2, d3) -> (0, d1, 0, 0)>
#map8 = affine_map<(d0, d1) -> (d0, d1)>
#map9 = affine_map<(d0, d1) -> (d1, d0)>
#map10 = affine_map<(d0, d1) -> (d1)>
#map11 = affine_map<(d0, d1) -> (0, d1)>
module attributes {torch.debug_module_name = "GraphModule"} {
  ml_program.global private mutable @global_seed(dense<0> : tensor<i64>) : tensor<i64>
  func.func @forward(%arg0: tensor<64x3x7x7xf32>, %arg1: tensor<64xf32>, %arg2: tensor<64xf32>, %arg3: tensor<64x64x3x3xf32>, %arg4: tensor<64xf32>, %arg5: tensor<64xf32>, %arg6: tensor<64x64x3x3xf32>, %arg7: tensor<64xf32>, %arg8: tensor<64xf32>, %arg9: tensor<64x64x3x3xf32>, %arg10: tensor<64xf32>, %arg11: tensor<64xf32>, %arg12: tensor<64x64x3x3xf32>, %arg13: tensor<64xf32>, %arg14: tensor<64xf32>, %arg15: tensor<128x64x3x3xf32>, %arg16: tensor<128xf32>, %arg17: tensor<128xf32>, %arg18: tensor<128x128x3x3xf32>, %arg19: tensor<128xf32>, %arg20: tensor<128xf32>, %arg21: tensor<128x64x1x1xf32>, %arg22: tensor<128xf32>, %arg23: tensor<128xf32>, %arg24: tensor<128x128x3x3xf32>, %arg25: tensor<128xf32>, %arg26: tensor<128xf32>, %arg27: tensor<128x128x3x3xf32>, %arg28: tensor<128xf32>, %arg29: tensor<128xf32>, %arg30: tensor<256x128x3x3xf32>, %arg31: tensor<256xf32>, %arg32: tensor<256xf32>, %arg33: tensor<256x256x3x3xf32>, %arg34: tensor<256xf32>, %arg35: tensor<256xf32>, %arg36: tensor<256x128x1x1xf32>, %arg37: tensor<256xf32>, %arg38: tensor<256xf32>, %arg39: tensor<256x256x3x3xf32>, %arg40: tensor<256xf32>, %arg41: tensor<256xf32>, %arg42: tensor<256x256x3x3xf32>, %arg43: tensor<256xf32>, %arg44: tensor<256xf32>, %arg45: tensor<512x256x3x3xf32>, %arg46: tensor<512xf32>, %arg47: tensor<512xf32>, %arg48: tensor<512x512x3x3xf32>, %arg49: tensor<512xf32>, %arg50: tensor<512xf32>, %arg51: tensor<512x256x1x1xf32>, %arg52: tensor<512xf32>, %arg53: tensor<512xf32>, %arg54: tensor<512x512x3x3xf32>, %arg55: tensor<512xf32>, %arg56: tensor<512xf32>, %arg57: tensor<512x512x3x3xf32>, %arg58: tensor<512xf32>, %arg59: tensor<512xf32>, %arg60: tensor<1000x512xf32>, %arg61: tensor<1000xf32>, %arg62: tensor<64xf32>, %arg63: tensor<64xf32>, %arg64: tensor<i64>, %arg65: tensor<64xf32>, %arg66: tensor<64xf32>, %arg67: tensor<i64>, %arg68: tensor<64xf32>, %arg69: tensor<64xf32>, %arg70: tensor<i64>, %arg71: tensor<64xf32>, %arg72: tensor<64xf32>, %arg73: tensor<i64>, %arg74: tensor<64xf32>, %arg75: tensor<64xf32>, %arg76: tensor<i64>, %arg77: tensor<128xf32>, %arg78: tensor<128xf32>, %arg79: tensor<i64>, %arg80: tensor<128xf32>, %arg81: tensor<128xf32>, %arg82: tensor<i64>, %arg83: tensor<128xf32>, %arg84: tensor<128xf32>, %arg85: tensor<i64>, %arg86: tensor<128xf32>, %arg87: tensor<128xf32>, %arg88: tensor<i64>, %arg89: tensor<128xf32>, %arg90: tensor<128xf32>, %arg91: tensor<i64>, %arg92: tensor<256xf32>, %arg93: tensor<256xf32>, %arg94: tensor<i64>, %arg95: tensor<256xf32>, %arg96: tensor<256xf32>, %arg97: tensor<i64>, %arg98: tensor<256xf32>, %arg99: tensor<256xf32>, %arg100: tensor<i64>, %arg101: tensor<256xf32>, %arg102: tensor<256xf32>, %arg103: tensor<i64>, %arg104: tensor<256xf32>, %arg105: tensor<256xf32>, %arg106: tensor<i64>, %arg107: tensor<512xf32>, %arg108: tensor<512xf32>, %arg109: tensor<i64>, %arg110: tensor<512xf32>, %arg111: tensor<512xf32>, %arg112: tensor<i64>, %arg113: tensor<512xf32>, %arg114: tensor<512xf32>, %arg115: tensor<i64>, %arg116: tensor<512xf32>, %arg117: tensor<512xf32>, %arg118: tensor<i64>, %arg119: tensor<512xf32>, %arg120: tensor<512xf32>, %arg121: tensor<i64>, %arg122: tensor<1x3x224x224xf32>) -> (tensor<1x1000xf32>, tensor<64x3x7x7xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<128x64x3x3xf32>, tensor<128xf32>, tensor<128x128x3x3xf32>, tensor<128xf32>, tensor<128x64x1x1xf32>, tensor<128xf32>, tensor<128x128x3x3xf32>, tensor<128xf32>, tensor<128x128x3x3xf32>, tensor<128xf32>, tensor<256x128x3x3xf32>, tensor<256xf32>, tensor<256x256x3x3xf32>, tensor<256xf32>, tensor<256x128x1x1xf32>, tensor<256xf32>, tensor<256x256x3x3xf32>, tensor<256xf32>, tensor<256x256x3x3xf32>, tensor<256xf32>, tensor<512x256x3x3xf32>, tensor<512xf32>, tensor<512x512x3x3xf32>, tensor<512xf32>, tensor<512x256x1x1xf32>, tensor<512xf32>, tensor<512x512x3x3xf32>, tensor<512xf32>, tensor<512x512x3x3xf32>, tensor<512xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<1x3x224x224xf32>, tensor<1x64x112x112xf32>, tensor<1x64x112x112xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xi64>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512xf32>, tensor<512x1000xf32>) {
    %c-1_i64 = arith.constant -1 : i64
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %c112 = arith.constant 112 : index
    %cst_1 = arith.constant 0xFF800000 : f32
    %cst_2 = arith.constant 1.000000e-05 : f64
    %cst_3 = arith.constant 4.900000e+01 : f32
    %padded = tensor.pad %arg122 low[0, 0, 3, 3] high[0, 0, 3, 3] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x3x224x224xf32> to tensor<1x3x230x230xf32>
    %0 = tensor.empty() : tensor<1x64x112x112xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x64x112x112xf32>) -> tensor<1x64x112x112xf32>
    %2 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%padded, %arg0 : tensor<1x3x230x230xf32>, tensor<64x3x7x7xf32>) outs(%1 : tensor<1x64x112x112xf32>) -> tensor<1x64x112x112xf32>
    %3 = tensor.empty() : tensor<64xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg63 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %5 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%4 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<64xf32>
    %6 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%5 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %expanded = tensor.expand_shape %arg62 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %expanded_4 = tensor.expand_shape %6 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %7 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%2, %expanded : tensor<1x64x112x112xf32>, tensor<64x1x1xf32>) outs(%0 : tensor<1x64x112x112xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x112x112xf32>
    %8 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%7, %expanded_4 : tensor<1x64x112x112xf32>, tensor<64x1x1xf32>) outs(%0 : tensor<1x64x112x112xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x112x112xf32>
    %expanded_5 = tensor.expand_shape %arg1 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %9 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%8, %expanded_5 : tensor<1x64x112x112xf32>, tensor<64x1x1xf32>) outs(%0 : tensor<1x64x112x112xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x112x112xf32>
    %expanded_6 = tensor.expand_shape %arg2 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %10 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%9, %expanded_6 : tensor<1x64x112x112xf32>, tensor<64x1x1xf32>) outs(%0 : tensor<1x64x112x112xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x112x112xf32>
    %11 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%10 : tensor<1x64x112x112xf32>) outs(%0 : tensor<1x64x112x112xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x64x112x112xf32>
    %padded_7 = tensor.pad %11 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst_1 : f32
    } : tensor<1x64x112x112xf32> to tensor<1x64x114x114xf32>
    %12 = tensor.empty() : tensor<1x64x56x56xf32>
    %13 = linalg.fill ins(%cst_1 : f32) outs(%12 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %14 = tensor.empty() : tensor<3x3xf32>
    %15 = linalg.pooling_nchw_max {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%padded_7, %14 : tensor<1x64x114x114xf32>, tensor<3x3xf32>) outs(%13 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %16 = tensor.empty() : tensor<1x64x56x56xi64>
    %17 = linalg.fill ins(%c-1_i64 : i64) outs(%16 : tensor<1x64x56x56xi64>) -> tensor<1x64x56x56xi64>
    %18 = tensor.empty() : tensor<3x3xi64>
    %19 = linalg.generic {indexing_maps = [#map4, #map5, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction"]} ins(%15, %18 : tensor<1x64x56x56xf32>, tensor<3x3xi64>) outs(%17 : tensor<1x64x56x56xi64>) {
    ^bb0(%in: f32, %in_100: i64, %out: i64):
      %216 = linalg.index 0 : index
      %217 = linalg.index 1 : index
      %218 = linalg.index 2 : index
      %219 = linalg.index 3 : index
      %220 = linalg.index 4 : index
      %221 = linalg.index 5 : index
      %222 = arith.muli %218, %c2 : index
      %223 = arith.addi %222, %220 : index
      %224 = arith.muli %219, %c2 : index
      %225 = arith.addi %224, %221 : index
      %extracted = tensor.extract %padded_7[%216, %217, %223, %225] : tensor<1x64x114x114xf32>
      %226 = arith.cmpf oeq, %extracted, %in : f32
      %227 = arith.subi %223, %c1 : index
      %228 = arith.subi %225, %c1 : index
      %229 = arith.muli %227, %c112 : index
      %230 = arith.addi %229, %228 : index
      %231 = arith.index_cast %230 : index to i64
      %232 = arith.cmpi eq, %out, %c-1_i64 : i64
      %233 = arith.andi %232, %226 : i1
      %234 = arith.select %233, %231, %out : i64
      linalg.yield %234 : i64
    } -> tensor<1x64x56x56xi64>
    %padded_8 = tensor.pad %15 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x64x56x56xf32> to tensor<1x64x58x58xf32>
    %20 = linalg.fill ins(%cst : f32) outs(%12 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %21 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_8, %arg3 : tensor<1x64x58x58xf32>, tensor<64x64x3x3xf32>) outs(%20 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %22 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg66 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %23 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%22 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<64xf32>
    %24 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%23 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %expanded_9 = tensor.expand_shape %arg65 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %expanded_10 = tensor.expand_shape %24 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %25 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%21, %expanded_9 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %26 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%25, %expanded_10 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_11 = tensor.expand_shape %arg4 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %27 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%26, %expanded_11 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_12 = tensor.expand_shape %arg5 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %28 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%27, %expanded_12 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %29 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%28 : tensor<1x64x56x56xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x64x56x56xf32>
    %padded_13 = tensor.pad %29 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x64x56x56xf32> to tensor<1x64x58x58xf32>
    %30 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_13, %arg6 : tensor<1x64x58x58xf32>, tensor<64x64x3x3xf32>) outs(%20 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %31 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg69 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %32 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%31 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<64xf32>
    %33 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%32 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %expanded_14 = tensor.expand_shape %arg68 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %expanded_15 = tensor.expand_shape %33 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %34 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%30, %expanded_14 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %35 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%34, %expanded_15 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_16 = tensor.expand_shape %arg7 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %36 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%35, %expanded_16 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_17 = tensor.expand_shape %arg8 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %37 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%36, %expanded_17 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %38 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%37, %15 : tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %39 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%38 : tensor<1x64x56x56xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x64x56x56xf32>
    %padded_18 = tensor.pad %39 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x64x56x56xf32> to tensor<1x64x58x58xf32>
    %40 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_18, %arg9 : tensor<1x64x58x58xf32>, tensor<64x64x3x3xf32>) outs(%20 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %41 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg72 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %42 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%41 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<64xf32>
    %43 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%42 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %expanded_19 = tensor.expand_shape %arg71 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %expanded_20 = tensor.expand_shape %43 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %44 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%40, %expanded_19 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %45 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%44, %expanded_20 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_21 = tensor.expand_shape %arg10 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %46 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%45, %expanded_21 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_22 = tensor.expand_shape %arg11 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %47 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%46, %expanded_22 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %48 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%47 : tensor<1x64x56x56xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x64x56x56xf32>
    %padded_23 = tensor.pad %48 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x64x56x56xf32> to tensor<1x64x58x58xf32>
    %49 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_23, %arg12 : tensor<1x64x58x58xf32>, tensor<64x64x3x3xf32>) outs(%20 : tensor<1x64x56x56xf32>) -> tensor<1x64x56x56xf32>
    %50 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg75 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %51 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%50 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<64xf32>
    %52 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%51 : tensor<64xf32>) outs(%3 : tensor<64xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<64xf32>
    %expanded_24 = tensor.expand_shape %arg74 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %expanded_25 = tensor.expand_shape %52 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %53 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%49, %expanded_24 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %54 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%53, %expanded_25 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_26 = tensor.expand_shape %arg13 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %55 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%54, %expanded_26 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %expanded_27 = tensor.expand_shape %arg14 [[0, 1, 2]] : tensor<64xf32> into tensor<64x1x1xf32>
    %56 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%55, %expanded_27 : tensor<1x64x56x56xf32>, tensor<64x1x1xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %57 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%56, %39 : tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x64x56x56xf32>
    %58 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%57 : tensor<1x64x56x56xf32>) outs(%12 : tensor<1x64x56x56xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x64x56x56xf32>
    %padded_28 = tensor.pad %58 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x64x56x56xf32> to tensor<1x64x58x58xf32>
    %59 = tensor.empty() : tensor<1x128x28x28xf32>
    %60 = linalg.fill ins(%cst : f32) outs(%59 : tensor<1x128x28x28xf32>) -> tensor<1x128x28x28xf32>
    %61 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%padded_28, %arg15 : tensor<1x64x58x58xf32>, tensor<128x64x3x3xf32>) outs(%60 : tensor<1x128x28x28xf32>) -> tensor<1x128x28x28xf32>
    %62 = tensor.empty() : tensor<128xf32>
    %63 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg78 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %64 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%63 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<128xf32>
    %65 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%64 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %expanded_29 = tensor.expand_shape %arg77 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %expanded_30 = tensor.expand_shape %65 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %66 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%61, %expanded_29 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %67 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%66, %expanded_30 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_31 = tensor.expand_shape %arg16 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %68 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%67, %expanded_31 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_32 = tensor.expand_shape %arg17 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %69 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%68, %expanded_32 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %70 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%69 : tensor<1x128x28x28xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x128x28x28xf32>
    %padded_33 = tensor.pad %70 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x128x28x28xf32> to tensor<1x128x30x30xf32>
    %71 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_33, %arg18 : tensor<1x128x30x30xf32>, tensor<128x128x3x3xf32>) outs(%60 : tensor<1x128x28x28xf32>) -> tensor<1x128x28x28xf32>
    %72 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg81 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %73 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%72 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<128xf32>
    %74 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%73 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %expanded_34 = tensor.expand_shape %arg80 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %expanded_35 = tensor.expand_shape %74 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %75 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%71, %expanded_34 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %76 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%75, %expanded_35 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_36 = tensor.expand_shape %arg19 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %77 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%76, %expanded_36 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_37 = tensor.expand_shape %arg20 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %78 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%77, %expanded_37 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %79 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%58, %arg21 : tensor<1x64x56x56xf32>, tensor<128x64x1x1xf32>) outs(%60 : tensor<1x128x28x28xf32>) -> tensor<1x128x28x28xf32>
    %80 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg84 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %81 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%80 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<128xf32>
    %82 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%81 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %expanded_38 = tensor.expand_shape %arg83 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %expanded_39 = tensor.expand_shape %82 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %83 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%79, %expanded_38 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %84 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%83, %expanded_39 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_40 = tensor.expand_shape %arg22 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %85 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%84, %expanded_40 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_41 = tensor.expand_shape %arg23 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %86 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%85, %expanded_41 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %87 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%78, %86 : tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %88 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%87 : tensor<1x128x28x28xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x128x28x28xf32>
    %padded_42 = tensor.pad %88 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x128x28x28xf32> to tensor<1x128x30x30xf32>
    %89 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_42, %arg24 : tensor<1x128x30x30xf32>, tensor<128x128x3x3xf32>) outs(%60 : tensor<1x128x28x28xf32>) -> tensor<1x128x28x28xf32>
    %90 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg87 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %91 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%90 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<128xf32>
    %92 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%91 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %expanded_43 = tensor.expand_shape %arg86 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %expanded_44 = tensor.expand_shape %92 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %93 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%89, %expanded_43 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %94 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%93, %expanded_44 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_45 = tensor.expand_shape %arg25 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %95 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%94, %expanded_45 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_46 = tensor.expand_shape %arg26 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %96 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%95, %expanded_46 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %97 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%96 : tensor<1x128x28x28xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x128x28x28xf32>
    %padded_47 = tensor.pad %97 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x128x28x28xf32> to tensor<1x128x30x30xf32>
    %98 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_47, %arg27 : tensor<1x128x30x30xf32>, tensor<128x128x3x3xf32>) outs(%60 : tensor<1x128x28x28xf32>) -> tensor<1x128x28x28xf32>
    %99 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg90 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %100 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%99 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<128xf32>
    %101 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%100 : tensor<128xf32>) outs(%62 : tensor<128xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<128xf32>
    %expanded_48 = tensor.expand_shape %arg89 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %expanded_49 = tensor.expand_shape %101 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %102 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%98, %expanded_48 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %103 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%102, %expanded_49 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_50 = tensor.expand_shape %arg28 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %104 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%103, %expanded_50 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %expanded_51 = tensor.expand_shape %arg29 [[0, 1, 2]] : tensor<128xf32> into tensor<128x1x1xf32>
    %105 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%104, %expanded_51 : tensor<1x128x28x28xf32>, tensor<128x1x1xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %106 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%105, %88 : tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x128x28x28xf32>
    %107 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%106 : tensor<1x128x28x28xf32>) outs(%59 : tensor<1x128x28x28xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x128x28x28xf32>
    %padded_52 = tensor.pad %107 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x128x28x28xf32> to tensor<1x128x30x30xf32>
    %108 = tensor.empty() : tensor<1x256x14x14xf32>
    %109 = linalg.fill ins(%cst : f32) outs(%108 : tensor<1x256x14x14xf32>) -> tensor<1x256x14x14xf32>
    %110 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%padded_52, %arg30 : tensor<1x128x30x30xf32>, tensor<256x128x3x3xf32>) outs(%109 : tensor<1x256x14x14xf32>) -> tensor<1x256x14x14xf32>
    %111 = tensor.empty() : tensor<256xf32>
    %112 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg93 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %113 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%112 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<256xf32>
    %114 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%113 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %expanded_53 = tensor.expand_shape %arg92 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %expanded_54 = tensor.expand_shape %114 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %115 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%110, %expanded_53 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %116 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%115, %expanded_54 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_55 = tensor.expand_shape %arg31 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %117 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%116, %expanded_55 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_56 = tensor.expand_shape %arg32 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %118 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%117, %expanded_56 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %119 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%118 : tensor<1x256x14x14xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x256x14x14xf32>
    %padded_57 = tensor.pad %119 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x256x14x14xf32> to tensor<1x256x16x16xf32>
    %120 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_57, %arg33 : tensor<1x256x16x16xf32>, tensor<256x256x3x3xf32>) outs(%109 : tensor<1x256x14x14xf32>) -> tensor<1x256x14x14xf32>
    %121 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg96 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %122 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%121 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<256xf32>
    %123 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%122 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %expanded_58 = tensor.expand_shape %arg95 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %expanded_59 = tensor.expand_shape %123 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %124 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%120, %expanded_58 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %125 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%124, %expanded_59 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_60 = tensor.expand_shape %arg34 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %126 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%125, %expanded_60 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_61 = tensor.expand_shape %arg35 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %127 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%126, %expanded_61 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %128 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%107, %arg36 : tensor<1x128x28x28xf32>, tensor<256x128x1x1xf32>) outs(%109 : tensor<1x256x14x14xf32>) -> tensor<1x256x14x14xf32>
    %129 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg99 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %130 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%129 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<256xf32>
    %131 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%130 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %expanded_62 = tensor.expand_shape %arg98 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %expanded_63 = tensor.expand_shape %131 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %132 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%128, %expanded_62 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %133 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%132, %expanded_63 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_64 = tensor.expand_shape %arg37 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %134 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%133, %expanded_64 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_65 = tensor.expand_shape %arg38 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %135 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%134, %expanded_65 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %136 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%127, %135 : tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %137 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%136 : tensor<1x256x14x14xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x256x14x14xf32>
    %padded_66 = tensor.pad %137 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x256x14x14xf32> to tensor<1x256x16x16xf32>
    %138 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_66, %arg39 : tensor<1x256x16x16xf32>, tensor<256x256x3x3xf32>) outs(%109 : tensor<1x256x14x14xf32>) -> tensor<1x256x14x14xf32>
    %139 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg102 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %140 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%139 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<256xf32>
    %141 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%140 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %expanded_67 = tensor.expand_shape %arg101 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %expanded_68 = tensor.expand_shape %141 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %142 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%138, %expanded_67 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %143 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%142, %expanded_68 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_69 = tensor.expand_shape %arg40 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %144 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%143, %expanded_69 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_70 = tensor.expand_shape %arg41 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %145 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%144, %expanded_70 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %146 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%145 : tensor<1x256x14x14xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x256x14x14xf32>
    %padded_71 = tensor.pad %146 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x256x14x14xf32> to tensor<1x256x16x16xf32>
    %147 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_71, %arg42 : tensor<1x256x16x16xf32>, tensor<256x256x3x3xf32>) outs(%109 : tensor<1x256x14x14xf32>) -> tensor<1x256x14x14xf32>
    %148 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg105 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %149 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%148 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<256xf32>
    %150 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%149 : tensor<256xf32>) outs(%111 : tensor<256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<256xf32>
    %expanded_72 = tensor.expand_shape %arg104 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %expanded_73 = tensor.expand_shape %150 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %151 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%147, %expanded_72 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %152 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%151, %expanded_73 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_74 = tensor.expand_shape %arg43 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %153 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%152, %expanded_74 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %expanded_75 = tensor.expand_shape %arg44 [[0, 1, 2]] : tensor<256xf32> into tensor<256x1x1xf32>
    %154 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%153, %expanded_75 : tensor<1x256x14x14xf32>, tensor<256x1x1xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %155 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%154, %137 : tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x256x14x14xf32>
    %156 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%155 : tensor<1x256x14x14xf32>) outs(%108 : tensor<1x256x14x14xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x256x14x14xf32>
    %padded_76 = tensor.pad %156 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x256x14x14xf32> to tensor<1x256x16x16xf32>
    %157 = tensor.empty() : tensor<1x512x7x7xf32>
    %158 = linalg.fill ins(%cst : f32) outs(%157 : tensor<1x512x7x7xf32>) -> tensor<1x512x7x7xf32>
    %159 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%padded_76, %arg45 : tensor<1x256x16x16xf32>, tensor<512x256x3x3xf32>) outs(%158 : tensor<1x512x7x7xf32>) -> tensor<1x512x7x7xf32>
    %160 = tensor.empty() : tensor<512xf32>
    %161 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg108 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %162 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%161 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<512xf32>
    %163 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%162 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %expanded_77 = tensor.expand_shape %arg107 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %expanded_78 = tensor.expand_shape %163 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %164 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%159, %expanded_77 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %165 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%164, %expanded_78 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_79 = tensor.expand_shape %arg46 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %166 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%165, %expanded_79 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_80 = tensor.expand_shape %arg47 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %167 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%166, %expanded_80 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %168 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%167 : tensor<1x512x7x7xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x512x7x7xf32>
    %padded_81 = tensor.pad %168 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x512x7x7xf32> to tensor<1x512x9x9xf32>
    %169 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_81, %arg48 : tensor<1x512x9x9xf32>, tensor<512x512x3x3xf32>) outs(%158 : tensor<1x512x7x7xf32>) -> tensor<1x512x7x7xf32>
    %170 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg111 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %171 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%170 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<512xf32>
    %172 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%171 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %expanded_82 = tensor.expand_shape %arg110 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %expanded_83 = tensor.expand_shape %172 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %173 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%169, %expanded_82 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %174 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%173, %expanded_83 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_84 = tensor.expand_shape %arg49 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %175 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%174, %expanded_84 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_85 = tensor.expand_shape %arg50 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %176 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%175, %expanded_85 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %177 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%156, %arg51 : tensor<1x256x14x14xf32>, tensor<512x256x1x1xf32>) outs(%158 : tensor<1x512x7x7xf32>) -> tensor<1x512x7x7xf32>
    %178 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg114 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %179 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%178 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<512xf32>
    %180 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%179 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %expanded_86 = tensor.expand_shape %arg113 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %expanded_87 = tensor.expand_shape %180 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %181 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%177, %expanded_86 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %182 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%181, %expanded_87 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_88 = tensor.expand_shape %arg52 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %183 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%182, %expanded_88 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_89 = tensor.expand_shape %arg53 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %184 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%183, %expanded_89 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %185 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%176, %184 : tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %186 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%185 : tensor<1x512x7x7xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x512x7x7xf32>
    %padded_90 = tensor.pad %186 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x512x7x7xf32> to tensor<1x512x9x9xf32>
    %187 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_90, %arg54 : tensor<1x512x9x9xf32>, tensor<512x512x3x3xf32>) outs(%158 : tensor<1x512x7x7xf32>) -> tensor<1x512x7x7xf32>
    %188 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg117 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %189 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%188 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<512xf32>
    %190 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%189 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %expanded_91 = tensor.expand_shape %arg116 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %expanded_92 = tensor.expand_shape %190 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %191 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%187, %expanded_91 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %192 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%191, %expanded_92 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_93 = tensor.expand_shape %arg55 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %193 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%192, %expanded_93 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_94 = tensor.expand_shape %arg56 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %194 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%193, %expanded_94 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %195 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%194 : tensor<1x512x7x7xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x512x7x7xf32>
    %padded_95 = tensor.pad %195 low[0, 0, 1, 1] high[0, 0, 1, 1] {
    ^bb0(%arg123: index, %arg124: index, %arg125: index, %arg126: index):
      tensor.yield %cst : f32
    } : tensor<1x512x7x7xf32> to tensor<1x512x9x9xf32>
    %196 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : vector<2xi64>, strides = dense<1> : vector<2xi64>} ins(%padded_95, %arg57 : tensor<1x512x9x9xf32>, tensor<512x512x3x3xf32>) outs(%158 : tensor<1x512x7x7xf32>) -> tensor<1x512x7x7xf32>
    %197 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg120 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.truncf %cst_2 : f64 to f32
      %217 = arith.addf %in, %216 : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %198 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%197 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = math.sqrt %in : f32
      linalg.yield %216 : f32
    } -> tensor<512xf32>
    %199 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%198 : tensor<512xf32>) outs(%160 : tensor<512xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf one, %in, %cst : f32
      cf.assert %216, "unimplemented: tensor with zero element"
      %217 = arith.divf %cst_0, %in : f32
      linalg.yield %217 : f32
    } -> tensor<512xf32>
    %expanded_96 = tensor.expand_shape %arg119 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %expanded_97 = tensor.expand_shape %199 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %200 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%196, %expanded_96 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.subf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %201 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%200, %expanded_97 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_98 = tensor.expand_shape %arg58 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %202 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%201, %expanded_98 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.mulf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %expanded_99 = tensor.expand_shape %arg59 [[0, 1, 2]] : tensor<512xf32> into tensor<512x1x1xf32>
    %203 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%202, %expanded_99 : tensor<1x512x7x7xf32>, tensor<512x1x1xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %204 = linalg.generic {indexing_maps = [#map1, #map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%203, %186 : tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x7x7xf32>
    %205 = linalg.generic {indexing_maps = [#map1, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%204 : tensor<1x512x7x7xf32>) outs(%157 : tensor<1x512x7x7xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.cmpf ugt, %in, %cst : f32
      %217 = arith.select %216, %in, %cst : f32
      linalg.yield %217 : f32
    } -> tensor<1x512x7x7xf32>
    %206 = tensor.empty() : tensor<1x512x1x1xf32>
    %207 = linalg.fill ins(%cst : f32) outs(%206 : tensor<1x512x1x1xf32>) -> tensor<1x512x1x1xf32>
    %208 = linalg.generic {indexing_maps = [#map3, #map6], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%205 : tensor<1x512x7x7xf32>) outs(%207 : tensor<1x512x1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.addf %in, %out : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x1x1xf32>
    %209 = linalg.generic {indexing_maps = [#map7, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%208 : tensor<1x512x1x1xf32>) outs(%206 : tensor<1x512x1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      %216 = arith.divf %in, %cst_3 : f32
      linalg.yield %216 : f32
    } -> tensor<1x512x1x1xf32>
    %collapsed = tensor.collapse_shape %209 [[0], [1, 2, 3]] : tensor<1x512x1x1xf32> into tensor<1x512xf32>
    %210 = tensor.empty() : tensor<512x1000xf32>
    %211 = linalg.generic {indexing_maps = [#map8, #map9], iterator_types = ["parallel", "parallel"]} ins(%arg60 : tensor<1000x512xf32>) outs(%210 : tensor<512x1000xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<512x1000xf32>
    %212 = tensor.empty() : tensor<1x1000xf32>
    %213 = linalg.fill ins(%cst : f32) outs(%212 : tensor<1x1000xf32>) -> tensor<1x1000xf32>
    %214 = linalg.matmul ins(%collapsed, %211 : tensor<1x512xf32>, tensor<512x1000xf32>) outs(%213 : tensor<1x1000xf32>) -> tensor<1x1000xf32>
    %215 = linalg.generic {indexing_maps = [#map10, #map11, #map8], iterator_types = ["parallel", "parallel"]} ins(%arg61, %214 : tensor<1000xf32>, tensor<1x1000xf32>) outs(%212 : tensor<1x1000xf32>) {
    ^bb0(%in: f32, %in_100: f32, %out: f32):
      %216 = arith.addf %in, %in_100 : f32
      linalg.yield %216 : f32
    } -> tensor<1x1000xf32>
    return %215, %arg0, %arg1, %arg3, %arg4, %arg6, %arg7, %arg9, %arg10, %arg12, %arg13, %arg15, %arg16, %arg18, %arg19, %arg21, %arg22, %arg24, %arg25, %arg27, %arg28, %arg30, %arg31, %arg33, %arg34, %arg36, %arg37, %arg39, %arg40, %arg42, %arg43, %arg45, %arg46, %arg48, %arg49, %arg51, %arg52, %arg54, %arg55, %arg57, %arg58, %arg62, %arg63, %arg65, %arg66, %arg68, %arg69, %arg71, %arg72, %arg74, %arg75, %arg77, %arg78, %arg80, %arg81, %arg83, %arg84, %arg86, %arg87, %arg89, %arg90, %arg92, %arg93, %arg95, %arg96, %arg98, %arg99, %arg101, %arg102, %arg104, %arg105, %arg107, %arg108, %arg110, %arg111, %arg113, %arg114, %arg116, %arg117, %arg119, %arg120, %arg122, %2, %11, %15, %19, %21, %29, %30, %39, %40, %48, %49, %58, %61, %70, %71, %79, %88, %89, %97, %98, %107, %110, %119, %120, %128, %137, %138, %146, %147, %156, %159, %168, %169, %177, %186, %187, %195, %196, %205, %collapsed, %211 : tensor<1x1000xf32>, tensor<64x3x7x7xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<64x64x3x3xf32>, tensor<64xf32>, tensor<128x64x3x3xf32>, tensor<128xf32>, tensor<128x128x3x3xf32>, tensor<128xf32>, tensor<128x64x1x1xf32>, tensor<128xf32>, tensor<128x128x3x3xf32>, tensor<128xf32>, tensor<128x128x3x3xf32>, tensor<128xf32>, tensor<256x128x3x3xf32>, tensor<256xf32>, tensor<256x256x3x3xf32>, tensor<256xf32>, tensor<256x128x1x1xf32>, tensor<256xf32>, tensor<256x256x3x3xf32>, tensor<256xf32>, tensor<256x256x3x3xf32>, tensor<256xf32>, tensor<512x256x3x3xf32>, tensor<512xf32>, tensor<512x512x3x3xf32>, tensor<512xf32>, tensor<512x256x1x1xf32>, tensor<512xf32>, tensor<512x512x3x3xf32>, tensor<512xf32>, tensor<512x512x3x3xf32>, tensor<512xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<128xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<256xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<1x3x224x224xf32>, tensor<1x64x112x112xf32>, tensor<1x64x112x112xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xi64>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x64x56x56xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x128x28x28xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x256x14x14xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512x7x7xf32>, tensor<1x512xf32>, tensor<512x1000xf32>
  }
}

