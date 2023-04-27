func.func @contraction_matmul(%A: memref<1584x1584xi32>, %B: memref<1584x1584xi32>, %C: memref<1584x1584xi32>) {
  linalg.matmul ins(%A, %B: memref<1584x1584xi32>, memref<1584x1584xi32>)
            outs(%C: memref<1584x1584xi32>)
  return
}