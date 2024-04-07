func.func @single_loop_nothing_invariant() {
  %m1 = memref.alloc() : memref<10xi32>
  %m2 = memref.alloc() : memref<10xi32>
  affine.for %arg0 = 0 to 10 {
    %v0 = affine.load %m1[%arg0] : memref<10xi32>
    %v1 = affine.load %m2[%arg0] : memref<10xi32>
    %v2 = arith.addi %v0, %v1 : i32
    affine.store %v2, %m1[%arg0] : memref<10xi32>
  }


  return
}