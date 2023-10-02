
MLIR_BIN=/home/arnoor2/llvm-15/llvm-project/build/bin/


echo "$MLIR_BIN/mlir-opt -convert-linalg-to-affine-loops -split-input-file -canonicalize 1.mlir  > 2.mlir"
$MLIR_BIN/mlir-opt -convert-linalg-to-affine-loops -split-input-file -canonicalize 1.mlir  > 2.mlir


echo "$MLIR_BIN/mlir-opt --affine-super-vectorize="virtual-vector-size=8" 2.mlir > 3.mlir"
$MLIR_BIN/mlir-opt --affine-super-vectorize="virtual-vector-size=8" 2.mlir > 3.mlir


echo "$MLIR_BIN/mlir-opt -affine-loop-unroll="unroll-factor=4" 3.mlir > 4.mlir"
$MLIR_BIN/mlir-opt -affine-loop-unroll="unroll-factor=4" 3.mlir > 4.mlir



echo "$MLIR_BIN/mlir-opt  --hydride-arith 4.mlir > 5.mlir"
$MLIR_BIN/mlir-opt  --hydride-arith 4.mlir > 5.mlir




echo "$MLIR_BIN/mlir-opt --lower-affine --convert-scf-to-cf  --convert-func-to-llvm  --convert-vector-to-llvm --convert-arith-to-llvm  --convert-func-to-llvm  5.mlir > 6.mlir"
$MLIR_BIN/mlir-opt --lower-affine --convert-scf-to-cf  --convert-func-to-llvm  --convert-vector-to-llvm --convert-arith-to-llvm  --convert-func-to-llvm --convert-memref-to-llvm -reconcile-unrealized-casts  5.mlir > 6.mlir


echo "$MLIR_BIN/mlir-translate --mlir-to-llvmir 6.mlir > 7.ll"
$MLIR_BIN/mlir-translate --mlir-to-llvmir 6.mlir > 7.ll

#clear && mlir-opt -convert-linalg-to-affine-loops -split-input-file -canonicalize extra/conv-vec.mlir > extra/conv-vec-affine.mlir
