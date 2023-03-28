#ifndef HL_HYDRIDE_CODEGEN_H
#define HL_HYDRIDE_CODEGEN_H

#include "Expr.h"
#include "Bounds.h"
#include <functional>
#include <string>


#include "ExprUsesVar.h"
#include "Substitute.h"
#include "CodeGen_Internal.h"
#include "Bounds.h"
#include "CSE.h"
#include "FindIntrinsics.h"
#include "IRMutator.h"
#include "IROperator.h"
#include "IREquality.h"
#include "IRPrinter.h"
#include "IRVisitor.h"
#include "ModulusRemainder.h"
#include "Simplify.h"
#include "Substitute.h"
#include <fstream>
#include <stack>
#include <set>
#include <map>

#include <chrono>

namespace Halide {

    namespace Internal {


        void hydride_generate_llvm_bitcode(Target::Arch t, std::string input_file, std::string output_file, std::string benchmark_name);


    }  // namespace Internal

}  // namespace Halide

#endif // HL_HYDRIDE_CODEGEN_H  
