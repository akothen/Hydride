#map = affine_map<() -> (0)>
#map1 = affine_map<(d0, d1) -> (0)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1 + 1)>
#map4 = affine_map<() -> (1)>
#map5 = affine_map<(d0, d1) -> (d1 + 2)>
#map6 = affine_map<() -> (2)>
#map7 = affine_map<(d0, d1) -> (d0 + 1)>
#map8 = affine_map<(d0, d1) -> (d1)>
#map9 = affine_map<(d0, d1) -> (d0 + 2)>
module {
  func.func @conv2d(%arg0: memref<?x272xi32>, %arg1: memref<?x3xi32>, %arg2: memref<?x256xi32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    affine.for %arg3 = 0 to 16 {
      affine.for %arg4 = 0 to 256 step 8 {
        %c0_i32 = arith.constant 0 : i32
        %0 = vector.transfer_read %arg0[%arg3, %arg4], %c0_i32 : memref<?x272xi32>, vector<8xi32>
        %1 = affine.apply #map()
        %2 = affine.apply #map()
        %c0_i32_0 = arith.constant 0 : i32
        %3 = vector.transfer_read %arg1[%1, %2], %c0_i32_0 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %4 = arith.muli %0, %3 : vector<8xi32>
        %5 = affine.apply #map2(%arg3, %arg4)
        %6 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_1 = arith.constant 0 : i32
        %7 = vector.transfer_read %arg0[%5, %6], %c0_i32_1 : memref<?x272xi32>, vector<8xi32>
        %8 = affine.apply #map()
        %9 = affine.apply #map4()
        %c0_i32_2 = arith.constant 0 : i32
        %10 = vector.transfer_read %arg1[%8, %9], %c0_i32_2 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %11 = arith.muli %7, %10 : vector<8xi32>
        %12 = arith.addi %4, %11 : vector<8xi32>
        %13 = affine.apply #map2(%arg3, %arg4)
        %14 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_3 = arith.constant 0 : i32
        %15 = vector.transfer_read %arg0[%13, %14], %c0_i32_3 : memref<?x272xi32>, vector<8xi32>
        %16 = affine.apply #map()
        %17 = affine.apply #map6()
        %c0_i32_4 = arith.constant 0 : i32
        %18 = vector.transfer_read %arg1[%16, %17], %c0_i32_4 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %19 = arith.muli %15, %18 : vector<8xi32>
        %20 = arith.addi %12, %19 : vector<8xi32>
        %21 = affine.apply #map7(%arg3, %arg4)
        %22 = affine.apply #map8(%arg3, %arg4)
        %c0_i32_5 = arith.constant 0 : i32
        %23 = vector.transfer_read %arg0[%21, %22], %c0_i32_5 : memref<?x272xi32>, vector<8xi32>
        %24 = affine.apply #map4()
        %25 = affine.apply #map()
        %c0_i32_6 = arith.constant 0 : i32
        %26 = vector.transfer_read %arg1[%24, %25], %c0_i32_6 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %27 = arith.muli %23, %26 : vector<8xi32>
        %28 = arith.addi %20, %27 : vector<8xi32>
        %29 = affine.apply #map7(%arg3, %arg4)
        %30 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_7 = arith.constant 0 : i32
        %31 = vector.transfer_read %arg0[%29, %30], %c0_i32_7 : memref<?x272xi32>, vector<8xi32>
        %32 = affine.apply #map4()
        %33 = affine.apply #map4()
        %c0_i32_8 = arith.constant 0 : i32
        %34 = vector.transfer_read %arg1[%32, %33], %c0_i32_8 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %35 = arith.muli %31, %34 : vector<8xi32>
        %36 = arith.addi %28, %35 : vector<8xi32>
        %37 = affine.apply #map7(%arg3, %arg4)
        %38 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_9 = arith.constant 0 : i32
        %39 = vector.transfer_read %arg0[%37, %38], %c0_i32_9 : memref<?x272xi32>, vector<8xi32>
        %40 = affine.apply #map4()
        %41 = affine.apply #map6()
        %c0_i32_10 = arith.constant 0 : i32
        %42 = vector.transfer_read %arg1[%40, %41], %c0_i32_10 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %43 = arith.muli %39, %42 : vector<8xi32>
        %44 = arith.addi %36, %43 : vector<8xi32>
        %45 = affine.apply #map9(%arg3, %arg4)
        %46 = affine.apply #map8(%arg3, %arg4)
        %c0_i32_11 = arith.constant 0 : i32
        %47 = vector.transfer_read %arg0[%45, %46], %c0_i32_11 : memref<?x272xi32>, vector<8xi32>
        %48 = affine.apply #map6()
        %49 = affine.apply #map()
        %c0_i32_12 = arith.constant 0 : i32
        %50 = vector.transfer_read %arg1[%48, %49], %c0_i32_12 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %51 = arith.muli %47, %50 : vector<8xi32>
        %52 = arith.addi %44, %51 : vector<8xi32>
        %53 = affine.apply #map9(%arg3, %arg4)
        %54 = affine.apply #map3(%arg3, %arg4)
        %c0_i32_13 = arith.constant 0 : i32
        %55 = vector.transfer_read %arg0[%53, %54], %c0_i32_13 : memref<?x272xi32>, vector<8xi32>
        %56 = affine.apply #map6()
        %57 = affine.apply #map4()
        %c0_i32_14 = arith.constant 0 : i32
        %58 = vector.transfer_read %arg1[%56, %57], %c0_i32_14 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %59 = arith.muli %55, %58 : vector<8xi32>
        %60 = arith.addi %52, %59 : vector<8xi32>
        %61 = affine.apply #map9(%arg3, %arg4)
        %62 = affine.apply #map5(%arg3, %arg4)
        %c0_i32_15 = arith.constant 0 : i32
        %63 = vector.transfer_read %arg0[%61, %62], %c0_i32_15 : memref<?x272xi32>, vector<8xi32>
        %64 = affine.apply #map6()
        %65 = affine.apply #map6()
        %c0_i32_16 = arith.constant 0 : i32
        %66 = vector.transfer_read %arg1[%64, %65], %c0_i32_16 {permutation_map = #map1} : memref<?x3xi32>, vector<8xi32>
        %67 = arith.muli %63, %66 : vector<8xi32>
        %68 = arith.addi %60, %67 : vector<8xi32>
        vector.transfer_write %68, %arg2[%arg3, %arg4] : vector<8xi32>, memref<?x256xi32>
      }
    }
    return
  }
}

