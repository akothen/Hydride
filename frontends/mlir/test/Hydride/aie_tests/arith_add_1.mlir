func.func @axpy_int_add(%arg0: vector<16xi32>, %arg1: i32, %arg2: vector<16xi32>) -> vector<16xi32> {
   %0 = vector.outerproduct %arg0, %arg1, %arg2: vector<16xi32>, i32
   return %0: vector<16xi32>
}