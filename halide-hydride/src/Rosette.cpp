#include "Rosette.h"

#include "Bounds.h"
#include "CSE.h"
#include "FindIntrinsics.h"
#include "IRMutator.h"
#include "IROperator.h"
#include "IRPrinter.h"
#include "IRVisitor.h"
#include "ModulusRemainder.h"
#include "Simplify.h"
#include "Substitute.h"
#include <fstream>
#include <stack>
#include <set>

using namespace std;

namespace Halide {

namespace Internal {
namespace {

typedef std::map<std::string, VarEncoding> Encoding;

// Takes the input Halide IR and converts it to Rosette syntax
class ExprPrinter : public VariadicVisitor<ExprPrinter, std::string, std::string> {

    IRPrinter printer;
    std::stack<int> indent;
    std::stack<VarEncoding> mode;

    // Context of the expression being printed:-
    //   - let_vars holds all of the let expressions defined in the program thus far
    //   - encoding maps variable names to the Rosette encoding that should be used for them
    std::map<std::string, Expr> let_vars;
    Encoding encoding;

    std::string tabs() {
        std::string ret = "";
        for (int i = 0; i < indent.top(); i++)
            ret += " ";
        return ret;
    }

    // This is for development and debug purposes, clumsily shuts down the compilation after
    // printing a NYI message.
    std::string NYI() {
        debug(0) << "\nNYI. \n";
        exit(0);
        return "";
    }

    // Helper functions

    std::string print_intrinsic (std::string name, std::vector<Expr> args, bool is_scalar_intrin) {
        if (is_scalar_intrin) {
            std::string rkt_args = "";

            for (unsigned int i = 0; i < args.size(); i++)
                rkt_args += " " + dispatch(args[i]);

            return tabs() + "(sca-" + name + rkt_args + ")";
        } else {
            std::string rkt_args = "";

            indent.push(indent.top() + 1);
            for (unsigned int i = 0; i < args.size(); i++)
                rkt_args += "\n" + dispatch(args[i]);
            indent.pop();

            return tabs() + "(vec-" + name + rkt_args + ")";
        }
    }

    std::string print_binary_op (std::string bv_name, std::string int_name, Expr a, Expr b, bool is_vector_op) {
        if (is_vector_op) {
            indent.push(indent.top() + 1);
            std::string rkt_lhs = dispatch(a);
            std::string rkt_rhs = dispatch(b);
            indent.pop();
            return tabs() + "(vec-" + bv_name + "\n" + rkt_lhs + "\n" + rkt_rhs + ")";
        } else {//if (mode.top() == VarEncoding::Bitvector) {
            std::string rkt_lhs = dispatch(a);
            std::string rkt_rhs = dispatch(b);
            return tabs() + "(sca-" + bv_name + " " + rkt_lhs + " " + rkt_rhs + ")";
        }  //else {
           //std::string rkt_lhs = dispatch(a);
           //std::string rkt_rhs = dispatch(b);
           //return tabs() + "(" + int_name + " " + rkt_lhs + " " + rkt_rhs + ")";
        //}
    }

public:

    // Constructor
    ExprPrinter(std::ostream &s, Encoding enc, std::map<std::string, Expr> lvs, int i = 1) : printer(s) {
        indent.push(i);
        mode.push(VarEncoding::Bitvector);
        let_vars = lvs;
        encoding = enc;
    }

    void int_mode() {
        while (!mode.empty())
            mode.pop();
        mode.push(VarEncoding::Integer);
    }

    void bv_mode() {
        while (!mode.empty())
            mode.pop();
        mode.push(VarEncoding::Bitvector);
    }

    /** Currently we do not do any re-writing at the Stmt level. Therefore, printing statements is not supported. */

    std::string visit(const LetStmt *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const AssertStmt *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const For *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Provide *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Store *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Allocate *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Evaluate *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const ProducerConsumer *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Block *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Realize *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Prefetch *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Free *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Acquire *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const Fork *op) {
        printer.print(op);
        return NYI();
    }
    std::string visit(const IfThenElse *op) {
        printer.print(op);
        return NYI();
    }

    /* Constants and Variables */

    std::string visit(const Variable *op) {
        return tabs() + op->name;
    }

    std::string visit(const IntImm *op) {
        if (mode.top() == VarEncoding::Bitvector)
            return tabs() + " (bv " +
                std::to_string(op->value) + " " + std::to_string(op->type.bits()) + ")";
        else
            return tabs() + std::to_string(op->value);
    }

    std::string visit(const UIntImm *op) {
        if (mode.top() == VarEncoding::Bitvector)
            return tabs() + " (bv " +
                std::to_string(op->value) + " " + std::to_string(op->type.bits()) + ")";
        else
            return tabs() + std::to_string(op->value);
    }

    std::string visit(const FloatImm *op) {
        printer.print(op);
        return NYI();
    }

    std::string visit(const StringImm *op) {
        printer.print(op);
        return NYI();
    }

    /* Halide IR Operators */

    std::string visit(const Add *op) {
        return print_binary_op("add", "+", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Sub *op) {
        return print_binary_op("sub", "-", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Mul *op) {
        return print_binary_op("mul", "*", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Div *op) {
        return print_binary_op("div", "quotient", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Mod *op) {
        return print_binary_op("mod", "modulo", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Min *op) {
        return print_binary_op("min", "min", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Max *op) {
        return print_binary_op("max", "max", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const EQ *op) {
        return print_binary_op("eq", "eq?", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const NE *op) {
        return print_binary_op("ne", "ne?", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const LT *op) {
        return print_binary_op("lt", "<", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const LE *op) {
        return print_binary_op("le", "<=", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const GT *op) {
        return print_binary_op("gt", ">", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const GE *op) {
        return print_binary_op("ge", ">", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const And *op) {
        return print_binary_op("and", "and", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Or *op) {
        return print_binary_op("or", "or", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Not *op) {
        if (op->type.is_vector()) {
            indent.push(indent.top() + 1);
            std::string rkt_val = dispatch(op->a);
            indent.pop();
            return tabs() + "(vec-not\n" + rkt_val + ")";
        } else if (mode.top() == VarEncoding::Bitvector) {
            return tabs() + "(sca-not " + dispatch(op->a) + ")";
        } else {
            return tabs() + "(not " + dispatch(op->a) + ")";
        }
    }

    std::string visit(const Broadcast *op) {
        indent.push(0);
        std::string rkt_type = std::to_string(op->lanes);
        std::string rkt_val = dispatch(op->value);
        indent.pop();
        return tabs() + "(x" + rkt_type + " " + rkt_val + ")";
    }

    std::string get_type_string(Type t) {
        std::ostringstream stream;
        stream << t;
        return stream.str();
    }

    std::string visit(const Cast *op) {
        const std::string type_string = get_type_string(op->type);

        if (op->type.is_scalar() && mode.top() == Integer) {
            return tabs() + dispatch(op->value);
        } 
        else if (op->type.is_scalar()) {
            const std::string rkt_val = dispatch(op->value);
            return tabs() + "(" + type_string + "x1 " + rkt_val + ")";
        } else {
            indent.push(indent.top() + 1);
            const std::string rkt_val = dispatch(op->value);
            indent.pop();
            return tabs() + "(" + type_string + "\n" + rkt_val + ")";
        }
    }

    std::string visit(const Let *op) {
        // Set the correct encoding mode
        mode.push(encoding[op->name]);
        std::string rkt_val = dispatch(op->value);
        mode.pop();

        indent.push(indent.top() + 1);
        std::string rkt_bdy = dispatch(op->body);
        indent.pop();

        return tabs() + "(let ([" + op->name + " " + rkt_val + "])\n" + rkt_bdy + ")";
    }

    std::string visit(const Call *op) {
        std::set<string> cpp_types{"int8_t", "int16_t", "int32_t", "int64_t",
                                   "uint8_t", "uint16_t", "uint32_t", "uint64_t"};

        if (cpp_types.count(op->name)) {
            std::string rkt_args = "";

            indent.push(indent.top() + 1);
            for (unsigned int i = 0; i < op->args.size(); i++)
                rkt_args += "\n" + dispatch(op->args[i]);
            indent.pop();

            return tabs() + "(" + op->name + rkt_args + ")";
        } 
        else if (op->is_intrinsic(Call::dynamic_shuffle)) {
            indent.push(indent.top() + 1);

            // Print the lookup table in (default) bit-vector mode
            std::string rkt_args = "\n" + dispatch(op->args[0]);

            // Print the lookup indexes in integer mode
            mode.push(VarEncoding::Integer);
            for (unsigned int i = 1; i < op->args.size(); i++)
                rkt_args += "\n" + dispatch(op->args[i]);
            mode.pop();
            indent.pop();

            return tabs() + "(" + op->name + rkt_args + ")";
        } 
        else if (op->is_intrinsic(Call::shift_right)) {
            return print_intrinsic("shr", op->args, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::shift_left)) {
            return print_intrinsic("shl", op->args, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::absd)) {
            return print_intrinsic("absd", op->args, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::bitwise_and)) {
            return print_intrinsic("bwand", op->args, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::bitwise_xor)) {
            return print_intrinsic("bwxor", op->args, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::count_leading_zeros)) {
            return print_intrinsic("clz", op->args, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::if_then_else)) {
            vector<Expr> args_fixed = op->args;
            if (op->args[0].type().is_scalar())
                args_fixed[0] = Broadcast::make(op->args[0], op->args[1].type().lanes());
            return print_intrinsic("if", args_fixed, op->type.is_scalar());
        } 
        else if (op->is_intrinsic(Call::reinterpret)) {
            internal_assert(op->args.size() == 1);
            const std::string call_string = tabs() + "(vec-reinterpret" + "\n";
            const std::string type_string = get_type_string(op->type.element_of());
            indent.push(indent.top() + 1);
            const std::string arg = dispatch(op->args[0]);
            const std::string full_type_string = "\n" + tabs() + "\'" + type_string + " " + std::to_string(op->type.lanes());
            indent.pop();
            return call_string + arg + full_type_string + ")";
        } 
        else {
            return print_intrinsic(op->name, op->args, op->type.is_scalar());
        }
    }

    std::string visit(const Load *op) {
        indent.push(0);

        // Print index
        mode.push(VarEncoding::Integer);
        std::string rkt_idx = dispatch(op->index);
        std::string alignment = std::string("(aligned ") +
                                std::to_string(op->alignment.modulus) + std::string(" ") +
                                std::to_string(op->alignment.remainder) + ")";
        mode.pop();
        indent.pop();

        if (op->type.is_scalar() && mode.top() == VarEncoding::Integer)
            return tabs() + "(" + op->name + " " + rkt_idx + ")";
        else if (op->type.is_scalar())
            return tabs() + "(load-sca " + op->name + " " + rkt_idx + ")";
        else
            return tabs() + "(load " + op->name + " " + rkt_idx + " " + alignment + ")";
    }

    std::string visit(const Ramp *op) {
        indent.push(0);
        std::string rkt_base = dispatch(op->base);
        std::string rkt_stride = dispatch(op->stride);
        std::string rkt_lanes = std::to_string(op->lanes);
        indent.pop();
        return tabs() + "(ramp " + rkt_base + " " + rkt_stride + " " + rkt_lanes + ")";
    }

    std::string visit(const Select *op) {
        if (op->type.is_vector()) {
            Expr cond = (op->condition.type().is_scalar() ?
                             Broadcast::make(op->condition, op->true_value.type().lanes()) :
                             op->condition);
            indent.push(indent.top() + 1);
            std::string rkt_cond = dispatch(cond);
            std::string rkt_true = dispatch(op->true_value);
            std::string rkt_false = dispatch(op->false_value);
            indent.pop();
            return tabs() + "(vec-if\n" + rkt_cond + "\n" + rkt_true + "\n" + rkt_false + ")";
        } else if (mode.top() == VarEncoding::Bitvector) {
            std::string rkt_cond = dispatch(op->condition);
            std::string rkt_true = dispatch(op->true_value);
            std::string rkt_false = dispatch(op->false_value);
            return tabs() + "(sca-if " + rkt_cond + " " + rkt_true + " " + rkt_false + ")";
        } else {
            std::string rkt_cond = dispatch(op->condition);
            std::string rkt_true = dispatch(op->true_value);
            std::string rkt_false = dispatch(op->false_value);
            return tabs() + "(if " + rkt_cond + " " + rkt_true + " " + rkt_false + ")";
        }
    }

    std::string visit(const Shuffle *op) {
        if (op->is_slice()) {
            indent.push(indent.top() + 1);
            std::string rkt_vec = dispatch(op->vectors[0]);
            indent.pop();
            indent.push(0);
            mode.push(VarEncoding::Integer);
            std::string rkt_base = std::to_string(op->slice_begin());
            std::string rkt_stride = std::to_string(op->slice_stride());
            std::string rkt_len = std::to_string(op->indices.size());
            mode.pop();
            indent.pop();

            return tabs() + "(slice_vectors\n" + rkt_vec + " " + rkt_base + " " + rkt_stride + " " + rkt_len + ")";
        } 
        else if (op->is_broadcast()) {
            indent.push(indent.top() + 1);
            std::string rkt_vec = dispatch(op->vectors[0]);
            indent.pop();
            indent.push(0);
            mode.push(VarEncoding::Integer);
            std::string rkt_fac = std::to_string(op->broadcast_factor());
            mode.pop();
            indent.pop();

            return tabs() + "(vec-broadcast " + rkt_fac + "\n" + rkt_vec + ")";
        } 
        else if (op->is_interleave()) {
            switch (op->vectors.size()) {
            case 2: {
                indent.push(indent.top() + 1);
                std::string rkt_lhs = dispatch(op->vectors[0]);
                std::string rkt_rhs = dispatch(op->vectors[1]);
                indent.pop();
                return tabs() + "(interleave\n" + rkt_lhs + "\n" + rkt_rhs + ")";
            }
            case 4: {
                indent.push(indent.top() + 1);
                indent.push(indent.top() + 1);
                std::string rkt_vec0 = dispatch(op->vectors[0]);
                std::string rkt_vec1 = dispatch(op->vectors[1]);
                std::string rkt_vec2 = dispatch(op->vectors[2]);
                std::string rkt_vec3 = dispatch(op->vectors[3]);
                indent.pop();
                std::string rkt_lhs = tabs() + "(interleave\n" + rkt_vec0 + "\n" + rkt_vec2 + ")";
                std::string rkt_rhs = tabs() + "(interleave\n" + rkt_vec1 + "\n" + rkt_vec3 + ")";
                indent.pop();
                return tabs() + "(interleave\n" + rkt_lhs + "\n" + rkt_rhs + ")";
            }
            default:
                return NYI();
            }
        } 
        else if (op->is_concat()) {
            switch (op->vectors.size()) {
            case 2: {
                indent.push(indent.top() + 1);
                std::string rkt_lhs = dispatch(op->vectors[0]);
                std::string rkt_rhs = dispatch(op->vectors[1]);
                indent.pop();
                return tabs() + "(concat_vectors\n" + rkt_lhs + "\n" + rkt_rhs + ")";
            }
            case 4: {
                indent.push(indent.top() + 1);
                indent.push(indent.top() + 1);
                std::string rkt_vec0 = dispatch(op->vectors[0]);
                std::string rkt_vec1 = dispatch(op->vectors[1]);
                std::string rkt_vec2 = dispatch(op->vectors[2]);
                std::string rkt_vec3 = dispatch(op->vectors[3]);
                indent.pop();
                std::string rkt_lhs = tabs() + "(concat_vectors\n" + rkt_vec0 + "\n" + rkt_vec1 + ")";
                std::string rkt_rhs = tabs() + "(concat_vectors\n" + rkt_vec2 + "\n" + rkt_vec3 + ")";
                indent.pop();
                return tabs() + "(concat_vectors\n" + rkt_lhs + "\n" + rkt_rhs + ")";
            }
            case 5: {
                indent.push(indent.top() + 1);
                indent.push(indent.top() + 1);
                indent.push(indent.top() + 1);
                std::string rkt_vec0 = dispatch(op->vectors[0]);
                std::string rkt_vec1 = dispatch(op->vectors[1]);
                std::string rkt_vec2 = dispatch(op->vectors[2]);
                std::string rkt_vec3 = dispatch(op->vectors[3]);
                std::string rkt_vec4 = dispatch(op->vectors[4]);
                indent.pop();
                std::string sub_expr0 = tabs() + "(concat_vectors\n" + rkt_vec0 + "\n" + rkt_vec1 + ")";
                std::string sub_expr1 = tabs() + "(concat_vectors\n" + rkt_vec2 + "\n" + rkt_vec3 + ")";
                indent.pop();
                std::string rkt_lhs = tabs() + "(concat_vectors\n" + sub_expr0 + "\n" + sub_expr1 + ")";
                std::string rkt_rhs = tabs() + rkt_vec4;
                indent.pop();
                return tabs() + "(concat_vectors\n" + rkt_lhs + "\n" + rkt_rhs + ")";
            }
            case 8: {
                indent.push(indent.top() + 1);
                indent.push(indent.top() + 1);
                indent.push(indent.top() + 1);
                std::string rkt_vec0 = dispatch(op->vectors[0]);
                std::string rkt_vec1 = dispatch(op->vectors[1]);
                std::string rkt_vec2 = dispatch(op->vectors[2]);
                std::string rkt_vec3 = dispatch(op->vectors[3]);
                std::string rkt_vec4 = dispatch(op->vectors[4]);
                std::string rkt_vec5 = dispatch(op->vectors[5]);
                std::string rkt_vec6 = dispatch(op->vectors[6]);
                std::string rkt_vec7 = dispatch(op->vectors[7]);
                indent.pop();
                std::string sub_expr0 = tabs() + "(concat_vectors\n" + rkt_vec0 + "\n" + rkt_vec1 + ")";
                std::string sub_expr1 = tabs() + "(concat_vectors\n" + rkt_vec2 + "\n" + rkt_vec3 + ")";
                std::string sub_expr2 = tabs() + "(concat_vectors\n" + rkt_vec4 + "\n" + rkt_vec5 + ")";
                std::string sub_expr3 = tabs() + "(concat_vectors\n" + rkt_vec6 + "\n" + rkt_vec7 + ")";
                indent.pop();
                std::string rkt_lhs = tabs() + "(concat_vectors\n" + sub_expr0 + "\n" + sub_expr1 + ")";
                std::string rkt_rhs = tabs() + "(concat_vectors\n" + sub_expr2 + "\n" + sub_expr3 + ")";
                indent.pop();
                return tabs() + "(concat_vectors\n" + rkt_lhs + "\n" + rkt_rhs + ")";
            }
            default:
                printer.print(op);
                return NYI();
            }
        }
        printer.print(op);
        return NYI();
    }

    std::string visit(const VectorReduce *op) {
        std::string rkt_op = "";
        switch (op->op) {
        case VectorReduce::Add: rkt_op = "add"; break;
        case VectorReduce::SaturatingAdd: rkt_op = "sadd"; break;
        case VectorReduce::Mul: rkt_op = "mul"; break;
        case VectorReduce::Min: rkt_op = "min"; break;
        case VectorReduce::Max: rkt_op = "max"; break;
        case VectorReduce::And: rkt_op = "and"; break;
        case VectorReduce::Or: rkt_op = "or"; break;
        }
        indent.push(indent.top() + 1);
        std::string rkt_val = dispatch(op->value);
        indent.pop();
        return tabs() + "(vector_reduce '" + rkt_op + " " +
               std::to_string(op->value.type().lanes() / op->type.lanes()) + "\n" + rkt_val + ")";
    }
};

void insert_encodings(Encoding &encoding, const Encoding &other) {
    for (const auto &item : other) {
        const auto [iter, success] = encoding.insert({item.first, item.second});
        if (!success) {
            internal_assert(iter->second == item.second) << "mismatching encodings: " << iter->first << " is: " << iter->second << " -> " << item.second << "\n";
        }
    }
}

class InferVarEncodings : public IRVisitor {
    std::stack<bool> inside_indexing_expr;
    Encoding encoding;
    std::map<std::string, Expr> let_vars;
    std::map<std::string, Expr> llet_vars;

public:
    using IRVisitor::visit;

    InferVarEncodings(const std::map<std::string, Expr> &lvs, const std::map<std::string, Expr> &llvs) {
        inside_indexing_expr.push(false);
        let_vars = lvs;
        llet_vars = llvs;
    }

    void visit(const Variable *op) override {
        if (inside_indexing_expr.top()) {
            encoding[op->name] = Integer;

            // Recurse through let-expressions
            if (llet_vars.count(op->name))
                llet_vars[op->name].accept(this);
        } 
        else
            encoding[op->name] = Bitvector;
    }

    void visit(const Call *op) override {
        if (op->name == std::string("dynamic_shuffle")) {
            op->args[0].accept(this);
            inside_indexing_expr.push(true);
            for (unsigned int i = 1; i < op->args.size(); i++)
                op->args[i].accept(this);
            inside_indexing_expr.pop();
        } else
            IRVisitor::visit(op);
    }

    void visit(const Let *op) override {
        op->body.accept(this);
        if (encoding[op->name] == Integer)
            inside_indexing_expr.push(true);
        op->value.accept(this);
        if (encoding[op->name] == Integer)
            inside_indexing_expr.pop();
    }

    void visit(const Load *op) override {
        encoding[op->name] = (inside_indexing_expr.top() ? Integer : Bitvector);
        inside_indexing_expr.push(true);
        op->index.accept(this);
        op->predicate.accept(this);
        inside_indexing_expr.pop();
    }

    std::map<std::string, VarEncoding> getEncodings() {
        return encoding;
    }
};

}

Encoding get_encoding(const Expr &expr, const std::map<std::string, Expr> &let_vars, const std::map<std::string, Expr> &llet_vars) {
    // Infer which encoding to use for symbolic vars
    InferVarEncodings ive(let_vars, llet_vars);
    expr.accept(&ive);
    return ive.getEncodings();
}

std::string expr_to_racket(const Expr &expr, int indent) {
    std::map<std::string, Expr> let_vars;  // Empty by default.
    const auto encoding = get_encoding(expr, let_vars, let_vars);
    return expr_to_racket(expr, encoding, let_vars, indent);
}

std::string expr_to_racket(const Expr &expr, const Encoding &encoding, const std::map<std::string, Expr> &let_vars, int indent) {
    // Print spec expr as Rosette code
    ExprPrinter specPrinter(std::cout, encoding, let_vars, indent);
    return specPrinter.dispatch(expr);
}
}
}