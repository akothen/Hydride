//===- polygeist_conv2d_i32.mlir -------------------------------*- MLIR -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// (c) Copyright 2024 Advanced Micro Devices, Inc. or its affiliates
//
//===----------------------------------------------------------------------===//
// RUN: aie-opt --affine-loop-unroll="unroll-full unroll-full-threshold=3" --canonicalize -affine-super-vectorize="virtual-vector-size=8 vectorize-reductions" --aie-vectorize | aie-translate --aievec-to-cpp > %t.cpp

module attributes {} {
  func.func @conv2d(%arg0: memref<?x272xi32>, %arg1: memref<?x3xi32>, %arg2: memref<?x256xi32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg3 = 0 to 16 {
      affine.for %arg4 = 0 to 256 {
        %0 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %c0_i32) -> (i32) {
          %1 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %arg6) -> (i32) {
            %2 = affine.load %arg0[%arg3 + %arg5, %arg4 + %arg7] : memref<?x272xi32>
            %3 = affine.load %arg1[%arg5, %arg7] : memref<?x3xi32>
            %4 = arith.muli %2, %3 : i32
            %5 = arith.addi %arg8, %4 : i32
            affine.yield %5 : i32
          }
          affine.yield %1 : i32
        }
        affine.store %0, %arg2[%arg3, %arg4] : memref<?x256xi32>
      }
    }
    return
  }
}