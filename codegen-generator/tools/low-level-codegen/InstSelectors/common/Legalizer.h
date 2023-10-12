//===----------------------------------------------------------------------===//
//
// Common class for Legalizer for diffeerent targets.
//
//===----------------------------------------------------------------------===//

#ifndef HYDRIDE_LEGALIZER_H
#define HYDRIDE_LEGALIZER_H

#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"

#include <iomanip>
#include <iostream>
#include <sstream>
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
    virtual bool legalize(Function &F);

    Value *getBitvectorOfRequiredType(Value *Bitvector, Type *RequiredType, Instruction *InsertBefore);

    std::vector<Value *> getArgsAfterPermutation(CallInst *OriginalInst,
                                                 Function *InstFunction, std::vector<int> &Permutation,
                                                 Instruction *InsertBefore);

    std::vector<Value *> getArgsAfterPermutationForSpecialCases(CallInst *OriginalInst,
                                                                std::vector<int> &Permutation);

    std::string intToHex(int512_t IntegerVal, unsigned Bitwidth, bool IgnorePrefix);

    bool isAMatch(CallInst *OriginalInst, unsigned Idx, const int512_t &OperandValue);

    bool isNameMatch(CallInst *TargetAgnoticInst, std::vector<std::string> &NameList);
};

}  // end of namespace llvm

#endif  // HYDRIDE_LEGALIZER_H
