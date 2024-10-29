aie-opt --affine-loop-unroll="unroll-full unroll-full-threshold=3" --canonicalize -affine-super-vectorize="virtual-vector-size=8" -unaligned-loads-check=false -split-input-file conv2d_i32.mlir > conv2d_unrolled.mlir


--lower-affine