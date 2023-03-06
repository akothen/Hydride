#map0 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>

  func.func @conv1d_nwc_4x2x8_memref(%arg0: memref<4x6x3xi32>, %arg1: memref<2x3x8xi32>, %arg2: memref<4x2x8xi32>) -> vector<2x3x8xi32>{
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0, %c0] : memref<4x6x3xi32>, vector<4x4x3xi32>
    %1 = vector.load %arg1[%c0, %c0, %c0] : memref<2x3x8xi32>, vector<2x3x8xi32>
    %2 = vector.load %arg2[%c0, %c0, %c0] : memref<4x2x8xi32>, vector<4x2x8xi32>
    %3 = vector.extract_strided_slice %0 {offsets = [0, 0, 0], sizes = [4, 2, 3], strides = [1, 1, 1]} : vector<4x4x3xi32> to vector<4x2x3xi32>
    %4 = vector.extract_strided_slice %0 {offsets = [0, 2, 0], sizes = [4, 2, 3], strides = [1, 1, 1]} : vector<4x4x3xi32> to vector<4x2x3xi32>
    %5 = vector.extract %1[0] : vector<2x3x8xi32>
    %6 = vector.extract %1[1] : vector<2x3x8xi32>
    %7 = vector.contract {indexing_maps = [#map0, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %3, %5, %2 : vector<4x2x3xi32>, vector<3x8xi32> into vector<4x2x8xi32>
    %8 = vector.contract {indexing_maps = [#map0, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %4, %6, %7 : vector<4x2x3xi32>, vector<3x8xi32> into vector<4x2x8xi32>
    %9 = arith.addi %1, %1 : vector<2x3x8xi32>
    return %9 : vector<2x3x8xi32>
  }
  func.func @depthwise_conv1d_nwc_wc_3x5x4_memref(%arg0: memref<3x5x4xi32>, %arg1: memref<2x4xi32>, %arg2: memref<3x2x4xi32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0, %c0] : memref<3x5x4xi32>, vector<3x4x4xi32>
    %1 = vector.load %arg1[%c0, %c0] : memref<2x4xi32>, vector<2x4xi32>
    %2 = vector.load %arg2[%c0, %c0, %c0] : memref<3x2x4xi32>, vector<3x2x4xi32>
    %3 = vector.extract_strided_slice %0 {offsets = [0, 0, 0], sizes = [3, 2, 4], strides = [1, 1, 1]} : vector<3x4x4xi32> to vector<3x2x4xi32>
    %4 = vector.extract_strided_slice %0 {offsets = [0, 2, 0], sizes = [3, 2, 4], strides = [1, 1, 1]} : vector<3x4x4xi32> to vector<3x2x4xi32>
    %5 = vector.extract %1[0] : vector<2x4xi32>
    %6 = vector.extract %1[1] : vector<2x4xi32>
    %7 = vector.broadcast %5 : vector<4xi32> to vector<3x2x4xi32>
    %8 = vector.fma %3, %7, %2 : vector<3x2x4xi32>
    %9 = vector.broadcast %6 : vector<4xi32> to vector<3x2x4xi32>
    %10 = vector.fma %4, %9, %8 : vector<3x2x4xi32>
    vector.store %10, %arg2[%c0, %c0, %c0] : memref<3x2x4xi32>, vector<3x2x4xi32>
    return
  }
  func.func @conv_1d_nwc_wcf_mixed_type_memref(%arg0: memref<1x2x3xf16>, %arg1: memref<1x3x2xf16>, %arg2: memref<1x2x2xi32>) {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0, %c0] : memref<1x2x3xf16>, vector<1x2x3xf16>
    %1 = vector.load %arg1[%c0, %c0, %c0] : memref<1x3x2xf16>, vector<1x3x2xf16>
    %2 = vector.load %arg2[%c0, %c0, %c0] : memref<1x2x2xi32>, vector<1x2x2xi32>
    %3 = vector.extract %1[0] : vector<1x3x2xf16>
    %4 = vector.contract {indexing_maps = [#map0, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction"], kind = #vector.kind<add>} %0, %3, %2 : vector<1x2x3xf16>, vector<3x2xf16> into vector<1x2x2xi32>
    vector.store %4, %arg2[%c0, %c0, %c0] : memref<1x2x2xi32>, vector<1x2x2xi32>
    return
  }


