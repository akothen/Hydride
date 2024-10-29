#map0 = affine_map<() -> (0)>
#map1 = affine_map<(d0) -> (0)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1 + 1)>
#map4 = affine_map<() -> (1)>
#map5 = affine_map<(d0, d1) -> (d1 + 2)>
#map6 = affine_map<() -> (2)>
#map7 = affine_map<(d0, d1) -> (d0 + 1)>
#map8 = affine_map<(d0, d1) -> (d1)>
#map9 = affine_map<() -> (3)>
#map10 = affine_map<() -> (4)>
#map11 = affine_map<() -> (5)>
#map12 = affine_map<(d0, d1) -> (d0 + 2)>
#map13 = affine_map<() -> (6)>
#map14 = affine_map<() -> (7)>
#map15 = affine_map<() -> (8)>
module {
  func.func private @hydride.node.conv2d.8(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.7(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.6(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.5(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.4(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.3(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.2(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.1(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @hydride.node.conv2d.0(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func private @conv2d(%arg0: memref<2048x2048xi32>, %arg1: memref<9xi32>, %arg2: memref<2046x2046xi32>) {
    affine.for %arg3 = 0 to 2046 {
      affine.for %arg4 = 0 to 2046 step 8 {
        %c0_i32 = arith.constant 0 : i32
        %0 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32 : memref<2046x2046xi32>, vector<8xi32>
        %c0_i32_0 = arith.constant 0 : i32
        %1 = vector.transfer_read %arg0[%arg3, %arg4], %c0_i32_0 : memref<2048x2048xi32>, vector<8xi32>
        %2 = affine.apply #map0()
        %c0_i32_1 = arith.constant 0 : i32
        %3 = vector.transfer_read %arg1[%2], %c0_i32_1 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %4 = arith.muli %1, %3 : vector<8xi32>
        %5 = arith.addi %0, %4 : vector<8xi32>
        %6 = func.call @hydride.node.conv2d.0(%0, %1, %3) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %6, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_2 = arith.constant 0 : i32
        %7 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_2 : memref<2046x2046xi32>, vector<8xi32>
        %8 = affine.apply #map2(%arg3, %arg4)
        %9 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_3 = arith.constant 0 : i32
        %10 = vector.transfer_read %arg0[%8, %9], %c0_i32_3 : memref<2048x2048xi32>, vector<8xi32>
        %11 = affine.apply #map4()
        %c0_i32_4 = arith.constant 0 : i32
        %12 = vector.transfer_read %arg1[%11], %c0_i32_4 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %13 = arith.muli %10, %12 : vector<8xi32>
        %14 = arith.addi %7, %13 : vector<8xi32>
        %15 = func.call @hydride.node.conv2d.1(%7, %10, %12) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %15, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_5 = arith.constant 0 : i32
        %16 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_5 : memref<2046x2046xi32>, vector<8xi32>
        %17 = affine.apply #map2(%arg3, %arg4)
        %18 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_6 = arith.constant 0 : i32
        %19 = vector.transfer_read %arg0[%17, %18], %c0_i32_6 : memref<2048x2048xi32>, vector<8xi32>
        %20 = affine.apply #map6()
        %c0_i32_7 = arith.constant 0 : i32
        %21 = vector.transfer_read %arg1[%20], %c0_i32_7 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %22 = arith.muli %19, %21 : vector<8xi32>
        %23 = arith.addi %16, %22 : vector<8xi32>
        %24 = func.call @hydride.node.conv2d.2(%16, %19, %21) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %24, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_8 = arith.constant 0 : i32
        %25 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_8 : memref<2046x2046xi32>, vector<8xi32>
        %26 = affine.apply #map7(%arg3, %arg4)
        %27 = affine.apply #map8(%arg3, %arg4)
        %c0_i32_9 = arith.constant 0 : i32
        %28 = vector.transfer_read %arg0[%26, %27], %c0_i32_9 : memref<2048x2048xi32>, vector<8xi32>
        %29 = affine.apply #map9()
        %c0_i32_10 = arith.constant 0 : i32
        %30 = vector.transfer_read %arg1[%29], %c0_i32_10 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %31 = arith.muli %28, %30 : vector<8xi32>
        %32 = arith.addi %25, %31 : vector<8xi32>
        %33 = func.call @hydride.node.conv2d.3(%25, %28, %30) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %33, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_11 = arith.constant 0 : i32
        %34 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_11 : memref<2046x2046xi32>, vector<8xi32>
        %35 = affine.apply #map7(%arg3, %arg4)
        %36 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_12 = arith.constant 0 : i32
        %37 = vector.transfer_read %arg0[%35, %36], %c0_i32_12 : memref<2048x2048xi32>, vector<8xi32>
        %38 = affine.apply #map10()
        %c0_i32_13 = arith.constant 0 : i32
        %39 = vector.transfer_read %arg1[%38], %c0_i32_13 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %40 = arith.muli %37, %39 : vector<8xi32>
        %41 = arith.addi %34, %40 : vector<8xi32>
        %42 = func.call @hydride.node.conv2d.4(%34, %37, %39) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %42, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_14 = arith.constant 0 : i32
        %43 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_14 : memref<2046x2046xi32>, vector<8xi32>
        %44 = affine.apply #map7(%arg3, %arg4)
        %45 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_15 = arith.constant 0 : i32
        %46 = vector.transfer_read %arg0[%44, %45], %c0_i32_15 : memref<2048x2048xi32>, vector<8xi32>
        %47 = affine.apply #map11()
        %c0_i32_16 = arith.constant 0 : i32
        %48 = vector.transfer_read %arg1[%47], %c0_i32_16 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %49 = arith.muli %46, %48 : vector<8xi32>
        %50 = arith.addi %43, %49 : vector<8xi32>
        %51 = func.call @hydride.node.conv2d.5(%43, %46, %48) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %51, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_17 = arith.constant 0 : i32
        %52 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_17 : memref<2046x2046xi32>, vector<8xi32>
        %53 = affine.apply #map12(%arg3, %arg4)
        %54 = affine.apply #map8(%arg3, %arg4)
        %c0_i32_18 = arith.constant 0 : i32
        %55 = vector.transfer_read %arg0[%53, %54], %c0_i32_18 : memref<2048x2048xi32>, vector<8xi32>
        %56 = affine.apply #map13()
        %c0_i32_19 = arith.constant 0 : i32
        %57 = vector.transfer_read %arg1[%56], %c0_i32_19 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %58 = arith.muli %55, %57 : vector<8xi32>
        %59 = arith.addi %52, %58 : vector<8xi32>
        %60 = func.call @hydride.node.conv2d.6(%52, %55, %57) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %60, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_20 = arith.constant 0 : i32
        %61 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_20 : memref<2046x2046xi32>, vector<8xi32>
        %62 = affine.apply #map12(%arg3, %arg4)
        %63 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_21 = arith.constant 0 : i32
        %64 = vector.transfer_read %arg0[%62, %63], %c0_i32_21 : memref<2048x2048xi32>, vector<8xi32>
        %65 = affine.apply #map14()
        %c0_i32_22 = arith.constant 0 : i32
        %66 = vector.transfer_read %arg1[%65], %c0_i32_22 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %67 = arith.muli %64, %66 : vector<8xi32>
        %68 = arith.addi %61, %67 : vector<8xi32>
        %69 = func.call @hydride.node.conv2d.7(%61, %64, %66) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %69, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_23 = arith.constant 0 : i32
        %70 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_23 : memref<2046x2046xi32>, vector<8xi32>
        %71 = affine.apply #map12(%arg3, %arg4)
        %72 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_24 = arith.constant 0 : i32
        %73 = vector.transfer_read %arg0[%71, %72], %c0_i32_24 : memref<2048x2048xi32>, vector<8xi32>
        %74 = affine.apply #map15()
        %c0_i32_25 = arith.constant 0 : i32
        %75 = vector.transfer_read %arg1[%74], %c0_i32_25 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %76 = arith.muli %73, %75 : vector<8xi32>
        %77 = arith.addi %70, %76 : vector<8xi32>
        %78 = func.call @hydride.node.conv2d.8(%70, %73, %75) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
        vector.transfer_write %78, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
      }
    }
    return
  }
}

