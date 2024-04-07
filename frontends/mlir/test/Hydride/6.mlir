module attributes {llvm.data_layout = ""} {
  llvm.func @hydride.node.conv2d.0(vector<8xi8>, vector<8xi8>, vector<8xi8>) -> vector<8xi8>
  llvm.func @conv2d(%arg0: !llvm.ptr<i8>, %arg1: !llvm.ptr<i8>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr<i8>, %arg8: !llvm.ptr<i8>, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: !llvm.ptr<i8>, %arg13: !llvm.ptr<i8>, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64) {
    %0 = llvm.mlir.constant(2 : index) : i64
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(3 : index) : i64
    %3 = llvm.mlir.constant(8 : index) : i64
    %4 = llvm.mlir.constant(256 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(16 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.undef : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg0, %8[0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %11 = llvm.insertvalue %arg2, %10[2] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %12 = llvm.insertvalue %arg3, %11[3, 0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %13 = llvm.insertvalue %arg5, %12[4, 0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg4, %13[3, 1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg6, %14[4, 1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.mlir.undef : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<1 x i64>, array<1 x i64>)>
    %17 = llvm.insertvalue %arg7, %16[0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<1 x i64>, array<1 x i64>)>
    %18 = llvm.insertvalue %arg8, %17[1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.insertvalue %arg9, %18[2] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.insertvalue %arg10, %19[3, 0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.insertvalue %arg11, %20[4, 0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<1 x i64>, array<1 x i64>)>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.insertvalue %arg12, %22[0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %24 = llvm.insertvalue %arg13, %23[1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %arg14, %24[2] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %26 = llvm.insertvalue %arg15, %25[3, 0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg17, %26[4, 0] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %28 = llvm.insertvalue %arg16, %27[3, 1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %arg18, %28[4, 1] : !llvm.struct<(ptr<i8>, ptr<i8>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%7 : i64)
  ^bb1(%30: i64):  // 2 preds: ^bb0, ^bb11
    %31 = llvm.icmp "slt" %30, %6 : i64
    llvm.cond_br %31, ^bb2, ^bb12
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%7 : i64)
  ^bb3(%32: i64):  // 2 preds: ^bb2, ^bb10
    %33 = llvm.icmp "slt" %32, %4 : i64
    llvm.cond_br %33, ^bb4, ^bb11
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%7 : i64)
  ^bb5(%34: i64):  // 2 preds: ^bb4, ^bb9
    %35 = llvm.icmp "slt" %34, %2 : i64
    llvm.cond_br %35, ^bb6, ^bb10
  ^bb6:  // pred: ^bb5
    llvm.br ^bb7(%7 : i64)
  ^bb7(%36: i64):  // 2 preds: ^bb6, ^bb8
    %37 = llvm.icmp "slt" %36, %2 : i64
    llvm.cond_br %37, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.mlir.constant(256 : index) : i64
    %40 = llvm.sub %39, %32  : i64
    %41 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %42 = llvm.trunc %40 : i64 to i32
    %43 = llvm.mlir.undef : vector<8xi32>
    %44 = llvm.mlir.constant(0 : i32) : i32
    %45 = llvm.insertelement %42, %43[%44 : i32] : vector<8xi32>
    %46 = llvm.shufflevector %45, %43 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %47 = llvm.icmp "sgt" %46, %41 : vector<8xi32>
    %48 = llvm.mlir.constant(dense<0> : vector<8xi8>) : vector<8xi8>
    %49 = llvm.mlir.constant(256 : index) : i64
    %50 = llvm.mul %30, %49  : i64
    %51 = llvm.add %50, %32  : i64
    %52 = llvm.getelementptr %arg13[%51] : (!llvm.ptr<i8>, i64) -> !llvm.ptr<i8>
    %53 = llvm.bitcast %52 : !llvm.ptr<i8> to !llvm.ptr<vector<8xi8>>
    %54 = llvm.intr.masked.load %53, %47, %48 {alignment = 1 : i32} : (!llvm.ptr<vector<8xi8>>, vector<8xi1>, vector<8xi8>) -> vector<8xi8>
    %55 = llvm.add %30, %34  : i64
    %56 = llvm.add %32, %36  : i64
    %57 = llvm.mlir.constant(1 : index) : i64
    %58 = llvm.mlir.constant(288 : index) : i64
    %59 = llvm.sub %58, %56  : i64
    %60 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %61 = llvm.trunc %59 : i64 to i32
    %62 = llvm.mlir.undef : vector<8xi32>
    %63 = llvm.mlir.constant(0 : i32) : i32
    %64 = llvm.insertelement %61, %62[%63 : i32] : vector<8xi32>
    %65 = llvm.shufflevector %64, %62 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %66 = llvm.icmp "sgt" %65, %60 : vector<8xi32>
    %67 = llvm.mlir.constant(dense<0> : vector<8xi8>) : vector<8xi8>
    %68 = llvm.mlir.constant(288 : index) : i64
    %69 = llvm.mul %55, %68  : i64
    %70 = llvm.add %69, %56  : i64
    %71 = llvm.getelementptr %arg1[%70] : (!llvm.ptr<i8>, i64) -> !llvm.ptr<i8>
    %72 = llvm.bitcast %71 : !llvm.ptr<i8> to !llvm.ptr<vector<8xi8>>
    %73 = llvm.intr.masked.load %72, %66, %67 {alignment = 1 : i32} : (!llvm.ptr<vector<8xi8>>, vector<8xi1>, vector<8xi8>) -> vector<8xi8>
    %74 = llvm.mul %34, %6  : i64
    %75 = llvm.mul %36, %0  : i64
    %76 = llvm.add %74, %75  : i64
    %77 = llvm.getelementptr %arg8[%76] : (!llvm.ptr<i8>, i64) -> !llvm.ptr<i8>
    %78 = llvm.load %77 : !llvm.ptr<i8>
    %79 = llvm.mlir.undef : vector<8xi8>
    %80 = llvm.mlir.constant(0 : i32) : i32
    %81 = llvm.insertelement %78, %79[%80 : i32] : vector<8xi8>
    %82 = llvm.shufflevector %81, %79 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi8>, vector<8xi8>
    %83 = llvm.call @hydride.node.conv2d.0(%54, %73, %82) : (vector<8xi8>, vector<8xi8>, vector<8xi8>) -> vector<8xi8>
    %84 = llvm.mlir.constant(1 : index) : i64
    %85 = llvm.mlir.constant(256 : index) : i64
    %86 = llvm.sub %85, %32  : i64
    %87 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %88 = llvm.trunc %86 : i64 to i32
    %89 = llvm.mlir.undef : vector<8xi32>
    %90 = llvm.mlir.constant(0 : i32) : i32
    %91 = llvm.insertelement %88, %89[%90 : i32] : vector<8xi32>
    %92 = llvm.shufflevector %91, %89 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %93 = llvm.icmp "sgt" %92, %87 : vector<8xi32>
    %94 = llvm.mlir.constant(256 : index) : i64
    %95 = llvm.mul %30, %94  : i64
    %96 = llvm.add %95, %32  : i64
    %97 = llvm.getelementptr %arg13[%96] : (!llvm.ptr<i8>, i64) -> !llvm.ptr<i8>
    %98 = llvm.bitcast %97 : !llvm.ptr<i8> to !llvm.ptr<vector<8xi8>>
    llvm.intr.masked.store %83, %98, %93 {alignment = 1 : i32} : vector<8xi8>, vector<8xi1> into !llvm.ptr<vector<8xi8>>
    %99 = llvm.add %36, %5  : i64
    llvm.br ^bb7(%99 : i64)
  ^bb9:  // pred: ^bb7
    %100 = llvm.add %34, %5  : i64
    llvm.br ^bb5(%100 : i64)
  ^bb10:  // pred: ^bb5
    %101 = llvm.add %32, %3  : i64
    llvm.br ^bb3(%101 : i64)
  ^bb11:  // pred: ^bb3
    %102 = llvm.add %30, %5  : i64
    llvm.br ^bb1(%102 : i64)
  ^bb12:  // pred: ^bb1
    llvm.return
  }
}

