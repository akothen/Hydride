//===----------------------------------------------------------------------===//
//
// Common class for Legalizer for diffeerent targets.
//
//===----------------------------------------------------------------------===//


#ifndef HYDRIDE_LEGALIZER_H
#define HYDRIDE_LEGALIZER_H


#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Verifier.h"


namespace llvm {

class Legalizer {
public:
  // Map the target-agnostic intrinsics with target-specific ones
  DenseMap<Value *, Value *> InstToInstMap;

  // Track instructions to be removed
  SmallPtrSet<Instruction *, 16> ToBeRemoved;

  // Legalize the given instruction
  virtual bool legalize(Instruction *) = 0;

  // Legalize the given function
  virtual bool legalize(Function &F) {
    SmallVector<Instruction *, 16> TargetAgnosticInstructions;
    ReversePostOrderTraversal<Function *> RPOT(&F);
    for(auto *BB : RPOT) {
      for(Instruction &I : *BB) {
        auto *CI = dyn_cast<CallInst>(&I);
        if(CI != nullptr)
          TargetAgnosticInstructions.push_back(CI);
      }
    }

    errs() << "BEFORE LEGALIZATION:\n";
    errs() << F << "\n";

    // Legalize the instructions
    bool Changed = false;
    for (auto *I : TargetAgnosticInstructions) {
      Changed |= legalize(I);
    }

    errs() << "AFTER LEGALIZATION FUNCTION:\n";
    errs() << F << "\n";

    // Remove all the target-agnostic intrinsics / function calls
    for(auto *I : ToBeRemoved) {
      I->replaceAllUsesWith(UndefValue::get(I->getType()));
      I->eraseFromParent();
    }

    bool BrokenDebugInfo = true;
    assert(verifyModule(BrokenDebugInfo, *(F.getParent()), errs()));

    return Changed;
  }

  Value *getBitvectorOfRequiredType(Value *Bitvector, Type *RequiredType, Instruction *InsertBefore) {
    errs() << "getBitvectorOfRequiredType\n";
    if (Bitvector->getType() != RequiredType) {
      if (InstToInstMap[Bitvector] == nullptr) {
        InstToInstMap[Bitvector] = new BitCastInst(Bitvector, RequiredType, "", InsertBefore);
        errs() << "InstToInstMap[Bitvector]:" << *InstToInstMap[Bitvector] << "\n";
        return InstToInstMap[Bitvector];
      }
      errs() << "--InstToInstMap[Bitvector]:" << *InstToInstMap[Bitvector] << "\n";
      return InstToInstMap[Bitvector];
    }
    errs() << "Bitvector:" << *Bitvector << "\n";
    return Bitvector;
  }

  std::vector<Value *> getArgsAfterPermutation(CallInst *OriginalInst,
                            Function *InstFunction, std::vector<int> &Permutation, 
                            Instruction *InsertBefore) {
    // Get bitvector list
    std::vector<Value *> BitvectorList;
    for (unsigned I = 0, E = OriginalInst->getNumOperands(); I != E; ++I)
      BitvectorList.push_back(OriginalInst->getOperand(I));
    // Get the required types
    std::vector<Type *> RequiredTypes;
    for (auto &Arg : InstFunction->args())
      RequiredTypes.push_back(Arg.getType());
    // Some sanity checks
    assert(BitvectorList.size() == RequiredTypes.size() 
          && "Error: BitvectorList.size() != RequiredTypes.size()");
    assert(BitvectorList.size() == Permutation.size() 
          && "Error: BitvectorList.size() != RequiredTypes.size()");
    // Generate some new args
    std::vector<Value *> NewArgs;
    NewArgs.reserve(RequiredTypes.size());
    for (unsigned Idx = 0; Idx < BitvectorList.size(); Idx++) {
      if(Permutation[Idx] != -1) {
        auto PermIdx = Permutation[Idx];
        NewArgs[PermIdx] = getBitvectorOfRequiredType(BitvectorList[Idx], 
                                      RequiredTypes[PermIdx], InsertBefore);
      }
    }
    return NewArgs;
  }

};

}   // end of namespace llvm

#endif  // HYDRIDE_LEGALIZER_H

