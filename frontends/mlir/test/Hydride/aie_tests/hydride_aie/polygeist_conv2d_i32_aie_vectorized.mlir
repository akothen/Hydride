module {
  func.func @conv2d(%arg0: memref<?x272xi32>, %arg1: memref<?x3xi32>, %arg2: memref<?x256xi32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = aievec.upd %arg1[%c0, %c0] {index = 0 : i8, offset = 0 : i32} : memref<?x3xi32>, vector<8xi32>
    %1 = aievec.upd %arg1[%c2, %c2] {index = 0 : i8, offset = 0 : i32} : memref<?x3xi32>, vector<8xi32>
    %c0_0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0_0 to %c16 step %c1 {
      %c1_1 = arith.constant 1 : index
      %2 = arith.addi %arg3, %c1_1 : index
      %c2_2 = arith.constant 2 : index
      %3 = arith.addi %arg3, %c2_2 : index
      %c0_3 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %c8 = arith.constant 8 : index
      scf.for %arg4 = %c0_3 to %c256 step %c8 {
        %4 = aievec.upd %arg0[%arg3, %arg4] {index = 0 : i8, offset = 0 : i32} : memref<?x272xi32>, vector<16xi32>
        %5 = aievec_aie1.mul %4, %0 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %c1_4 = arith.constant 1 : index
        %6 = arith.addi %arg4, %c1_4 : index
        %7 = aievec.upd %arg0[%arg3, %6], %4 {index = 1 : i8, offset = 224 : i32} : memref<?x272xi32>, vector<16xi32>
        %8 = aievec_aie1.mac %7, %0, %5 {xoffsets = "0x76543210", xstart = "1", zoffsets = "0x00000000", zstart = "1"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %9 = aievec_aie1.mac %7, %0, %8 {xoffsets = "0x76543210", xstart = "2", zoffsets = "0x00000000", zstart = "2"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %10 = aievec.upd %arg0[%2, %arg4] {index = 0 : i8, offset = 0 : i32} : memref<?x272xi32>, vector<16xi32>
        %11 = aievec_aie1.mac %10, %0, %9 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "3"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %12 = aievec.upd %arg0[%2, %6], %10 {index = 1 : i8, offset = 224 : i32} : memref<?x272xi32>, vector<16xi32>
        %13 = aievec_aie1.mac %12, %0, %11 {xoffsets = "0x76543210", xstart = "1", zoffsets = "0x00000000", zstart = "4"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %14 = aievec_aie1.mac %12, %0, %13 {xoffsets = "0x76543210", xstart = "2", zoffsets = "0x00000000", zstart = "5"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %15 = aievec.upd %arg0[%3, %arg4] {index = 0 : i8, offset = 0 : i32} : memref<?x272xi32>, vector<16xi32>
        %16 = aievec_aie1.mac %15, %0, %14 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "6"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %17 = aievec.upd %arg0[%3, %6], %15 {index = 1 : i8, offset = 224 : i32} : memref<?x272xi32>, vector<16xi32>
        %18 = aievec_aie1.mac %17, %0, %16 {xoffsets = "0x76543210", xstart = "1", zoffsets = "0x00000000", zstart = "7"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %19 = aievec_aie1.mac %17, %1, %18 {xoffsets = "0x76543210", xstart = "2", zoffsets = "0x00000000", zstart = "0"} : vector<16xi32>, vector<8xi32>, vector<8xi80>
        %20 = aievec.srs %19, %c0_i32 : vector<8xi80>, i32, vector<8xi32>
        vector.transfer_write %20, %arg2[%arg3, %arg4] : vector<8xi32>, memref<?x256xi32>
      }
    }
    return
  }
}

