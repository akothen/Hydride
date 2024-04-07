func.func @conv2d (%A: memref<2048x2048xi32>, %B: memref<9xi32>, %C: memref<2046x2046xi32>) {
    affine.for %arg3 = 0 to 2046 {
        affine.for %arg4 = 0 to 2046 {
            //3x3 stencil 
            affine.for %arg5 = 0 to 3 {
                affine.for %arg6 = 0 to 3 {   
                    //Load the output point
                    %ci = affine.load %C[%arg3, %arg4] : memref<2046x2046xi32>
                     %a11 = affine.load %A[%arg3+%arg5, %arg4+%arg6] : memref<2048x2048xi32>
                     %b11 = affine.load %B[3*%arg5+%arg6] : memref<9xi32>
                     %p11 = arith.muli %a11, %b11 : i32
                     %c11 = arith.addi %ci, %p11 : i32
                     //Store accumulated sum
                     affine.store %c11, %C[%arg3, %arg4] : memref<2046x2046xi32>
                }
            }
        }
    }
    return
}