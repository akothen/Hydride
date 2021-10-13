//===------------- Legalizer.h -  Legalize tensor intrinsics -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Legalizer for tensor/vector intrinsics.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_TENSOR_LEGALIZER_H
#define LLVM_TENSOR_LEGALIZER_H

namespace llvm {

class Legalizer {
public:
  // Map the target-agnostic intrinsics with target-specific ones
  DenseMap<Value *, Value *> InstToInstMap;

  // Track instructions to be removed
  SmallPtrSet<Instruction *, 16> ToBeRemoved;

  // Instructions whose legalization is delayed
  SmallVector<Instruction *, 16> ToBeLegalized;

  Legalizer() = default;

  // Legalize the given instruction
  virtual bool legalize(Instruction *) = 0;

  // Legalize the given function
  virtual bool legalize(Function &F) {
    SmallVector<Instruction *, 16> TensorInsts;
    ReversePostOrderTraversal<Function *> RPOT(&F);
    for(auto *BB : RPOT) {
      for(Instruction &I : *BB) {
        TensorInsts.push_back(&I);
      }
    }

    // Legalize the instructions
    bool Changed = false;
    for (auto *I : TensorInsts) {
      Changed |= legalize(I);
    }
    for (auto *I : ToBeLegalized) {
      Changed |= legalize(I);
    }

    errs() << "FUNCTION:\n";
    errs() << F << "\n";

    // Remove the target-agnostic intrinsics
    for(auto *I : ToBeRemoved) {
      I->replaceAllUsesWith(UndefValue::get(I->getType()));
      I->eraseFromParent();
    }

    return Changed;
  }

};

}   // end of namespace llvm

#endif  // LLVM_TENSOR_LEGALIZER_H
