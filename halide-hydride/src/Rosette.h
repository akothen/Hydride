#ifndef HL_ROSETTE_H
#define HL_ROSETTE_H

#include "Expr.h"
#include "Bounds.h"
#include <functional>
#include <map>
#include <set>
#include <string>

namespace Halide {

namespace Internal {
enum VarEncoding { Bitvector, Integer };

std::string expr_to_racket(const Expr &expr, int indent = 1);
std::string expr_to_racket(const Expr &expr, const std::map<std::string, VarEncoding> &encoding, const std::map<std::string, Expr> &let_vars, int indent = 1);

}  // namespace Internal

}  // namespace Halide

#endif  // HL_ROSETTE_H