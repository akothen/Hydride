func.func @conv2d (%A: memref<18x288xi8>, %B: memref<48xi8>, %C: memref<16x256xi8>) {
    affine.for %arg3 = 0 to 16 {
        affine.for %arg4 = 0 to 256 {
            //3x3 stencil 
            affine.for %arg5 = 0 to 3 {
                affine.for %arg6 = 0 to 3 {   
                    //Load the output point
                    %ci = affine.load %C[%arg3, %arg4] : memref<16x256xi8>
                     %a11 = affine.load %A[%arg3+%arg5, %arg4+%arg6] : memref<18x288xi8>
                     %b11 = affine.load %B[16*%arg5 + 2*%arg6] : memref<48xi8>
                     %p11 = arith.muli %a11, %b11 : i8
                     %c11 = arith.addi %ci, %p11 : i8
                     //Store accumulated sum
                     affine.store %c11, %C[%arg3, %arg4] : memref<16x256xi8>
                }
            }
        }
    }
    return
}
