func.func @vecdim_reduction(%in: memref<256x512xi32>, %out: memref<256xi32>) {
 %cst = arith.constant 0 : i32
 affine.for %i = 0 to 256 {
   %final_red = affine.for %j = 0 to 512 iter_args(%red_iter = %cst) -> (i32) {
     %ld = affine.load %in[%i, %j] : memref<256x512xi32>
     %add = arith.addi %red_iter, %ld : i32
     affine.yield %add : i32
   }
   affine.store %final_red, %out[%i] : memref<256xi32>
 }
 return
}