//===----------------------------------------------------------------------===//
//
// Common class for Legalizer for diffeerent targets.
//
//===----------------------------------------------------------------------===//


#ifndef HYDRIDE_LEGALIZER_H
#define HYDRIDE_LEGALIZER_H


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
        auto *CI = dyn_cast<CallInst>(&I)
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

    return Changed;
  }

};

}   // end of namespace llvm

#endif  // HYDRIDE_LEGALIZER_H

