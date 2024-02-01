module {
  func.func @vecdim_reduction(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg2 = 0 to 256 {
      %cst = arith.constant dense<0> : vector<16xi32>
      %0 = affine.for %arg3 = 0 to 512 step 16 iter_args(%arg4 = %cst) -> (vector<16xi32>) {
        %c0_i32_0 = arith.constant 0 : i32
        %2 = vector.transfer_read %arg0[%arg2, %arg3], %c0_i32_0 : memref<256x512xi32>, vector<16xi32>
        %3 = arith.addi %arg4, %2 : vector<16xi32>
        affine.yield %3 : vector<16xi32>
      }
      %1 = vector.reduction <add>, %0 : vector<16xi32> into i32
      affine.store %1, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}
