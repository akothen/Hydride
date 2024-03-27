#ifndef HL_BITSERIAL_H
#define HL_BITSERIAL_H

#include "CodeGen_Internal.h"
#include "Bounds.h"
#include "Expr.h"
#include <functional>
#include <map>
#include <set>
#include <string>

namespace Halide {

namespace Internal {
    
    // Map Halide Loads to PIM Allocation identifiers
    std::map<const Load *, Expr > LoadToPimIDMap;


    Expr PIMAllocate(Expr E);

    Expr PIMAllocateAssociated(Expr E, Expr RefE);



}  // namespace Internal

}  // namespace Halide

#endif  // HL_BITSERIAL_H
