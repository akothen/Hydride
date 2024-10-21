module attributes {llvm.data_layout = ""} {
  llvm.func @hydride.node.contraction_matmul.3(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @hydride.node.contraction_matmul.2(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @hydride.node.contraction_matmul.1(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @hydride.node.contraction_matmul.0(vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  llvm.func @contraction_matmul(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr<i32>, %arg8: !llvm.ptr<i32>, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: !llvm.ptr<i32>, %arg15: !llvm.ptr<i32>, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64) {
    %0 = llvm.mlir.constant(3 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(4 : index) : i64
    %4 = llvm.mlir.constant(8 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(1584 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg0, %8[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %11 = llvm.insertvalue %arg2, %10[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %12 = llvm.insertvalue %arg3, %11[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %13 = llvm.insertvalue %arg5, %12[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg4, %13[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %arg6, %14[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %arg7, %16[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %18 = llvm.insertvalue %arg8, %17[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %19 = llvm.insertvalue %arg9, %18[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %20 = llvm.insertvalue %arg10, %19[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.insertvalue %arg12, %20[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %22 = llvm.insertvalue %arg11, %21[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.insertvalue %arg13, %22[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %arg14, %24[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %26 = llvm.insertvalue %arg15, %25[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg16, %26[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %28 = llvm.insertvalue %arg17, %27[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %arg19, %28[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %arg18, %29[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %31 = llvm.insertvalue %arg20, %30[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    llvm.br ^bb1(%7 : i64)
  ^bb1(%32: i64):  // 2 preds: ^bb0, ^bb8
    %33 = llvm.icmp "slt" %32, %6 : i64
    llvm.cond_br %33, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%7 : i64)
  ^bb3(%34: i64):  // 2 preds: ^bb2, ^bb7
    %35 = llvm.icmp "slt" %34, %6 : i64
    llvm.cond_br %35, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%7 : i64)
  ^bb5(%36: i64):  // 2 preds: ^bb4, ^bb6
    %37 = llvm.icmp "slt" %36, %6 : i64
    llvm.cond_br %37, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %38 = llvm.mlir.constant(1584 : index) : i64
    %39 = llvm.mul %32, %38  : i64
    %40 = llvm.add %39, %36  : i64
    %41 = llvm.getelementptr %arg1[%40] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %42 = llvm.load %41 : !llvm.ptr<i32>
    %43 = llvm.mlir.undef : vector<8xi32>
    %44 = llvm.mlir.constant(0 : i32) : i32
    %45 = llvm.insertelement %42, %43[%44 : i32] : vector<8xi32>
    %46 = llvm.shufflevector %45, %43 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %47 = llvm.mlir.constant(1 : index) : i64
    %48 = llvm.mlir.constant(1584 : index) : i64
    %49 = llvm.sub %48, %34  : i64
    %50 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %51 = llvm.trunc %49 : i64 to i32
    %52 = llvm.mlir.undef : vector<8xi32>
    %53 = llvm.mlir.constant(0 : i32) : i32
    %54 = llvm.insertelement %51, %52[%53 : i32] : vector<8xi32>
    %55 = llvm.shufflevector %54, %52 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %56 = llvm.icmp "sgt" %55, %50 : vector<8xi32>
    %57 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %58 = llvm.mlir.constant(1584 : index) : i64
    %59 = llvm.mul %36, %58  : i64
    %60 = llvm.add %59, %34  : i64
    %61 = llvm.getelementptr %arg8[%60] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %62 = llvm.bitcast %61 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %63 = llvm.intr.masked.load %62, %56, %57 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %64 = llvm.mlir.constant(1 : index) : i64
    %65 = llvm.mlir.constant(1584 : index) : i64
    %66 = llvm.sub %65, %34  : i64
    %67 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %68 = llvm.trunc %66 : i64 to i32
    %69 = llvm.mlir.undef : vector<8xi32>
    %70 = llvm.mlir.constant(0 : i32) : i32
    %71 = llvm.insertelement %68, %69[%70 : i32] : vector<8xi32>
    %72 = llvm.shufflevector %71, %69 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %73 = llvm.icmp "sgt" %72, %67 : vector<8xi32>
    %74 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %75 = llvm.mlir.constant(1584 : index) : i64
    %76 = llvm.mul %32, %75  : i64
    %77 = llvm.add %76, %34  : i64
    %78 = llvm.getelementptr %arg15[%77] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %79 = llvm.bitcast %78 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %80 = llvm.intr.masked.load %79, %73, %74 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %81 = llvm.call @hydride.node.contraction_matmul.0(%80, %46, %63) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %82 = llvm.mlir.constant(1 : index) : i64
    %83 = llvm.mlir.constant(1584 : index) : i64
    %84 = llvm.sub %83, %34  : i64
    %85 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %86 = llvm.trunc %84 : i64 to i32
    %87 = llvm.mlir.undef : vector<8xi32>
    %88 = llvm.mlir.constant(0 : i32) : i32
    %89 = llvm.insertelement %86, %87[%88 : i32] : vector<8xi32>
    %90 = llvm.shufflevector %89, %87 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %91 = llvm.icmp "sgt" %90, %85 : vector<8xi32>
    %92 = llvm.mlir.constant(1584 : index) : i64
    %93 = llvm.mul %32, %92  : i64
    %94 = llvm.add %93, %34  : i64
    %95 = llvm.getelementptr %arg15[%94] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %96 = llvm.bitcast %95 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    llvm.intr.masked.store %81, %96, %91 {alignment = 4 : i32} : vector<8xi32>, vector<8xi1> into !llvm.ptr<vector<8xi32>>
    %97 = llvm.add %36, %5  : i64
    %98 = llvm.mlir.constant(1584 : index) : i64
    %99 = llvm.mul %32, %98  : i64
    %100 = llvm.add %99, %97  : i64
    %101 = llvm.getelementptr %arg1[%100] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %102 = llvm.load %101 : !llvm.ptr<i32>
    %103 = llvm.mlir.undef : vector<8xi32>
    %104 = llvm.mlir.constant(0 : i32) : i32
    %105 = llvm.insertelement %102, %103[%104 : i32] : vector<8xi32>
    %106 = llvm.shufflevector %105, %103 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %107 = llvm.mlir.constant(1 : index) : i64
    %108 = llvm.mlir.constant(1584 : index) : i64
    %109 = llvm.sub %108, %34  : i64
    %110 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %111 = llvm.trunc %109 : i64 to i32
    %112 = llvm.mlir.undef : vector<8xi32>
    %113 = llvm.mlir.constant(0 : i32) : i32
    %114 = llvm.insertelement %111, %112[%113 : i32] : vector<8xi32>
    %115 = llvm.shufflevector %114, %112 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %116 = llvm.icmp "sgt" %115, %110 : vector<8xi32>
    %117 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %118 = llvm.mlir.constant(1584 : index) : i64
    %119 = llvm.mul %97, %118  : i64
    %120 = llvm.add %119, %34  : i64
    %121 = llvm.getelementptr %arg8[%120] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %122 = llvm.bitcast %121 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %123 = llvm.intr.masked.load %122, %116, %117 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %124 = llvm.mlir.constant(1 : index) : i64
    %125 = llvm.mlir.constant(1584 : index) : i64
    %126 = llvm.sub %125, %34  : i64
    %127 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %128 = llvm.trunc %126 : i64 to i32
    %129 = llvm.mlir.undef : vector<8xi32>
    %130 = llvm.mlir.constant(0 : i32) : i32
    %131 = llvm.insertelement %128, %129[%130 : i32] : vector<8xi32>
    %132 = llvm.shufflevector %131, %129 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %133 = llvm.icmp "sgt" %132, %127 : vector<8xi32>
    %134 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %135 = llvm.mlir.constant(1584 : index) : i64
    %136 = llvm.mul %32, %135  : i64
    %137 = llvm.add %136, %34  : i64
    %138 = llvm.getelementptr %arg15[%137] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %139 = llvm.bitcast %138 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %140 = llvm.intr.masked.load %139, %133, %134 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %141 = llvm.call @hydride.node.contraction_matmul.1(%140, %106, %123) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %142 = llvm.mlir.constant(1 : index) : i64
    %143 = llvm.mlir.constant(1584 : index) : i64
    %144 = llvm.sub %143, %34  : i64
    %145 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %146 = llvm.trunc %144 : i64 to i32
    %147 = llvm.mlir.undef : vector<8xi32>
    %148 = llvm.mlir.constant(0 : i32) : i32
    %149 = llvm.insertelement %146, %147[%148 : i32] : vector<8xi32>
    %150 = llvm.shufflevector %149, %147 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %151 = llvm.icmp "sgt" %150, %145 : vector<8xi32>
    %152 = llvm.mlir.constant(1584 : index) : i64
    %153 = llvm.mul %32, %152  : i64
    %154 = llvm.add %153, %34  : i64
    %155 = llvm.getelementptr %arg15[%154] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %156 = llvm.bitcast %155 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    llvm.intr.masked.store %141, %156, %151 {alignment = 4 : i32} : vector<8xi32>, vector<8xi1> into !llvm.ptr<vector<8xi32>>
    %157 = llvm.add %36, %1  : i64
    %158 = llvm.mlir.constant(1584 : index) : i64
    %159 = llvm.mul %32, %158  : i64
    %160 = llvm.add %159, %157  : i64
    %161 = llvm.getelementptr %arg1[%160] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %162 = llvm.load %161 : !llvm.ptr<i32>
    %163 = llvm.mlir.undef : vector<8xi32>
    %164 = llvm.mlir.constant(0 : i32) : i32
    %165 = llvm.insertelement %162, %163[%164 : i32] : vector<8xi32>
    %166 = llvm.shufflevector %165, %163 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %167 = llvm.mlir.constant(1 : index) : i64
    %168 = llvm.mlir.constant(1584 : index) : i64
    %169 = llvm.sub %168, %34  : i64
    %170 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %171 = llvm.trunc %169 : i64 to i32
    %172 = llvm.mlir.undef : vector<8xi32>
    %173 = llvm.mlir.constant(0 : i32) : i32
    %174 = llvm.insertelement %171, %172[%173 : i32] : vector<8xi32>
    %175 = llvm.shufflevector %174, %172 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %176 = llvm.icmp "sgt" %175, %170 : vector<8xi32>
    %177 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %178 = llvm.mlir.constant(1584 : index) : i64
    %179 = llvm.mul %157, %178  : i64
    %180 = llvm.add %179, %34  : i64
    %181 = llvm.getelementptr %arg8[%180] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %182 = llvm.bitcast %181 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %183 = llvm.intr.masked.load %182, %176, %177 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %184 = llvm.mlir.constant(1 : index) : i64
    %185 = llvm.mlir.constant(1584 : index) : i64
    %186 = llvm.sub %185, %34  : i64
    %187 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %188 = llvm.trunc %186 : i64 to i32
    %189 = llvm.mlir.undef : vector<8xi32>
    %190 = llvm.mlir.constant(0 : i32) : i32
    %191 = llvm.insertelement %188, %189[%190 : i32] : vector<8xi32>
    %192 = llvm.shufflevector %191, %189 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %193 = llvm.icmp "sgt" %192, %187 : vector<8xi32>
    %194 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %195 = llvm.mlir.constant(1584 : index) : i64
    %196 = llvm.mul %32, %195  : i64
    %197 = llvm.add %196, %34  : i64
    %198 = llvm.getelementptr %arg15[%197] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %199 = llvm.bitcast %198 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %200 = llvm.intr.masked.load %199, %193, %194 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %201 = llvm.call @hydride.node.contraction_matmul.2(%200, %166, %183) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %202 = llvm.mlir.constant(1 : index) : i64
    %203 = llvm.mlir.constant(1584 : index) : i64
    %204 = llvm.sub %203, %34  : i64
    %205 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %206 = llvm.trunc %204 : i64 to i32
    %207 = llvm.mlir.undef : vector<8xi32>
    %208 = llvm.mlir.constant(0 : i32) : i32
    %209 = llvm.insertelement %206, %207[%208 : i32] : vector<8xi32>
    %210 = llvm.shufflevector %209, %207 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %211 = llvm.icmp "sgt" %210, %205 : vector<8xi32>
    %212 = llvm.mlir.constant(1584 : index) : i64
    %213 = llvm.mul %32, %212  : i64
    %214 = llvm.add %213, %34  : i64
    %215 = llvm.getelementptr %arg15[%214] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %216 = llvm.bitcast %215 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    llvm.intr.masked.store %201, %216, %211 {alignment = 4 : i32} : vector<8xi32>, vector<8xi1> into !llvm.ptr<vector<8xi32>>
    %217 = llvm.add %36, %0  : i64
    %218 = llvm.mlir.constant(1584 : index) : i64
    %219 = llvm.mul %32, %218  : i64
    %220 = llvm.add %219, %217  : i64
    %221 = llvm.getelementptr %arg1[%220] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %222 = llvm.load %221 : !llvm.ptr<i32>
    %223 = llvm.mlir.undef : vector<8xi32>
    %224 = llvm.mlir.constant(0 : i32) : i32
    %225 = llvm.insertelement %222, %223[%224 : i32] : vector<8xi32>
    %226 = llvm.shufflevector %225, %223 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %227 = llvm.mlir.constant(1 : index) : i64
    %228 = llvm.mlir.constant(1584 : index) : i64
    %229 = llvm.sub %228, %34  : i64
    %230 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %231 = llvm.trunc %229 : i64 to i32
    %232 = llvm.mlir.undef : vector<8xi32>
    %233 = llvm.mlir.constant(0 : i32) : i32
    %234 = llvm.insertelement %231, %232[%233 : i32] : vector<8xi32>
    %235 = llvm.shufflevector %234, %232 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %236 = llvm.icmp "sgt" %235, %230 : vector<8xi32>
    %237 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %238 = llvm.mlir.constant(1584 : index) : i64
    %239 = llvm.mul %217, %238  : i64
    %240 = llvm.add %239, %34  : i64
    %241 = llvm.getelementptr %arg8[%240] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %242 = llvm.bitcast %241 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %243 = llvm.intr.masked.load %242, %236, %237 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %244 = llvm.mlir.constant(1 : index) : i64
    %245 = llvm.mlir.constant(1584 : index) : i64
    %246 = llvm.sub %245, %34  : i64
    %247 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %248 = llvm.trunc %246 : i64 to i32
    %249 = llvm.mlir.undef : vector<8xi32>
    %250 = llvm.mlir.constant(0 : i32) : i32
    %251 = llvm.insertelement %248, %249[%250 : i32] : vector<8xi32>
    %252 = llvm.shufflevector %251, %249 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %253 = llvm.icmp "sgt" %252, %247 : vector<8xi32>
    %254 = llvm.mlir.constant(dense<0> : vector<8xi32>) : vector<8xi32>
    %255 = llvm.mlir.constant(1584 : index) : i64
    %256 = llvm.mul %32, %255  : i64
    %257 = llvm.add %256, %34  : i64
    %258 = llvm.getelementptr %arg15[%257] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %259 = llvm.bitcast %258 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    %260 = llvm.intr.masked.load %259, %253, %254 {alignment = 4 : i32} : (!llvm.ptr<vector<8xi32>>, vector<8xi1>, vector<8xi32>) -> vector<8xi32>
    %261 = llvm.call @hydride.node.contraction_matmul.3(%260, %226, %243) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    %262 = llvm.mlir.constant(1 : index) : i64
    %263 = llvm.mlir.constant(1584 : index) : i64
    %264 = llvm.sub %263, %34  : i64
    %265 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    %266 = llvm.trunc %264 : i64 to i32
    %267 = llvm.mlir.undef : vector<8xi32>
    %268 = llvm.mlir.constant(0 : i32) : i32
    %269 = llvm.insertelement %266, %267[%268 : i32] : vector<8xi32>
    %270 = llvm.shufflevector %269, %267 [0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32, 0 : i32] : vector<8xi32>, vector<8xi32>
    %271 = llvm.icmp "sgt" %270, %265 : vector<8xi32>
    %272 = llvm.mlir.constant(1584 : index) : i64
    %273 = llvm.mul %32, %272  : i64
    %274 = llvm.add %273, %34  : i64
    %275 = llvm.getelementptr %arg15[%274] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %276 = llvm.bitcast %275 : !llvm.ptr<i32> to !llvm.ptr<vector<8xi32>>
    llvm.intr.masked.store %261, %276, %271 {alignment = 4 : i32} : vector<8xi32>, vector<8xi1> into !llvm.ptr<vector<8xi32>>
    %277 = llvm.add %36, %3  : i64
    llvm.br ^bb5(%277 : i64)
  ^bb7:  // pred: ^bb5
    %278 = llvm.add %34, %4  : i64
    llvm.br ^bb3(%278 : i64)
  ^bb8:  // pred: ^bb3
    %279 = llvm.add %32, %5  : i64
    llvm.br ^bb1(%279 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
}

