module {
  llvm.func @hydride.node.test_addi_vector.0(vector<8xi64>, vector<8xi64>) -> vector<8xi64>
  func.func @test_addi_vector(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> vector<8xi64> {
    %0 = arith.addi %arg0, %arg1 : vector<8xi64>
    %1 = llvm.call @hydride.node.test_addi_vector.0(%arg0, %arg1) : (vector<8xi64>, vector<8xi64>) -> vector<8xi64>
    return %1 : vector<8xi64>
  }
}

