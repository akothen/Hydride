//===----------------------------------------------------------------------===//
//
// This file implements a very simple version of instruction combine pass
// for LLVM. It only combines instructions that are emitted by Hydride.
// So this pass does not handle loads, stores, phis, GEPs, etc.
//
//===----------------------------------------------------------------------===//


#include "llvm/IR/Function.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Type.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Scalar.h"

#include "HydrideInstSemantics.h"


using namespace llvm;

#define DEBUG_TYPE "hydride-llvm-instcombine"

static cl::opt<unsigned int> InstCombineWindowSize(
    "instcombine-window-size", cl::init(2), cl::Hidden,
    cl::desc("Enables users to set the size of sliding window
            for instruction combining pass."));


namespace {

class HydrideLLVMInstCombinePass : public FunctionPass {
public:
    static char ID;

    HydrideLLVMInstSimplifyPass() : FunctionPass(ID) {}

    bool runOnFunction(Function &F);

    void getAnalysisUsage(AnalysisUsage &AU) const {}
};

}  // end anonymous namespace


template<typename T>
static bool Combine(T &InstWindow) {
  std::string Semantics = "";
  for (auto *I : InstWindow) {
    // Generate rosette semantics for this instruction
    Semantics += GetSemanticsFor(CI);
  }

  // Invoke Hydride's synthesis-based instruction combiner.
  // First we will generate a racket file with semantics of
  // this instruction and 

  return ;
}

bool HydrideLLVMInstCombinePass::runOnFunction(Function &F) {
  // Collect instructions in a worklist
  SmallVector<Instruction *, 16> Worklist;
  ReversePostOrderTraversal<Function *> RPOT(&F);
  for(auto *BB : RPOT) {
    for(Instruction &I : *BB) {
      auto *CI = dyn_cast<CallInst>(&I);
      if(CI != nullptr) {
        Worklist.push_back(CI);
      }
    }
  }

  // Combine the instructions in the worklist within the 
  // scope of a sliding window.
  SmallPtrSet<Instruction *, 16> ToBeRemoved;
  bool Changed = false;
  unsigned int Index = 0;
  while(Index < Worklist.size()) {
    auto Start = myVec.begin() + Index;
    auto End = myVec.begin() + InstCombineWindowSize - 1;
    SmallVector<Instruction *, 16> InstCombineList (Start, End);
    bool Combined = Combine(InstCombineList);
    Changed |= Combined;
    if (Combined) {
      // The instructions in this
          ToBeRemoved.push_back(CI);
      Index += InstCombineWindowSize;
    } else {
      Index++;
    }
  }

  // Remove the dead instructions
  for(auto *I : ToBeRemoved)
    I->eraseFromParent();
  
  return Changed;
}


char HydrideLLVMInstCombinePass::ID = 0;
static RegisterPass<HydrideLLVMInstCombinePass> X("hydride-llvm-instcombine", 
          "Pass to combine target-agnostic instructions generated by Hydride.");
