
MLIR_BIN=/home/baronia3/llvm-project/build/bin

echo "$MLIR_BIN/mlir-opt -convert-linalg-to-affine-loops -split-input-file -canonicalize torchdynamo_resnet_linalg.mlir  > torchdynamo_resnet_affine.mlir"
$MLIR_BIN/mlir-opt -convert-linalg-to-affine-loops -split-input-file -canonicalize torchdynamo_resnet_linalg_on_tensors_1.mlir  > torchdynamo_resnet_linalg_torchdynamo_resnet_linalg_2.mlir

echo "$MLIR_BIN/mlir-opt --affine-super-vectorize="virtual-vector-size=8" torchdynamo_resnet_linalg_2.mlir > torchdynamo_resnet_affine_3.mlir"
$MLIR_BIN/mlir-opt --affine-super-vectorize="virtual-vector-size=8" torchdynamo_resnet_linalg_2.mlir > torchdynamo_resnet_affine_3.mlir


echo "$MLIR_BIN/mlir-opt -affine-loop-unroll="unroll-factor=4" torchdynamo_resnet_affine_3.mlir > 4.mlir"
$MLIR_BIN/mlir-opt -affine-loop-unroll="unroll-factor=4" torchdynamo_resnet_affine_3.mlir > 4.mlir

echo "$MLIR_BIN/mlir-opt --hydride-arith="synth_target=aie" 4.mlir > 5.mlir"
$MLIR_BIN/mlir-opt  --hydride-arith="synth_target=aie" 4.mlir > 5.mlir

echo "$MLIR_BIN/mlir-opt --lower-affine --convert-scf-to-cf  --convert-func-to-llvm  --convert-vector-to-llvm --convert-arith-to-llvm  --convert-func-to-llvm  5.mlir > 6.mlir"
$MLIR_BIN/mlir-opt --lower-affine --convert-scf-to-cf  --convert-func-to-llvm  --convert-vector-to-llvm --convert-arith-to-llvm  --convert-func-to-llvm --convert-memref-to-llvm -reconcile-unrealized-casts  5.mlir > 6.mlir

echo "$MLIR_BIN/mlir-translate --mlir-to-llvmir 6.mlir > 7.ll"
$MLIR_BIN/mlir-translate --mlir-to-llvmir 6.mlir > 7.ll

# clear && mlir-opt -convert-linalg-to-affine-loops -split-input-file -canonicalize extra/conv-vec.mlir > extra/conv-vec-affine.mlir
