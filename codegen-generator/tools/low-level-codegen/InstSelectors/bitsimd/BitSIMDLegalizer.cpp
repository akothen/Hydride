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
      std::vector<std::string> InstNames = {"llvm.hydride.pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimXorScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimXorScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimXorScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimXorScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimXorScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimXorScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimXorScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimXorScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimXorScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimXorScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimXorScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimXorScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimXorScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimXorScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimXorScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimXorScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimXorScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimXorScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimXorScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimXorScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimXorScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimXorScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimXorScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimXorScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimXorScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimXorScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimXorScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimXorScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimXorScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimXorScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimXorScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimXorScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimXorScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimXorScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimXorScalar_v512_e16__v512_e16__v512_e16_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimOrScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimOrScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimOrScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimOrScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimOrScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimOrScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimOrScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimOrScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimOrScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimOrScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimOrScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimOrScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimOrScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimOrScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimOrScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimOrScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimOrScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimOrScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimOrScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimOrScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimOrScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimOrScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimOrScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimOrScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimOrScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimOrScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimOrScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimOrScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimOrScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimOrScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimOrScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimOrScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimOrScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimOrScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimOrScalar_v8192_e32__v8192_e32__v8192_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimSub_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimSub_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimSub_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimSub_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimSub_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimSub_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimSub_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimSub_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimSub_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimSub_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimSub_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimSub_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimSub_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimSub_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimSub_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimSub_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimSub_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimSub_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimSub_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimSub_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimSub_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimSub_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimSub_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimSub_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimSub_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimSub_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimSub_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimSub_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimSub_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimSub_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimSub_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimSub_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimSub_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimSub_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimSub_v512_e32__v512_e32__v512_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
"llvm.hydride.pimMinScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimMinScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimMinScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimMinScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimMinScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimMinScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimMinScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimMinScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimMinScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimMinScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimMinScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimMinScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimMinScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimMinScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimMinScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimMinScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimMinScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimMinScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimMinScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimMinScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimMinScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimMinScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimMinScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimMinScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimMinScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimMinScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimMinScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimMinScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimMinScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimMinScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimMinScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimMinScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimMinScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimMinScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimMinScalar_v1024_e8__v1024_e8__v1024_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
"llvm.hydride.pimOr_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimOr_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimOr_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimOr_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimOr_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimOr_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimOr_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimOr_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimOr_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimOr_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimOr_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimOr_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimOr_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimOr_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimOr_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimOr_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimOr_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimOr_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimOr_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimOr_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimOr_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimOr_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimOr_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimOr_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimOr_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimOr_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimOr_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimOr_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimOr_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimOr_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimOr_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimOr_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimOr_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimOr_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimOr_v256_e8__v256_e8__v256_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimAnd_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimAnd_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimAnd_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimAnd_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimAnd_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimAnd_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimAnd_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimAnd_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimAnd_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimAnd_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimAnd_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimAnd_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimAnd_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimAnd_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimAnd_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimAnd_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimAnd_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimAnd_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimAnd_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimAnd_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimAnd_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimAnd_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimAnd_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimAnd_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimAnd_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimAnd_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimAnd_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimAnd_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimAnd_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimAnd_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimAnd_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimAnd_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimAnd_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimAnd_v512_e16__v512_e16__v512_e16_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimDiv_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimDiv_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimDiv_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimDiv_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimDiv_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimDiv_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimDiv_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimDiv_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimDiv_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimDiv_v8192_e8__v8192_e8__v8192_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 16)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 16)
       && isAMatch(CI, 12, 0)) {
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
"llvm.hydride.pimMin_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimMin_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimMin_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimMin_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimMin_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimMin_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimMin_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimMin_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimMin_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimMin_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimMin_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimMin_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimMin_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimMin_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimMin_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimMin_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimMin_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimMin_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimMin_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimMin_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimMin_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimMin_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimMin_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimMin_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimMin_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimMin_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimMin_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimMin_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimMin_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimMin_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimMin_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimMin_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimMin_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimMin_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimMin_v16_e8__v16_e8__v16_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
"llvm.hydride.pimSubScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimSubScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimSubScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimSubScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimSubScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimSubScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimSubScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimSubScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimSubScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimSubScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimSubScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimSubScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimSubScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimSubScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimSubScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimSubScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimSubScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimSubScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimSubScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimSubScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimSubScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimSubScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimSubScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimSubScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimSubScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimSubScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimSubScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimSubScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimSubScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimSubScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimSubScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimSubScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimSubScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimSubScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimSubScalar_v1024_e32__v1024_e32__v1024_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
      std::vector<std::string> InstNames = {"llvm.hydride.pimMulScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimMulScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimMulScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimMulScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimMulScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimMulScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimMulScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimMulScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimMulScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimMulScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimMulScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimMulScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimMulScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimMulScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimMulScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimMulScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimMulScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimMulScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimMulScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimMulScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimMulScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimMulScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimMulScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimMulScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimMulScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimMulScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimMulScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimMulScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimMulScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimMulScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimMulScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimMulScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimMulScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimMulScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimMulScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimMulScalar_v64_e16__v64_e16__v64_e16_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimMax_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimMax_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimMax_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimMax_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimMax_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimMax_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimMax_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimMax_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimMax_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimMax_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimMax_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimMax_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimMax_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimMax_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimMax_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimMax_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimMax_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimMax_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimMax_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimMax_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimMax_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimMax_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimMax_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimMax_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimMax_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimMax_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimMax_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimMax_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimMax_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimMax_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimMax_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimMax_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimMax_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimMax_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimMax_v512_e32__v512_e32__v512_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
"llvm.hydride.pimDiv_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimDiv_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimDiv_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimDiv_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimDiv_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimDiv_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimDiv_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimDiv_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimDiv_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 64)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 64)
       && isAMatch(CI, 12, 0)) {
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
"llvm.hydride.pimAndScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimAndScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimAndScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimAndScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimAndScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimAndScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimAndScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimAndScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimAndScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimAndScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimAndScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimAndScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimAndScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimAndScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimAndScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimAndScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimAndScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimAndScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimAndScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimAndScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimAndScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimAndScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimAndScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimAndScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimAndScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimAndScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimAndScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimAndScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimAndScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimAndScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimAndScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimAndScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimAndScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimAndScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimAndScalar_v1024_e32__v1024_e32__v1024_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimXor_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimXor_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimXor_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimXor_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimXor_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimXor_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimXor_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimXor_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimXor_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimXor_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimXor_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimXor_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimXor_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimXor_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimXor_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimXor_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimXor_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimXor_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimXor_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimXor_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimXor_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimXor_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimXor_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimXor_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimXor_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimXor_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimXor_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimXor_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimXor_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimXor_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimXor_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimXor_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimXor_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimXor_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimXor_v8192_e8__v8192_e8__v8192_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 0)) {
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
      std::vector<std::string> InstNames = {"llvm.hydride.pimBroadCast_v1024_e16__v16_e16_dsl",
"llvm.hydride.pimBroadCast_v512_e32__v32_e32_dsl",
"llvm.hydride.pimBroadCast_v16384_e8__v8_e8_dsl",
"llvm.hydride.pimBroadCast_v1024_e8__v8_e8_dsl",
"llvm.hydride.pimBroadCast_v512_e8__v8_e8_dsl",
"llvm.hydride.pimBroadCast_v512_e16__v16_e16_dsl",
"llvm.hydride.pimBroadCast_v1024_e32__v32_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 1, 16)
       && isAMatch(CI, 2, 16)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 1, 512)
       && isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 1, 8)
       && isAMatch(CI, 2, 8)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 1, 8)
       && isAMatch(CI, 2, 8)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 1, 8)
       && isAMatch(CI, 2, 8)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 8)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 1, 512)
       && isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 16)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
            
              if(isAMatch(CI, 1, 32)
       && isAMatch(CI, 2, 32)
       && isAMatch(CI, 3, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 32)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 0)) {
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
"llvm.hydride.pimEQ_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimEQ_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimEQ_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimEQ_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimEQ_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimEQ_v1024_e16__v1024_e16__v1024_e16_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 131072)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 0, 0)
       && isAMatch(CI, 2, 1)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 0)) {
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
"llvm.hydride.pimMaxScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimMaxScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimMaxScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimMaxScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimMaxScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimMaxScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimMaxScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimMaxScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimMaxScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimMaxScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimMaxScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimMaxScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimMaxScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimMaxScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimMaxScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimMaxScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimMaxScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimMaxScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimMaxScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimMaxScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimMaxScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimMaxScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimMaxScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimMaxScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimMaxScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimMaxScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimMaxScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimMaxScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimMaxScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimMaxScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimMaxScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimMaxScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimMaxScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimMaxScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimMaxScalar_v128_e32__v128_e32__v128_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
"llvm.hydride.pimGT_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimGT_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimGT_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimLT_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimLT_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimGT_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimGT_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimLT_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimLT_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimGT_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimLT_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimLT_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimLT_v512_e8__v512_e8__v512_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 131072)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 131072)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 1024)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
            
              if(isAMatch(CI, 0, 1)
       && isAMatch(CI, 1, 0)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 0)
       && isAMatch(CI, 7, 512)
       && isAMatch(CI, 8, 8)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
                std::string base_name = "pimLT";
                std::vector<int> Permutation = {-1,-1,0,1,-1,-1,-1,-1,-1,-1,-1};
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
      std::vector<std::string> InstNames = {"llvm.hydride.pimAddScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimAddScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimAddScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimAddScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimAddScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimAddScalar_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimAddScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimAddScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimAddScalar_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimAddScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimAddScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimAddScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimAddScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimAddScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimAddScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimAddScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimAddScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimAddScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimAddScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimAddScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimAddScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimAddScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimAddScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimAddScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimAddScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimAddScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimAddScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimAddScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimAddScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimAddScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimAddScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimAddScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimAddScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimAddScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimAddScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimAddScalar_v4096_e32__v4096_e32__v4096_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
"llvm.hydride.pimDiv_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimDiv_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimDiv_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimDiv_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimDiv_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimDiv_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimDiv_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimDiv_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimDiv_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimDiv_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 1)
       && isAMatch(CI, 9, 32)
       && isAMatch(CI, 10, 1)
       && isAMatch(CI, 11, 32)
       && isAMatch(CI, 12, 0)) {
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
      std::vector<std::string> InstNames = {"llvm.hydride.pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimScaledAdd_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimScaledAdd_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimScaledAdd_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimScaledAdd_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimScaledAdd_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimScaledAdd_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimScaledAdd_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimScaledAdd_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimScaledAdd_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimScaledAdd_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimScaledAdd_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimScaledAdd_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimScaledAdd_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimScaledAdd_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimScaledAdd_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimScaledAdd_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimScaledAdd_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimScaledAdd_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimScaledAdd_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimScaledAdd_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimScaledAdd_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimScaledAdd_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimScaledAdd_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimScaledAdd_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimScaledAdd_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimScaledAdd_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimScaledAdd_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimScaledAdd_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimScaledAdd_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimScaledAdd_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimScaledAdd_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimScaledAdd_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimScaledAdd_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimScaledAdd_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimScaledAdd_v512_e8__v512_e8__v512_e8_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 2048)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 2048)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 262144)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 262144)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 8192)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 8192)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 524288)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 524288)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 65536)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 65536)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 32768)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32768)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 131072)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 8192)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 8192)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 256)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 256)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 64)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 64)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 2048)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 2048)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 256)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 256)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 131072)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 8192)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 8192)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 256)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 256)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 131072)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 131072)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 4098)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 4096)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 1024)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 1024)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 65536)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 65536)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 2048)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 2048)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 16384)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16384)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 4098)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 4096)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 512)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 512)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 128)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 128)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 16384)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16384)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 65536)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 65536)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 262144)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 262144)
       && isAMatch(CI, 7, 32)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 32768)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32768)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 32768)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 32768)
       && isAMatch(CI, 7, 16)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 16384)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 16384)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
            
              if(isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 4098)
       && isAMatch(CI, 5, 0)
       && isAMatch(CI, 6, 4096)
       && isAMatch(CI, 7, 8)
       && isAMatch(CI, 8, -1)
       && isAMatch(CI, 9, 0)) {
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
      std::vector<std::string> InstNames = {"llvm.hydride.pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimAdd_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimAdd_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimAdd_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimAdd_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimAdd_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimAdd_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimAdd_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimAdd_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimAdd_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimAdd_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimAdd_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimAdd_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimAdd_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimAdd_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimAdd_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimAdd_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimAdd_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimAdd_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimAdd_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimAdd_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimAdd_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimAdd_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimAdd_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimAdd_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimAdd_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimAdd_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimAdd_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimAdd_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimAdd_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimAdd_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimAdd_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimAdd_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimAdd_v128_e32__v128_e32__v128_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, -1)
       && isAMatch(CI, 8, 0)) {
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
      std::vector<std::string> InstNames = {"llvm.hydride.pimMul_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimMul_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimMul_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimMul_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimMul_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimMul_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimMul_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimMul_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimMul_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimMul_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimMul_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimMul_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimMul_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimMul_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimMul_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimMul_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimMul_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimMul_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimMul_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimMul_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimMul_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimMul_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimMul_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimMul_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimMul_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimMul_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimMul_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimMul_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimMul_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimMul_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimMul_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimMul_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimMul_v32_e16__v32_e16__v32_e16_dsl",
"llvm.hydride.pimMul_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimMul_v4096_e16__v4096_e16__v4096_e16_dsl",
"llvm.hydride.pimMul_v1024_e32__v1024_e32__v1024_e32_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 16)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 32)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 64)
       && isAMatch(CI, 9, 1)
       && isAMatch(CI, 10, 0)) {
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
"llvm.hydride.pimDivScalar_v8192_e16__v8192_e16__v8192_e16_dsl",
"llvm.hydride.pimDivScalar_v2048_e8__v2048_e8__v2048_e8_dsl",
"llvm.hydride.pimDivScalar_v512_e16__v512_e16__v512_e16_dsl",
"llvm.hydride.pimDivScalar_v256_e32__v256_e32__v256_e32_dsl",
"llvm.hydride.pimDivScalar_v2048_e32__v2048_e32__v2048_e32_dsl",
"llvm.hydride.pimDivScalar_v64_e16__v64_e16__v64_e16_dsl",
"llvm.hydride.pimDivScalar_v8_e16__v8_e16__v8_e16_dsl",
"llvm.hydride.pimDivScalar_v16_e16__v16_e16__v16_e16_dsl",
"llvm.hydride.pimDivScalar_v8_e8__v8_e8__v8_e8_dsl",
"llvm.hydride.pimDivScalar_v128_e16__v128_e16__v128_e16_dsl",
"llvm.hydride.pimDivScalar_v128_e8__v128_e8__v128_e8_dsl",
"llvm.hydride.pimDivScalar_v8192_e32__v8192_e32__v8192_e32_dsl",
"llvm.hydride.pimDivScalar_v32_e8__v32_e8__v32_e8_dsl",
"llvm.hydride.pimDivScalar_v512_e32__v512_e32__v512_e32_dsl",
"llvm.hydride.pimDivScalar_v256_e16__v256_e16__v256_e16_dsl",
"llvm.hydride.pimDivScalar_v16384_e16__v16384_e16__v16384_e16_dsl",
"llvm.hydride.pimDivScalar_v8192_e8__v8192_e8__v8192_e8_dsl",
"llvm.hydride.pimDivScalar_v16384_e32__v16384_e32__v16384_e32_dsl",
"llvm.hydride.pimDivScalar_v32_e32__v32_e32__v32_e32_dsl",
"llvm.hydride.pimDivScalar_v64_e8__v64_e8__v64_e8_dsl",
"llvm.hydride.pimDivScalar_v16_e32__v16_e32__v16_e32_dsl",
"llvm.hydride.pimDivScalar_v4096_e32__v4096_e32__v4096_e32_dsl",
"llvm.hydride.pimDivScalar_v8_e32__v8_e32__v8_e32_dsl",
"llvm.hydride.pimDivScalar_v2048_e16__v2048_e16__v2048_e16_dsl",
"llvm.hydride.pimDivScalar_v256_e8__v256_e8__v256_e8_dsl",
"llvm.hydride.pimDivScalar_v64_e32__v64_e32__v64_e32_dsl",
"llvm.hydride.pimDivScalar_v1024_e32__v1024_e32__v1024_e32_dsl",
"llvm.hydride.pimDivScalar_v512_e8__v512_e8__v512_e8_dsl",
"llvm.hydride.pimDivScalar_v4096_e8__v4096_e8__v4096_e8_dsl",
"llvm.hydride.pimDivScalar_v16_e8__v16_e8__v16_e8_dsl",
"llvm.hydride.pimDivScalar_v128_e32__v128_e32__v128_e32_dsl",
"llvm.hydride.pimDivScalar_v16384_e8__v16384_e8__v16384_e8_dsl",
"llvm.hydride.pimDivScalar_v1024_e16__v1024_e16__v1024_e16_dsl",
"llvm.hydride.pimDivScalar_v1024_e8__v1024_e8__v1024_e8_dsl",
"llvm.hydride.pimDivScalar_v4096_e16__v4096_e16__v4096_e16_dsl"};
      if(isNameMatch(CI, InstNames)) {
        
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 64)
       && isAMatch(CI, 3, 64)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 64)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 262144)
       && isAMatch(CI, 3, 262144)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 262144)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 524288)
       && isAMatch(CI, 3, 524288)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 524288)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 1024)
       && isAMatch(CI, 3, 1024)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 1024)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 512)
       && isAMatch(CI, 3, 512)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 512)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 256)
       && isAMatch(CI, 3, 256)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 256)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 2048)
       && isAMatch(CI, 3, 2048)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 2048)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 32768)
       && isAMatch(CI, 3, 32768)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 32768)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 128)
       && isAMatch(CI, 3, 128)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 128)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 4098)
       && isAMatch(CI, 3, 4098)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 4096)
       && isAMatch(CI, 6, 32)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 131072)
       && isAMatch(CI, 3, 131072)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 131072)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 16384)
       && isAMatch(CI, 3, 16384)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 16384)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 8192)
       && isAMatch(CI, 3, 8192)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 8192)
       && isAMatch(CI, 6, 8)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
            
              if(isAMatch(CI, 2, 65536)
       && isAMatch(CI, 3, 65536)
       && isAMatch(CI, 4, 0)
       && isAMatch(CI, 5, 65536)
       && isAMatch(CI, 6, 16)
       && isAMatch(CI, 7, 1)
       && isAMatch(CI, 8, 0)) {
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
    