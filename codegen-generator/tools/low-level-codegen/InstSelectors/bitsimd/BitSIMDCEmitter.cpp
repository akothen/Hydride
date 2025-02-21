#include "BitSIMDCEmitter.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/CFG.h"
#include "llvm/ADT/PostOrderIterator.h"


using namespace llvm;

char BitSIMDCEmitter::ID = 0;

BitSIMDCEmitter::BitSIMDCEmitter() : FunctionPass(ID) {}

bool BitSIMDCEmitter::runOnFunction(Function &F) {
    variableCounter = 0;

    // Implementation of the pass
    errs() << "Running BitSIMDCEmitter on function: " << F.getName() << "\n";

    if(!F.getName().contains("hydride")) return false;

    std::vector<std::string> statements;

    std::string prototype = getFunctionPrototype(&F);
    statements.push_back(prototype);
    statements.push_back("{"); // Opening brace of function defintion

    // Perform reverse post-order traversal on basic blocks in the function
    ReversePostOrderTraversal<Function*> RPOT(&F);

    // Iterate over each basic block in reverse post-order
    for (BasicBlock *BB : RPOT) {
        errs() << "BasicBlock: " << BB->getName() << "\n";

        // Iterate over each instruction in the basic block
        for (Instruction &I : *BB) {
            if(isPimInst(&I)){

            } else if(ReturnInst* RI = dyn_cast<ReturnInst>(&I)){

            } else if(StoreInst* SI = dyn_cast<StoreInst>(&I)){

            } else if(LoadInst* LI = dyn_cast<LoadInst>(&I)){

            }
        }
    }

    statements.push_back("}"); // Closing brace of function defintion

    std::string functionDef = stringJoin(statements, "\n");
    errs() << functionDef << "\n";
    return false; // No modifications done to the function.
}



std::string BitSIMDCEmitter::stringJoin(const std::vector<std::string> &strings, const std::string &separator) {
    if (strings.empty()) {
        return ""; // Return an empty string if the vector is empty
    }

    std::string result;

    // Iterate over the vector and append strings with the separator
    for (size_t i = 0; i < strings.size(); ++i) {
        result += strings[i];
        if (i != strings.size() - 1) { // Don't add separator after the last element
            result += separator;
        }
    }

    return result;
}

std::string BitSIMDCEmitter::getCppScalarType(Type *type, bool add_t) {
    if (type->isIntegerTy()) {
        switch (type->getIntegerBitWidth()) {
            case 1:  return add_t ? "int1_t" : "int1";
            case 8:  return add_t ? "int8_t" : "int8";
            case 16: return add_t ?"int16_t" : "int16";
            case 32: return add_t ?"int32_t" : "int32";
            case 64: return add_t ?"int64_t" : "int64";
            default: return "unknown integer type";
        }
    } else if (type->isFloatingPointTy()) {
        if (type->isFloatTy()) {
            return "float";
        } else if (type->isDoubleTy()) {
            return "double";
        } else if (type->isHalfTy()) {
            return "half";
        }
    } else if (type->isVoidTy()) {
        return "void";
    } else if (type->isPointerTy()) {
        return "pointer";
    }

    // Add more cases as needed
    return "unknown type";
}
std::string BitSIMDCEmitter::getCppType(Type *type) {
    if(FixedVectorType* FVTy = dyn_cast<FixedVectorType>(type)){
        Type* ElemTy = FVTy->getElementType();
        unsigned numElements = FVTy->getNumElements();
        std::string scalarTy = getCppScalarType(ElemTy, numElements == 1);
        std::string suffix = numElements == 1 ? "" : "x" + std::to_string(numElements);

        return scalarTy + suffix;

    } else {
        return  getCppScalarType(type, /* add_t */ true);
    }
}

std::string BitSIMDCEmitter::getEnumDataTypeName(PimDataType dataType) {
    switch (dataType) {
        case PIM_INT8:   return "PIM_INT8";
        case PIM_INT16:  return "PIM_INT16";
        case PIM_INT32:  return "PIM_INT32";
        case PIM_INT64:  return "PIM_INT64";
        case PIM_UINT8:  return "PIM_UINT8";
        case PIM_UINT16: return "PIM_UINT16";
        case PIM_UINT32: return "PIM_UINT32";
        case PIM_UINT64: return "PIM_UINT64";
        case PIM_FP32:   return "PIM_FP32";
        case PIM_FP16:   return "PIM_FP16";
        case PIM_BF16:   return "PIM_BF16";
        case PIM_FP8:    return "PIM_FP8";
        default:         return "Unknown PimDataType";
    }
}


std::string BitSIMDCEmitter::getPimAllocEnumName(PimAllocEnum allocType) {
    switch (allocType) {
        case PIM_ALLOC_AUTO: return "PIM_ALLOC_AUTO";
        case PIM_ALLOC_V:    return "PIM_ALLOC_V";
        case PIM_ALLOC_H:    return "PIM_ALLOC_H";
        case PIM_ALLOC_V1:   return "PIM_ALLOC_V1";
        case PIM_ALLOC_H1:   return "PIM_ALLOC_H1";
        default:             return "Unknown PimAllocEnum";
    }
}

std::string BitSIMDCEmitter::getFreshVariableName(){
    std::string baseName = "var_"; 
    return baseName + std::to_string(variableCounter++);
}

// Function to check if the given Value is a PIM allocation call
bool BitSIMDCEmitter::isPimAllocation(Value *val) {
    // Check if the value is a CallInst
    if (auto *callInst = dyn_cast<CallInst>(val)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            // Check if the called function's name matches "pimAlloc" or "pimAllocAssociated"
            StringRef funcName = calledFunction->getName();
            if (funcName == "pimAlloc" || funcName == "pimAllocAssociated") {
                return true;
            }
        }
    }
    return false;
}


// Function to check if the given Value is a PIM allocation call
bool BitSIMDCEmitter::isPimCopy(Value *val) {
    // Check if the value is a CallInst
    if (auto *callInst = dyn_cast<CallInst>(val)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            StringRef funcName = calledFunction->getName();
            if (funcName == "pimCopyHostToDevice" || funcName == "pimCopyDeviceToHost") {
                return true;
            }
        }
    }
    return false;
}

std::string BitSIMDCEmitter::handlePimInst(Value* val){

    if(isPimCopy(val)){
        return handlePimCopy(val);
    } else if(isPimAllocation(val)){
        return handlePimAllocation(val);
    } else if(isPimComputeScalarOp(val)){
        return handlePimComputeScalarOp(val);
    } else if(isPimComputeVectorOp(val)){
        return handlePimComputeVectorOp(val);
    } else{
        assert(false && "Unreachable pimInst");
        return "";
    }
}

std::string BitSIMDCEmitter::handlePimCopy(Value* val){
    assert(isPimCopy(val) && "Expected PimCopy Call");

    CallInst* CI = dyn_cast<CallInst>(val);
    std::string funcName = getCalledFunctionName(CI);

    std::string return_type = "auto";
    std::string return_name = getFreshVariableName();
    varMap[val] = return_name;


    std::vector<std::string> tokens = {return_type, return_name, "=", funcName, "("};

    if(funcName == "pimCopyHostToDevice"){
        Value* HostPtr = CI->getArgOperand(0)->stripPointerCasts();
        Value* HostArg = PointerToArgMap[HostPtr];
        std::string host_vector_data = varMap[HostArg] + ".data()";
        tokens.push_back(host_vector_data);
        tokens.push_back(",");

        Value* DstID = CI->getArgOperand(1);
        tokens.push_back(varMap[DstID]);

    } else {

        Value* SrcID = CI->getArgOperand(0);
        tokens.push_back(varMap[SrcID]);
        tokens.push_back(",");

        Value* HostPtr = CI->getArgOperand(1)->stripPointerCasts();
        Value* HostArg = PointerToArgMap[HostPtr];
        std::string host_vector_data = varMap[HostArg] + ".data()";
        tokens.push_back(host_vector_data);
    }

    tokens.push_back(");");

    return stringJoin(tokens, " ");
}

std::string BitSIMDCEmitter::getCalledFunctionName(Value* V){

    if (auto *callInst = dyn_cast<CallInst>(V)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            StringRef funcName = calledFunction->getName();
            return funcName.str();
        }
    }
    return "";
}

std::string BitSIMDCEmitter::handlePimAllocation(Value* val){
    assert(isPimAllocation(val) && "Expected PimAllocation Call");

    CallInst* CI = dyn_cast<CallInst>(val);
    std::string funcName = getCalledFunctionName(CI);

    std::string return_type = "auto";
    std::string return_name = getFreshVariableName();

    varMap[val] = return_name;

    std::vector<std::string> tokens = {return_type, return_name, "=", funcName, "("};

    if(funcName == "pimAlloc"){
        // Allocation Enum
        Value* AllocTy = CI->getArgOperand(0);
        ConstantInt* AllocTyInt = dyn_cast<ConstantInt>(AllocTy);
        assert(AllocTyInt && "Allocation Type must be a compile time constant");
        PimAllocEnum enumTy = PimAllocEnum(AllocTyInt->getSExtValue());
        tokens.push_back(getPimAllocEnumName(enumTy));
        tokens.push_back(",");

        // Num Elements: Currently since we're emitting via Hydride, 
        // this is expected to be a constant value
        Value* NumValues = CI->getArgOperand(1);
        ConstantInt* NumValuesInt = dyn_cast<ConstantInt>(NumValues);
        assert(NumValuesInt && "NumValues must be a compile time constant");
        tokens.push_back(std::to_string(NumValuesInt->getSExtValue()));
        tokens.push_back(",");

        // PimDataType Enum
        Value* DataType = CI->getArgOperand(2);
        ConstantInt* DataTypeInt = dyn_cast<ConstantInt>(DataType);
        assert(DataTypeInt && "pimDataType must be a compile time constant");
        PimDataType enumDataTy = PimDataType(DataTypeInt->getSExtValue());
        tokens.push_back(getEnumDataTypeName(enumDataTy));


    } else {

        // AssocID
        Value* AssocID = CI->getArgOperand(0);
        tokens.push_back(varMap[AssocID]);
        tokens.push_back(",");


        // PimDataType Enum
        Value* DataType = CI->getArgOperand(1);
        ConstantInt* DataTypeInt = dyn_cast<ConstantInt>(DataType);
        assert(DataTypeInt && "pimDataType must be a compile time constant");
        PimDataType enumDataTy = PimDataType(DataTypeInt->getSExtValue());
        tokens.push_back(getEnumDataTypeName(enumDataTy));

    }

    tokens.push_back(");");

    return stringJoin(tokens, " ");
}


// Function to check if the given Value is a PIM-related instruction
bool BitSIMDCEmitter::isPimInst(Value *val) {
    // Check if the value is a CallInst
    if (auto *callInst = dyn_cast<CallInst>(val)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            // Check if the called function's name contains "pim"
            StringRef funcName = calledFunction->getName();
            if (funcName.contains("pim")) {
                return true;
            }
        }
    }
    return false;
}

bool BitSIMDCEmitter::isPimFree(Value *val) {
    // Check if the value is a CallInst
    if (auto *callInst = dyn_cast<CallInst>(val)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            // Check if the called function's name contains "pim"
            StringRef funcName = calledFunction->getName();
            if (funcName.contains("pimFree")) {
                return true;
            }
        }
    }
    return false;
}

std::string BitSIMDCEmitter::handlePimFree(Value* val){

    CallInst* CI = dyn_cast<CallInst>(val);
    std::string funcName = getCalledFunctionName(CI);
    std::string return_type = "auto";
    std::string return_name = getFreshVariableName();
    varMap[val] = return_name;

    Value* ObjID = CI->getArgOperand(0);
    std::string cpp_label = varMap[ObjID];

    std::vector<std::string> tokens = {return_type, return_name, "=", funcName, "(", cpp_label, ")"};

    return stringJoin(tokens, " ");
}

bool BitSIMDCEmitter::isPimComputeScalarOp(Value *val) {
    // Check if the value is a CallInst
    if (auto *callInst = dyn_cast<CallInst>(val)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            // Check if the called function's name contains "pim"
            StringRef funcName = calledFunction->getName();
            if (funcName.contains("Scaled") || funcName.contains("Scalar")) {
                return true;
            }
        }
    }
    return false;
}

std::string BitSIMDCEmitter::handlePimComputeScalarOp(Value* val){

    CallInst* CI = dyn_cast<CallInst>(val);
    std::string funcName = getCalledFunctionName(CI);
    std::string return_type = "auto";
    std::string return_name = getFreshVariableName();
    varMap[val] = return_name;

    
    std::vector<std::string> param_tokens;
    
    // Currently it looks like the mixed vector scalar ops contain the scalar value only 
    // at the end
    unsigned num_args = CI->getNumArgOperands();
    for(unsigned i = 0; i < num_args - 1; i++){
        Value* Opnd = CI->getArgOperand(i);
        param_tokens.push_back(varMap[Opnd]);
    }
    Value* ScalarArg = CI->getArgOperand(num_args - 1);

    if (auto *SExt = dyn_cast<SExtInst>(ScalarArg)) {
        ScalarArg = SExt->getOperand(0); // Return the original operand before sign extension
    } else if (auto *ZExt = dyn_cast<ZExtInst>(ScalarArg)) {
        ScalarArg =  ZExt->getOperand(0); // Return the original operand before zero extension
    }

    if(auto* EE = dyn_cast<ExtractElementInst>(ScalarArg)){
        ScalarArg = EE->getVectorOperand(); 
    }

    std::string scalarArgName = varMap[ScalarArg];
    param_tokens.push_back(scalarArgName);

    std::string param_use = stringJoin(param_tokens, ",");



    std::vector<std::string> tokens = {return_type, return_name, "=", funcName, "(", param_use, ")"};

    return stringJoin(tokens, " ");
}

bool BitSIMDCEmitter::isPimComputeVectorOp(Value *val) {
    // Check if the value is a CallInst
    if (auto *callInst = dyn_cast<CallInst>(val)) {
        // Get the called function
        if (Function *calledFunction = callInst->getCalledFunction()) {
            // Check if the called function's name contains "pim"
            StringRef funcName = calledFunction->getName();
            if (funcName.contains("pim") 
                    &&  !funcName.contains("Scalar")
                    &&  !funcName.contains("Scaled")
                    &&  !funcName.contains("Copy")
                    &&  !funcName.contains("Free")
               ) {
                return true;
            }
        }
    }
    return false;
}

std::string BitSIMDCEmitter::handlePimComputeVectorOp(Value* val){
    CallInst* CI = dyn_cast<CallInst>(val);
    std::string funcName = getCalledFunctionName(CI);
    std::string return_type = "auto";
    std::string return_name = getFreshVariableName();
    varMap[val] = return_name;

    
    std::vector<std::string> param_tokens;
    for(unsigned i = 0; i < CI->getNumArgOperands(); i++){
        Value* Opnd = CI->getArgOperand(i);
        param_tokens.push_back(varMap[Opnd]);
    }
    std::string param_use = stringJoin(param_tokens, ",");



    std::vector<std::string> tokens = {return_type, return_name, "=", funcName, "(", param_use, ")"};

    return stringJoin(tokens, " ");
}

std::string BitSIMDCEmitter::getFunctionPrototype(Function* F){

    std::vector<std::string> tokens;


    Type* RetTy = F->getReturnType();
    std::string cpp_ret_type = getCppType(RetTy);
    tokens.push_back(cpp_ret_type);


    // C++ identifier names do not allow '.' where as LLVM does
    std::string sanatized_name = F->getName().str();
    std::replace(sanatized_name.begin(), sanatized_name.end(), '.', '_');
    tokens.push_back(sanatized_name);


    std::vector<std::string> param_tokens;
    for(auto &Arg : F->args()){
        
        std::string cpp_param_ty = getCppType(Arg.getType());
        param_tokens.push_back(cpp_param_ty);
        varMap[&Arg] = getFreshVariableName();
        std::string param_def = cpp_param_ty + " " + varMap[&Arg]; 
        param_tokens.push_back(param_def);
    }

    std::string cpp_func_params = "(" + stringJoin(param_tokens, ", ") + ")";
    tokens.push_back(cpp_func_params);


    return stringJoin(tokens, " ");
}



// Register the pass with LLVM
static RegisterPass<BitSIMDCEmitter> X("bitsimdce", "BitSIMD C Emitter Pass", false, false);

