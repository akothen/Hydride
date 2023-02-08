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
#include "llvm/IR/IntrinsicsHexagon.h"
#include "Legalizer.h"
      namespace llvm {
      class HexLegalizationPass : public FunctionPass {
      public:
          static char ID;
          HexLegalizationPass() : FunctionPass(ID) {}
          bool runOnFunction(Function &F);
          void getAnalysisUsage(AnalysisUsage &AU) const {}
      };
      }
    
    using namespace llvm;
    class HexLegalizer : public Legalizer {
    public:
    
    virtual bool legalize(Instruction *I) {
      auto *CI = dyn_cast<CallInst>(I);
      if (CI == nullptr)
        return false;
      if (InstToInstMap[CI] != nullptr)
        return false;
      
      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaslh_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 32)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaslh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaslh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyowh_rnd_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 14)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 64)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 16)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyowh_rnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyowh_rnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 14)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 64)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 16)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyowh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyowh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_pred_xor_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_pred_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_pred_xor_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vxor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vxor_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vabsw_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsw_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandnqrt_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 4)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandnqrt_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandnqrt_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdmpyhvsat_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhvsat_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhvsat_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhvsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhvsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyiewuh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 64)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiewuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiewuh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdmpyhsuisat_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhsuisat_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhsuisat_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhisat_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhisat_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhisat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhisat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhsuisat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhsuisat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_veqw_xor_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 15)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqw_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqw_xor_128B" << "\n"; 
            std::vector<int> Permutation = {2,-1,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 2816)
       && isAMatch(CI, 3, 2833)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqh_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqh_xor_128B" << "\n"; 
            std::vector<int> Permutation = {2,-1,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 176)
       && isAMatch(CI, 3, 177)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqb_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqb_xor_128B" << "\n"; 
            std::vector<int> Permutation = {2,-1,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_hi_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_hi_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_hi_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vassign_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vassign_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyuh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdealh_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 2)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdealh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdealh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 16)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 16)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdealb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdealb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrhubrndsat_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 16)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 0)
       && isAMatch(CI, 19, -1)
       && isAMatch(CI, 20, 1)
       && isAMatch(CI, 21, 32)
       && isAMatch(CI, 22, -1)
       && isAMatch(CI, 23, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrhubrndsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrhubrndsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 16)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 1)
       && isAMatch(CI, 19, -1)
       && isAMatch(CI, 20, 1)
       && isAMatch(CI, 21, 32)
       && isAMatch(CI, 22, -1)
       && isAMatch(CI, 23, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrhbrndsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrhbrndsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 16)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 0)
       && isAMatch(CI, 19, -1)
       && isAMatch(CI, 20, 0)
       && isAMatch(CI, 21, 32)
       && isAMatch(CI, 22, -1)
       && isAMatch(CI, 23, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasruhubrndsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasruhubrndsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vsubw_dv_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubw_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubw_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubb_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubb_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsububsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsububsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubh_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubh_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubuwsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubuwsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubuhsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubuhsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubwsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubwsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubhsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubhsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubbsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubbsat_dv_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyiowh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 64)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiowh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiowh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vpackob_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 64)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 2)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackob_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackob_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 2)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackoh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackoh_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vgtuh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 2816)
       && isAMatch(CI, 1, 2833)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2816)
       && isAMatch(CI, 1, 2833)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgth_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgth_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 176)
       && isAMatch(CI, 1, 177)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 1, 15)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 4)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 1, 15)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 4)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 176)
       && isAMatch(CI, 1, 177)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtub_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vadduhsat_dv_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vadduhsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vadduhsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddb_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddb_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddwsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddwsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddbsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddbsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddh_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddh_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddhsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddhsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddubsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddubsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vadduwsat_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vadduwsat_dv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddw_dv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddw_dv_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyuhe_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyuhe_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyuhe_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_pred_and_n_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_pred_and_n_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_pred_and_n_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaddhnq_dsl")) { 
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddhnq);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddhnq" << "\n"; 
            std::vector<int> Permutation = {1,0,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddhq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddhq_128B" << "\n"; 
            std::vector<int> Permutation = {1,0,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddbnq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddbnq_128B" << "\n"; 
            std::vector<int> Permutation = {1,0,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddwnq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddwnq_128B" << "\n"; 
            std::vector<int> Permutation = {1,0,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddwq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddwq_128B" << "\n"; 
            std::vector<int> Permutation = {1,0,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddbq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddbq_128B" << "\n"; 
            std::vector<int> Permutation = {1,0,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdmpyhsat_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhsat_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhsat_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhsusat_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhsusat_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhsusat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhsusat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpybusv_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpybusv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpybusv_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyhv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyhv_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpybv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpybv_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyhus_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyhus_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyuhv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyuhv_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyubv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyubv_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_veqw_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 4)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 3, 176)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2833)
       && isAMatch(CI, 3, 2816)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyhv_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyhv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyhv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyuhv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyuhv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyhus_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyhus_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 128)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpybv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpybv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 128)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpybusv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpybusv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 128)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyubv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyubv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyieoh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 16)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyieoh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyieoh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdmpyhb_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 2)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhb_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhb_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 2)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpyhb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpyhb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaddh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddh_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddubsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddubsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddw_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddwsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddwsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddb_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddububb_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddububb_sat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddhsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vadduwsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vadduwsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vadduhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vadduhsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddbsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddbsat_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmaxh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmaxh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmaxh_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmaxub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmaxub_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmaxw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmaxw_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmaxb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmaxb_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmaxuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmaxuh_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_lo_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_lo_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_lo_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpabus_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 1024)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, 2)
       && isAMatch(CI, 18, 2)
       && isAMatch(CI, 19, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpabus_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpabus_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 1024)
       && isAMatch(CI, 15, 0)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, 2)
       && isAMatch(CI, 18, 2)
       && isAMatch(CI, 19, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpabuu_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpabuu_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_veqw_or_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqw_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqw_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,2,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2833)
       && isAMatch(CI, 3, 2816)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqh_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqh_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,2,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 3, 176)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqb_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqb_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,2,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrwh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrwh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrwh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_lvsplath_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_lvsplath_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_lvsplath_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_lvsplatb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_lvsplatb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpabusv_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 1024)
       && isAMatch(CI, 13, 0)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 2)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpabusv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpabusv_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 1024)
       && isAMatch(CI, 13, 0)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 2)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpabuuv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpabuuv_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vunpackh_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vunpackh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vunpackh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vunpackub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vunpackub_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vunpackuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vunpackuh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vunpackb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vunpackb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyuhe_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyuhe_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyuhe_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_pred_or_n_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_pred_or_n_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_pred_or_n_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyiwb_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 64)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiwb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiwb_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 64)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiwub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiwub_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 64)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiwh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiwh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyihb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyihb_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdmpybus_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 16)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 8)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpybus_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpybus_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 16)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 8)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdmpybus_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdmpybus_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpabuu_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 4)
       && isAMatch(CI, 15, 1024)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, 0)
       && isAMatch(CI, 18, 2)
       && isAMatch(CI, 19, 2)
       && isAMatch(CI, 20, 128)
       && isAMatch(CI, 21, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpabuu_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpabuu_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 4)
       && isAMatch(CI, 15, 1024)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 0)
       && isAMatch(CI, 18, 2)
       && isAMatch(CI, 19, 2)
       && isAMatch(CI, 20, 128)
       && isAMatch(CI, 21, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpabus_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpabus_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyewuh_64_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 16)
       && isAMatch(CI, 1, 16)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 512)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 64)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 32)
       && isAMatch(CI, 18, 1024)
       && isAMatch(CI, 19, 1)
       && isAMatch(CI, 20, 64)
       && isAMatch(CI, 21, 1)
       && isAMatch(CI, 22, 2)
       && isAMatch(CI, 23, 32)
       && isAMatch(CI, 24, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyewuh_64_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyewuh_64_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vgtub_and_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 1, 176)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtub_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtub_and_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2833)
       && isAMatch(CI, 1, 2816)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgth_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgth_and_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuw_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuw_and_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2833)
       && isAMatch(CI, 1, 2816)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuh_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuh_and_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtw_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtw_and_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 1, 176)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtb_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtb_and_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vsubhsat_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubhsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubh_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubb_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubw_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubwsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubwsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubuhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubuhsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubbsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubbsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsububsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsububsat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubububb_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubububb_sat_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubuwsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubuwsat_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vavgwrnd_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 2)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgwrnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgwrnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 2)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgbrnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgbrnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 2)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavguwrnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavguwrnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 2)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavguhrnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavguhrnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 2)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgubrnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgubrnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 2)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavghrnd_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavghrnd_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyub_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 2)
       && isAMatch(CI, 14, 8)
       && isAMatch(CI, 15, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyub_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 16)
       && isAMatch(CI, 13, 2)
       && isAMatch(CI, 14, 8)
       && isAMatch(CI, 15, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpybus_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpybus_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vnavgub_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vnavgub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vnavgub_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vnavgb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vnavgb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vnavgh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vnavgh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vnavgw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vnavgw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandvnqv_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandvnqv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandvnqv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaddhw_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddhw_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddhw_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vadduhw_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vadduhw_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, -1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 128)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddubh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddubh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyiewuh_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 64)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 64)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiewuh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiewuh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 64)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 64)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiewh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiewh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vrounduhub_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 128)
       && isAMatch(CI, 1, 8)
       && isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 8)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrounduhub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrounduhub_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 128)
       && isAMatch(CI, 1, 8)
       && isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 8)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vroundhb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vroundhb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 128)
       && isAMatch(CI, 1, 8)
       && isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 8)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vroundhub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vroundhub_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_lvsplatw_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_lvsplatw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_lvsplatw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vlsrw_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 31)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vlsrw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vlsrw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrw_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 31)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrw_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrw_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vlsrhv_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vlsrhv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vlsrhv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vlsrwv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vlsrwv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandqrt_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 2, 0)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandqrt_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandqrt_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vsubhw_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubhw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubhw_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsububh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsububh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubuhw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubuhw_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandvqv_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 2, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandvqv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandvqv_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaddcarrysat_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddcarrysat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddcarrysat_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vswap_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 128)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 8)
       && isAMatch(CI, 15, 1024)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vswap_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vswap_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,2,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vroundwuh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 32768)
       && isAMatch(CI, 1, 16)
       && isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vroundwuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vroundwuh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 32768)
       && isAMatch(CI, 1, 16)
       && isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vroundwh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vroundwh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 32768)
       && isAMatch(CI, 1, 16)
       && isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 16)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrounduwuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrounduwuh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandvrt_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 1, 177)
       && isAMatch(CI, 3, 176)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 128)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandvrt_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandvrt_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,2,-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrhubsat_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 0)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrhubsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrhubsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrhbsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrhbsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 0)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasruhubsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasruhubsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_pred_and_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_pred_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_pred_and_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vand_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vand_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyih_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyih_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyih_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vpackhub_sat_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 8)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackhub_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackhub_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 32)
       && isAMatch(CI, 14, 0)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 16)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackwuh_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackwuh_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 8)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackhb_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackhb_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 32)
       && isAMatch(CI, 14, 1)
       && isAMatch(CI, 15, 32)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 16)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackwh_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackwh_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vshuffh_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 2)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshuffh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshuffh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 16)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 16)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshuffb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshuffb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpybus_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 128)
       && isAMatch(CI, 15, 2)
       && isAMatch(CI, 16, 8)
       && isAMatch(CI, 17, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpybus_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpybus_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 4)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 128)
       && isAMatch(CI, 15, 2)
       && isAMatch(CI, 16, 8)
       && isAMatch(CI, 17, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyub_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyub_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandqrt_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 177)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1024)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 4)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 8)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandqrt_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandqrt_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,1,2,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vsubbnq_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubbnq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubbnq_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubwnq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubwnq_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubhq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubhq_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubwq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubwq_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubbq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubbq_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsubhnq_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsubhnq_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,-1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vzh_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 2048)
       && isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 64)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vzh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vzh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 2048)
       && isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 16)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 2048)
       && isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 64)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsh_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 2048)
       && isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 16)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vzb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vzb_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyh_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyuh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyuh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 64)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyhsat_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyhsat_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vminh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vminh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vminh_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vminb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vminb_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vminw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vminw_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vminub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vminub_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vminuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vminuh_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpauhb_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 1024)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 2)
       && isAMatch(CI, 19, 16)
       && isAMatch(CI, 20, 2)
       && isAMatch(CI, 21, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpauhb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpauhb_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 4)
       && isAMatch(CI, 14, 16)
       && isAMatch(CI, 15, 1024)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 2)
       && isAMatch(CI, 19, 16)
       && isAMatch(CI, 20, 2)
       && isAMatch(CI, 21, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpahb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpahb_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vor_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vor_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
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
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_pred_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_pred_or_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vshufoh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 2)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshufoh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshufoh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 2)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshuffob_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshuffob_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vdealb4w_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 32)
       && isAMatch(CI, 14, 4)
       && isAMatch(CI, 15, 8)
       && isAMatch(CI, 16, 4)
       && isAMatch(CI, 17, 4)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vdealb4w_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vdealb4w_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vnot_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vnot_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vnot_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 128)
       && isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 1)
       && isAMatch(CI, 6, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_pred_not_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_pred_not_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vabsdiffh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsdiffh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsdiffh_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsdiffub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsdiffub_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsdiffw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsdiffw_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsdiffuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsdiffuh_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaddubh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddubh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddubh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaddhw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaddhw_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 2)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vadduhw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vadduhw_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaslhv_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaslhv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaslhv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaslwv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaslwv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyowh_sacc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 14)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, -1)
       && isAMatch(CI, 15, -1)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 64)
       && isAMatch(CI, 18, 1)
       && isAMatch(CI, 19, 64)
       && isAMatch(CI, 20, 1)
       && isAMatch(CI, 21, 16)
       && isAMatch(CI, 22, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyowh_sacc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyowh_sacc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 14)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, -1)
       && isAMatch(CI, 15, -1)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, 64)
       && isAMatch(CI, 18, 1)
       && isAMatch(CI, 19, 64)
       && isAMatch(CI, 20, 1)
       && isAMatch(CI, 21, 16)
       && isAMatch(CI, 22, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyowh_rnd_sacc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyowh_rnd_sacc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandvrt_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 1, 177)
       && isAMatch(CI, 3, 176)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandvrt_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandvrt_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrh_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 32)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrwuhsat_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrwuhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrwuhsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrwhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrwhsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasruwuhsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasruwuhsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaslw_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 31)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaslw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaslw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasruwuhrndsat_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, -1)
       && isAMatch(CI, 19, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasruwuhrndsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasruwuhrndsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 0)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, -1)
       && isAMatch(CI, 19, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrwuhrndsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrwuhrndsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 1)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 512)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, -1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 1)
       && isAMatch(CI, 17, -1)
       && isAMatch(CI, 18, -1)
       && isAMatch(CI, 19, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrwhrndsat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrwhrndsat_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmux_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 177)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmux_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmux_128B" << "\n"; 
            std::vector<int> Permutation = {2,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyih_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyih_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyih_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vcombine_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 1024)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 1024)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vcombine_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vcombine_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vasrhv_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrhv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrhv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vasrwv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vasrwv_128B" << "\n"; 
            std::vector<int> Permutation = {1,-1,0,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vunpackoh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 16)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vunpackoh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vunpackoh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 8)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vunpackob_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vunpackob_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyewuh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 16)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyewuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyewuh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpyiwh_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 64)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 64)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 2)
       && isAMatch(CI, 17, 16)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiwh_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiwh_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 32)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 32)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 4)
       && isAMatch(CI, 17, 8)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyihb_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyihb_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 256)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 64)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 64)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 4)
       && isAMatch(CI, 17, 8)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiwb_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiwb_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 256)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 64)
       && isAMatch(CI, 13, 0)
       && isAMatch(CI, 14, 64)
       && isAMatch(CI, 15, 1)
       && isAMatch(CI, 16, 4)
       && isAMatch(CI, 17, 8)
       && isAMatch(CI, 18, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpyiwub_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpyiwub_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vshuffeb_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshuffeb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshuffeb_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 2)
       && isAMatch(CI, 9, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshufeh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshufeh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vsathub_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsathub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsathub_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsatwh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsatwh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 0)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vsatuwuh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vsatuwuh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vgtw_xor_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtw_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtw_xor_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 1, 176)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtb_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtb_xor_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuw_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuw_xor_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 177)
       && isAMatch(CI, 1, 176)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtub_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtub_xor_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2833)
       && isAMatch(CI, 1, 2816)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgth_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgth_xor_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2833)
       && isAMatch(CI, 1, 2816)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuh_xor_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuh_xor_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vandnqrt_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 128)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 4)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vandnqrt_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vandnqrt_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,2,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vmpahb_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 4)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 1024)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 1)
       && isAMatch(CI, 19, 2)
       && isAMatch(CI, 20, 16)
       && isAMatch(CI, 21, 2)
       && isAMatch(CI, 22, 128)
       && isAMatch(CI, 23, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpahb_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpahb_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, -1)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 1)
       && isAMatch(CI, 14, 4)
       && isAMatch(CI, 15, 16)
       && isAMatch(CI, 16, 1024)
       && isAMatch(CI, 17, 1)
       && isAMatch(CI, 18, 1)
       && isAMatch(CI, 19, 2)
       && isAMatch(CI, 20, 16)
       && isAMatch(CI, 21, 2)
       && isAMatch(CI, 22, 128)
       && isAMatch(CI, 23, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vmpauhb_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vmpauhb_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vinsertwr_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 32)
       && isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vinsertwr_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vinsertwr_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vshufoeh_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshufoeh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshufoeh_128B" << "\n"; 
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
        
          if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 32)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vshufoeb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vshufoeb_128B" << "\n"; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vavgw_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgub_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavgh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavgh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavguh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavguh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vavguw_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vavguw_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vrmpyubv_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpyubv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpyubv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpybusv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpybusv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpybusv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpybusv_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpybv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpybv_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpyubv_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpyubv_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpybv_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpybv_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_veqw_and_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 0)
       && isAMatch(CI, 3, 15)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 32)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqw_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqw_and_128B" << "\n"; 
            std::vector<int> Permutation = {2,1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 176)
       && isAMatch(CI, 3, 177)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 8)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqb_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqb_and_128B" << "\n"; 
            std::vector<int> Permutation = {2,1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 2816)
       && isAMatch(CI, 3, 2833)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 16)
       && isAMatch(CI, 11, 1)
       && isAMatch(CI, 12, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_veqh_and_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_veqh_and_128B" << "\n"; 
            std::vector<int> Permutation = {2,1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vrmpyub_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpyub_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpyub_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpybus_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpybus_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpyub_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpyub_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 32)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vrmpybus_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vrmpybus_acc_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaslh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaslh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaslh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vpackeb_128B_dsl")) { 
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 8)
       && isAMatch(CI, 10, 2)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 8)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackeb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackeb_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 512)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 2)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 2)
       && isAMatch(CI, 13, 16)
       && isAMatch(CI, 14, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vpackeh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vpackeh_128B" << "\n"; 
            std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vlsrh_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 15)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vlsrh_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vlsrh_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 7)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, 0)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vlsrb_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vlsrb_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vaslw_acc_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 31)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, -1)
       && isAMatch(CI, 10, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vaslw_acc_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vaslw_acc_128B" << "\n"; 
            std::vector<int> Permutation = {-1,0,1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vgtb_or_128B_dsl")) { 
        
          if(isAMatch(CI, 0, 176)
       && isAMatch(CI, 1, 177)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtb_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtb_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 1, 15)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtw_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtw_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 176)
       && isAMatch(CI, 1, 177)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 8)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtub_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtub_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2816)
       && isAMatch(CI, 1, 2833)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuh_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuh_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 2816)
       && isAMatch(CI, 1, 2833)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 2)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgth_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgth_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 1, 15)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 0)
       && isAMatch(CI, 8, 128)
       && isAMatch(CI, 9, 4)
       && isAMatch(CI, 10, 0)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 1)
       && isAMatch(CI, 13, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vgtuw_or_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vgtuw_or_128B" << "\n"; 
            std::vector<int> Permutation = {-1,-1,0,1,2,-1,-1,-1,-1,-1,-1,-1,-1,-1}; 
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
    

      if(CI->getCalledFunction()->getName().contains("llvm.hydride.hexagon_V6_vabsw_sat_128B_dsl")) { 
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsw_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsw_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsb_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsb_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1}; 
            std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI); 
            if (Args.size() != 0) {
              auto *NewCallInst = CallInst::Create(InstFunction, Args, "", CI); 
              errs() << "NEW INSTUCTION:" << *NewCallInst << "\n"; 
              InstToInstMap[CI] = NewCallInst; 
              ToBeRemoved.insert(CI); 
              return true; 
            }
          }
        
          if(isAMatch(CI, 1, 1024)
       && isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 1)
       && isAMatch(CI, 7, 0)) { 
            auto *InstFunction = Intrinsic::getDeclaration(I->getModule(), Intrinsic::hexagon_V6_vabsh_sat_128B);
            errs() << "INST FUNCTION NAME: " << "hexagon_V6_vabsh_sat_128B" << "\n"; 
            std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1}; 
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
    
    };
    
    bool HexLegalizationPass::runOnFunction(Function &F) {
      if (F.getName().contains("hydride") == false)
        return false;
      // Initialize the legalizer
      errs() << "LEGALIZATION BEGIN\n";
      Legalizer *L = new HexLegalizer();
      return L->legalize(F);
    }
    
    
    char HexLegalizationPass::ID = 0;
    static RegisterPass<HexLegalizationPass> X("hex-hydride-legalize", 
                                              "Pass to legalize tensor intrinsics");
    
