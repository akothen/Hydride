#ifndef HL_ROSETTE_H
#define HL_ROSETTE_H

#include "Bounds.h"
#include "Expr.h"
#include <functional>
#include <map>
#include <set>
#include <string>

namespace Halide {

namespace Internal {
enum VarEncoding { Bitvector,
                   Integer };

std::string expr_to_racket(const Expr &expr, int indent = 1);
std::string expr_to_racket(const Expr &expr, const std::map<std::string, VarEncoding> &encoding, const std::map<std::string, Expr> &let_vars, int indent = 1);

Stmt hydride_optimize_hvx(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs);

Stmt hydride_optimize_x86(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs);
std::string type_to_rake_type(Type type, bool include_space, bool c_plus_plus);
std::string type_to_rake_elem_type(Type type, bool include_space, bool c_plus_plus);

Stmt hydride_preprocess_hvx(Stmt s);
Stmt hydride_preprocess_x86(Stmt s);

Stmt optimize_x86_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb);
Stmt optimize_arm_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb);
Stmt optimize_hexagon_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb);
}  // namespace Internal

}  // namespace Halide

#endif  // HL_ROSETTE_H
