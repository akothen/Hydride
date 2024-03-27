#ifndef HL_BITSERIAL_H
#define HL_BITSERIAL_H

#include "CodeGen_Internal.h"
#include "libpimsim.h"
#include "Bounds.h"
#include "Expr.h"
#include <functional>
#include <map>
#include <set>
#include <string>

namespace Halide {

namespace Internal {

    const std::string pimAllocName = "pimAlloc";
    const std::string pimAllocAssocName = "pimAllocAssociated";
    const std::string pimCopyHostToDeviceName = "pimCopyHostToDevice";
    const std::string pimCopyDeviceToHostName = "pimCopyDeviceToHost";
    const std::string pimBroadCastName = "pimBroadCast";
    
    // Map Halide Loads to PIM Allocation identifiers
    std::map<const Load *, Expr > LoadToPimIDMap;


    Expr PIMAllocate(Expr E);

    Expr PIMAllocateAssociated(Expr ObjId, Expr E);


    Expr PIMBroadCast(Expr ObjId, Expr E);

    Expr PimCopyHostToDevice(Expr ObjId, Expr E);

    Expr PimCopyDeviceToHostName(Expr ObjId, Expr E);



}  // namespace Internal

}  // namespace Halide

#endif  // HL_BITSERIAL_H
