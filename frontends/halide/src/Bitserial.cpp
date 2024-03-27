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

        Type i32Ty = Int(32);
        std::vector<Expr> args;
        Expr Allocation;
        if(E.node_type() == IRNodeType::Load){
            const Load* LI = E.as<Load>();

            int bits = LI->type.bits();
            int lanes = LI->type.lanes();

            int AllocationTy = PIM_ALLOC_V1;
            int  PimDataType = PIM_INT32;
            args.push_back(AllocationTy);
            args.push_back(lanes);
            args.push_back(bits);
            args.push_back(PimDataType);

            Allocation = Call::make(i32Ty, pimAllocName, args, Call::Extern);
            
            LoadToPimIDMap[LI] = Allocation.as<Call>();
        }

        return Allocation;
    }

    Expr PIMAllocateAssociated(Expr ObjId, Expr E){
        Type i32Ty = Int(32);
        std::vector<Expr> args;
        Expr Allocation;
        if(E.node_type() == IRNodeType::Load){
            const Load* LI = E.as<Load>();

            int bits = LI->type.bits();
            int lanes = LI->type.lanes();

            int AllocationTy = PIM_ALLOC_V1;
            int  PimDataType = PIM_INT32;
            args.push_back(AllocationTy);
            args.push_back(lanes);
            args.push_back(bits);
            args.push_back(ObjId);
            args.push_back(PimDataType);

            Allocation = Call::make(i32Ty, pimAllocAssocName, args, Call::Extern);
            
            LoadToPimIDMap[LI] = Allocation.as<Call>();
        }

        return Allocation;
    }



    Expr PIMBroadCast(Expr ObjId, Expr E){
        Type i32Ty = Int(32);
        std::vector<Expr> args;
        Expr BroadCast;
        if(E.node_type() == IRNodeType::Broadcast){
            const Broadcast* BI = E.as<Broadcast>();

            int bits = BI->type.bits();
            int lanes = BI->type.lanes();

            args.push_back(PIM_COPY_V);
            args.push_back(ObjId);
            args.push_back(E);

            BroadCast = Call::make(i32Ty, pimBroadCastName, args, Call::Extern);
            
        }
        return BroadCast;
    }



    Expr PimCopyHostToDevice(Expr ObjId, Expr E){
        Type i32Ty = Int(32);
        std::vector<Expr> args;
        Expr Copy;

        int bits = E.type().bits();
        int lanes = E.type().lanes();

        args.push_back(PIM_COPY_V);
        args.push_back(E);
        args.push_back(ObjId);

        Copy = Call::make(i32Ty,pimCopyHostToDeviceName , args, Call::Extern);

        return Copy;

    }


    Expr PimCopyDeviceToHostName(Expr ObjId, Expr E){
        Type i32Ty = Int(32);
        std::vector<Expr> args;
        Expr Copy;

        int bits = E.type().bits();
        int lanes = E.type().lanes();

        args.push_back(PIM_COPY_V);
        args.push_back(ObjId);
        args.push_back(E);

        Copy = Call::make(i32Ty,  pimCopyDeviceToHostName , args, Call::Extern);

        return Copy;

    }

}  // namespace Internal
}  // namespace Halide
