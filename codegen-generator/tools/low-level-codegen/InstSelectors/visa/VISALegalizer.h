//============================== Hydride File =================================
//
// Part of the Hydride Compiler Infrastructure.
// <Placeholder for license information>
//
//=============================================================================
//
// Do NOT modify this file. It is automatically generated.
//
//=============================================================================

#include "Legalizer.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Scalar.h"
#include <string>
using namespace boost::multiprecision::literals;
namespace llvm {

class VISALegalizationPass : public FunctionPass {
public:
    static char ID;

    VISALegalizationPass()
        : FunctionPass(ID) {
    }

    bool runOnFunction(Function &F) override;

    void getAnalysisUsage(AnalysisUsage &AU) const override {
    }
};

}  // namespace llvm

using namespace llvm;

class VISALegalizer : public Legalizer {
public:
    bool legalize(Instruction *I) override;

#include "VISALegalizer.h.inc"

    static std::vector<Value *> getPermutedArgVISA(CallInst *OriginalInst,
                                                   std::vector<int> &Permutation,
                                                   Instruction *InsertBefore);

    void customPermute(const std::string &type, std::vector<Value *> &Args,
                       Instruction *InsertBefore);
};
