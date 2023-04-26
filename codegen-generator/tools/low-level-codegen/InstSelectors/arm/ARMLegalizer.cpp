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
using namespace boost::multiprecision::literals;
namespace llvm {

class ARMLegalizationPass : public FunctionPass {
public:
    static char ID;

    ARMLegalizationPass() : FunctionPass(ID) {}

    bool runOnFunction(Function &F);

    void getAnalysisUsage(AnalysisUsage &AU) const {}
};

}
    
using namespace llvm;

class ARMLegalizer : public Legalizer {
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
      std::vector<std::string> InstNames = {"llvm.hydride.vpmin_u16_dsl",
"llvm.hydride.vpminq_u16_dsl",
"llvm.hydride.vpmin_s8_dsl",
"llvm.hydride.vpminq_u8_dsl",
"llvm.hydride.vpminq_u32_dsl",
"llvm.hydride.vpminq_s16_dsl",
"llvm.hydride.vpminq_s32_dsl",
"llvm.hydride.vpmin_u32_dsl",
"llvm.hydride.vpminq_s8_dsl",
"llvm.hydride.vpmin_s16_dsl",
"llvm.hydride.vpmin_u8_dsl",
"llvm.hydride.vpmin_s32_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmin_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmin_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpminq_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpminq_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmin_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmin_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpminq_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpminq_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpminq_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpminq_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpminq_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpminq_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpminq_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpminq_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmin_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmin_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpminq_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpminq_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmin_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmin_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmin_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmin_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmin_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmin_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
      std::vector<std::string> InstNames = {"llvm.hydride.vpmaxq_u16_dsl",
"llvm.hydride.vpmax_u32_dsl",
"llvm.hydride.vpmax_s16_dsl",
"llvm.hydride.vpmaxq_u32_dsl",
"llvm.hydride.vpmax_s8_dsl",
"llvm.hydride.vpmaxq_u8_dsl",
"llvm.hydride.vpmaxq_s32_dsl",
"llvm.hydride.vpmax_u16_dsl",
"llvm.hydride.vpmaxq_s8_dsl",
"llvm.hydride.vpmax_u8_dsl",
"llvm.hydride.vpmaxq_s16_dsl",
"llvm.hydride.vpmax_s32_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmaxq_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmaxq_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmax_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmax_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmax_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmax_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmaxq_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmaxq_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmax_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmax_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmaxq_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmaxq_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmaxq_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmaxq_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmax_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmax_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmaxq_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmaxq_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmax_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmax_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmaxq_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmaxq_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 2)) {
              auto *InstFunction = I->getModule()->getFunction("vpmax_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vpmax_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
      std::vector<std::string> InstNames = {"llvm.hydride.vmaxq_u16_dsl",
"llvm.hydride.vmaxq_s16_dsl",
"llvm.hydride.vmax_u32_dsl",
"llvm.hydride.vmax_s16_dsl",
"llvm.hydride.vmax_u16_dsl",
"llvm.hydride.vmax_u8_dsl",
"llvm.hydride.vmaxq_u8_dsl",
"llvm.hydride.vmaxq_s8_dsl",
"llvm.hydride.vmaxq_u32_dsl",
"llvm.hydride.vmaxq_s32_dsl",
"llvm.hydride.vmax_s32_dsl",
"llvm.hydride.vmax_s8_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmaxq_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmaxq_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmaxq_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmaxq_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmax_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmax_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmax_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmax_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmax_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmax_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmax_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmax_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmaxq_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmaxq_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmaxq_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmaxq_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmaxq_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmaxq_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmaxq_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmaxq_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmax_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmax_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmax_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmax_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
      std::vector<std::string> InstNames = {"llvm.hydride.vminq_s8_dsl",
"llvm.hydride.vmin_s8_dsl",
"llvm.hydride.vmin_u16_dsl",
"llvm.hydride.vmin_s32_dsl",
"llvm.hydride.vminq_u32_dsl",
"llvm.hydride.vminq_u16_dsl",
"llvm.hydride.vmin_u32_dsl",
"llvm.hydride.vmin_s16_dsl",
"llvm.hydride.vminq_s32_dsl",
"llvm.hydride.vmin_u8_dsl",
"llvm.hydride.vminq_s16_dsl",
"llvm.hydride.vminq_u8_dsl"};
      if(isNameMatch(CI, InstNames)) { 
        
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vminq_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vminq_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmin_s8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmin_s8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmin_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmin_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmin_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmin_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vminq_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vminq_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vminq_u16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vminq_u16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmin_u32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmin_u32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vmin_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmin_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vminq_s32_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vminq_s32_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vmin_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vmin_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)) {
              auto *InstFunction = I->getModule()->getFunction("vminq_s16_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vminq_s16_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
              std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
              if (Args.size() != 0) {
                auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
                errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
                InstToInstMap[CI] = NewCallInst; 
                ToBeRemoved.insert(CI); 
                return true; 
              }
            } 
          
            if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) {
              auto *InstFunction = I->getModule()->getFunction("vminq_u8_wrapper"); 
              errs() << "INST FUNCTION NAME: " << "vminq_u8_wrapper" << "\n"; 
              std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    
  return false;
}
    

};


bool ARMLegalizationPass::runOnFunction(Function &F) {
  if (F.getName().contains("hydride") == false) {
    return false;
  }
  // Initialize the legalizer
  errs() << "LEGALIZATION BEGIN\n";
  Legalizer *L = new ARMLegalizer();
  return L->legalize(F);
}
    
    
char ARMLegalizationPass::ID = 0;
static RegisterPass<ARMLegalizationPass> X("arm-hydride-legalize", 
                                          "Pass to legalize tensor intrinsics");
    