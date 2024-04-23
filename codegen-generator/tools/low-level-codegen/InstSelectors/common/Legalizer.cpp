//===----------------------------------------------------------------------===//
//
// Common class for Legalizer for diffeerent targets.
//
//===----------------------------------------------------------------------===//

#include "Legalizer.h"
#include "libpimsim.h"
#include "llvm/IR/IRBuilder.h"


namespace llvm {
bool Legalizer::legalize(Function &F) {
    SmallVector<Instruction *, 16> TargetAgnosticInstructions;
    ReversePostOrderTraversal<Function *> RPOT(&F);
    for (auto *BB : RPOT) {
        for (Instruction &I : *BB) {
            auto *CI = dyn_cast<CallInst>(&I);
            if (CI != nullptr)
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

    bool IS_BITSIMD = true;
    // Remove all the target-agnostic intrinsics / function calls
    for (auto *I : ToBeRemoved) {
        errs() << "Instruction to remove: "<< * I << "\n";
        if(!IS_BITSIMD){
            errs() << "Found in map!\n";
            if (InstToInstMap[I]->getType() == I->getType()) {
                I->replaceAllUsesWith(InstToInstMap[I]);  // UndefValue::get(I->getType()));
            } else {
                errs() << "I->getType():" << *I->getType() << "\n";
                errs() << "InstToInstMap[I]:" << *InstToInstMap[I] << "\n";
                I->replaceAllUsesWith(new BitCastInst(InstToInstMap[I], I->getType(), "", I));
            }
        } else {
            errs() << "Not found in map!\n";
            I->replaceAllUsesWith(UndefValue::get(I->getType()));
        }
        I->eraseFromParent();
    }

    // bool BrokenDebugInfo = true;
    // if (verifyModule(*(F.getParent()), errs(), &BrokenDebugInfo) == false):
    //   errs() << "BROKEN MODULE!!!!!!!\n";

    errs() << "FINAL FUNCTION:\n";
    errs() << F << "\n";

    return Changed;
}

Value *Legalizer::getBitvectorOfRequiredType(Value *Bitvector, Type *RequiredType, Instruction *InsertBefore) {
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

std::vector<Value *> Legalizer::getArgsAfterPermutation(CallInst *OriginalInst,
                                             Function *InstFunction, std::vector<int> &Permutation,
                                             Instruction *InsertBefore) {
    errs() << "getArgsAfterPermutation:"
           << "\n";
    errs() << "OriginalInst:" << *OriginalInst << "\n";
    errs() << "InstFunction" << *InstFunction << "\n";
    // Get bitvector list
    std::vector<Value *> BitvectorList;
    errs() << "OriginalInst->getNumOperands():" << OriginalInst->getNumOperands() << "\n";
    for (auto &Operand : OriginalInst->args()) {
        errs() << "OriginalInst->getOperand(I):" << *Operand << "\n";
        BitvectorList.push_back(Operand);
    }
    // Get the required types
    std::vector<Type *> RequiredTypes;
    for (auto &Arg : InstFunction->args())
        RequiredTypes.push_back(Arg.getType());
    // Some sanity checks
    // assert(BitvectorList.size() == RequiredTypes.size()
    //      && "Error: BitvectorList.size() != RequiredTypes.size()");
    // assert(BitvectorList.size() == Permutation.size()
    //      && "Error: BitvectorList.size() != RequiredTypes.size()");
    // Generate some new args
    std::vector<Value *> NewArgs;
    for (unsigned I = 0; I < RequiredTypes.size(); ++I)
        NewArgs.push_back(nullptr);
    // NewArgs.reserve(RequiredTypes.size());
    errs() << "RequiredTypes size:" << RequiredTypes.size() << "\n";
    errs() << "BitvectorList size:" << BitvectorList.size() << "\n";
    for (int PermIdx : Permutation)
        errs() << "Permutation Idx:" << PermIdx << "\n";
    for (unsigned Idx = 0; Idx < BitvectorList.size(); Idx++) {
        if (Permutation[Idx] != -1) {
            errs() << "IDX:" << Idx << "\n";
            int PermIdx = Permutation[Idx];
            errs() << "PERM IDX:" << PermIdx << "\n";
            if (PermIdx >= RequiredTypes.size()) continue;  // Immediate Number
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

std::vector<Value *> Legalizer::getArgsAfterPermutationForSpecialCases(CallInst *OriginalInst,
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
        if (Permutation[Idx] != -1) {
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

std::string Legalizer::intToHex(int512_t IntegerVal, unsigned Bitwidth, bool IgnorePrefix = false) {
    std::stringstream Stream;
    if (IgnorePrefix == false) {
        if (IntegerVal >= 0) {
            Stream << "0x"
                   << std::setfill('0') << std::setw(Bitwidth * 2)
                   << std::hex << IntegerVal;
        } else {
            Stream << "0x"
                   << std::setfill('f') << std::setw(Bitwidth * 2)
                   << std::hex << IntegerVal;
        }
    } else {
        if (IntegerVal >= 0) {
            Stream << std::setfill('0') << std::setw(Bitwidth * 2)
                   << std::hex << IntegerVal;
        } else {
            Stream << std::setfill('f') << std::setw(Bitwidth * 2)
                   << std::hex << IntegerVal;
        }
    }
    return Stream.str();
}

bool Legalizer::isAMatch(CallInst *OriginalInst, unsigned Idx, const int512_t &OperandValue) {
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
            if (ConstantVectorVal == nullptr) {
                auto *ConstantVectorVal = dyn_cast<ConstantVector>(OriginalInst->getOperand(Idx));
                for (unsigned I = 0; I < NumElems; I++) {
                    errs() << "ConstantVectorVal->getElementAsAPInt(Idx):" << *(ConstantVectorVal->getOperand(I)) << "\n";
                    ActualHexVal += intToHex(dyn_cast<ConstantInt>(ConstantVectorVal->getOperand(I))->getZExtValue(), ElemSize, true);
                }
            } else {
                errs() << "ConstantVectorVal:" << *ConstantVectorVal << "\n";
                for (unsigned I = 0; I < NumElems; I++) {
                    errs() << "ConstantVectorVal->getElementAsAPInt(Idx):" << *(ConstantVectorVal->getElementAsConstant(I)) << "\n";
                    ActualHexVal += intToHex(dyn_cast<ConstantInt>(ConstantVectorVal->getElementAsConstant(I))->getZExtValue(), ElemSize, true);
                }
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


// Generate any bitserial Allocation for operands
// If they do not exist
void Legalizer::InsertBitSIMDAllocations(std::vector<Value*> Args, Instruction* InsertBefore){
    errs() << "Inserting BitSIMD allocations for "<<Args.size()<<" Bitvectors\n";

    LLVMContext& ctx = InsertBefore->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);

    Module* M = InsertBefore->getModule();
    Function* ParentFn = InsertBefore->getParent()->getParent();
    Function* AllocFunc = M->getFunction(pimAllocName);

    Function* AlignedAllocFunc = M->getFunction(pimAllocAssocName);

    if(!AllocFunc){
        std::vector<Type*>  AllocArgsTy = {i32Ty, i32Ty, i32Ty, i32Ty};
        FunctionType* AllocFuncTy = FunctionType::get(i32Ty, AllocArgsTy, /* isVarArgs */ false);

        AllocFunc = Function::Create(AllocFuncTy, Function::ExternalLinkage ,pimAllocName , M);
    }

    if(!AlignedAllocFunc){
        // Second last parameter is reference objected id
        std::vector<Type*>  AllocArgsTy = {i32Ty, i32Ty, i32Ty, i32Ty , i32Ty};
        FunctionType* AllocFuncTy = FunctionType::get(i32Ty, AllocArgsTy, /* isVarArgs */ false);
        AlignedAllocFunc = Function::Create(AllocFuncTy, Function::ExternalLinkage ,pimAllocAssocName , M);
    }

    
    for(Value* Arg : Args){
        if(InstToObjectIDMap.find(Arg) == InstToObjectIDMap.end()){
            Type* ArgTy = Arg->getType();
            FixedVectorType* FVTy = dyn_cast<FixedVectorType>(ArgTy);
            assert(FVTy && "Operand must be a fixed vector llvm type");
            Type* ElementType = FVTy->getElementType();
            unsigned num_elements = FVTy->getNumElements();

            
            Value* AllocationTy = ConstantInt::get(i32Ty, PIM_ALLOC_V1);
            // TODO: Replace with switch statement. Hard coded for now
            Value* PimDataType = ConstantInt::get(i32Ty, PIM_INT32);
            Value* Lanes = ConstantInt::get(i32Ty, num_elements);
            Value* Bits = ConstantInt::get(i32Ty, 32);

            CallInst* AllocationCall = nullptr;
            if(AlignmentMap.find(ParentFn) != AlignmentMap.end()){
                std::vector<Value*> AllocationParams = {AllocationTy, Lanes, Bits, AlignmentMap[ParentFn] , PimDataType};
                AllocationCall = CallInst::Create(AlignedAllocFunc, AllocationParams, "pimAssocAlloc", InsertBefore);
            } else {
                std::vector<Value*> AllocationParams = {AllocationTy, Lanes, Bits, PimDataType};
                AllocationCall = CallInst::Create(AllocFunc, AllocationParams, "pimAlloc", InsertBefore);
                AlignmentMap[ParentFn] = AllocationCall;
            }
            InstToObjectIDMap[Arg] = AllocationCall;
            errs() << "PimAllocation for "<< *Arg << ", AllocationCall: "<< *AllocationCall<<"\n";

            // For vectors coming in through arguments, we need to generate the appropriate copy to host function
            if(isa<Argument>(Arg)){
                InsertBitSIMDCopyToDevice(Arg, InsertBefore);
            }
        }
    }


}

void Legalizer::InsertBitSIMDCopyToDevice(Value* Arg, Instruction* InsertBefore){
    Type* ArgTy = Arg->getType();
    FixedVectorType* FVTy = dyn_cast<FixedVectorType>(ArgTy);
    assert(FVTy && "Operand must be a fixed vector llvm type");
    Type* ElementType = FVTy->getElementType();
    unsigned num_elements = FVTy->getNumElements();

    IRBuilder<> Builder(InsertBefore);
    // Generate an alloca and store value into alloca
    AllocaInst* HostAlloc = Builder.CreateAlloca(FVTy);
    Builder.CreateStore(Arg, HostAlloc);


    // Insert call to copy host memory to device

    LLVMContext& ctx = InsertBefore->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);

    Module* M = InsertBefore->getModule();
    Function* CopyFunc = M->getFunction(pimCopyHostToDeviceName);

    if(!CopyFunc){
        std::vector<Type*>  CopyArgsTy = {i32Ty, i8PTy, i32Ty};
        FunctionType* CopyFuncTy = FunctionType::get(i32Ty, CopyArgsTy, /* isVarArgs */ false);
        CopyFunc = Function::Create(CopyFuncTy, Function::ExternalLinkage ,pimCopyHostToDeviceName , M);
    }

    Value* CopyTy = ConstantInt::get(i32Ty, PIM_COPY_V);
    Value* MemoryRef = BitCastInst::CreatePointerCast(HostAlloc, i8PTy, "", InsertBefore);

    Value* Bytes = ConstantInt::get(i32Ty, num_elements);
    Value* ObjectID = InstToObjectIDMap[Arg];
    std::vector<Value*> Args = {CopyTy, MemoryRef, ObjectID};

    CallInst* CopyCall = CallInst::Create(CopyFunc, Args, "pimHostToDevice", InsertBefore);
}



// Replace vectorized call to call PIM ISA Directly
void Legalizer::InsertBitSIMDCall(Function* InstFunction, std::vector<Value*> Args, Instruction* PimInst,  Instruction* InsertBefore){
    
    std::vector<Value*> ObjIDs;
    for(auto* Arg: Args){
        assert(InstToObjectIDMap.find(Arg) != InstToObjectIDMap.end() && "PimArg not in InstToObjectIDMap");
        ObjIDs.push_back(InstToObjectIDMap[Arg]);
    }

    assert(InstToObjectIDMap.find(PimInst) != InstToObjectIDMap.end() && "PimResult not in InstToObjectIDMap" );
    ObjIDs.push_back(InstToObjectIDMap[PimInst]) ;
    errs()<< "Calling function: "<< *InstFunction <<"\n"; 
    
    for(auto* Arg : ObjIDs){
        errs() <<"Arg: "<< *Arg <<"\n";
    }


    CallInst::Create(InstFunction, ObjIDs, "pimInst", InsertBefore);




}

bool Legalizer::ReplaceReturn(CallInst* PimInst){



    // Insert call to copy host memory to device

    LLVMContext& ctx = PimInst->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);

    Module* M = PimInst->getModule();
    Function* CopyFunc = M->getFunction(pimCopyDeviceToHostName);

    if(!CopyFunc){
        std::vector<Type*>  CopyArgsTy = {i32Ty, i32Ty,i8PTy};
        FunctionType* CopyFuncTy = FunctionType::get(i32Ty, CopyArgsTy, /* isVarArgs */ false);
        CopyFunc = Function::Create(CopyFuncTy, Function::ExternalLinkage ,pimCopyDeviceToHostName , M);
    }


    // If a user of this instruction is the return instruction then generate allocation and copy memory from device to host
    for(auto* User: PimInst->users()){

        ReturnInst* RI = dyn_cast<ReturnInst>(User);
        if(!RI) continue;

        IRBuilder<> Builder(PimInst);
        // Generate an alloca and store value into alloca
        AllocaInst* HostAlloc = Builder.CreateAlloca(PimInst->getType());


        Value* CopyTy = ConstantInt::get(i32Ty, PIM_COPY_V);
        Value* MemoryRef = BitCastInst::CreatePointerCast(HostAlloc, i8PTy, "", PimInst);

        Value* ObjectID = InstToObjectIDMap[PimInst];
        std::vector<Value*> Args = {CopyTy,  ObjectID, MemoryRef };


        CallInst* CopyCall = CallInst::Create(CopyFunc, Args, "pimDeviceToHost", PimInst);

        Builder.SetInsertPoint(PimInst);
        Value *LoadInst = Builder.CreateLoad(PimInst->getType(), HostAlloc, "load.buffer");
        PimInst->replaceAllUsesWith(LoadInst);


        return true;

    }



    return false;
}

Function* Legalizer::CreateFunctionDecl(std::string name, CallInst* CI){
    // 1 for return argument
    unsigned num_symbolic_args = 1;

    for(int i =0; i < CI->getNumArgOperands(); i++){
        Value* arg = CI->getArgOperand(i);
        if(isa<FixedVectorType>(arg->getType())){
            num_symbolic_args++;
        }
    }

    LLVMContext& ctx = CI->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);

    Module* M = CI->getModule();
    Function* PimFunc = M->getFunction(name);

    if(!PimFunc){
        std::vector<Type*>  CopyArgsTy;
        for(int i = 0; i < num_symbolic_args ; i++){
            CopyArgsTy.push_back(i32Ty);
        }
        FunctionType* PimFuncTy = FunctionType::get(i32Ty, CopyArgsTy, /* isVarArgs */ false);
        PimFunc = Function::Create(PimFuncTy, Function::ExternalLinkage ,name , M);
    }

    return PimFunc;


}

bool Legalizer::isNameMatch(CallInst *TargetAgnoticInst, std::vector<std::string> &NameList) {
    for (const auto &Name : NameList) {
        if (TargetAgnoticInst->getCalledFunction()->getName().contains(Name)) {
            errs() << "NAME MATCH!!\n";
            return true;
        }
    }
    return false;
}

}  // end of namespace llvm
