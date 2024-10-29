module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @conv2d(%arg0: memref<?x288xi16>, %arg1: memref<?xi16>, %arg2: memref<?x256xi16>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %c10_i32 = arith.constant 10 : i32
    %c0 = arith.constant 0 : index
    %0 = aievec.upd %arg1[%c0] {index = 0 : i8, offset = 0 : i32} : memref<?xi16>, vector<16xi16>
    %1 = aievec.concat %0, %0 : vector<16xi16>, vector<32xi16>
    %c0_0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0_0 to %c16 step %c1 {
      %c0_1 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %c16_2 = arith.constant 16 : index
      scf.for %arg4 = %c0_1 to %c256 step %c16_2 {
        %2 = aievec.upd %arg0[%arg3, %arg4] {index = 0 : i8, offset = 0 : i32} : memref<?x288xi16>, vector<32xi16>
        %3 = aievec.mul_conv %2, %1 {M = 16 : i32, N = 4 : i32} : vector<32xi16>, vector<32xi16>, vector<16xi64>
        %4 = aievec.srs %3, %c10_i32 : vector<16xi64>, i32, vector<16xi16>
        vector.transfer_write %4, %arg2[%arg3, %arg4] : vector<16xi16>, memref<?x256xi16>
      }
    }
    return
  }
}

