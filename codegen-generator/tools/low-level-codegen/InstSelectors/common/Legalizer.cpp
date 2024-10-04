//===----------------------------------------------------------------------===//
//
// Common class for Legalizer for diffeerent targets.
//
//===----------------------------------------------------------------------===//

#include "Legalizer.h"
#include "libpimeval.h"
#include "llvm/IR/IRBuilder.h"


namespace llvm {

    PimDataType Legalizer::convertLLVMTyToPIMTy(Type* Ty){
        Type* ElemTy = Ty;

        if(auto* VectorTy = dyn_cast<VectorType>(ElemTy)){
            ElemTy = VectorTy->getElementType();
        }

        if(ElemTy->isIntegerTy(8)){
            return PIM_INT8;
        }

        if(ElemTy->isIntegerTy(16)){
            return PIM_INT16;
        }

        if(ElemTy->isIntegerTy(32)){
            return PIM_INT32;
        }

        if(ElemTy->isIntegerTy(64)){
            return PIM_INT64;
        }


        assert(false && "Unsupported element type in Hydride Bitserial legalizer");
        return PIM_INT8;
    }


bool Legalizer::legalize(Function &F) {
    InstToObjectIDMap.clear();  


    SmallVector<Instruction *, 16> TargetAgnosticInstructions;
    ReversePostOrderTraversal<Function *> RPOT(&F);

    Instruction* RetInst = nullptr;
    for (auto *BB : RPOT) {
        for (Instruction &I : *BB) {
            if(isa<ReturnInst>(&I)){
                RetInst = &I;
            }
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

    bool IS_BITSIMD = bitsimd;
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

    if(!inserted_pim_init and bitsimd){

        Function* ParentFn = &F;
        BasicBlock& EntryBlock = ParentFn->getEntryBlock();

        //InsertPimInitCall(/* numCores */ 4, /* numRows*/ 512, /* numCols */ 512, EntryBlock.getFirstNonPHI());

        InsertPimInitCall(/* numRanks */ 4, /*numBankPerRank */ 128, /* numSubarrayPerBank */ 32  , /* numRows*/ 1024, /* numCols */ 1024, EntryBlock.getFirstNonPHI());
        inserted_pim_init = true;
    }

    InsertPimFreeCalls(RetInst);

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

    if(CallInst* CI = dyn_cast<CallInst>(InsertBefore)){
        Function* CF = CI->getCalledFunction();
        if(CF && CF->getName().startswith(StringRef("pimBroadCast"))){
            return;
        }

    }

    errs() << "Inserting BitSIMD allocations for "<<Args.size()<<" Bitvectors\n";

    LLVMContext& ctx = InsertBefore->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);
    Type* i64Ty = Type::getInt64Ty(ctx);

    Module* M = InsertBefore->getModule();
    Function* ParentFn = InsertBefore->getParent()->getParent();
    Function* AllocFunc = M->getFunction(pimAllocName);

    Function* AlignedAllocFunc = M->getFunction(pimAllocAssocName);
    // pimAlloc(PimAllocEnum allocType, uint64_t numElements, PimDataType dataType)
    if(!AllocFunc){
        std::vector<Type*>  AllocArgsTy = {i32Ty , i64Ty, i32Ty};
        FunctionType* AllocFuncTy = FunctionType::get(i32Ty, AllocArgsTy, /* isVarArgs */ false);

        AllocFunc = Function::Create(AllocFuncTy, Function::ExternalLinkage ,pimAllocName , M);
    }

    // pimAllocAssociated(PimObjId assocId, PimDataType dataType)
    if(!AlignedAllocFunc){
        std::vector<Type*>  AllocArgsTy = {i32Ty, i32Ty};
        FunctionType* AllocFuncTy = FunctionType::get(i32Ty, AllocArgsTy, /* isVarArgs */ false);
        AlignedAllocFunc = Function::Create(AllocFuncTy, Function::ExternalLinkage ,pimAllocAssocName , M);
    }

    
    for(Value* Arg : Args){
        if(InstToObjectIDMap.find(Arg) == InstToObjectIDMap.end()){

            errs () << "Argument: "<< *Arg << "\n";
            Type* ArgTy = Arg->getType();
            errs () << "Argument Type: "<< *ArgTy << "\n";
            FixedVectorType* FVTy = dyn_cast<FixedVectorType>(ArgTy);
            assert(FVTy && "Operand must be a fixed vector llvm type");
            Type* ElementType = FVTy->getElementType();
            unsigned num_elements = FVTy->getNumElements();

            
            Value* AllocationTy = ConstantInt::get(i32Ty, PIM_ALLOC_AUTO);
            // TODO: Replace with switch statement. Hard coded for now
            Value* PimDataType = ConstantInt::get(i32Ty, convertLLVMTyToPIMTy(ElementType));
            Value* Lanes = ConstantInt::get(i64Ty, num_elements);

            CallInst* AllocationCall = nullptr;
            if(AlignmentMap.find(ParentFn) != AlignmentMap.end()){
                std::vector<Value*> AllocationParams = {AlignmentMap[ParentFn] , PimDataType};
                AllocationCall = CallInst::Create(AlignedAllocFunc, AllocationParams, "pimAssocAlloc", InsertBefore);
            } else {
                std::vector<Value*> AllocationParams = {AllocationTy, Lanes, PimDataType};
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
    // pimCopyHostToDevice(void* src, PimObjId dest)
    if(!CopyFunc){
        std::vector<Type*>  CopyArgsTy = {i8PTy, i32Ty};
        FunctionType* CopyFuncTy = FunctionType::get(i32Ty, CopyArgsTy, /* isVarArgs */ false);
        CopyFunc = Function::Create(CopyFuncTy, Function::ExternalLinkage ,pimCopyHostToDeviceName , M);
    }

    Value* MemoryRef = BitCastInst::CreatePointerCast(HostAlloc, i8PTy, "", InsertBefore);

    Value* Bytes = ConstantInt::get(i32Ty, num_elements);
    Value* ObjectID = InstToObjectIDMap[Arg];
    std::vector<Value*> Args = {ObjectID, MemoryRef};

    CallInst* CopyCall = CallInst::Create(CopyFunc, Args, "pimHostToDevice", InsertBefore);
}



// Replace vectorized call to call PIM ISA Directly
void Legalizer::InsertBitSIMDCall(Function* InstFunction, std::vector<Value*> Args, Instruction* PimInst,  Instruction* InsertBefore){
    
    LLVMContext& ctx = PimInst->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);
    Value* CopyTy = ConstantInt::get(i32Ty, PIM_COPY_V);
    Value* Zero = ConstantInt::get(i32Ty, 0);

    std::vector<Value*> ObjIDs;
    if(InstFunction->getName().startswith(StringRef("pimBroadCast"))){
        errs () << "Processing broadcast instruction: "<< "\n";
        ObjIDs.push_back(CopyTy);

        assert(InstToObjectIDMap.find(PimInst) != InstToObjectIDMap.end() && "PimResult not in InstToObjectIDMap" );
        ObjIDs.push_back(InstToObjectIDMap[PimInst]) ;
        Value* BroadcastedValue = Args[0];
        if(FixedVectorType* FVTy = dyn_cast<FixedVectorType>(BroadcastedValue->getType())){
            errs() << "Need to extract value from "<< *BroadcastedValue << "\n";
            unsigned num_elements = FVTy->getNumElements();
            assert(num_elements == 1 && "Expected to broadcast scalar values");
            BroadcastedValue = ExtractElementInst::Create(BroadcastedValue, Zero, "ext.0", InsertBefore);
            errs() << "New Broadcasted value: "<< * BroadcastedValue << "\n";
        } 

        ObjIDs.push_back(BroadcastedValue);

    } else {

        for(auto* Arg: Args){
            assert(InstToObjectIDMap.find(Arg) != InstToObjectIDMap.end() && "PimArg not in InstToObjectIDMap");
            ObjIDs.push_back(InstToObjectIDMap[Arg]);
        }

        assert(InstToObjectIDMap.find(PimInst) != InstToObjectIDMap.end() && "PimResult not in InstToObjectIDMap" );
        ObjIDs.push_back(InstToObjectIDMap[PimInst]) ;

    }

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


        Value* MemoryRef = BitCastInst::CreatePointerCast(HostAlloc, i8PTy, "", PimInst);

        Value* ObjectID = InstToObjectIDMap[PimInst];
        std::vector<Value*> Args = {ObjectID, MemoryRef };


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
        if(name == "pimBroadCast"){
            CopyArgsTy.push_back(i32Ty);
            CopyArgsTy.push_back(i32Ty);
            CopyArgsTy.push_back(i32Ty);
        } else {
            for(int i = 0; i < num_symbolic_args ; i++){
                CopyArgsTy.push_back(i32Ty);
            }
        }
        FunctionType* PimFuncTy = FunctionType::get(i32Ty, CopyArgsTy, /* isVarArgs */ false);
        PimFunc = Function::Create(PimFuncTy, Function::ExternalLinkage ,name , M);
    }

    return PimFunc;


}



// PimStatus status = pimCreateDevice(PIM_FUNCTIONAL, numRanks, numBankPerRank, numSubarrayPerBank, numRows, numCols);
void Legalizer::InsertPimInitCall(int numRanks, int numBankPerRank, int numSubarrayPerBank , int numRows, int numCols, Instruction* InsertBefore){

    LLVMContext& ctx = InsertBefore->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);

    Module* M = InsertBefore->getModule();
    Function* InitFunc = M->getFunction(pimInitDeviceName);

    if(!InitFunc){
        std::vector<Type*>  InitArgsTy = {i32Ty, i32Ty,i32Ty, i32Ty, i32Ty, i32Ty};
        FunctionType* InitFuncTy = FunctionType::get(i32Ty, InitArgsTy, /* isVarArgs */ false);
        InitFunc = Function::Create(InitFuncTy, Function::ExternalLinkage ,pimInitDeviceName , M);
    }

    Value* DeviceSetting = ConstantInt::get(i32Ty, PIM_FUNCTIONAL);
    Value* NumRanks = ConstantInt::get(i32Ty, numRanks);
    Value* NumBankPerRank = ConstantInt::get(i32Ty, numBankPerRank);
    Value* NumSubarrayPerBank = ConstantInt::get(i32Ty, numSubarrayPerBank);
    Value* NumRows = ConstantInt::get(i32Ty, numRows);
    Value* NumCols = ConstantInt::get(i32Ty, numCols);

    std::vector<Value*> Args = {DeviceSetting, NumRanks, NumBankPerRank, NumSubarrayPerBank, NumRows, NumCols };


    CallInst* InitCall = CallInst::Create(InitFunc, Args, "pimInit", InsertBefore);


}

void Legalizer::InsertPimFreeCalls(Instruction* InsertBefore){
    LLVMContext& ctx = InsertBefore->getContext();
    Type* i8PTy = Type::getInt8PtrTy(ctx);
    Type* voidTy = Type::getVoidTy(ctx);
    Type* i32Ty = Type::getInt32Ty(ctx);

    Module* M = InsertBefore->getModule();
    Function* FreeFunc = M->getFunction(pimFreeName);

    if(!FreeFunc){
        std::vector<Type*>  FreeArgsTy = {i32Ty};
        FunctionType* FreeFuncTy = FunctionType::get(i32Ty, FreeArgsTy, /* isVarArgs */ false);
        FreeFunc = Function::Create(FreeFuncTy, Function::ExternalLinkage ,pimFreeName , M);
    }

    for(auto iter = InstToObjectIDMap.begin(); iter != InstToObjectIDMap.end(); iter++){
        Value* PimAlloc = iter->second;
        std::vector<Value*> Args = {PimAlloc};
        CallInst* FreeCall = CallInst::Create(FreeFunc, Args, "pimFree", InsertBefore);

    }



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
