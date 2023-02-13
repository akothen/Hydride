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
#include "llvm/IR/DerivedTypes.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Verifier.h"

#include <iostream>
#include <sstream>
#include <iomanip>
#include <string>

#include <boost/multiprecision/cpp_int.hpp>

using namespace boost::multiprecision;


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
      if (InstToInstMap[I]->getType() == I->getType()) {
        I->replaceAllUsesWith(InstToInstMap[I]);//UndefValue::get(I->getType()));
      } else {
        I->replaceAllUsesWith(new BitCastInst(InstToInstMap[I], I->getType(), "", I));
      }
      I->eraseFromParent();
    }

    //bool BrokenDebugInfo = true;
    //if (verifyModule(*(F.getParent()), errs(), &BrokenDebugInfo) == false):
    //  errs() << "BROKEN MODULE!!!!!!!\n";

    errs() << "FINAL FUNCTION:\n";
    errs() << F << "\n";

    return Changed;
  }

  Value *getBitvectorOfRequiredType(Value *Bitvector, Type *RequiredType, Instruction *InsertBefore) {
    errs() << "getBitvectorOfRequiredType\n";
    errs() << "Bitvector:" << *Bitvector << "\n";
    errs() << "RequiredVectoType:" << *RequiredType << "\n";
    if (Bitvector->getType() != RequiredType) {
      if (InstToInstMap[Bitvector] == nullptr) {
        // Check if the required bitwidth and the bitwidth of given vector are the same.
        unsigned BitvectorTypeSize = 0;
        if (auto *BitvectorType = dyn_cast<VectorType>(Bitvector->getType())) {
          unsigned BitvectorElemSize = BitvectorType->getElementType()->getScalarSizeInBits();
          unsigned BitvectorNumElems = BitvectorType->getElementCount().getKnownMinValue();
          BitvectorTypeSize = BitvectorElemSize * BitvectorNumElems;
        } else {
          BitvectorTypeSize = Bitvector->getType()->getScalarSizeInBits();
        }
        unsigned RequiredTypeSize = 0;
        if (auto *RequiredVectoType = dyn_cast<VectorType>(RequiredType)) {
          unsigned RequiredTypeElemSize = RequiredVectoType->getElementType()->getScalarSizeInBits();
          unsigned RequiredTypeNumElems = RequiredVectoType->getElementCount().getKnownMinValue();
          RequiredTypeSize = RequiredTypeElemSize * RequiredTypeNumElems;
        } else {
          RequiredTypeSize = RequiredType->getScalarSizeInBits();
        }
        if (RequiredTypeSize != BitvectorTypeSize)
          return nullptr;
        InstToInstMap[Bitvector] = new BitCastInst(Bitvector, RequiredType, "", InsertBefore);
        errs() << "InstToInstMap[Bitvector]:" << *InstToInstMap[Bitvector] << "\n";
        return InstToInstMap[Bitvector];
      }
      errs() << "--InstToInstMap[Bitvector]:" << *InstToInstMap[Bitvector] << "\n";
      // Check if the required bitwidth and the bitwidth of given vector are the same.
      unsigned BitvectorTypeSize = 0;
      if (auto *BitvectorType = dyn_cast<VectorType>(InstToInstMap[Bitvector]->getType())) {
        unsigned BitvectorElemSize = BitvectorType->getElementType()->getScalarSizeInBits();
        unsigned BitvectorNumElems = BitvectorType->getElementCount().getKnownMinValue();
        BitvectorTypeSize = BitvectorElemSize * BitvectorNumElems;
      } else {
        BitvectorTypeSize = InstToInstMap[Bitvector]->getType()->getScalarSizeInBits();
      }
      unsigned RequiredTypeSize = 0;
      if (auto *RequiredVectoType = dyn_cast<VectorType>(RequiredType)) {
        unsigned RequiredTypeElemSize = RequiredVectoType->getElementType()->getScalarSizeInBits();
        unsigned RequiredTypeNumElems = RequiredVectoType->getElementCount().getKnownMinValue();
        RequiredTypeSize = RequiredTypeElemSize * RequiredTypeNumElems;
      } else {
        RequiredTypeSize = RequiredType->getScalarSizeInBits();
      }
      if (RequiredTypeSize != BitvectorTypeSize)
        return nullptr;
      if (RequiredType == InstToInstMap[Bitvector]->getType()) {
          return InstToInstMap[Bitvector];
      } else {
        return new BitCastInst(InstToInstMap[Bitvector], RequiredType, "", InsertBefore);
      }
    }
    errs() << "Bitvector:" << *Bitvector << "\n";
    return Bitvector;
  }

  std::vector<Value *> getArgsAfterPermutation(CallInst *OriginalInst,
                            Function *InstFunction, std::vector<int> &Permutation, 
                            Instruction *InsertBefore) {
    errs() << "getArgsAfterPermutation:" << "\n";
    errs() << "OriginalInst:" << *OriginalInst << "\n";
    errs() << "InstFunction" << *InstFunction << "\n";
    errs() << "Permutation[0]:" << Permutation[0] << "\n";
    errs() << "Permutation.size():" << Permutation.size() << "\n";
    // Get the required types
    std::vector<Type *> RequiredTypes;
    for (auto &Arg : InstFunction->args())
      RequiredTypes.push_back(Arg.getType());
    if (RequiredTypes.size() == 1) {
      errs() << "OriginalInst->getOperand(0):" << *(OriginalInst->getOperand(0)) << "\n";
      auto *Bitvector = getBitvectorOfRequiredType(OriginalInst->getOperand(0), 
                                    RequiredTypes[0], InsertBefore);
      if (Bitvector == nullptr)
        return std::vector<Value *>();
      return std::vector<Value *>{Bitvector};
    }
    // Get bitvector list
    std::vector<Value *> BitvectorList;
    errs() << "OriginalInst->getNumOperands():" << OriginalInst->getNumOperands() << "\n";
    for (auto &Operand : OriginalInst->args()) {
      errs() << "OriginalInst->getOperand(I):" << *Operand << "\n";
      BitvectorList.push_back(Operand);
    }
    // Some sanity checks
    //assert(BitvectorList.size() == RequiredTypes.size() 
    //      && "Error: BitvectorList.size() != RequiredTypes.size()");
    //assert(BitvectorList.size() == Permutation.size() 
    //      && "Error: BitvectorList.size() != RequiredTypes.size()");
    // Generate some new args
    std::vector<Value *> NewArgs;
    for (unsigned I = 0; I < RequiredTypes.size(); ++I)
      NewArgs.push_back(nullptr);
    //NewArgs.reserve(RequiredTypes.size());
    errs() << "RequiredTypes size:" << RequiredTypes.size() << "\n"; 
    errs() << "BitvectorList size:" << BitvectorList.size() << "\n";
    for (int PermIdx : Permutation)
      errs() << "Permutation Idx:" << PermIdx << "\n";
    for (unsigned Idx = 0; Idx < BitvectorList.size(); Idx++) {
      if(Permutation[Idx] != -1) {
        errs() << "IDX:" << Idx << "\n";
        int PermIdx = Permutation[Idx];
        errs() << "PERM IDX:" << PermIdx << "\n";
        auto *Bitvector = getBitvectorOfRequiredType(BitvectorList[Idx], 
                                      RequiredTypes[PermIdx], InsertBefore);
        if (Bitvector == nullptr)
          return std::vector<Value *>();
        NewArgs[PermIdx] = Bitvector;
        errs() << "NewArgs[PermIdx]:" << *NewArgs[PermIdx] << "\n";
        errs() << "----NewArgs.size(): " << NewArgs.size() << "\n";
      }
    }
    errs() << "NewArgs.size(): " << NewArgs.size() << "\n";
    return NewArgs;
  }

  std::vector<Value *> getArgsAfterPermutationForSpecialCases(CallInst *OriginalInst, 
                                                              std::vector<int> &Permutation) {
    // Get bitvector list
    std::vector<Value *> BitvectorList;
    errs() << "OriginalInst->getNumOperands():" << OriginalInst->getNumOperands() << "\n";
    for (auto &Operand : OriginalInst->args()) {
      errs() << "OriginalInst->getOperand(I):" << *Operand << "\n";
      BitvectorList.push_back(Operand);
    }
    // Generate some new args
    std::vector<Value *> NewArgs;
    for (unsigned I = 0; I < BitvectorList.size(); ++I)
      NewArgs.push_back(nullptr);
    for (unsigned Idx = 0; Idx < BitvectorList.size(); Idx++) {
      if(Permutation[Idx] != -1) {
        errs() << "IDX:" << Idx << "\n";
        int PermIdx = Permutation[Idx];
        errs() << "PERM IDX:" << PermIdx << "\n";
        auto *Bitvector = BitvectorList[Idx];
        if (Bitvector == nullptr)
          return std::vector<Value *>();
        NewArgs[PermIdx] = Bitvector;
        errs() << "NewArgs[PermIdx]:" << *NewArgs[PermIdx] << "\n";
        errs() << "----NewArgs.size(): " << NewArgs.size() << "\n";
      }
    }
    return NewArgs;
  }

  std::string intToHex(int512_t IntegerVal, unsigned Bitwidth, bool IgnorePrefix = false) {
    std::stringstream Stream;
    if (IgnorePrefix == false) {
      if (IntegerVal >= 0) {
        Stream << "0x" 
              << std::setfill ('0') << std::setw(Bitwidth * 2) 
              << std::hex << IntegerVal;
      } else {
        Stream << "0x" 
              << std::setfill ('f') << std::setw(Bitwidth * 2) 
              << std::hex << IntegerVal;
      }
    } else {
      if (IntegerVal >= 0) {
        Stream << std::setfill ('0') << std::setw(Bitwidth * 2) 
              << std::hex << IntegerVal;
      } else {
        Stream << std::setfill ('f') << std::setw(Bitwidth * 2) 
              << std::hex << IntegerVal;
      }
    }
    return Stream.str();
  }

  bool isAMatch(CallInst *OriginalInst, unsigned Idx, int512_t OperandValue) {
    errs() << "MATCHING INST:" << *OriginalInst << "\n";
    errs() << "Idx:" << Idx << "\n";
    errs() << "OriginalInst->getOperand(Idx):" << *(OriginalInst->getOperand(Idx)) << "\n";
    if (dyn_cast<Constant>(OriginalInst->getOperand(Idx)) == nullptr)
      return false;
    auto *OperandVectorType = dyn_cast<VectorType>(OriginalInst->getOperand(Idx)->getType());
    if (OperandVectorType) {
      // Get full bitwidth of the vector
      unsigned ElemSize = OperandVectorType->getElementType()->getScalarSizeInBits();
      unsigned NumElems = OperandVectorType->getElementCount().getKnownMinValue();
      errs() << "ElemSize:" << ElemSize << "\n";
      errs() << "NumElems:" << NumElems << "\n";
      unsigned TotalBitwidth = ElemSize * NumElems;
      errs() << "TotalBitwidth:" << TotalBitwidth << "\n";
      std::string CheckHexVal = intToHex(OperandValue, TotalBitwidth);
      errs() << "CheckHexVal:" << CheckHexVal << "\n";
      std::string ActualHexVal = "0x";
      auto *ConstantAggZeroArray = dyn_cast<ConstantAggregateZero>(OriginalInst->getOperand(Idx));
      if (ConstantAggZeroArray == nullptr) {
        auto *ConstantVectorVal = dyn_cast<ConstantDataVector>(OriginalInst->getOperand(Idx));
        errs() << "ConstantVectorVal:" << *ConstantVectorVal << "\n";
        for (unsigned I = 0; I < NumElems; I++) {
          errs() << "ConstantVectorVal->getElementAsAPInt(Idx):" << *(ConstantVectorVal->getElementAsConstant(I)) << "\n";
          ActualHexVal += intToHex(dyn_cast<ConstantInt>(ConstantVectorVal->getElementAsConstant(I))->getZExtValue(), ElemSize, true);
        }
      } else {
        ActualHexVal += intToHex(0, TotalBitwidth, true);
      }
      errs() << "ActualHexVal:" << ActualHexVal << "\n";
      if (CheckHexVal == ActualHexVal) {
        errs() << "CheckHexVal == ActualHexVal\n";
        errs() << "MATCH FOUND\n";
        return true;
      }
      errs() << "CheckHexVal != ActualHexVal\n";
      return false;
    }
    if (OperandValue >= 0) {
      if (dyn_cast<ConstantInt>(OriginalInst->getOperand(Idx))->getZExtValue() == OperandValue) {
        errs() << "MATCH FOUND\n";
        return true;
      }
    } else {
      if (dyn_cast<ConstantInt>(OriginalInst->getOperand(Idx))->getSExtValue() == OperandValue) {
        errs() << "MATCH FOUND\n";
        return true;
      }
    }
    return false;
  }

  bool isNameMatch(CallInst *TargetAgnoticInst, std::vector<std::string> &NameList) {
    for (auto Name : NameList) {
      if (TargetAgnoticInst->getCalledFunction()->getName().contains(Name)) {
        errs() << "NAME MATCH!!\n";
        return true;
      }
    }
    return false;
  }

};

}   // end of namespace llvm

#endif  // HYDRIDE_LEGALIZER_H
