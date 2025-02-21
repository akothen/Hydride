#ifndef LLVM_BITSIMDCEMITTER_H
#define LLVM_BITSIMDCEMITTER_H

#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "libpimeval.h"
#include <string>
#include <vector>
#include <map>

namespace llvm {

    class BitSIMDCEmitter : public FunctionPass {
        public:
            static char ID;

            BitSIMDCEmitter();

            // Function that runs on each LLVM Function
            bool runOnFunction(Function &F) override;

            // Helper function to get the C++ type corresponding to an LLVM type
            std::string getCppType(Type *type);
            std::string getCppScalarType(Type *type, bool add_t);

            // Function to return the named values of PimDataType enum as a string
            std::string getEnumDataTypeName(PimDataType dataType);


            // Function to return the named values of PimAllocEnum enum as a string
            std::string getPimAllocEnumName(PimAllocEnum allocType);

            std::string getFreshVariableName();


            std::string getFunctionPrototype(Function* F);

            // Function to check if the given Value is a PIM allocation call
            bool isPimAllocation(Value *val);
            std::string handlePimAllocation(Value* val);

            // Function to check if the given Value is a PIM deallocation call
            bool isPimFree(Value *val);
            std::string handlePimFree(Value* val);

            // Function to check if the given Value is a PIM allocation call
            bool isPimCopy(Value *val);
            std::string handlePimCopy(Value* val);

            // Function to check if the given Value is a PIM compute scalar op call
            bool isPimComputeScalarOp(Value *val);
            std::string handlePimComputeScalarOp(Value* val);

            // Function to check if the given Value is a PIM compute vector only op call
            bool isPimComputeVectorOp(Value *val);
            std::string handlePimComputeVectorOp(Value* val);


            // Helper Functions
            std::string getCalledFunctionName(Value* V);

            // Function to check if the given Value is a PIM-related instruction
            bool isPimInst(Value *val);
            std::string handlePimInst(Value *val);

        private:
            unsigned variableCounter; // Counter to generate fresh variable names
            std::string stringJoin(const std::vector<std::string> &strings, const std::string &separator) ;
            std::map<Value*, std::string> varMap;
            std::map<Value*, Value*> PointerToArgMap;
    };

} // namespace llvm

#endif // LLVM_BITSIMDCEMITTER_H

