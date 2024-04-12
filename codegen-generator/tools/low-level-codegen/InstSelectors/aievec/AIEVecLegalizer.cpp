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
#include "Legalizer.h"
namespace llvm {

class AIEVecLegalizationPass : public FunctionPass {
public:
    static char ID;

    AIEVecLegalizationPass() : FunctionPass(ID) {}

    bool runOnFunction(Function &F);

    void getAnalysisUsage(AnalysisUsage &AU) const {}
};

}
    
using namespace llvm;

class AIEVecLegalizer : public Legalizer {
public:

virtual bool legalize(Instruction *I) {
  auto *CI = dyn_cast<CallInst>(I);
  if (CI == nullptr) {
    return false;
  }
  if (InstToInstMap[CI] != nullptr) {
    return false;
  }
  
    {
      std::vector<std::string> InstNames = {"llvm.hydride.v16int32_add16_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            { 
              auto *InstFunction = I->getModule()->getFunction("v16int32_add16_wrapper"); 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }
            } 
           
      } 
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.v8int32_add8_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            { 
              auto *InstFunction = I->getModule()->getFunction("v8int32_add8_wrapper"); 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }
            } 
           
      } 
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.v16int32_sub16_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            { 
              auto *InstFunction = I->getModule()->getFunction("v16int32_sub16_wrapper"); 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }
            } 
           
      } 
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.v8acc80_mul32_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            { 
              auto *InstFunction = I->getModule()->getFunction("v8acc80_mul32_wrapper"); 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }
            } 
           
      } 
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.srs_8_80_to_8_32_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            { 
              auto *InstFunction = I->getModule()->getFunction("srs_8_80_to_8_32_wrapper"); 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }
            } 
           
      } 
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.ups_8_32_to_8_80_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            { 
              auto *InstFunction = I->getModule()->getFunction("ups_8_32_to_8_80_wrapper"); 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true;
              }
            } 
           
      } 
    }
    
}
    

};


bool AIEVecLegalizationPass::runOnFunction(Function &F) {
  if (F.getName().contains("hydride") == false) {
    return false;
  }
  // Initialize the legalizer
  errs() << "LEGALIZATION BEGIN\n";
  Legalizer *L = new AIEVecLegalizer();
  return L->legalize(F);
}
    
    
char AIEVecLegalizationPass::ID = 0;
static RegisterPass<AIEVecLegalizationPass> X("aievec-hydride-legalize", 
                                          "Pass to legalize tensor intrinsics");
    