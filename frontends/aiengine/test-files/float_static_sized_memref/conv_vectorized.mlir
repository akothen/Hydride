#map = affine_map<() -> (0)>
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
  func.func @conv2d(%arg0: memref<18x272xf32>, %arg1: memref<9xf32>, %arg2: memref<16x256xf32>) {
    affine.for %arg3 = 0 to 16 {
      affine.for %arg4 = 0 to 256 step 8 {
        %cst = arith.constant 0.000000e+00 : f32
        %0 = vector.transfer_read %arg0[%arg3, %arg4], %cst : memref<18x272xf32>, vector<8xf32>
        %1 = affine.apply #map()
        %cst_0 = arith.constant 0.000000e+00 : f32
        %2 = vector.transfer_read %arg1[%1], %cst_0 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %3 = arith.mulf %0, %2 : vector<8xf32>
        %4 = affine.apply #map2(%arg3, %arg4)
        %5 = affine.apply #map3(%arg3, %arg4)
        %cst_1 = arith.constant 0.000000e+00 : f32
        %6 = vector.transfer_read %arg0[%4, %5], %cst_1 : memref<18x272xf32>, vector<8xf32>
        %7 = affine.apply #map4()
        %cst_2 = arith.constant 0.000000e+00 : f32
        %8 = vector.transfer_read %arg1[%7], %cst_2 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %9 = arith.mulf %6, %8 : vector<8xf32>
        %10 = arith.addf %3, %9 : vector<8xf32>
        %11 = affine.apply #map2(%arg3, %arg4)
        %12 = affine.apply #map5(%arg3, %arg4)
        %cst_3 = arith.constant 0.000000e+00 : f32
        %13 = vector.transfer_read %arg0[%11, %12], %cst_3 : memref<18x272xf32>, vector<8xf32>
        %14 = affine.apply #map6()
        %cst_4 = arith.constant 0.000000e+00 : f32
        %15 = vector.transfer_read %arg1[%14], %cst_4 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %16 = arith.mulf %13, %15 : vector<8xf32>
        %17 = arith.addf %10, %16 : vector<8xf32>
        %18 = affine.apply #map7(%arg3, %arg4)
        %19 = affine.apply #map8(%arg3, %arg4)
        %cst_5 = arith.constant 0.000000e+00 : f32
        %20 = vector.transfer_read %arg0[%18, %19], %cst_5 : memref<18x272xf32>, vector<8xf32>
        %21 = affine.apply #map9()
        %cst_6 = arith.constant 0.000000e+00 : f32
        %22 = vector.transfer_read %arg1[%21], %cst_6 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %23 = arith.mulf %20, %22 : vector<8xf32>
        %24 = arith.addf %17, %23 : vector<8xf32>
        %25 = affine.apply #map7(%arg3, %arg4)
        %26 = affine.apply #map3(%arg3, %arg4)
        %cst_7 = arith.constant 0.000000e+00 : f32
        %27 = vector.transfer_read %arg0[%25, %26], %cst_7 : memref<18x272xf32>, vector<8xf32>
        %28 = affine.apply #map10()
        %cst_8 = arith.constant 0.000000e+00 : f32
        %29 = vector.transfer_read %arg1[%28], %cst_8 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %30 = arith.mulf %27, %29 : vector<8xf32>
        %31 = arith.addf %24, %30 : vector<8xf32>
        %32 = affine.apply #map7(%arg3, %arg4)
        %33 = affine.apply #map5(%arg3, %arg4)
        %cst_9 = arith.constant 0.000000e+00 : f32
        %34 = vector.transfer_read %arg0[%32, %33], %cst_9 : memref<18x272xf32>, vector<8xf32>
        %35 = affine.apply #map11()
        %cst_10 = arith.constant 0.000000e+00 : f32
        %36 = vector.transfer_read %arg1[%35], %cst_10 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %37 = arith.mulf %34, %36 : vector<8xf32>
        %38 = arith.addf %31, %37 : vector<8xf32>
        %39 = affine.apply #map12(%arg3, %arg4)
        %40 = affine.apply #map8(%arg3, %arg4)
        %cst_11 = arith.constant 0.000000e+00 : f32
        %41 = vector.transfer_read %arg0[%39, %40], %cst_11 : memref<18x272xf32>, vector<8xf32>
        %42 = affine.apply #map13()
        %cst_12 = arith.constant 0.000000e+00 : f32
        %43 = vector.transfer_read %arg1[%42], %cst_12 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %44 = arith.mulf %41, %43 : vector<8xf32>
        %45 = arith.addf %38, %44 : vector<8xf32>
        %46 = affine.apply #map12(%arg3, %arg4)
        %47 = affine.apply #map3(%arg3, %arg4)
        %cst_13 = arith.constant 0.000000e+00 : f32
        %48 = vector.transfer_read %arg0[%46, %47], %cst_13 : memref<18x272xf32>, vector<8xf32>
        %49 = affine.apply #map14()
        %cst_14 = arith.constant 0.000000e+00 : f32
        %50 = vector.transfer_read %arg1[%49], %cst_14 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %51 = arith.mulf %48, %50 : vector<8xf32>
        %52 = arith.addf %45, %51 : vector<8xf32>
        %53 = affine.apply #map12(%arg3, %arg4)
        %54 = affine.apply #map5(%arg3, %arg4)
        %cst_15 = arith.constant 0.000000e+00 : f32
        %55 = vector.transfer_read %arg0[%53, %54], %cst_15 : memref<18x272xf32>, vector<8xf32>
        %56 = affine.apply #map15()
        %cst_16 = arith.constant 0.000000e+00 : f32
        %57 = vector.transfer_read %arg1[%56], %cst_16 {permutation_map = #map1} : memref<9xf32>, vector<8xf32>
        %58 = arith.mulf %55, %57 : vector<8xf32>
        %59 = arith.addf %52, %58 : vector<8xf32>
        vector.transfer_write %59, %arg2[%arg3, %arg4] : vector<8xf32>, memref<16x256xf32>
      }
    }
    return
  }
}

