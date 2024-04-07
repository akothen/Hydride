module {
  llvm.func @hydride.node.single_loop_nothing_invariant.0(vector<8xi32>, vector<8xi32>) -> vector<8xi32>
  func.func @single_loop_nothing_invariant() {
    %0 = memref.alloc() : memref<10xi32>
    %1 = memref.alloc() : memref<10xi32>
    affine.for %arg0 = 0 to 10 step 8 {
      %c0_i32 = arith.constant 0 : i32
      %2 = vector.transfer_read %0[%arg0], %c0_i32 : memref<10xi32>, vector<8xi32>
      %c0_i32_0 = arith.constant 0 : i32
      %3 = vector.transfer_read %1[%arg0], %c0_i32_0 : memref<10xi32>, vector<8xi32>
      %4 = arith.addi %2, %3 : vector<8xi32>
      %5 = llvm.call @hydride.node.single_loop_nothing_invariant.0(%2, %3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
      vector.transfer_write %5, %0[%arg0] : vector<8xi32>, memref<10xi32>
    }
    return
  }
}

