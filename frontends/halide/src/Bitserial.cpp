#include "Bitserial.h"
#include "Bounds.h"
#include "CSE.h"
#include "CodeGen_Internal.h"
#include "ExprUsesVar.h"
#include "FindIntrinsics.h"
#include "HydrideCodeGen.h"
#include "IREquality.h"
#include "IRMutator.h"
#include "IROperator.h"
#include "IRPrinter.h"
#include "IRVisitor.h"
#include "ModulusRemainder.h"
#include "Simplify.h"
#include "Substitute.h"
#include <fstream>
#include <map>
#include <set>
#include <stack>

#include <chrono>

#define TRACE debug(0) << __FILE__ << ":" << __LINE__ << "\n"

using namespace std;

namespace Halide {

namespace Internal {

    Expr PIMAllocate(Expr E){

        std::string fn_name = "pimAlloc";
        Type i32Ty = Int(32);
        std::vector<Expr> args;
        Expr Allocation;
        if(E.node_type() == IRNodeType::Load){
            const Load* LI = E.as<Load>();

            int bits = LI->type.bits();
            int lanes = LI->type.lanes();

            int AllocationTy = 0;
            int  PimDataType = 0;
            args.push_back(AllocationTy);
            args.push_back(lanes);
            args.push_back(bits);
            args.push_back(PimDataType);

            Allocation = Call::make(i32Ty, fn_name, args, Call::Extern);
            
            LoadToPimIDMap[LI] = Allocation.as<Call>();
            

        }


        return Allocation;
    }

    Expr PIMAllocateAssociated(Expr E, Expr RefE){
        return RefE;
    }

}  // namespace Internal
}  // namespace Halide
