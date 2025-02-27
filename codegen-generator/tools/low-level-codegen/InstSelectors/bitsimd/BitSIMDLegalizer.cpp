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
      class BitSIMDLegalizationPass : public FunctionPass {
      public:
          static char ID;
          BitSIMDLegalizationPass() : FunctionPass(ID) {}
          bool runOnFunction(Function &F);
          void getAnalysisUsage(AnalysisUsage &AU) const {}
      };
      }
    
    using namespace llvm;
    class BitSIMDLegalizer : public Legalizer {
    public:
    
    virtual bool legalize(Instruction *I) {
      auto *CI = dyn_cast<CallInst>(I);
      if (CI == nullptr)
        return false;
      if (InstToInstMap[CI] != nullptr)
        return false;
      
    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimXorScalar_v32768_e16__v32768_e16__v32768_e16_dsl",
"pimXorScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimXorScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"pimOrScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimOrScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimSub_v8192_e16__v8192_e16__v8192_e16_dsl",
"pimSub_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimSub";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"pimMinScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimMinScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimOr_v4096_e32__v4096_e32__v4096_e32_dsl",
"pimOr_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimOr";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimAnd_v32_e32__v32_e32__v32_e32_dsl",
"pimAnd_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimAnd";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl",
"pimDiv_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimDiv";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimMin_v64_e32__v64_e32__v64_e32_dsl",
"pimMin_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimMin";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"pimSubScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimSubScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimMulScalar_v65536_e32__v65536_e32__v65536_e32_dsl",
"pimMulScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimMulScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimMax_v8192_e16__v8192_e16__v8192_e16_dsl",
"pimMax_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimMax";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl",
"pimDiv_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimDiv";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimAndScalar_v256_e32__v256_e32__v256_e32_dsl",
"pimAndScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimAndScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimXor_v8192_e16__v8192_e16__v8192_e16_dsl",
"pimXor_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimXor";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimBroadCast_v65536_e32__v32_e32_dsl",
"pimBroadCast_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimBroadCast";
                std::vector<int> Permutation = {0,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimEQ_v512_e16__v512_e16__v512_e16_dsl",
"pimEQ_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimEQ";
                std::vector<int> Permutation = {-1,1,-1,0,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl",
"pimMaxScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimMaxScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimGT_v16384_e8__v16384_e8__v16384_e8_dsl",
"pimGT_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimGT";
                std::vector<int> Permutation = {-1,-1,1,0,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimAddScalar_v32768_e16__v32768_e16__v32768_e16_dsl",
"pimAddScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimAddScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl",
"pimDiv_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimDiv";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimScaledAdd_v65536_e32__v65536_e32__v65536_e32_dsl",
"pimScaledAdd_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimScaledAdd";
                std::vector<int> Permutation = {0,1,2,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1), CI->getArgOperand(2)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimAdd_v65536_e32__v65536_e32__v65536_e32_dsl",
"pimAdd_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimAdd";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimMul_v65536_e32__v65536_e32__v65536_e32_dsl",
"pimMul_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimMul";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

    {
      std::vector<std::string> InstNames = {"llvm.hydride.pimDivScalar_v32_e16__v32_e16__v32_e16_dsl",
"pimDivScalar_"};
      if(isNameMatch(CI, InstNames) ) {
        
              if(true) {
                std::string base_name = "pimDivScalar";
                std::vector<int> Permutation = {0,1,-1,-1,-1,-1,-1,-1,-1};
                auto *InstFunction = CreateFunctionDecl(base_name, CI);
                //std::vector<Value *> Args = getArgsAfterPermutation(CI, InstFunction, Permutation, CI);
                std::vector<Value *> Args = {CI->getArgOperand(0), CI->getArgOperand(1)} ;

                // Generate any bitserial Allocation for operands
                // If they do not exist
                InsertBitSIMDAllocations(Args, CI);

                std::vector<Value*> Temp;
                Temp.push_back(CI);
                // Generate any bitserial Allocation for result
                InsertBitSIMDAllocations(Temp, CI);

                // Replace vectorized call to call PIM ISA Directly
                InsertBitSIMDCall(InstFunction, Args,CI,  CI);

                ReplaceReturn(CI);

                ToBeRemoved.insert(CI);
                return true;
              }
            
      }
    }
    

      return false;
    }
    
    };
    
    bool BitSIMDLegalizationPass::runOnFunction(Function &F) {
      if (F.getName().contains("hydride") == false)
        return false;
      // Initialize the legalizer
      errs() << "LEGALIZATION BEGIN\n";
      Legalizer *L = new BitSIMDLegalizer();
      return L->legalize(F);
    }
    
    
    char BitSIMDLegalizationPass::ID = 0;
    static RegisterPass<BitSIMDLegalizationPass> X("bitsimd-hydride-legalize",
                                              "Pass to legalize tensor intrinsics");
    