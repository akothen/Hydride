module {
  func.func @conv2d(%arg0: memref<18x272xf32>, %arg1: memref<9xf32>, %arg2: memref<16x256xf32>) {
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %0 = aievec.upd %arg1[%c0] {index = 0 : i8, offset = 0 : si32} : memref<9xf32>, vector<8xf32>
    %1 = aievec.upd %arg1[%c8] {index = 0 : i8, offset = 0 : si32} : memref<9xf32>, vector<8xf32>
    %c0_0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0_0 to %c16 step %c1 {
      %c1_1 = arith.constant 1 : index
      %2 = arith.addi %arg3, %c1_1 : index
      %c2 = arith.constant 2 : index
      %3 = arith.addi %arg3, %c2 : index
      %c0_2 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %c8_3 = arith.constant 8 : index
      scf.for %arg4 = %c0_2 to %c256 step %c8_3 {
        %4 = aievec.upd %arg0[%arg3, %arg4] {index = 0 : i8, offset = 0 : si32} : memref<18x272xf32>, vector<16xf32>
        %5 = aievec.mul %4, %0 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %c1_4 = arith.constant 1 : index
        %6 = arith.addi %arg4, %c1_4 : index
        %7 = aievec.upd %arg0[%arg3, %6], %4 {index = 1 : i8, offset = 224 : si32} : memref<18x272xf32>, vector<16xf32>
        %8 = aievec.mac %7, %0, %5 {xoffsets = "0x76543210", xstart = "1", zoffsets = "0x00000000", zstart = "1"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %9 = aievec.mac %7, %0, %8 {xoffsets = "0x76543210", xstart = "2", zoffsets = "0x00000000", zstart = "2"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %10 = aievec.upd %arg0[%2, %arg4] {index = 0 : i8, offset = 0 : si32} : memref<18x272xf32>, vector<16xf32>
        %11 = aievec.mac %10, %0, %9 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "3"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %12 = aievec.upd %arg0[%2, %6], %10 {index = 1 : i8, offset = 224 : si32} : memref<18x272xf32>, vector<16xf32>
        %13 = aievec.mac %12, %0, %11 {xoffsets = "0x76543210", xstart = "1", zoffsets = "0x00000000", zstart = "4"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %14 = aievec.mac %12, %0, %13 {xoffsets = "0x76543210", xstart = "2", zoffsets = "0x00000000", zstart = "5"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %15 = aievec.upd %arg0[%3, %arg4] {index = 0 : i8, offset = 0 : si32} : memref<18x272xf32>, vector<16xf32>
        %16 = aievec.mac %15, %0, %14 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "6"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %17 = aievec.upd %arg0[%3, %6], %15 {index = 1 : i8, offset = 224 : si32} : memref<18x272xf32>, vector<16xf32>
        %18 = aievec.mac %17, %0, %16 {xoffsets = "0x76543210", xstart = "1", zoffsets = "0x00000000", zstart = "7"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        %19 = aievec.mac %17, %1, %18 {xoffsets = "0x76543210", xstart = "2", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, vector<8xf32>
        vector.transfer_write %19, %arg2[%arg3, %arg4] {in_bounds = [true]} : vector<8xf32>, memref<16x256xf32>
      }
    }
    return
  }
}

