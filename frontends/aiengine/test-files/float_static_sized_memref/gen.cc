module {
  llvm.func @llvm.aie.vfpmac(vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
  llvm.func @llvm.aie.upd.w.v16float.hi(vector<16xf32>, vector<8xf32>) -> vector<16xf32>
  llvm.func @llvm.aie.vfpmul(vector<16xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
  llvm.func @llvm.aie.v16float.undef() -> vector<16xf32>
  llvm.func @llvm.aie.upd.w.v16float.lo(vector<16xf32>, vector<8xf32>) -> vector<16xf32>
  func.func @conv2d(%arg0: memref<18x272xf32>, %arg1: memref<9xf32>, %arg2: memref<16x256xf32>) {
    %0 = builtin.unrealized_conversion_cast %arg1 : memref<9xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg0 : memref<18x272xf32> to !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %c8 = arith.constant 8 : index
    %2 = builtin.unrealized_conversion_cast %c8 : index to i64
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    %4 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.getelementptr %4[%3] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %6 = llvm.bitcast %5 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
    %7 = llvm.load %6 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
    %8 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.getelementptr %8[%2] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %10 = llvm.bitcast %9 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
    %11 = llvm.load %10 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
    %c0_0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0_0 to %c16 step %c1 {
      %12 = builtin.unrealized_conversion_cast %arg3 : index to i64
      %c1_1 = arith.constant 1 : index
      %13 = arith.addi %arg3, %c1_1 : index
      %14 = builtin.unrealized_conversion_cast %13 : index to i64
      %c2 = arith.constant 2 : index
      %15 = arith.addi %arg3, %c2 : index
      %16 = builtin.unrealized_conversion_cast %15 : index to i64
      %c0_2 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %c8_3 = arith.constant 8 : index
      scf.for %arg4 = %c0_2 to %c256 step %c8_3 {
        %17 = builtin.unrealized_conversion_cast %arg4 : index to i64
        %18 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
        %19 = llvm.mlir.constant(272 : index) : i64
        %20 = llvm.mul %12, %19  : i64
        %21 = llvm.add %20, %17  : i64
        %22 = llvm.getelementptr %18[%21] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
        %23 = llvm.bitcast %22 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
        %24 = llvm.load %23 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
        %25 = llvm.call @llvm.aie.v16float.undef() : () -> vector<16xf32>
        %26 = llvm.call @llvm.aie.upd.w.v16float.lo(%25, %24) : (vector<16xf32>, vector<8xf32>) -> vector<16xf32>
        %27 = llvm.mlir.constant(0 : i32) : i32
        %28 = llvm.mlir.constant(0 : i32) : i32
        %29 = llvm.mlir.constant(0 : i32) : i32
        %30 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %31 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %32 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %33 = llvm.call @llvm.aie.vfpmul(%26, %7, %27, %28, %29, %30, %31, %32) : (vector<16xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %c1_4 = arith.constant 1 : index
        %34 = arith.addi %arg4, %c1_4 : index
        %35 = builtin.unrealized_conversion_cast %34 : index to i64
        %36 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
        %37 = llvm.mlir.constant(272 : index) : i64
        %38 = llvm.mul %12, %37  : i64
        %39 = llvm.add %38, %35  : i64
        %40 = llvm.getelementptr %36[%39] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
        %41 = llvm.bitcast %40 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
        %42 = llvm.load %41 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
        %43 = llvm.call @llvm.aie.upd.w.v16float.hi(%26, %42) : (vector<16xf32>, vector<8xf32>) -> vector<16xf32>
        %44 = llvm.mlir.constant(1 : i32) : i32
        %45 = llvm.mlir.constant(0 : i32) : i32
        %46 = llvm.mlir.constant(1 : i32) : i32
        %47 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %48 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %49 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %50 = llvm.call @llvm.aie.vfpmac(%43, %7, %33, %44, %45, %46, %47, %48, %49) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %51 = llvm.mlir.constant(2 : i32) : i32
        %52 = llvm.mlir.constant(0 : i32) : i32
        %53 = llvm.mlir.constant(2 : i32) : i32
        %54 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %55 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %56 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %57 = llvm.call @llvm.aie.vfpmac(%43, %7, %50, %51, %52, %53, %54, %55, %56) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %58 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
        %59 = llvm.mlir.constant(272 : index) : i64
        %60 = llvm.mul %14, %59  : i64
        %61 = llvm.add %60, %17  : i64
        %62 = llvm.getelementptr %58[%61] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
        %63 = llvm.bitcast %62 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
        %64 = llvm.load %63 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
        %65 = llvm.call @llvm.aie.v16float.undef() : () -> vector<16xf32>
        %66 = llvm.call @llvm.aie.upd.w.v16float.lo(%65, %64) : (vector<16xf32>, vector<8xf32>) -> vector<16xf32>
        %67 = llvm.mlir.constant(0 : i32) : i32
        %68 = llvm.mlir.constant(0 : i32) : i32
        %69 = llvm.mlir.constant(3 : i32) : i32
        %70 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %71 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %72 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %73 = llvm.call @llvm.aie.vfpmac(%66, %7, %57, %67, %68, %69, %70, %71, %72) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %74 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
        %75 = llvm.mlir.constant(272 : index) : i64
        %76 = llvm.mul %14, %75  : i64
        %77 = llvm.add %76, %35  : i64
        %78 = llvm.getelementptr %74[%77] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
        %79 = llvm.bitcast %78 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
        %80 = llvm.load %79 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
        %81 = llvm.call @llvm.aie.upd.w.v16float.hi(%66, %80) : (vector<16xf32>, vector<8xf32>) -> vector<16xf32>
        %82 = llvm.mlir.constant(1 : i32) : i32
        %83 = llvm.mlir.constant(0 : i32) : i32
        %84 = llvm.mlir.constant(4 : i32) : i32
        %85 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %86 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %87 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %88 = llvm.call @llvm.aie.vfpmac(%81, %7, %73, %82, %83, %84, %85, %86, %87) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %89 = llvm.mlir.constant(2 : i32) : i32
        %90 = llvm.mlir.constant(0 : i32) : i32
        %91 = llvm.mlir.constant(5 : i32) : i32
        %92 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %93 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %94 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %95 = llvm.call @llvm.aie.vfpmac(%81, %7, %88, %89, %90, %91, %92, %93, %94) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %96 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
        %97 = llvm.mlir.constant(272 : index) : i64
        %98 = llvm.mul %16, %97  : i64
        %99 = llvm.add %98, %17  : i64
        %100 = llvm.getelementptr %96[%99] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
        %101 = llvm.bitcast %100 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
        %102 = llvm.load %101 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
        %103 = llvm.call @llvm.aie.v16float.undef() : () -> vector<16xf32>
        %104 = llvm.call @llvm.aie.upd.w.v16float.lo(%103, %102) : (vector<16xf32>, vector<8xf32>) -> vector<16xf32>
        %105 = llvm.mlir.constant(0 : i32) : i32
        %106 = llvm.mlir.constant(0 : i32) : i32
        %107 = llvm.mlir.constant(6 : i32) : i32
        %108 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %109 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %110 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %111 = llvm.call @llvm.aie.vfpmac(%104, %7, %95, %105, %106, %107, %108, %109, %110) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %112 = llvm.extractvalue %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
        %113 = llvm.mlir.constant(272 : index) : i64
        %114 = llvm.mul %16, %113  : i64
        %115 = llvm.add %114, %35  : i64
        %116 = llvm.getelementptr %112[%115] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
        %117 = llvm.bitcast %116 : !llvm.ptr<f32> to !llvm.ptr<vector<8xf32>>
        %118 = llvm.load %117 {alignment = 1 : i64} : !llvm.ptr<vector<8xf32>>
        %119 = llvm.call @llvm.aie.upd.w.v16float.hi(%104, %118) : (vector<16xf32>, vector<8xf32>) -> vector<16xf32>
        %120 = llvm.mlir.constant(1 : i32) : i32
        %121 = llvm.mlir.constant(0 : i32) : i32
        %122 = llvm.mlir.constant(7 : i32) : i32
        %123 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %124 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %125 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %126 = llvm.call @llvm.aie.vfpmac(%119, %7, %111, %120, %121, %122, %123, %124, %125) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        %127 = llvm.mlir.constant(2 : i32) : i32
        %128 = llvm.mlir.constant(0 : i32) : i32
        %129 = llvm.mlir.constant(0 : i32) : i32
        %130 = llvm.mlir.constant(dense<[1985229328, 0]> : vector<2xi32>) : vector<2xi32>
        %131 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %132 = llvm.mlir.constant(dense<0> : vector<2xi32>) : vector<2xi32>
        %133 = llvm.call @llvm.aie.vfpmac(%119, %11, %126, %127, %128, %129, %130, %131, %132) : (vector<16xf32>, vector<8xf32>, vector<8xf32>, i32, i32, i32, vector<2xi32>, vector<2xi32>, vector<2xi32>) -> vector<8xf32>
        vector.transfer_write %133, %arg2[%arg3, %arg4] {in_bounds = [true]} : vector<8xf32>, memref<16x256xf32>
      }
    }
    return
  }
}

