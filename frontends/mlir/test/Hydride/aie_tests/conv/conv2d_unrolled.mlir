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
  func.func @conv2d(%arg0: memref<2048x2048xi32>, %arg1: memref<9xi32>, %arg2: memref<2046x2046xi32>) {
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
        vector.transfer_write %5, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_2 = arith.constant 0 : i32
        %6 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_2 : memref<2046x2046xi32>, vector<8xi32>
        %7 = affine.apply #map2(%arg3, %arg4)
        %8 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_3 = arith.constant 0 : i32
        %9 = vector.transfer_read %arg0[%7, %8], %c0_i32_3 : memref<2048x2048xi32>, vector<8xi32>
        %10 = affine.apply #map4()
        %c0_i32_4 = arith.constant 0 : i32
        %11 = vector.transfer_read %arg1[%10], %c0_i32_4 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %12 = arith.muli %9, %11 : vector<8xi32>
        %13 = arith.addi %6, %12 : vector<8xi32>
        vector.transfer_write %13, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_5 = arith.constant 0 : i32
        %14 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_5 : memref<2046x2046xi32>, vector<8xi32>
        %15 = affine.apply #map2(%arg3, %arg4)
        %16 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_6 = arith.constant 0 : i32
        %17 = vector.transfer_read %arg0[%15, %16], %c0_i32_6 : memref<2048x2048xi32>, vector<8xi32>
        %18 = affine.apply #map6()
        %c0_i32_7 = arith.constant 0 : i32
        %19 = vector.transfer_read %arg1[%18], %c0_i32_7 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %20 = arith.muli %17, %19 : vector<8xi32>
        %21 = arith.addi %14, %20 : vector<8xi32>
        vector.transfer_write %21, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_8 = arith.constant 0 : i32
        %22 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_8 : memref<2046x2046xi32>, vector<8xi32>
        %23 = affine.apply #map7(%arg3, %arg4)
        %24 = affine.apply #map8(%arg3, %arg4)
        %c0_i32_9 = arith.constant 0 : i32
        %25 = vector.transfer_read %arg0[%23, %24], %c0_i32_9 : memref<2048x2048xi32>, vector<8xi32>
        %26 = affine.apply #map9()
        %c0_i32_10 = arith.constant 0 : i32
        %27 = vector.transfer_read %arg1[%26], %c0_i32_10 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %28 = arith.muli %25, %27 : vector<8xi32>
        %29 = arith.addi %22, %28 : vector<8xi32>
        vector.transfer_write %29, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_11 = arith.constant 0 : i32
        %30 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_11 : memref<2046x2046xi32>, vector<8xi32>
        %31 = affine.apply #map7(%arg3, %arg4)
        %32 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_12 = arith.constant 0 : i32
        %33 = vector.transfer_read %arg0[%31, %32], %c0_i32_12 : memref<2048x2048xi32>, vector<8xi32>
        %34 = affine.apply #map10()
        %c0_i32_13 = arith.constant 0 : i32
        %35 = vector.transfer_read %arg1[%34], %c0_i32_13 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %36 = arith.muli %33, %35 : vector<8xi32>
        %37 = arith.addi %30, %36 : vector<8xi32>
        vector.transfer_write %37, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_14 = arith.constant 0 : i32
        %38 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_14 : memref<2046x2046xi32>, vector<8xi32>
        %39 = affine.apply #map7(%arg3, %arg4)
        %40 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_15 = arith.constant 0 : i32
        %41 = vector.transfer_read %arg0[%39, %40], %c0_i32_15 : memref<2048x2048xi32>, vector<8xi32>
        %42 = affine.apply #map11()
        %c0_i32_16 = arith.constant 0 : i32
        %43 = vector.transfer_read %arg1[%42], %c0_i32_16 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %44 = arith.muli %41, %43 : vector<8xi32>
        %45 = arith.addi %38, %44 : vector<8xi32>
        vector.transfer_write %45, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_17 = arith.constant 0 : i32
        %46 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_17 : memref<2046x2046xi32>, vector<8xi32>
        %47 = affine.apply #map12(%arg3, %arg4)
        %48 = affine.apply #map8(%arg3, %arg4)
        %c0_i32_18 = arith.constant 0 : i32
        %49 = vector.transfer_read %arg0[%47, %48], %c0_i32_18 : memref<2048x2048xi32>, vector<8xi32>
        %50 = affine.apply #map13()
        %c0_i32_19 = arith.constant 0 : i32
        %51 = vector.transfer_read %arg1[%50], %c0_i32_19 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %52 = arith.muli %49, %51 : vector<8xi32>
        %53 = arith.addi %46, %52 : vector<8xi32>
        vector.transfer_write %53, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_20 = arith.constant 0 : i32
        %54 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_20 : memref<2046x2046xi32>, vector<8xi32>
        %55 = affine.apply #map12(%arg3, %arg4)
        %56 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_21 = arith.constant 0 : i32
        %57 = vector.transfer_read %arg0[%55, %56], %c0_i32_21 : memref<2048x2048xi32>, vector<8xi32>
        %58 = affine.apply #map14()
        %c0_i32_22 = arith.constant 0 : i32
        %59 = vector.transfer_read %arg1[%58], %c0_i32_22 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %60 = arith.muli %57, %59 : vector<8xi32>
        %61 = arith.addi %54, %60 : vector<8xi32>
        vector.transfer_write %61, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
        %c0_i32_23 = arith.constant 0 : i32
        %62 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32_23 : memref<2046x2046xi32>, vector<8xi32>
        %63 = affine.apply #map12(%arg3, %arg4)
        %64 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_24 = arith.constant 0 : i32
        %65 = vector.transfer_read %arg0[%63, %64], %c0_i32_24 : memref<2048x2048xi32>, vector<8xi32>
        %66 = affine.apply #map15()
        %c0_i32_25 = arith.constant 0 : i32
        %67 = vector.transfer_read %arg1[%66], %c0_i32_25 {permutation_map = #map1} : memref<9xi32>, vector<8xi32>
        %68 = arith.muli %65, %67 : vector<8xi32>
        %69 = arith.addi %62, %68 : vector<8xi32>
        vector.transfer_write %69, %arg2[%arg3, %arg4] : vector<8xi32>, memref<2046x2046xi32>
      }
    }
    return
  }
}

