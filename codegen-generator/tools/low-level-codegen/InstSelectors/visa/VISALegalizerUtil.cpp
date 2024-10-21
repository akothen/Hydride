#include "VISALegalizer.h"
bool VISALegalizationPass::runOnFunction(Function &F) {
  if (F.getName().contains("hydride") == false) {
    return false;
  }
  // Initialize the legalizer
  errs() << "LEGALIZATION BEGIN\n";
  Legalizer *L = new VISALegalizer();
  return L->legalize(F);
}

std::vector<Value *> VISALegalizer::getPermutedArgVISA(CallInst *OriginalInst,
                                                       std::vector<int> &Permutation,
                                                       Instruction *InsertBefore) {
    std::vector<Value *> NewArgs;
    for (auto idx : Permutation) {
        if (idx != -1) {
            NewArgs.push_back(nullptr);
        }
    }
    for (unsigned Idx = 0; Idx < Permutation.size(); Idx++) {
        if (Permutation[Idx] != -1) {
            auto PermIdx = Permutation[Idx];
            assert(PermIdx < NewArgs.size() && "Invalid permutation index");
            NewArgs[PermIdx] = OriginalInst->getArgOperand(Idx);
        }
    }
    return NewArgs;
}

void VISALegalizer::customPermute(const std::string &type, std::vector<Value *> &Args,
                                                       Instruction *InsertBefore) {
    if (type == "VDP4A_1_UD_UD_UD_UD") {
        // DP4A in IGC require input be 16xi32 instead of 64xi8,
        // just populate the first argument to the other two
        Args[1] = new BitCastInst(Args[1], Args[0]->getType(), "", InsertBefore);
        Args[2] = new BitCastInst(Args[2], Args[0]->getType(), "", InsertBefore);
    }
}

char VISALegalizationPass::ID = 0;
static RegisterPass<VISALegalizationPass> X("visa-hydride-legalize", 
                                          "Pass to legalize tensor intrinsics");