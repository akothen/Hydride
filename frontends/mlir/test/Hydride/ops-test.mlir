func.func @test_shrui(%arg0 : i32, %arg1 : i32) -> i32 {
  %0 = arith.shrui %arg0, %arg1 : i32
  return %0 : i32
}