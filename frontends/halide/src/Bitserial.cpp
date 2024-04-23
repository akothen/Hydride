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

    // Map Halide Loads to PIM Allocation identifiers
    std::map<const Load *, Expr > LoadToPimIDMap;
    std::map<const Store *, Expr > StoreToPimIDMap;


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
        } else if(E.node_type() == IRNodeType::Store){
            const Store* SI = E.as<Store>();


            int bits = SI->value.type().bits();
            int lanes = SI->value.type().lanes();

            int AllocationTy = PIM_ALLOC_V1;
            int  PimDataType = PIM_INT32;
            args.push_back(AllocationTy);
            args.push_back(lanes);
            args.push_back(bits);
            args.push_back(PimDataType);

            Allocation = Call::make(i32Ty, pimAllocName, args, Call::Extern);
            StoreToPimIDMap[SI] = Allocation.as<Call>();

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


    Expr PIMAllocateWrapper(Expr E){

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
            args.push_back(E);
            debug(0)  << E << " Argument type: "<< E.type() << "\n";

            Allocation = Call::make(E.type(), pimAllocWrapperName, args, Call::Extern);

            
            LoadToPimIDMap[LI] = Allocation.as<Call>();
        } else if(E.node_type() == IRNodeType::Store){
            const Store* SI = E.as<Store>();


            int bits = SI->value.type().bits();
            int lanes = SI->value.type().lanes();

            int AllocationTy = PIM_ALLOC_V1;
            int  PimDataType = PIM_INT32;
            args.push_back(E);
            args.push_back(AllocationTy);
            args.push_back(lanes);
            args.push_back(bits);
            args.push_back(PimDataType);
            args.push_back(SI->value);

            Allocation = Call::make(SI->value.type(), pimAllocWrapperName, args, Call::Extern);
            StoreToPimIDMap[SI] = Allocation.as<Call>();

        }


        return Allocation;
    }

    Expr PIMAllocateAssociatedWrapper(Expr ObjId, Expr E){
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
            args.push_back(E);

            Allocation = Call::make(E.type(), pimAllocAssocWrapperName, args, Call::Extern);
            
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


    Expr PimCopyDeviceToHost(Expr ObjId, Expr E){
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

    Expr PimHandleLoad(const Load* LI){
        
        Expr PimAllocation;

        Expr LoadExpr = Load::make(LI->type, LI->name, LI->index, LI->image, LI->param, LI->predicate, LI->alignment);
        if(LoadToPimIDMap.find(LI) != LoadToPimIDMap.end()){
            PimAllocation = LoadToPimIDMap[LI];
        } else {
            PimAllocation = PIMAllocate(LoadExpr);
        }

        Expr Copy = PimCopyHostToDevice(PimAllocation, LoadExpr);

        return Copy;

    }

    Expr PimHandleLoadWrapper(const Load* LI){
        
        Expr PimAllocation;

        Expr LoadExpr = Load::make(LI->type, LI->name, LI->index, LI->image, LI->param, LI->predicate, LI->alignment);
        if(LoadToPimIDMap.find(LI) != LoadToPimIDMap.end()){
            PimAllocation = LoadToPimIDMap[LI];
        } else {
            PimAllocation = PIMAllocateWrapper(LoadExpr);
        }


        return PimAllocation;

    }



    Expr PimHandleLoadAssocWrapper(Expr ObjId, const Load* LI){
        
        Expr PimAllocation;

        Expr LoadExpr = Load::make(LI->type, LI->name, LI->index, LI->image, LI->param, LI->predicate, LI->alignment);
        if(LoadToPimIDMap.find(LI) != LoadToPimIDMap.end()){
            PimAllocation = LoadToPimIDMap[LI];
        } else {
            PimAllocation = PIMAllocateAssociatedWrapper(ObjId, LoadExpr);
        }
        return PimAllocation;

    }

    Expr PimHandleStore(const Store* SI){
        
        Expr PimAllocation;

        Stmt StoreExpr = Store::make(SI->name, SI->value,  SI->index, SI->param, SI->predicate, SI->alignment);
        if(StoreToPimIDMap.find(SI) != StoreToPimIDMap.end()){
            PimAllocation = StoreToPimIDMap[SI];
        } else {
            PimAllocation = PIMAllocate(SI->value);
        }

        Expr Copy = PimCopyDeviceToHost(PimAllocation, SI->value);

        return Copy;

    }

    Expr PimHandleLoadAssoc(Expr ObjId, const Load* LI){
        
        Expr PimAllocation;

        Expr LoadExpr = Load::make(LI->type, LI->name, LI->index, LI->image, LI->param, LI->predicate, LI->alignment);
        if(LoadToPimIDMap.find(LI) != LoadToPimIDMap.end()){
            PimAllocation = LoadToPimIDMap[LI];
        } else {
            PimAllocation = PIMAllocateAssociated(ObjId, LoadExpr);
        }

        Expr Copy = PimCopyHostToDevice(PimAllocation, LoadExpr);

        return Copy;

    }

    std::vector<Expr> PimHandleLoads(std::vector<const Load*> Loads){
        std::vector<Expr> Allocations;

        if(Loads.size() > 0){
            Expr Alloc0 = PimHandleLoad(Loads[0]);
            Allocations.push_back(Alloc0);

            for(int i = 1; i < Loads.size(); i++){
                Allocations.push_back(
                        PimHandleLoadAssoc(Alloc0,Loads[i])
                        );
            }

        }


        return Allocations;
        
    }

}  // namespace Internal
}  // namespace Halide
