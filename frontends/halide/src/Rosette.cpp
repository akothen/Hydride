#include "Rosette.h"
#include "DistributeVec.h"
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

int expr_id = 0;

// ABSD is a complex operation which is represented as
// a call node in Halide. Optionally decompose absd into
// sequence of arithmetic op.
bool SIMPLIFY_ABSD = true;

bool SIMPLIFY_RAMP = true;
bool HVX_TARGET = true;
bool SIMPLIFY_WIDEN_MUL = false;

std::string target_str = "";

namespace Internal {

namespace {
enum HydrideSupportedArchitecture {
    HVX,
    ARM,
    X86,
    BitSerial
};

typedef std::map<std::string, VarEncoding> Encoding;

// For variables below load instruction
// we do not need to emit any strings
// as the code generator in LLVM
// would handle those.
std::set<const IRNode *> SkipNodes;

std::map<unsigned, const Load *> RegToLoadMap;  // Map racket register expressions to Halide Load Instructions
std::map<const Load *, unsigned> LoadToRegMap;  // Map racket register expressions to Halide Load Instructions

std::map<unsigned, const Variable *> RegToVariableMap;  // Map racket register expressions to Halide Load Instructions
std::map<const Variable *, unsigned> VariableToRegMap;  // Map racket register expressions to Halide Load Instructions

// Targets such as HVX do not have division
// operations, so we must replace operations
// using division to instead use shifts
class ReplaceDiv : public IRMutator {
    using IRMutator::visit;

    Expr visit(const Div *op) override {

        if (!op->type.is_float() && op->type.is_vector() && !is_const(op->b, 2)) {
            auto lowered_div = lower_int_uint_div(op->a, op->b);
            debug(0) << "Halide Lowered Div to: " << lowered_div << "\n";
            return mutate(lowered_div);
        }

        return IRMutator::visit(op);
    }

    Expr visit(const Call *op) override {

        if (arch == HydrideSupportedArchitecture::ARM && op->is_intrinsic(Call::shift_right)) {
            debug(0) << "Found shr\n";
            // if (!op->type.is_float() && op->type.is_vector()) {
            //     debug(0) << "Lowering armshr to armshl\n";
            //     return (op->args[0] << simplify(-op->args[1]));
            // }
            // Current legalizer doesn't support immediate argument
            if (!op->type.is_float() && op->type.is_vector() && !is_const(op->args[1])) {
                debug(0) << "Lowering armshr to armshl\n";
                return op->args[0] << simplify(-op->args[1]);
            }
        }

        return IRMutator::visit(op);
    }

    Expr visit(const Mul *op) override {

        /*

        size_t bits = op->type.bits();
        size_t lanes = op->type.lanes();

        if(!op->type.is_float() && op->type.is_vector() && (bits == 32) && (lanes == 64)){
            debug(0) << "Found multiplication to slice!" << "\n";
            Expr left_op_first_half = (Shuffle::make_slice(op->a, 0, 1 , 32));
            Expr right_op_first_half = (Shuffle::make_slice(op->b, 0, 1 , 32));

            Expr left_op_second_half = (Shuffle::make_slice(op->a, 32, 1 , 32));
            Expr right_op_second_half = (Shuffle::make_slice(op->b, 32, 1 , 32));




            Expr left_mul = (Mul::make(left_op_first_half, right_op_first_half));
            Expr right_mul =  (Mul::make(left_op_second_half, right_op_second_half));

            Expr lowered_mul = (Shuffle::make_concat({left_mul, right_mul}));
            debug(0) << "Halide Lowered Mul to: "<<lowered_mul <<"\n";
            return mutate(lowered_mul);
        }*/

        return IRMutator::visit(op);
    }

    // For certain targets, even when broadcasting elements of
    // certain sizes, they often padd the bits to fit the word (e.g. 32 bits)
    // Without loss of generality, depending on the target, we modify our broadcasts
    // to accomodate such behavior when needed.
    // Expr visit(const Broadcast *op) override {

    //     size_t lanes = op->type.lanes();

    //     if (lanes == 1) {
    //         return op->value;
    //     }

    //     if (is_const(op->value)) {
    //         return op;
    //     }

    //     if (!op->type.is_float() && op->type.is_vector()) {

    //         size_t bits = op->type.bits();

    //         if (bits == 16 && op->value.type().lanes() != 2) {

    //             debug(0) << "======"
    //                      << "\n";
    //             debug(0) << "Orignal bits: " << bits << ", Original lanes: " << lanes << "\n";
    //             Expr Broadcast2 = Broadcast::make(op->value, 2);
    //             Expr ModifiedBroadcast = Broadcast::make(Broadcast2, lanes / 2);
    //             debug(0) << "Modified broadcast to " << ModifiedBroadcast << "\n";
    //             debug(0) << "Modified broadcast bits  " << ModifiedBroadcast.type().bits() << " and lanes " << ModifiedBroadcast.type().lanes() << "\n";
    //             return ModifiedBroadcast;
    //         }

    //         else if (bits == 8 && op->value.type().lanes() != 4) {

    //             debug(0) << "======"
    //                      << "\n";
    //             debug(0) << "Orignal bits: " << bits << ", Original lanes: " << lanes << "\n";
    //             Expr Broadcast2 = Broadcast::make(op->value, 4);
    //             Expr ModifiedBroadcast = Broadcast::make(Broadcast2, lanes / 4);
    //             debug(0) << "Modified broadcast to " << ModifiedBroadcast << "\n";
    //             debug(0) << "Modified broadcast bits  " << ModifiedBroadcast.type().bits() << " and lanes " << ModifiedBroadcast.type().lanes() << "\n";
    //             return ModifiedBroadcast;
    //         }

    //         else {
    //             return op;
    //         }
    //     }

    //     return op;
    // }

public:
    ReplaceDiv(HydrideSupportedArchitecture _arch)
        : arch(_arch) {
    }

private:
    HydrideSupportedArchitecture arch;
};

// Takes the input Halide IR and converts it to Rosette syntax
class ExprPrinter : public VariadicVisitor<ExprPrinter, std::string, std::string> {

    IRPrinter printer;
    std::stack<int> indent;
    std::stack<VarEncoding> mode;
    std::set<std::string> defined;

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

    std::string print_intrinsic(std::string name, std::vector<Expr> args, bool is_scalar_intrin) {
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

    std::string print_binary_op(std::string bv_name, std::string int_name, Expr a, Expr b, bool is_vector_op) {
        if (is_vector_op) {
            indent.push(indent.top() + 1);
            std::string rkt_lhs = dispatch(a);
            std::string rkt_rhs = dispatch(b);
            indent.pop();
            return tabs() + "(vec-" + bv_name + "\n" + rkt_lhs + "\n" + rkt_rhs + ")";
        } else {  // if (mode.top() == VarEncoding::Bitvector) {
            std::string rkt_lhs = dispatch(a);
            std::string rkt_rhs = dispatch(b);
            return tabs() + "(sca-" + bv_name + " " + rkt_lhs + " " + rkt_rhs + ")";
        }  // else {
        // std::string rkt_lhs = dispatch(a);
        // std::string rkt_rhs = dispatch(b);
        // return tabs() + "(" + int_name + " " + rkt_lhs + " " + rkt_rhs + ")";
        // }
    }

public:
    // Constructor
    ExprPrinter(std::ostream &s, Encoding enc, std::map<std::string, Expr> lvs, int i = 1)
        : printer(s) {
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
        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            return "";
        }

        if (defined.find(op->name) != defined.end()) {
            return tabs() + op->name;
        }

        for (auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end(); bi++) {
            const Variable *vop = bi->first;

            if (vop->name == op->name) {
                std::string reg_name = "reg_" + std::to_string(VariableToRegMap[vop]);
                return tabs() + reg_name;
            }
        }

        if (VariableToRegMap.find(op) != VariableToRegMap.end()) {
            std::string reg_name = "reg_" + std::to_string(VariableToRegMap[op]);
            return tabs() + reg_name;
        }

        // Traverse variable map to update as well

        std::string bits = std::to_string(op->type.bits() * op->type.lanes());
        unsigned reg_counter = (RegToLoadMap.size() + RegToVariableMap.size());

        std::string reg_name = "reg_" + std::to_string(reg_counter);
        std::cout << op->name << " maps to " << reg_name << "\n";

        RegToVariableMap[reg_counter] = op;
        VariableToRegMap[op] = reg_counter;
        return tabs() + reg_name;  // op->name;
    }

    std::string visit(const IntImm *op) {

        std::string reg_name = "(int-imm (bv " + std::to_string(op->value) + " " + std::to_string(op->type.bits()) + ")" + " #t)";

        if (mode.top() == VarEncoding::Bitvector)
            return tabs() + reg_name;
        else
            return tabs() + std::to_string(op->value);
    }

    std::string visit(const UIntImm *op) {

        std::string reg_name = "(int-imm (bv " + std::to_string(op->value) + " " + std::to_string(op->type.bits()) + ")" + " #f)";

        if (mode.top() == VarEncoding::Bitvector)
            return tabs() + reg_name;
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

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }

        std::string add_str = print_binary_op("add", "+", op->a, op->b, op->type.is_vector());

        return add_str;
    }

    std::string visit(const Sub *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("sub", "-", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Mul *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("mul", "*", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Div *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("div", "quotient", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Mod *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("mod", "modulo", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Min *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        std::string min_emit = print_binary_op("min", "min", op->a, op->b, op->type.is_vector());

        return min_emit;
    }

    std::string visit(const Max *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("max", "max", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const EQ *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("eq", "eq?", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const NE *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("ne", "ne?", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const LT *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("lt", "<", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const LE *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("le", "<=", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const GT *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("gt", ">", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const GE *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("ge", ">", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const And *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("and", "and", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Or *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            SkipNodes.insert(op->b.get());
            return "";
        }
        return print_binary_op("or", "or", op->a, op->b, op->type.is_vector());
    }

    std::string visit(const Not *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->a.get());
            return "";
        }

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

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->value.get());
            return "";
        }

        indent.push(0);
        std::string rkt_type = std::to_string(op->lanes);
        std::string rkt_val = dispatch(op->value);
        // std::cout << "Broadcast "<<rkt_val << "to x"<<rkt_type <<"\n";
        indent.pop();
        return tabs() + "(xBroadcast " + rkt_val + " " + rkt_type + ")";
    }

    std::string get_type_string(Type t) {
        std::ostringstream stream;
        stream << t;
        return stream.str();
    }

    std::string visit(const Cast *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->value.get());
            return "";
        }

        const std::string type_string = get_type_string(op->type);
        std::cout << "Cast operation into: " << type_string << "\n";

        if (op->type.is_scalar() && mode.top() == Integer) {
            return tabs() + dispatch(op->value);
        } else if (op->type.is_scalar()) {
            const std::string rkt_val = dispatch(op->value);
            return tabs() + "(" + type_string + "x1 " + rkt_val + ")";
        } else {
            indent.push(indent.top() + 1);
            const std::string rkt_val = dispatch(op->value);
            indent.pop();
            bool use_generalized_cast = true;

            if (use_generalized_cast) {
                std::string lanes_str = std::to_string(op->type.lanes());
                std::string bits_str = std::to_string(op->type.bits());
                if (op->type.is_uint()) {
                    return tabs() + "(cast-uint" + "\n" + rkt_val + " " + lanes_str + " " + bits_str + ")";
                } else {
                    return tabs() + "(cast-int" + "\n" + rkt_val + " " + lanes_str + " " + bits_str + ")";
                }
            } else {
                return tabs() + "(" + type_string + "\n" + rkt_val + ")";
            }
        }
    }

    std::string visit(const Let *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->value.get());
            SkipNodes.insert(op->body.get());
            return "";
        }

        defined.insert(op->name);

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
        } else if (op->is_intrinsic(Call::dynamic_shuffle)) {
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
        } else if (op->is_intrinsic(Call::saturating_add)) {
            return print_intrinsic("sat-add", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::saturating_sub)) {
            return print_intrinsic("sat-sub", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::widening_mul)) {
            return print_intrinsic("widen-mul", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::shift_right)) {
            return print_intrinsic("shr", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::shift_left)) {
            return print_intrinsic("shl", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::absd)) {
            return print_intrinsic("absd", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::bitwise_and)) {
            return print_intrinsic("bwand", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::bitwise_not)) {
            return print_intrinsic("bwnot", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::abs)) {
            return print_intrinsic("abs", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::bitwise_xor)) {
            return print_intrinsic("bwxor", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::count_leading_zeros)) {
            return print_intrinsic("clz", op->args, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::if_then_else)) {
            vector<Expr> args_fixed = op->args;
            if (op->args[0].type().is_scalar())
                args_fixed[0] = Broadcast::make(op->args[0], op->args[1].type().lanes());
            return print_intrinsic("if", args_fixed, op->type.is_scalar());
        } else if (op->is_intrinsic(Call::reinterpret)) {
            internal_assert(op->args.size() == 1);
            const std::string call_string = tabs() + "(vec-reinterpret" + "\n";
            const std::string type_string = get_type_string(op->type.element_of());
            indent.push(indent.top() + 1);
            const std::string arg = dispatch(op->args[0]);
            const std::string full_type_string = "\n" + tabs() + "\'" + type_string + " " + std::to_string(op->type.lanes());
            indent.pop();
            return call_string + arg + full_type_string + ")";
        } else {
            return print_intrinsic(op->name, op->args, op->type.is_scalar());
        }
    }

    std::string visit(const Load *op) {
        indent.push(0);
        debug(0) << "Emitting load \n";

        SkipNodes.insert(op->predicate.get());
        SkipNodes.insert(op->index.get());

        // Print index
        mode.push(VarEncoding::Integer);
        std::string rkt_idx = dispatch(op->index);
        std::string alignment = std::string("(aligned ") +
                                std::to_string(op->alignment.modulus) + std::string(" ") +
                                std::to_string(op->alignment.remainder) + ")";
        mode.pop();
        indent.pop();

        if (LoadToRegMap.find(op) != LoadToRegMap.end()) {
            return "reg_" + std::to_string(LoadToRegMap[op]);
        }

        // Traverse loads and check if equal?
        if (LoadToRegMap.find(op) != LoadToRegMap.end()) {
            return "reg_" + std::to_string(LoadToRegMap[op]);
        }

        if (op->type.is_scalar() && mode.top() == VarEncoding::Integer)
            return tabs() + "(" + op->name + " " + rkt_idx + ")";
        else if (op->type.is_scalar()) {
            // std::string cpp_type = type_to_rake_type(op->type, false, true);

            std::string bits = std::to_string(op->type.bits() * 1);
            unsigned reg_counter = RegToLoadMap.size() + RegToVariableMap.size();
            std::string reg_name = "reg_" + std::to_string(reg_counter);
            RegToLoadMap[reg_counter] = op;
            LoadToRegMap[op] = reg_counter;
            // std::string load_buff = define_load_buffer(op);
            return tabs() + reg_name;  //" (?? (bitvector "+ std::to_string(op->type.bits())+")"+")";
            // return tabs() + "(load-sca " + op->name + " " + rkt_idx + ")";
        } else {
            std::string bits = std::to_string(op->type.bits() * op->type.lanes());
            unsigned reg_counter = RegToLoadMap.size() + RegToVariableMap.size();
            std::string reg_name = "reg_" + std::to_string(reg_counter);
            RegToLoadMap[reg_counter] = op;
            LoadToRegMap[op] = reg_counter;
            // std::string load_buff = define_load_buffer(op);
            return tabs() + reg_name;  //+ load_buff + "\n"+ "(load " + reg_name + " " + rkt_idx + " " + alignment + ")";
            // return tabs() + "(load " + op->name + " " + rkt_idx + " " + alignment + ")";
        }
    }

    std::string visit(const Ramp *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->base.get());
            SkipNodes.insert(op->stride.get());
            return "";
        }

        indent.push(0);
        std::string rkt_base = dispatch(op->base);
        std::string rkt_stride = dispatch(op->stride);
        std::string rkt_lanes = std::to_string(op->lanes);
        indent.pop();
        return tabs() + "(ramp " + rkt_base + " " + rkt_stride + " " + rkt_lanes + ")";
    }

    std::string visit(const Select *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->condition.get());
            SkipNodes.insert(op->true_value.get());
            SkipNodes.insert(op->false_value.get());
            return "";
        }

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

    std::string emit_general_concat_vectors(const std::vector<Expr> &vectors, int start, int end) {
        bool is_even = ((end - start) % 2) == 0;
        debug(0) << "start: " << start << ", end: " << end << ", is_even: " << is_even << "\n";
        if (start + 1 == end || start == end) {
            std::string rkt_lhs = dispatch(vectors[start]);
            return rkt_lhs;
        }

        if (is_even) {
            int mid_point = (end + start) / 2;
            std::string rkt_lhs = emit_general_concat_vectors(vectors, start, mid_point);
            std::string rkt_rhs = emit_general_concat_vectors(vectors, mid_point, end);
            return "(concat_vectors\n" + rkt_lhs + " " + rkt_rhs + ")\n";
        } else {
            // Seperate out odd element from the end
            std::string concat_even = emit_general_concat_vectors(vectors, start, end - 1);

            return "(concat_vectors\n" + concat_even + " " + dispatch(vectors[end - 1]) + ")\n";
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
        } else if (op->is_broadcast()) {
            indent.push(indent.top() + 1);
            std::string rkt_vec = dispatch(op->vectors[0]);
            indent.pop();
            indent.push(0);
            mode.push(VarEncoding::Integer);
            std::string rkt_fac = std::to_string(op->broadcast_factor());
            mode.pop();
            indent.pop();

            return tabs() + "(vec-broadcast " + rkt_fac + "\n" + rkt_vec + ")";
        } else if (op->is_interleave()) {
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
        } else if (op->is_concat()) {
            /*
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
                        debug(0) << "Concat vectors with number of vectors: "<<op->vectors.size()<<"\n";
                        printer.print(op);
                        return NYI();
            }
            */
            return tabs() + emit_general_concat_vectors(op->vectors, 0, op->vectors.size());
        }
        printer.print(op);
        return NYI();
    }

    std::string visit(const VectorReduce *op) {

        if (SkipNodes.find((const IRNode *)op) != SkipNodes.end()) {
            SkipNodes.insert(op->value.get());
            return "";
        }
        std::string rkt_op = "";
        switch (op->op) {
        case VectorReduce::Add:
            rkt_op = "add";
            break;
        case VectorReduce::SaturatingAdd:
            rkt_op = "sadd";
            break;
        case VectorReduce::Mul:
            rkt_op = "mul";
            break;
        case VectorReduce::Min:
            rkt_op = "min";
            break;
        case VectorReduce::Max:
            rkt_op = "max";
            break;
        case VectorReduce::And:
            rkt_op = "and";
            break;
        case VectorReduce::Or:
            rkt_op = "or";
            break;
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
        } else
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

class GatherVars : public IRVisitor {
    Scope<> let_vars;

public:
    using IRVisitor::visit;

    void visit(const Variable *var) override {
        if (!let_vars.contains(var->name)) {
            names.insert(var->name);
        }
    }

    void visit(const Let *let) override {
        let->value.accept(this);
        ScopedBinding<>(let_vars, let->name);
        let->body.accept(this);
    }

    std::set<std::string> names;
};

}  // namespace

Encoding get_encoding(const Expr &expr, const std::map<std::string, Expr> &let_vars, const std::map<std::string, Expr> &llet_vars) {
    // Infer which encoding to use for symbolic vars
    InferVarEncodings ive(let_vars, llet_vars);
    expr.accept(&ive);
    return ive.getEncodings();
}

std::string expr_to_racket(const Expr &expr, int indent) {
    std::cout << "Invoked Expression to Racket"
              << "\n";
    std::map<std::string, Expr> let_vars;  // Empty by default.
    const auto encoding = get_encoding(expr, let_vars, let_vars);
    return expr_to_racket(expr, encoding, let_vars, indent);
}

std::string expr_to_racket(const Expr &expr, const Encoding &encoding, const std::map<std::string, Expr> &let_vars, int indent) {
    // Print spec expr as Rosette code
    ExprPrinter specPrinter(std::cout, encoding, let_vars, indent);
    return specPrinter.dispatch(expr);
}

std::function<std::string(const Expr &, bool, bool)> get_expr_racket_dispatch(const Expr &expr, const Encoding &encoding, const std::map<std::string, Expr> &let_vars) {
    // Print spec expr as Rosette code
    // Reference: https://stackoverflow.com/questions/27775233/lambdas-and-capture-by-reference-local-variables-accessing-after-the-scope
    auto specPrinter = std::make_shared<ExprPrinter>(std::cout, encoding, let_vars);
    return [specPrinter](const Expr &expr, bool set_mode, bool int_mode) {
        // TODO: this got really messy... Is there a cleaner way?
        if (set_mode) {
            if (int_mode) {
                specPrinter->int_mode();
            } else {
                specPrinter->bv_mode();
            }
        }
        return specPrinter->dispatch(expr);
    };
}

std::string type_to_rake_elem_type(Type type, bool include_space, bool c_plus_plus) {
    bool needs_space = true;
    std::ostringstream oss;

    if (type.is_bfloat()) {
        oss << "bfloat" << type.bits();
    } else if (type.is_float()) {
        if (type.bits() == 32) {
            oss << "float";
        } else if (type.bits() == 64) {
            oss << "double";
        } else {
            oss << "float" << type.bits();
        }
    } else {
        switch (type.bits()) {
        /*
        case 1:
            // bool vectors are always emitted as uint8 in the C++ backend
            if (type.is_vector()) {
                //oss << "uint1x" << type.lanes() << "_t";


            } else {
                oss << "uint1";
            }
            break;
            */
        default:
            if (type.is_uint()) {
                oss << "u";
            }
            oss << "int" << type.bits();
        }
    }
    if (include_space && needs_space) {
        oss << " ";
    }
    return oss.str();
}

std::string type_to_rake_type(Type type, bool include_space, bool c_plus_plus) {
    bool needs_space = true;
    std::ostringstream oss;

    if (type.is_bfloat()) {
        oss << "bfloat" << type.bits() << "_t";
    } else if (type.is_float()) {
        if (type.bits() == 32) {
            oss << "float";
        } else if (type.bits() == 64) {
            oss << "double";
        } else {
            oss << "float" << type.bits() << "_t";
        }
        if (type.is_vector()) {
            oss << type.lanes();
        }
    } else {
        switch (type.bits()) {
        case 1:
            // bool vectors are always emitted as uint8 in the C++ backend
            if (type.is_vector()) {
                oss << "uint8x" << type.lanes() << "_t";
            } else {
                oss << "uint1_t";
            }
            break;
        default:
            if (type.is_uint()) {
                oss << "u";
            }
            oss << "int" << type.bits();
            if (type.is_vector()) {
                oss << "x" << type.lanes();
            }
            oss << "_t";
        }
    }
    if (include_space && needs_space) {
        oss << " ";
    }
    return oss.str();
}

//>>>>>>>>>>>>>>>>> Hydride Integration

namespace Hydride {

bool should_inline_let(std::map<std::string, Expr> external_let_vars, std::string var_name) {
    if (external_let_vars.count(var_name)) {
        Expr e = external_let_vars[var_name];
        return e.node_type() == IRNodeType::Ramp || e.node_type() == IRNodeType::Load ||
               e.node_type() == IRNodeType::Broadcast;
    }
    return false;
}

// Extract the set of input variables that appear in the expression. These are modelled as symbolic
// constants in the synthesizer queries
class InferSymbolics : public IRVisitor {

    std::map<std::string, Expr> external_let_vars;
    std::map<std::string, Expr> external_llet_vars;
    Scope<Interval> &bounds;
    FuncValueBounds func_value_bounds;
    Encoding encoding;

    std::set<std::string> live_lets;
    std::set<const Variable *> live_vars;
    std::set<std::string> local_vars;
    std::set<std::pair<std::string, Type>> buffers;

public:
    using IRVisitor::visit;

    InferSymbolics(std::map<std::string, Expr> lvs, std::map<std::string, Expr> llvs, Scope<Interval> &bnds,
                   FuncValueBounds fvb, Encoding enc)
        : external_let_vars(lvs), external_llet_vars(llvs), bounds(bnds), func_value_bounds(fvb), encoding(enc) {
    }

    void visit(const Variable *op) override {
        if (op->type.is_vector()) {
            auto b = bounds_of_expr_in_scope(op, bounds, func_value_bounds);
            debug(1) << "Var Found: " << op->name << "\n"
                     << "Bounds: " << b.min << " ... " << b.max << "\n";
        }

        if (external_llet_vars.count(op->name) && encoding[op->name] == Integer) {
            external_llet_vars[op->name].accept(this);
            live_lets.insert(op->name);
        } else if (should_inline_let(external_let_vars, op->name)) {
            external_let_vars[op->name].accept(this);
            live_lets.insert(op->name);
        } else {
            live_vars.insert(op);
        }
    }

    void visit(const Let *op) override {
        local_vars.insert(op->name);
        IRVisitor::visit(op);
    }

    void visit(const Load *op) override {
        auto b = bounds_of_expr_in_scope(op, bounds, func_value_bounds);
        debug(1) << "Load Found: " << op->name << "\n"
                 << "Bound: " << b.min << " ... " << b.max << "\n";
        buffers.insert(std::pair<std::string, Type>(op->name, (op->type.is_vector() ? op->type.element_of() : op->type)));

        IRVisitor::visit(op);
    }

    std::set<const Variable *> getSymVars() {
        std::set<const Variable *> l;
        for (auto var : live_vars) {
            if (local_vars.count(var->name) == 0)
                l.insert(var);
        }
        return l;
    }

    std::set<std::pair<std::string, Type>> getSymBufs() {
        return buffers;
    }

    std::set<std::string> getLiveLets() {
        return live_lets;
    }
};

class FoldLoadStores : public IRMutator {
    using IRMutator::mutate;
    using IRMutator::visit;

public:
    std::set<const IRNode *> &DeadStatements;

    FoldLoadStores(std::set<const IRNode *> &DeadStatements)
        : DeadStatements(DeadStatements) {
        debug(0) << "Invoked Fold Load Stores"
                 << "\n";
    }

    Scope<std::map<const Store *, Expr>> MemMap;
    std::stack<std::string> scope_name;

    std::set<const IRNode *> getDeadStatements() {
        return DeadStatements;
    }

    bool isConstantValue(const Expr v) {
        if (v.node_type() == IRNodeType::IntImm) {
            return true;
        }

        if (v.node_type() == IRNodeType::UIntImm) {
            return true;
        }

        if (v.node_type() == IRNodeType::Broadcast) {
            const Broadcast *b = v.as<Broadcast>();

            return isConstantValue(b->value);
        }

        return false;
    }

    void UpdateDeadStatements(std::map<const Store *, Expr> &Context, const Store *StoreStmt) {

        std::vector<const Store *> EraseKeys;
        for (auto const &x : Context) {
            auto store = x.first;
            debug(1) << "UpdateDeadStatements checking: " << store << "\n";

            if (store->name != StoreStmt->name) {
                debug(1) << "Name mismatch"
                         << "\n";
                continue;
            }

            if (!equal(store->predicate, StoreStmt->predicate)) {
                debug(1) << "predicate mismatch"
                         << "\n";
                continue;
            }

            if (!equal(store->index, StoreStmt->index)) {
                debug(1) << "index mismatch"
                         << "\n";
                continue;
            }

            /*
            if(!equal(store->value, StoreStmt->value)){
                continue;
                */

            if (!store->param.same_as(StoreStmt->param))
                continue;

            // Halide modulus remainder class only
            // defines equality
            if (!(store->alignment == StoreStmt->alignment))
                continue;

            debug(1) << "Adding pointer: " << store << " to dead statements ...\n";
            DeadStatements.insert(store);
            EraseKeys.push_back(store);
        }

        for (auto k : EraseKeys) {
            Context.erase(k);
        }
    }

    Stmt mutate(const Stmt &stmt) override {

        // Undefined statements may arise in the case
        // of if-then-else blocks where the else case
        // is not defined. In this case we simply return.
        if (!stmt.defined()) {
            return IRMutator::mutate(stmt);
        }

        if (stmt.node_type() == IRNodeType::Store) {
            const Store *s = stmt.as<Store>();

            if (!isConstantValue(s->value)) {
                Expr updated_val = mutate(s->value);
                debug(1) << "Store Instruction: " << stmt << "\n";
                debug(1) << "Store name: " << s->name << "\n";

                std::string current_scope = scope_name.top();
                debug(1) << "Current Scope name: " << current_scope << "\n";

                auto &context = MemMap.ref(scope_name.top());

                Stmt NewStore = Store::make(s->name, updated_val, s->index, s->param, s->predicate, s->alignment);

                UpdateDeadStatements(context, s);
                context[NewStore.as<Store>()] = updated_val;

                return NewStore;
            }
        }

        if (stmt.node_type() == IRNodeType::For) {
            const For *f = stmt.as<For>();
            debug(1) << "For Instruction: " << stmt << "\n";
            std::map<const Store *, Expr> scoped_map;

            scope_name.push(f->name);

            debug(1) << "Pushing scope_name: " << scope_name.top() << "\n";
            MemMap.push(scope_name.top(), scoped_map);
            auto new_stmt = mutate(f->body);
            debug(1) << "Popping scope_name: " << scope_name.top() << "\n";
            MemMap.pop(scope_name.top());
            scope_name.pop();

            Stmt NewFor = For::make(f->name, f->min, f->extent, f->for_type, f->device_api, new_stmt);
            return NewFor;
        }

        // Start a new scope for Let
        if (stmt.node_type() == IRNodeType::LetStmt) {
            const LetStmt *l = stmt.as<LetStmt>();
            debug(1) << "Let  Instruction: " << stmt << "\n";
            std::map<const Store *, Expr> scoped_map;

            scope_name.push(l->name);

            debug(1) << "Pushing scope_name: " << scope_name.top() << "\n";
            MemMap.push(scope_name.top(), scoped_map);
            auto new_stmt = mutate(l->body);
            debug(1) << "Popping scope_name: " << scope_name.top() << "\n";
            MemMap.pop(scope_name.top());
            scope_name.pop();

            Stmt NewLet = LetStmt::make(l->name, l->value, new_stmt);
            return NewLet;
        }

        const char *disable_prod = getenv("HL_PROD_CONS_DISABLE");
        if (stmt.node_type() == IRNodeType::ProducerConsumer && !disable_prod) {

            debug(0) << "Producer Consumer STMT  Instruction: " << stmt << "\n";

            const ProducerConsumer *pc = stmt.as<ProducerConsumer>();
            std::string p_or_c = pc->is_producer ? "_prod" : "_cons";
            std::string name = pc->name + p_or_c;
            scope_name.push(name);

            std::map<const Store *, Expr> scoped_map;
            MemMap.push(scope_name.top(), scoped_map);
            auto new_produce_consume = mutate(pc->body);
            debug(0) << "Popping scope_name: " << scope_name.top() << "\n";
            MemMap.pop(scope_name.top());
            scope_name.pop();

            Stmt NewPC = ProducerConsumer::make(pc->name, pc->is_producer, new_produce_consume);
            return NewPC;
        }

        // Start a new scope for IfThenElse
        if (stmt.node_type() == IRNodeType::IfThenElse) {
            const IfThenElse *ite = stmt.as<IfThenElse>();
            debug(1) << "If then else  Instruction: " << stmt << "\n";

            std::map<const Store *, Expr> scoped_map;
            scope_name.push("ite_then");
            debug(1) << "Pushing scope_name: " << scope_name.top() << "\n";
            MemMap.push(scope_name.top(), scoped_map);
            auto new_stmt_then = mutate(ite->then_case);
            debug(1) << "Popping scope_name: " << scope_name.top() << "\n";
            MemMap.pop(scope_name.top());
            scope_name.pop();

            std::map<const Store *, Expr> scoped_map_else;
            scope_name.push("ite_else");
            debug(1) << "Pushing scope_name: " << scope_name.top() << "\n";
            MemMap.push(scope_name.top(), scoped_map_else);
            auto new_stmt_else = mutate(ite->else_case);
            debug(1) << "Popping scope_name: " << scope_name.top() << "\n";
            MemMap.pop(scope_name.top());
            scope_name.pop();

            Stmt NewITE = IfThenElse::make(ite->condition, new_stmt_then, new_stmt_else);
            return NewITE;
        }

        return IRMutator::mutate(stmt);
    }

    Expr visit(const Load *op) override {
        Expr folded = Load::make(op->type, op->name, op->index, op->image, op->param, op->predicate, op->alignment);

        if (scope_name.empty() || !MemMap.contains(scope_name.top())) {
            return folded;
        }

        auto &context = MemMap.ref(scope_name.top());

        for (auto const &x : context) {

            auto store = x.first;

            if (store->name != op->name)
                continue;

            if (!equal(store->predicate, op->predicate))
                continue;

            if (!equal(store->index, op->index))
                continue;

            if (!store->param.same_as(op->param))
                continue;

            // Halide modulus remainder class only
            // defines equality
            if (!(store->alignment == op->alignment))
                continue;

            debug(0) << "LOAD STORE MATCHED!"
                     << "\n";

            debug(0) << "Replaced " << folded << " with " << x.second << "\n";
            folded = x.second;
        }

        return folded;
    }
};

class RemoveRedundantStmt : public IRMutator {
    using IRMutator::mutate;
    using IRMutator::visit;

public:
    std::set<const IRNode *> &DeadStatements;

    RemoveRedundantStmt(std::set<const IRNode *> DeadStatements)
        : DeadStatements(DeadStatements) {
        debug(0) << "RemoveRedundant Statements invoked"
                 << "\n";
    }

    Stmt mutate(const Stmt &stmt) override {

        // Undefined statements may arise in the case
        // of if-then-else blocks where the else case
        // is not defined. In this case we simply return.
        if (!stmt.defined()) {
            return IRMutator::mutate(stmt);
        }

        if (stmt.node_type() == IRNodeType::Store) {
            const Store *s = stmt.as<Store>();

            debug(0) << "Checking if pointer " << s << " is redundant "
                     << "\n";

            for (auto DS_IR : DeadStatements) {

                const Store *DS = (const Store *)DS_IR;

                Stmt DeadStoreStmt = Store::make(DS->name, DS->value, DS->index, DS->param, DS->predicate, DS->alignment);

                debug(0) << "Orig Stmt: " << stmt << "\n";
                debug(0) << "Test Stmt: " << DeadStoreStmt << "\n";

                if (equal(DeadStoreStmt, stmt)) {
                    debug(0) << "It is redundant!\n";
                    return Evaluate::make(0);
                }
            }
        }

        return IRMutator::mutate(stmt);
    }
};

// This IR mutator optimizes vector expressions for the Hexagon HVX ISA
class IROptimizer : public IRMutator {

public:
    using IRMutator::mutate;

    IROptimizer(FuncValueBounds fvb, HydrideSupportedArchitecture _arch, std::set<const BaseExprNode *> &ms, int oid, std::string name)
        : arch(_arch), func_value_bounds(fvb), mutated_exprs(ms), optimizer_id(oid), benchmark_name(name) {
    }

    bool isConstantValue(const Expr v) {
        if (v.node_type() == IRNodeType::IntImm) {
            return true;
        }

        if (v.node_type() == IRNodeType::UIntImm) {
            return true;
        }

        if (v.node_type() == IRNodeType::Broadcast) {
            const Broadcast *b = v.as<Broadcast>();

            return isConstantValue(b->value);
        }

        return false;
    }

    // We don't currently perform any optimizations at the Stmt level
    Stmt mutate(const Stmt &stmt) override {

        return IRMutator::mutate(stmt);
    }

    Expr mutate(const Expr &expr) override {

        switch (arch) {
        case HydrideSupportedArchitecture::X86:
            // std::cout << "Using X86 Optimizer" <<"\n";
            target_str = "x86";
            break;
        case HydrideSupportedArchitecture::HVX:
            // std::cout << "Using Hexagon Optimizer" <<"\n";
            target_str = "hvx";
            break;
        case HydrideSupportedArchitecture::ARM:
            // std::cout << "Using ARM Optimizer" <<"\n";
            target_str = "arm";
            break;
        case HydrideSupportedArchitecture::BitSerial:
            // std::cout << "Using ARM Optimizer" <<"\n";
            target_str = "BitSerial";
            break;
        default:
            break;
        }

        /* Disqualify expressions we do not currently support */

        debug(0) << "Current expression: " << expr << "\n";

        // If the expression produces a scalar output, ignore it
        if (!expr.type().is_vector()) {
            debug(1) << "produces a scalar output so we ignore it"
                     << "\n";
            return IRMutator::mutate(expr);
        }

        // If the expression produces an output of float type, ignore it
        if (expr.type().element_of().is_float())
            return IRMutator::mutate(expr);

        // If the expression produces an output of boolean type, ignore it
        if (expr.type().element_of().is_bool())
            return IRMutator::mutate(expr);

        if (arch == HydrideSupportedArchitecture::HVX) {
            // If the expression produces a vector that is not a multiple of the base vector length, ignore it
            if ((expr.type().bits() * expr.type().lanes() % 1024 != 0) && (expr.type().bits() > 1)) {
                debug(0) << "Invalid vector size for hexagon: " << expr.type().bits() * expr.type().lanes() << "\n";
                return IRMutator::mutate(expr);
            }

            if ((expr.type().bits() * expr.type().lanes() > 2048)) {
                debug(0) << "Invalid vector size for HVX: " << expr.type().bits() * expr.type().lanes() << "\n";
                return IRMutator::mutate(expr);
            }
        } else if (arch == HydrideSupportedArchitecture::X86) {
            // std::cout << "Using X86 Optimizer" << "\n";
            if ((expr.type().bits() * expr.type().lanes() % 128 != 0) && (expr.type().bits() > 1)) {
                debug(1) << "Invalid vector size for X86: " << expr.type().bits() * expr.type().lanes() << "\n";
                return IRMutator::mutate(expr);
            }

            if ((expr.type().bits() * expr.type().lanes() > 512)) {
                debug(1) << "Invalid vector size for X86: " << expr.type().bits() * expr.type().lanes() << "\n";
                return IRMutator::mutate(expr);
            }
        } else if (arch == HydrideSupportedArchitecture::ARM) {
            // std::cout << "Using ARM Optimizer" << "\n";
            if ((expr.type().bits() * expr.type().lanes() % 64 != 0) && (expr.type().bits() > 1)) {
                debug(1) << "Invalid vector size for ARM: " << expr.type().bits() * expr.type().lanes() << "\n";
                return IRMutator::mutate(expr);
            }

            if ((expr.type().bits() * expr.type().lanes() > 128)) {
                debug(1) << "Invalid vector size for ARM: " << expr.type().bits() * expr.type().lanes() << "\n";
                return IRMutator::mutate(expr);
            }
        } else if (arch == HydrideSupportedArchitecture::BitSerial) {
            if (expr.type().bits() != 32) {
                return IRMutator::mutate(expr);
            }
        }

        // If the expression is a dynamic shuffle, ignore it
        const Call *c = expr.as<Call>();
        if (c && c->is_intrinsic(Call::dynamic_shuffle)) {
            debug(1) << "Call to dynamic shuffle"
                     << "\n";
            return IRMutator::mutate(expr);
        }

        /* Ignore some qualifying but trivial expressions to reduce noise in the results */
        Expr base_e = expr;
        while (base_e.node_type() == IRNodeType::Let){
            base_e = base_e.as<Let>()->body;
        }

        // If the expression is just a single ramp instruction, ignore it
        if (base_e.node_type() == IRNodeType::Ramp) {
            debug(1) << "Single Ramp case"
                     << "\n";
            return IRMutator::mutate(expr);
        }

        // If the expression is just a single load instruction, ignore it
        if (base_e.node_type() == IRNodeType::Load) {
            debug(1) << "Single load case"
                     << "\n";
            return IRMutator::mutate(expr);
        }

        // If the expression is just a single broadcast instruction, ignore it
        if (base_e.node_type() == IRNodeType::Broadcast) {
            debug(1) << "Single Broadcast case"
                     << "\n";
            return IRMutator::mutate(expr);
        }

        // If the expression is just a variable, ignore it
        if (base_e.node_type() == IRNodeType::Variable) {
            debug(1) << "Single Variable case"
                     << "\n";
            return IRMutator::mutate(expr);
        }

        // If the expression is a conditional, optimize the branches individually
        if (base_e.node_type() == IRNodeType::Select) {
            debug(1) << "Select case"
                     << "\n";
            return IRMutator::mutate(expr);
        }
        // If the expression is a conditional, optimize the branches individually
        if (base_e.node_type() == IRNodeType::Call) {
            if (const Call *call = base_e.as<Call>()) {
                if (call->is_intrinsic(Call::if_then_else)) {
                    debug(1) << "ite case"
                             << "\n";
                    return IRMutator::mutate(expr);
                }
            }
        }

        // If the expression is a shuffle , optimize the operands individually
        if (base_e.node_type() == IRNodeType::Shuffle) {
            debug(0) << "Encountered shuffle: " << base_e << "\n";
            const Shuffle *shuff = base_e.as<Shuffle>();

            if (arch != HydrideSupportedArchitecture::HVX &&
                arch != HydrideSupportedArchitecture::ARM) {
                return IRMutator::mutate(expr);
            } else {
                if (shuff->is_concat()) {
                    debug(0) << "Encountered concat: " << base_e << "\n";
                } else if (shuff->is_slice()) {
                    debug(0) << "Encountered slice: " << base_e << "\n";
                } else {
                    return IRMutator::mutate(expr);
                }
            }
        }

        std::cout << "Starting synthesis for expr_id: " << expr_id << "\n";

        std::cout << "Expression before lower intrinsic: " << expr << "\n";

        // Lower intrinsics
        Expr spec_expr = LowerIntrinsics(arch).mutate(expr);

        std::cout << "Expression after lower intrinsic: " << spec_expr << "\n";

        // Simplify constants
        if (arch != HydrideSupportedArchitecture::HVX) {
            spec_expr = simplify(spec_expr);
        }

        std::cout << "Expression after simplification: " << spec_expr << "\n";

        // After simplification we may create trivially simple expressions
        if (spec_expr.node_type() == IRNodeType::Ramp) {
            debug(1) << "Single Ramp case"
                     << "\n";
            return IRMutator::mutate(spec_expr);
        }

        // If the expression is just a single broadcast instruction, ignore it
        if (spec_expr.node_type() == IRNodeType::Broadcast) {
            debug(1) << "Single Broadcast case"
                     << "\n";
            return IRMutator::mutate(spec_expr);
        }

        // Both HVX and ARM have no vector division intrinsics
        if (arch == HydrideSupportedArchitecture::HVX || arch == HydrideSupportedArchitecture::ARM) {

            Expr previous_expr = spec_expr;

            while (true) {
                spec_expr = ReplaceDiv(arch).mutate(spec_expr);
                // Lowering of division may introduce new intrinsics
                spec_expr = LowerIntrinsics(arch).mutate(spec_expr);

                if (equal(spec_expr, previous_expr)) break;

                previous_expr = spec_expr;
            }

            spec_expr = ReplaceDiv(arch).mutate(spec_expr);
            // Lowering of division may introduce new intrinsics
            spec_expr = LowerIntrinsics(arch).mutate(spec_expr);
        }

        std::cout << "Expression after legalizing division operations to target: " << spec_expr << "\n";

        std::cout << "Expression before InlineLets: " << spec_expr << "\n";
        // spec_expr = InlineLets().mutate(spec_expr);
        std::cout << "Expression after InlineLets: " << spec_expr << "\n";

        const char *decompose_let = getenv("HYDRIDE_DECOMPOSE_LET");

        if (decompose_let) {
            // Lift cse for more readable specs
            spec_expr = common_subexpression_elimination(spec_expr);
            std::cout << "Expression after CSE: " << spec_expr << "\n";

            // For cleaner specs synthesize let seperately from
            // body
            if (spec_expr.node_type() == IRNodeType::Let) {
                debug(0) << "Let Case: Synthesize value and body seperately"
                         << "\n";
                Expr LetVal = spec_expr.as<Let>()->value;
                Expr LetBody = spec_expr.as<Let>()->body;

                debug(0) << "Let Value to synthesize: " << LetVal << "\n";
                Expr OptVal = IRMutator::mutate(LetVal);
                debug(0) << "Let Body to synthesize: " << LetBody << "\n";
                Expr OptBody = IRMutator::mutate(LetBody);

                return Let::make(spec_expr.as<Let>()->name, OptVal, OptBody);
            }
        }

        std::cout << "Expression before abstraction: " << spec_expr << "\n";

        // Abstract out unsupported nodes if they appear as sub-expressions
        spec_expr = AbstractUnsupportedNodes(arch, abstractions).mutate(spec_expr);

        std::cout << "Expression after abstraction: " << spec_expr << "\n";

        Expr optimized_expr;

        bool skipped_synthesis = false;
        // If after abstraction, we're left with just a variable
        // simply return the same expression
        if (spec_expr.node_type() == IRNodeType::Variable) {
            optimized_expr = spec_expr;
            skipped_synthesis = true;
        } else {
            // Re-write expression using synthesis
            optimized_expr = synthesize_impl(spec_expr, expr);
        }

        // Replace abstracted abstractions
        Expr final_expr = ReplaceAbstractedNodes(abstractions, let_vars).mutate(optimized_expr);

        std::cout << "Expression after replace abstraction: " << final_expr << "\n";

        Expr return_expr = final_expr;

        if (!skipped_synthesis) {

            std::string fn_name = "hydride.node." + benchmark_name + "." + std::to_string(expr_id);
            Expr call_expr = ExtractIntoCall(arch).generate_call(fn_name, final_expr, abstractions);

            std::cout << "Ending synthesis for expr: " << expr_id << "\n";

            expr_id++;

            // Register that this node has been optimzied
            mutated_exprs.insert(call_expr.get());
            return_expr = call_expr;


            debug(0) << "\nOptimized expression: " << call_expr << "\n";

            if(arch == HydrideSupportedArchitecture::BitSerial){
                return return_expr;
            }
        }

        return IRMutator::mutate(return_expr);
    }

private:
    HydrideSupportedArchitecture arch;
    FuncValueBounds func_value_bounds;
    std::set<const BaseExprNode *> &mutated_exprs;
    int optimizer_id;
    Scope<Interval> bounds;

    std::map<std::string, Expr> let_vars;
    std::map<std::string, Expr> linearized_let_vars;
    std::vector<std::string> let_decl_order;

    std::map<std::string, Expr> abstractions;

    /* Helper functions and visitors */

    // A custom version of lower intrinsics that skips a TODO in the existing lower_intrinsics
    class LowerIntrinsics : public IRMutator {
        using IRMutator::visit;

    public:
        HydrideSupportedArchitecture _arch;

        LowerIntrinsics(HydrideSupportedArchitecture _a)
            : _arch(_a) {
        }

        Expr widen(Expr a) {
            Type result_type = a.type().widen();
            return Cast::make(result_type, std::move(a));
        }

        Expr narrow(Expr a) {
            Type result_type = a.type().narrow();
            return Cast::make(result_type, std::move(a));
        }

        Expr saturating_narrow(const Expr &a) {
            Type narrow = a.type().narrow();
            return saturating_cast(narrow, a);
        }

        Expr visit(const Ramp *op) override {
            Expr lowered;
            if (true || SIMPLIFY_RAMP) {

                // If either the stride or the base are constant
                // we can simplify the operations and hence keep
                // the original operation. Otherwise we decompose the
                // operation into it's consituent operations.
                if (!is_const(op->stride) && !is_const(op->base)) {
                    Expr broadcast_base = Broadcast::make(op->base, op->lanes);
                    Expr broadcast_stride = Broadcast::make(op->stride, op->lanes);
                    Expr ramp = Ramp::make(make_zero(op->base.type()), make_one(op->base.type()), op->lanes);
                    lowered = broadcast_base + broadcast_stride * ramp;
                }

                /*
                if(is_const(op->stride) && !is_const(op->base)) {
                    Expr broadcast_base = Broadcast::make(op->base, op->lanes);
                    Expr broadcast_stride = Broadcast::make(op->stride, op->lanes);
                    Expr ramp = Ramp::make(make_zero(op->base.type()), make_one(op->base.type()), op->lanes);
                    lowered = broadcast_base +  ramp;
                    debug(0) << "Simplied ramp to : "<< lowered <<"\n";
                    return lowered;
                }*/
            }

            if (lowered.defined()) {
                return mutate(lowered);
            }
            return IRMutator::visit(op);
        }

        // Lower a i1 selecting all lanes
        // to Broadcast i1 to number of lanes
        // for vector selection.
        Expr visit(const Select *op) override {

            /*
            if(op->type.is_vector() && op->condition.type().is_scalar()) {
                std::cout << "Potentially new select lowering" <<"\n";
                Expr cond = (op->condition.type().is_scalar() ?
                        Broadcast::make(op->condition, op->true_value.type().lanes()) :
                        op->condition);

                Expr Sel = Select::make(cond, op->true_value, op->false_value);

                debug(0) << "New select instruction: "<< Sel << "\n";

                return mutate(Sel);
            }*/

            return IRMutator::visit(op);
        }

        // Certain architectures don't have
        // vector division operations such as
        // HVX. Use Halides existing lower div
        // method to rewrite division in terms of other intrinsics
        Expr visit(const Div *op) override {

            return IRMutator::visit(op);
        }

        Expr visit(const Call *op) override {
            std::cout << "Lower Intrinsic on call: " << op->name << "\n";
            Expr lowered;

            bool lower_using_halide = false;
            // Generate cleaner specs. Since performance is not a concern, we can freely
            // use widening casts etc.
            if (op->is_intrinsic(Call::saturating_add)) {

                size_t element_bits = op->args[0].type().bits();

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    if (element_bits < 64) {
                        // lowered = narrow(clamp(widen(op->args[0]) + widen(op->args[1]),
                        //     op->args[0].type().min(), op->args[0].type().max()));
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {

                    if (element_bits >= 32) {
                        lowered = lower_saturating_add(op->args[0], op->args[1]);
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {

                    if (element_bits > 64) {
                        lowered = lower_saturating_add(op->args[0], op->args[1]);
                    }
                }

                // Map Saturating add to saturating add in Rosette.
            }

            else if (op->is_intrinsic(Call::saturating_sub)) {

                size_t element_bits = op->args[0].type().bits();
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    // lowered = narrow(clamp(widen(op->args[0]) - widen(op->args[1]),
                    //        op->args[0].type().min(), op->args[0].type().max()));
                } else if (_arch == HydrideSupportedArchitecture::X86) {

                    if (element_bits >= 32 && element_bits < 64) {
                        lowered = lower_saturating_sub(op->args[0], op->args[1]);
                        lower_using_halide = false;
                    } else if (element_bits >= 64) {
                        lower_using_halide = true;
                    }
                    // Map Saturating sub to saturating sub in Rosette.
                } else if (_arch == HydrideSupportedArchitecture::ARM) {

                    if (element_bits > 64) {
                        lowered = lower_saturating_add(op->args[0], op->args[1]);
                    }
                }

            } else if (op->is_intrinsic(Call::halving_add)) {

                Expr Two, One;
                if (op->args[1].type().is_uint()) {
                    Two = make_const(UInt(op->args[1].type().bits()), 2);
                    One = make_const(UInt(op->args[1].type().bits()), 1);
                } else {
                    Two = make_const(Int(op->args[1].type().bits()), 2);
                    One = make_const(Int(op->args[1].type().bits()), 1);
                }

                size_t element_bits = op->args[0].type().bits();

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    if (element_bits < 32) {
                        lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    if (element_bits < 64) {
                        lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    if (element_bits <= 64) {  // All following condition might be discussed
                        lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                }

            } else if (op->is_intrinsic(Call::halving_sub)) {

                Expr Two, One;
                if (op->args[1].type().is_uint()) {
                    Two = make_const(UInt(op->args[1].type().bits()), 2);
                    One = make_const(UInt(op->args[1].type().bits()), 1);
                } else {
                    Two = make_const(Int(op->args[1].type().bits()), 2);
                    One = make_const(Int(op->args[1].type().bits()), 1);
                }

                size_t element_bits = op->args[0].type().bits();
                if (_arch == HydrideSupportedArchitecture::HVX) {

                    if (element_bits < 32) {
                        lowered = narrow((widen(op->args[0]) - widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {

                    if (element_bits < 64) {
                        lowered = narrow((widen(op->args[0]) - widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {

                    if (element_bits <= 64) {
                        lowered = narrow((widen(op->args[0]) - widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                }

            } else if (op->is_intrinsic(Call::rounding_halving_sub)) {

                Expr Two, One;
                if (op->args[1].type().is_uint()) {
                    Two = make_const(UInt(op->args[1].type().bits()), 2);
                    One = make_const(UInt(op->args[1].type().bits()), 1);
                } else {
                    Two = make_const(Int(op->args[1].type().bits()), 2);
                    One = make_const(Int(op->args[1].type().bits()), 1);
                }

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    lowered = narrow((widen(op->args[0]) - widen(op->args[1]) + One) / Two);
                } else if (_arch == HydrideSupportedArchitecture::X86) {

                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                        lowered = narrow((widen(op->args[0]) - widen(op->args[1]) + One) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    lowered = narrow((widen(op->args[0]) - widen(op->args[1]) + One) / Two);
                }

            } else if (op->is_intrinsic(Call::sorted_avg)) {

                size_t element_bits = op->args[0].type().bits();
                Expr Two;
                if (op->args[1].type().is_uint()) {
                    Two = make_const(UInt(op->args[1].type().bits() * 2), 2);
                } else {
                    Two = make_const(Int(op->args[1].type().bits() * 2), 2);
                }

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    if (element_bits < 32) {
                        lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    if (element_bits < 64) {
                        lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / Two);
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    lower_using_halide = true;
                }

            } else if (op->is_intrinsic(Call::absd)) {

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    lower_using_halide = false;
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    if (SIMPLIFY_ABSD) {
                        lowered = max(op->args[0], op->args[1]) - min(op->args[0], op->args[1]);
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    lower_using_halide = false;  // vabd does this
                }
            } else if (op->is_intrinsic(Call::rounding_shift_right)) {
                Expr Zero, One, Two;
                if (op->args[1].type().is_uint()) {
                    Zero = make_const(UInt(op->args[1].type().bits()), 0);
                    Two = make_const(UInt(op->args[1].type().bits()), 2);
                } else {
                    Zero = make_const(Int(op->args[1].type().bits()), 0);
                    Two = make_const(Int(op->args[1].type().bits()), 2);
                }

                if (op->args[0].type().is_uint()) {
                    One = make_const(UInt(op->args[0].type().bits()), 1);
                } else {
                    One = make_const(Int(op->args[0].type().bits()), 1);
                }
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    // lowered = saturating_add(op->args[0], (One << max(Zero,op->args[1]))/ Two) >> op->args[1];
                    lower_using_halide = true;
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    lowered = saturating_add(op->args[0], (One << max(Zero, op->args[1])) / Two) >> op->args[1];
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    // Don't want this be lowered for arm
                    lowered = saturating_add(op->args[0], (One << (op->args[1] - 1))) >> op->args[1];
                }
            } else if (op->is_intrinsic(Call::widening_mul)) {
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 32 && SIMPLIFY_WIDEN_MUL) {
                        lowered = (widen(op->args[0]) * widen(op->args[1]));
                    } else if (element_bits < 32 && !SIMPLIFY_WIDEN_MUL) {
                        // Let it pass through
                    } else if (!SIMPLIFY_WIDEN_MUL && element_bits >= 32) {
                        debug(0) << "Lowering widening mul to halide as widening beyond type supported on target: " << element_bits << "\n";
                        lower_using_halide = true;
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                    } else {
                        lower_using_halide = true;
                    }
                }
            } else if (op->is_intrinsic(Call::widening_add)) {
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    // lower_using_halide = true;
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 32) {
                        lowered = (widen(op->args[0]) + widen(op->args[1]));
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                        lowered = (widen(op->args[0]) + widen(op->args[1]));
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits <= 64) {
                        lowered = (widen(op->args[0]) + widen(op->args[1]));
                    } else {
                        lower_using_halide = true;
                    }
                }
            } else if (op->is_intrinsic(Call::widening_sub)) {
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    // lower_using_halide = true;
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 32) {
                        lowered = (widen(op->args[0]) - widen(op->args[1]));
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {

                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                        lowered = (widen(op->args[0]) - widen(op->args[1]));
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {

                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits <= 64) {
                        lowered = (widen(op->args[0]) - widen(op->args[1]));
                    } else {
                        lower_using_halide = true;
                    }
                }

            } else if (op->is_intrinsic(Call::widening_shift_left)) {
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    // lower_using_halide = true;
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 32) {
                        lowered = widen(op->args[0]) << op->args[1];
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                        lowered = widen(op->args[0]) << op->args[1];
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits <= 64) {
                        lowered = widen(op->args[0]) << op->args[1];
                    } else {
                        lower_using_halide = true;
                    }
                }
            } else if (op->is_intrinsic(Call::widening_shift_right)) {

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    // lower_using_halide = true;
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 32) {
                        lowered = widen(op->args[0]) >> op->args[1];
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {

                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                        lowered = widen(op->args[0]) >> op->args[1];
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {

                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits <= 64) {
                        lowered = widen(op->args[0]) >> op->args[1];
                    } else {
                        lower_using_halide = true;
                    }
                }

            } else if (op->is_intrinsic(Call::rounding_mul_shift_right)) {
                if (_arch == HydrideSupportedArchitecture::HVX) {
                    int value = -1;

                    if (as_const_uint(op->args[2])) {
                        value = *as_const_uint(op->args[2]);
                    }

                    if (as_const_int(op->args[2])) {
                        value = *as_const_int(op->args[2]);
                    }

                    if (value == 31 || value == 15) {
                        debug(0) << "Found constant rounding_mul_shift_right with value 31: " << op->args[2] << "\n";
                    } else {
                        debug(0) << "Lowering rounding_mul_shift_right using halide"
                                 << "\n";
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 64) {
                        lowered = saturating_narrow(rounding_shift_right(widening_mul(op->args[0], op->args[1]), op->args[2]));
                    } else {
                        lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    int value = -1;
                    if (as_const_uint(op->args[2])) {
                        value = *as_const_uint(op->args[2]);
                    }

                    if (as_const_int(op->args[2])) {
                        value = *as_const_int(op->args[2]);
                    }

                    if (value == 31 || value == 15) {
                        debug(0) << "Found constant rounding_mul_shift_right with special value 15/31: " << op->args[2] << "\n";
                    } else {
                        // debug(0) << "Lowering rounding_mul_shift_right using halide"
                        //          << "\n";
                        lowered = saturating_narrow(rounding_shift_right(widening_mul(op->args[0], op->args[1]), op->args[2]));
                    }
                }

            }

            else if (op->is_intrinsic(Call::mul_shift_right)) {

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits < 32) {
                        lowered = narrow(widening_mul(op->args[0], op->args[1]) >> op->args[2]);
                    } else {
                        // lower_using_halide = true;
                    }
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    /*
                    size_t element_bits = op->args[0].type().bits();
                    if(element_bits < 64){
                        lowered = saturating_narrow(widening_mul(op->args[0], op->args[1]) >> op->args[2]);
                    } else {
                        lower_using_halide = true;
                    }
                    */
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    size_t element_bits = op->args[0].type().bits();
                    if (element_bits <= 64) {
                        lowered = saturating_narrow(widening_mul(op->args[0], op->args[1]) >> op->args[2]);
                    } else {
                        lower_using_halide = true;
                    }
                }
            }

            if (lowered.defined()) {
                debug(0) << "Lowered Expression: " << lowered << "\n";
                return mutate(lowered);
            } else if (lower_using_halide) {
                debug(0) << "Falling back onto halide to lower...\n"
                         << "for " << op->name << "\n";

                if (_arch == HydrideSupportedArchitecture::HVX) {
                    return mutate(lower_intrinsic(op));
                } else if (_arch == HydrideSupportedArchitecture::X86) {
                    return mutate(lower_intrinsic(op));
                } else if (_arch == HydrideSupportedArchitecture::ARM) {
                    auto tempExpr = mutate(lower_intrinsic(op));
                    debug(0) << "Halide lowered " << op->name << "(";
                    for (auto arg : op->args) {
                        debug(0) << arg << ", ";
                    }
                    debug(0) << ") to " << tempExpr << "\n";
                    return tempExpr;
                }
            }
            return IRMutator::visit(op);
        }
    };

    class FloatFinder : public IRVisitor {
        using IRVisitor::visit;

        bool f = false;

        void visit(const Variable *op) override {
            if (op->type.is_float())
                f = true;
        }

        void visit(const FloatImm *op) override {
            f = true;
        }

        void visit(const Cast *op) override {
            if (op->type.is_float())
                f = true;
            return IRVisitor::visit(op);
        }

    public:
        bool found() {
            return f;
        }
    };

    class AbstractUnsupportedNodes : public IRMutator {
        using IRMutator::visit;

        std::map<std::string, Expr> &abstractions;
        HydrideSupportedArchitecture _arch;

        std::vector<Call::IntrinsicOp> supported_calls = {
            Call::saturating_add,
            Call::saturating_sub,
            Call::shift_right,
            Call::shift_left,
            Call::absd,
            Call::abs,
            Call::bitwise_and,
            Call::bitwise_not,
            Call::bitwise_xor,
            Call::if_then_else,
            Call::widening_mul,
            Call::rounding_shift_right,
            Call::rounding_mul_shift_right,
            Call::rounding_halving_add};

        Expr visit(const Call *op) override {
            debug(0) << "Abstracting call: " << op->name << "\n";

            bool supported = false;
            for (auto IntrinID : supported_calls) {
                if (op->is_intrinsic(IntrinID)) {
                    supported = true;
                }
            }

            if (!supported) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            if (op->is_intrinsic(Call::widening_mul)) {
                size_t length = (op->type.bits() * op->type.lanes()) / 2;  // Divide by 2 to get input lengths
                bool supported = is_length_supported_on_target(length);

                if (!supported) {
                    std::string uname = unique_name('h');
                    abstractions[uname] = IRMutator::visit(op);
                    return Variable::make(op->type, uname);
                }
            }

            if (op->is_intrinsic(Call::dynamic_shuffle)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            } else if (op->is_intrinsic(Call::count_leading_zeros)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            } else if (op->is_intrinsic(Call::if_then_else)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            } else if (op->is_intrinsic(Call::shift_left) && (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);

            }

            else if (op->is_intrinsic(Call::shift_right) && (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);

            } else if (op->is_intrinsic(Call::saturating_add) && (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);

            } else if (op->is_intrinsic(Call::saturating_sub) && (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);

            } else
                return IRMutator::visit(op);
        }

        Expr visit(const Ramp *op) override {
            std::string uname = unique_name('h');
            abstractions[uname] = IRMutator::visit(op);
            return Variable::make(op->type, uname);
        }

        Expr visit(const Load *op) override {
            return op;
        }

        Expr visit(const LT *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Mod *op) override {

            if ((_arch == HydrideSupportedArchitecture::HVX)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Select *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const LE *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const NE *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const EQ *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const GT *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                // std::string uname = unique_name('h');
                // abstractions[uname] = IRMutator::visit(op);
                // return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const GE *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Not *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Or *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const And *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Min *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Max *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Add *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Mul *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 32)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Sub *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Div *op) override {

            // Abstract scalar arithmetic
            // operations.
            if (!op->type.is_vector() || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Shuffle *op) override {
            cout << "Shuffle: " << op->type << "\n";
            bool disable_shuffles = (_arch != HydrideSupportedArchitecture::HVX);
            // &&(_arch != HydrideSupportedArchitecture::ARM);

            if (op->is_concat() && disable_shuffles) {
                debug(0) << "Abstracting concat vector!\n";
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            if (op->is_concat() && !is_length_supported_on_target(op->vectors[0].type().lanes() * op->vectors[0].type().bits())) {
                debug(0) << "Abstracting concat vector with unsupported length\n";
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            if (op->is_slice() && !is_length_supported_on_target(op->vectors[0].type().lanes() * op->vectors[0].type().bits())) {
                debug(0) << "Abstracting slice vector with unsupported length\n";
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            if (op->is_slice() && (disable_shuffles || op->vectors[0].type().lanes() * op->vectors[0].type().bits() > 2048)) {
                debug(0) << "Abstracting slice vector!\n";
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            if (op->is_slice() && (op->slice_begin() != 0 && op->slice_begin() != op->vectors[0].type().lanes() / 2)) {
                debug(0) << "Abstracting random access slice vector!\n";
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            }

            if (op->is_broadcast() && _arch == HydrideSupportedArchitecture::ARM) {  // Temporary support for conv_nn
                debug(0) << "Abstracting last level broadcast!\n";
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                debug(0) << "TRACCE" << op->vectors[0] << '\n';
                return Variable::make(op->type, uname);
            }

            return IRMutator::visit(op);
        }

        Expr visit(const Broadcast *op) override {

            std::vector<int> supported_input_sizes;

            switch (_arch) {
            case HydrideSupportedArchitecture::ARM:
                supported_input_sizes.push_back(128);
                supported_input_sizes.push_back(64);
                break;
            case HydrideSupportedArchitecture::HVX:
                supported_input_sizes.push_back(2048);
                supported_input_sizes.push_back(1024);
                supported_input_sizes.push_back(128);
                supported_input_sizes.push_back(32);
                supported_input_sizes.push_back(8);
                break;
            case HydrideSupportedArchitecture::X86:
                debug(1) << "Abstraction vector sizes for X86 "
                         << "\n";
                // Push in vector register sizes in descending order
                supported_input_sizes.push_back(512);
                supported_input_sizes.push_back(128);
                supported_input_sizes.push_back(64);
                supported_input_sizes.push_back(32);
                supported_input_sizes.push_back(16);
                supported_input_sizes.push_back(8);
            };

            Expr v = op->value;

            bool supported = false;
            for (int input_size : supported_input_sizes) {
                debug(1) << "Testing for vector input length: " << input_size << "\n";
                if ((v.type().bits() * v.type().lanes() % input_size != 0) && (v.type().bits() > 1)) {
                } else if (v.type().bits() > 1) {
                    supported = true;
                }
            }

            const Broadcast *inner_broadcast = op->value.as<Broadcast>();

            if (inner_broadcast) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(inner_broadcast);
                return Broadcast::make(Variable::make(inner_broadcast->type, uname), op->lanes);
            }

            if ((!supported && !is_const(op->value)) || (_arch == HydrideSupportedArchitecture::HVX && op->type.bits() >= 64)
                //|| (_arch == Architecture::HVX && op->type.bits() == 16 && op->type.bits() == 2)

            ) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            } else {
                return IRMutator::visit(op);
            }
        }

        bool is_length_supported_on_target(size_t length) {
            debug(0) << "Checking if length is supported on target: " << length << "\n";

            std::vector<size_t> vec_lens;
            switch (_arch) {
            case HydrideSupportedArchitecture::ARM:
                vec_lens.push_back(128);
                vec_lens.push_back(64);
                break;
            case HydrideSupportedArchitecture::HVX:
                vec_lens.push_back(2048);
                vec_lens.push_back(1024);
                break;
            case HydrideSupportedArchitecture::X86:
                debug(1) << "Abstraction vector sizes for X86 "
                         << "\n";
                // Push in vector register sizes in descending order
                vec_lens.push_back(512);
                vec_lens.push_back(256);
                vec_lens.push_back(128);
                vec_lens.push_back(32);
            };

            bool supported = false;
            for (auto vec_len : vec_lens) {
                if ((length % vec_len != 0)) {
                } else if (length == vec_len) {
                    supported = true;
                }
            }

            return supported;
        }

        Expr visit(const Cast *op) override {
            Expr v = op->value;

            std::vector<int> vec_lens;

            switch (_arch) {
            case HydrideSupportedArchitecture::ARM:
                vec_lens.push_back(128);
                vec_lens.push_back(64);
                break;
            case HydrideSupportedArchitecture::HVX:
                vec_lens.push_back(2048);
                vec_lens.push_back(1024);
                break;
            case HydrideSupportedArchitecture::X86:
                debug(1) << "Abstraction vector sizes for X86 "
                         << "\n";
                // Push in vector register sizes in descending order
                vec_lens.push_back(512);
                vec_lens.push_back(256);
                vec_lens.push_back(128);
                vec_lens.push_back(32);
            };

            bool supported = false;
            for (int vec_len : vec_lens) {
                debug(1) << "Testing for vector length: " << vec_len << "\n";
                if (v.type().is_vector() && (v.type().bits() * v.type().lanes() % vec_len != 0) && (v.type().bits() > 1)) {
                } else if (v.type().is_vector() && (v.type().bits() > 1) && (v.type().bits() * v.type().lanes() == vec_len)) {
                    debug(1) << "True!"
                             << "\n";
                    debug(1) << "v.bits(): " << v.type().bits() << "\n";
                    debug(1) << "v.lanes(): " << v.type().lanes() << "\n";
                    supported = true;
                }
            }

            if (_arch == HydrideSupportedArchitecture::HVX && (op->type.bits() >= 64 || v.type().bits() >= 64)) {
                supported = false;
            }

            if (!supported) {
                std::string uname = unique_name('h');
                abstractions[uname] = IRMutator::visit(op);
                return Variable::make(op->type, uname);
            } else {
                return IRMutator::visit(op);
            }
        }

    public:
        AbstractUnsupportedNodes(HydrideSupportedArchitecture a, std::map<std::string, Expr> &abstrs)
            : abstractions(abstrs), _arch(a) {
        }
    };

    class ExtractIntoCall : public IRMutator {
        using IRMutator::visit;

    HydrideSupportedArchitecture _arch;

    public:
        // Populate a std::vector with Halide expressions  correpsonding to load instructions
        // and Variable instructions. The index into the vector is determined by the
        // unsigned value attached to each argument type.
        void get_call_args(const Expr &x, std::vector<Expr> &args, std::map<std::string, Expr> &abstractions) {

            std::map<std::string, Expr> let_vars;
            auto RAN = ReplaceAbstractedNodes(abstractions, let_vars);
            
            if(false && _arch == HydrideSupportedArchitecture::BitSerial){

                std::vector<const Load*> Loads;
                std::vector<unsigned> indicies;

                for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
                    const Load *op = bi->first;
                    unsigned idx = bi->second;

                    Loads.push_back(op);
                    indicies.push_back(idx);
                }

                std::vector<Expr> PimLoads = PimHandleLoads(Loads);

                for(int i =0; i < indicies.size(); i++){
                    unsigned index = indicies[i];
                    debug(0) << "Generated Load: "<< PimLoads[i] << "\n";
                    args[index] = PimLoads[i];
                }

                    
            } else {

                for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
                    const Load *op = bi->first;
                    unsigned idx = bi->second;
                    Expr OriginalLoad = Load::make(op->type, op->name, op->index, op->image, op->param, op->predicate, op->alignment);
                    Expr MutatedLoad = RAN.mutate(OriginalLoad);
                    args[idx] = MutatedLoad;
                }

            }


            for (auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end(); bi++) {
                // For variables we may have abstracted out the calculation before synthesis,
                // so we need to account for any variable mapping.
                const Variable *op = bi->first;
                unsigned idx = bi->second;
                Expr OriginalVar = Variable::make(op->type, op->name, op->image, op->param, op->reduction_domain);
                args[idx] = RAN.mutate(OriginalVar);
            }
        }

        Expr bitserial_create_let_allocations(Expr body, std::vector<Expr> &args){

                std::vector<const Load*> OrderedLoads(args.size());
                for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
                    const Load *op = bi->first;
                    unsigned idx = bi->second;
                    OrderedLoads[idx] = op;
                }

                Expr LetExpr = body;

                // Align everything with allocation 0 name
                Expr Alloc0_var = get_pim_alloc_variable_typed(0, OrderedLoads[0]->type);
                for(int i = OrderedLoads.size()-1; i >= 0; i--){
                    if(i == 0){
                        LetExpr = Let::make(get_pim_alloc_name(i),PimHandleLoadWrapper(OrderedLoads[i]) , LetExpr);
                    } else {
                        LetExpr = Let::make(get_pim_alloc_name(i),PimHandleLoadAssocWrapper(Alloc0_var, OrderedLoads[i]) , LetExpr);
                    }
                    debug(0) << "Let Expression: "<< LetExpr << "\n";

                }

                return LetExpr;

        }

        void get_call_args_bitserial(const Expr &x, std::vector<Expr> &args, std::map<std::string, Expr> &abstractions) {

            std::map<std::string, Expr> let_vars;
            auto RAN = ReplaceAbstractedNodes(abstractions, let_vars);

            std::vector<const Load*> Loads;
            std::vector<unsigned> indicies;

            for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
                const Load *op = bi->first;
                unsigned idx = bi->second;

                Loads.push_back(op);
                indicies.push_back(idx);
            }

            // Naming convention: Load_{idx} is copied into OperandAlloc_{idx}


            // std::vector<Expr> PimLoads = PimHandleLoads(Loads);

            for(int i =0; i < indicies.size(); i++){
                unsigned index = indicies[i];
                // debug(0) << "Generated Load: "<< PimLoads[i] << "\n";
                args[index] =  get_pim_alloc_variable_typed(index, Loads[i]->type);// PimLoads[i];
                // args[index] =   Loads[i];
            }





        }

        std::string get_pim_alloc_name(int idx){
            return "OperandAlloc_"+ std::to_string(idx);
        }

        Expr get_pim_alloc_variable(int idx){
            Type i32Ty = Int(32);
            return Variable::make(i32Ty, get_pim_alloc_name(idx));
        }

        Expr get_pim_alloc_variable_typed(int idx, Type t){
            return Variable::make(t, get_pim_alloc_name(idx));
        }

        Expr generate_call(std::string function_name, const Expr &x, std::map<std::string, Expr> &abstractions) {
            size_t num_arguments = LoadToRegMap.size() + VariableToRegMap.size();
                std::vector<Expr> args(num_arguments);
            if(false  && _arch == HydrideSupportedArchitecture::BitSerial) {
                get_call_args_bitserial(x, args, abstractions);

                std::cout << "Generating Call with type: " << x.type() << " and lanes " << x.type().lanes() << "\n";

                Expr LetBody = Call::make(x.type(), function_name, args, Call::Extern);


                Expr PimAllocated = bitserial_create_let_allocations(LetBody, args);

                return PimAllocated;

            } else {
                get_call_args(x, args, abstractions);

                std::cout << "Generating Call with type: " << x.type() << " and lanes " << x.type().lanes() << "\n";
                return Call::make(x.type(), function_name, args, Call::Extern);
            }
        }

        ExtractIntoCall(HydrideSupportedArchitecture arch) {
            _arch = arch;
        }
    };

    class ReplaceAbstractedNodes : public IRMutator {
        using IRMutator::visit;

        std::map<std::string, Expr> &abstractions;
        std::map<std::string, Expr> &letvars;

        Expr visit(const Variable *v) override {
            if (abstractions.count(v->name) == 0)
                return IRMutator::visit(v);
            return mutate(abstractions[v->name]);
        }

        Expr visit(const Load *v) override {
            return IRMutator::visit(v);
        }

    public:
        ReplaceAbstractedNodes(std::map<std::string, Expr> &abstrs, std::map<std::string, Expr> &lvs)
            : abstractions(abstrs), letvars(lvs) {
        }
    };

    // Replace Let expressions (not stmt with side effects)
    // with the value of the let replaced in the expression.
    class InlineLets : public IRMutator {
        using IRMutator::visit;

        std::map<std::string, Expr> VariableNameToExpr;

        Expr visit(const Variable *v) override {
            if (VariableNameToExpr.count(v->name) == 0)
                return IRMutator::visit(v);
            return mutate(VariableNameToExpr[v->name]);
        }

        Expr visit(const Let *op) override {
            VariableNameToExpr[op->name] = op->value;
            // All nested let statements should be inlined
            Expr simplified_body = mutate(op->body);

            return simplified_body;
        }

    public:
        InlineLets() {
        }
    };

    bool containsFloat(const Expr &e) {
        FloatFinder ff;
        e.accept(&ff);
        return ff.found();
    }

    Expr linearize(const Expr &e) {
        if (is_const(e)) {
            return e;
        } else if (e.as<Variable>()) {
            return e;
        } else if (const Add *add = e.as<Add>()) {
            return linearize(add->a) + linearize(add->b);
        } else if (const Sub *sub = e.as<Sub>()) {
            return linearize(sub->a) - linearize(sub->b);
        } else if (const Mul *mul = e.as<Mul>()) {
            // Assume the simplifier has run, so constants are to the right
            if (is_const(mul->b)) {
                return linearize(mul->a) * mul->b;
            }
        } else if (const Min *m = e.as<Min>()) {
            return min(linearize(m->a), linearize(m->b));
        } else if (const Max *m = e.as<Max>()) {
            return max(linearize(m->a), linearize(m->b));
        }
        // TODO: Select nodes? Need to decide which kinds of
        // conditions are OK if so. Or we could abstract the condition
        // as a new variable.

        // Just treat it as a symbolic unknown
        std::string uname = unique_name('h');
        abstractions[uname] = e;
        return Variable::make(e.type(), uname);
    }

    /* Some visitor overrides to track the context within which each expr appears */
    using IRMutator::visit;

    Stmt visit(const LetStmt *stmt) override {
        // debug(0) << "Let Found: " << stmt->name << " = " << stmt->value << "\n";

        Expr value = stmt->value;
        value = LowerIntrinsics(arch).mutate(value);
        value = AbstractUnsupportedNodes(arch, abstractions).mutate(value);

        bounds.push(stmt->name, bounds_of_expr_in_scope(value, bounds, func_value_bounds));
        let_vars[stmt->name] = value;
        linearized_let_vars[stmt->name] = linearize(value);
        let_decl_order.push_back(stmt->name);
        return IRMutator::visit(stmt);
    }

    // synthesis
    Expr synthesize_impl(Expr spec_expr, Expr orig_expr);

    std::string benchmark_name;
};

class HydrideSynthEmitter {
public:
    HydrideSynthEmitter(std::string benchmark_name)
        : benchmark_name(benchmark_name) {
        const char *extract_ops = getenv("HYDRIDE_EXTRACT_OPS");
        if (extract_ops) {
            extract_ops_only = true;
        }
    }

    std::string benchmark_name;

    bool extract_ops_only = false;

    std::string get_synthlog_hash_filepath(int id) {

        if (id < 0) {
            const char *initial_hash = getenv("HYDRIDE_INITIAL_HASH");
            if (initial_hash) {
                return std::string(initial_hash) + ".rkt";

            } else {
                return "";
            }

        } else {
            return "hydride_hash_" + benchmark_name + "_" + std::to_string(id) + ".rkt";
        }
    }

    std::string get_synthlog_hash_name(int id) {

        if (id < 0) {
            const char *initial_hash = getenv("HYDRIDE_INITIAL_HASH");
            if (initial_hash) {
                return std::string(initial_hash);
            } else {
                return "";
            }
        } else {
            return "synth_hash_" + benchmark_name + "_" + std::to_string(id);
        }
    }

    std::string get_expr_extract_filepath(int id) {

        if (id < 0) {
            return "";
        } else {
            return "expr_hash_" + benchmark_name + "_" + std::to_string(id) + ".rkt";
        }
    }

    std::string get_expr_extract_hash_name(int id) {

        if (id < 0) {
            return "";
        } else {
            return "expr_hash_" + benchmark_name + "_" + std::to_string(id);
        }
    }

    std::string define_load_buffer(const Load *op) {
        std::string reg_name = "reg_" + std::to_string(LoadToRegMap[op]);
        size_t bitwidth = op->type.bits() * op->type.lanes();

        std::string elemT = "'" + type_to_rake_elem_type(op->type, false, true);

        if (elemT == "'") {
            debug(0) << "Define_load_buffer escaping early for " << reg_name << "of bitwidth " << bitwidth << "\n";
            return "";
        }

        std::string define_bitvector_str = "(define " + reg_name + "_bitvector" + " " + "(bv 0 (bitvector " + std::to_string(bitwidth) + ")" + "))";

        std::string define_buffer_str = "(define " + reg_name + " (halide:create-buffer " + reg_name + "_bitvector " + elemT + ")" + ")";

        return define_bitvector_str + "\n" + define_buffer_str;
    }

    std::string define_variable_buffer(const Variable *op) {
        std::string reg_name = "reg_" + std::to_string(VariableToRegMap[op]);
        size_t bitwidth = op->type.bits() * op->type.lanes();

        std::string elemT = "'" + type_to_rake_elem_type(op->type, false, true);

        if (elemT == "'") {
            debug(0) << "Define_variable_buffer escaping early for " << reg_name << "of bitwidth " << bitwidth << "\n";
            return "";
        }

        std::string define_bitvector_str = "(define " + reg_name + "_bitvector" + " " + "(bv 0 (bitvector " + std::to_string(bitwidth) + ")" + "))";
        std::string define_buffer_str = "(define " + reg_name + " (halide:create-buffer " + reg_name + "_bitvector " + elemT + ")" + ")";

        return define_bitvector_str + "\n" + define_buffer_str;
    }

    std::string get_reg_id(int reg_id) {
        return "(bv " + std::to_string(reg_id) + " (bitvector 8))";
    }

    std::string emit_buffer_id_map(std::string map_name) {
        std::string comment = "; Creating a map between buffers and halide call node arguments\n";
        std::string define_buff_map = "(define " + map_name + " (make-hash))" + "\n";
        std::string add_entry = "";

        for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
            unsigned id = bi->second;
            add_entry += "(hash-set! " + map_name + " " + "reg_" + std::to_string(id) + " " + get_reg_id(id) + ")" + "\n";
        }

        for (auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end(); bi++) {
            unsigned id = bi->second;
            add_entry += "(hash-set! " + map_name + " " + "reg_" + std::to_string(id) + " " + get_reg_id(id) + ")" + "\n";
        }

        return comment + define_buff_map + add_entry;
    }

    std::string emit_symbolic_buffers() {
        std::string buffers = "";
        for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
            const Load *op = bi->first;
            buffers += define_load_buffer(op) + "\n";
        }

        for (auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end(); bi++) {
            const Variable *op = bi->first;
            buffers += define_variable_buffer(op) + "\n";
        }

        return buffers;
    }

    std::string emit_symbolic_buffers_vector(std::string vector_name) {
        std::string buffers = "(define " + vector_name + " (vector ";
        for (auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++) {
            const Load *op = bi->first;
            buffers += "reg_" + std::to_string(LoadToRegMap[op]) + " ";
        }

        buffers += "))";
        return buffers;
    }

    std::string emit_racket_imports() {
        debug(0) << "emit racket imports \n";
        return "#lang rosette\n \
                            (require rosette/lib/synthax)\n \
                            (require rosette/lib/angelic)\n \
                            (require racket/pretty)\n \
                            (require data/bit-vector)\n \
                            (require rosette/lib/destruct)\n \
                            (require rosette/solver/smt/boolector)\n \
                            (require hydride)\n ";
    }

    std::string emit_compile_to_llvm(std::string expr_name, std::string map_name, std::string call_name, std::string bitcode_path) {
        std::string comment = "; Translate synthesized hydride-expression into LLVM-IR";
        std::string command = "(compile-to-llvm " + expr_name + " " + map_name + " \"" + call_name + "\" \"" + bitcode_path + "\")\n";

        return comment + "\n" + command;
    }

    std::string emit_racket_debug() {
        debug(0) << "emit racket debug \n";
        return "\n \
                            ;; Uncomment the line below to enable verbose logging\n \
                            (enable-debug)\n";
    }

    std::string emit_set_current_bitwidth() {
        const char *bitwidth = getenv("HL_SYNTH_BW");
        if (bitwidth) {
            std::string str = bitwidth;
            int bw = stoi(str);

            if (bw > 0) {
                return "(current-bitwidth " + std::to_string(bw) + ")";
            }
        }
        return "";
    }

    std::string emit_set_memory_limit(size_t MB) {
        return "(custodian-limit-memory (current-custodian) (* " + std::to_string(MB) + " 1024 1024))";
    }

    std::string emit_hydride_synthesis(std::string expr_name, size_t expr_depth, size_t VF, std::string id_map_name, std::string synth_log_path, std::string synth_log_name, std::string target) {

        std::string solver = "'z3";
        const char *hydride_solver = getenv("HYDRIDE_SOLVER");

        if (hydride_solver) {
            solver = hydride_solver;
        }

        std::string optimize = "#t";
        std::string symbolic = "#f";

        return "(synthesize-halide-expr " + expr_name + " " + id_map_name + " " + std::to_string(expr_depth) + " " + std::to_string(VF) + " " + solver + " " + optimize + " " + symbolic + "  \"" + synth_log_path + "\"  \"" + synth_log_name + "\"  \"" + target + "\")";
    }

    std::string emit_interpret_expr(std::string expr_name) {
        return "(halide:interpret " + expr_name + ")";
    }

    std::string emit_iterative_optimize(bool do_iterative) {
        std::string comment = ";; Certain solvers do not support direct optimization, and hence we iteratively optimize by progressively tightening cost";
        std::string command = "(set-iterative-optimize)";

        std::string enable = do_iterative ? "" : ";";

        return comment + "\n" + enable + command + "\n";
    }

    std::string emit_assemble_result(std::string result_name, std::string expr_name, size_t lanes) {
        return "(define " + result_name + " (halide:assemble-bitvector " + emit_interpret_expr(expr_name) + " " + std::to_string(lanes) + ")" + ")";
    }

    std::string emit_write_synth_log_to_file(std::string fpath, std::string hash_name) {
        return "(save-synth-map \"" + fpath + "\" \"" + hash_name + "\" synth-log)";
    }
};

Expr IROptimizer::synthesize_impl(Expr spec_expr, Expr orig_expr) {

    std::cout << "Input expression to synthesize: " << spec_expr << "\n";

    RegToLoadMap.clear();
    LoadToRegMap.clear();

    RegToVariableMap.clear();
    VariableToRegMap.clear();

    Encoding encoding = get_encoding(spec_expr, let_vars, linearized_let_vars);

    // Infer symbolic variables
    // InferSymbolics symFinder(let_vars, linearized_let_vars, bounds, func_value_bounds, encoding);
    // spec_expr.accept(&symFinder);

    auto spec_dispatch = get_expr_racket_dispatch(spec_expr, encoding, let_vars);
    std::string expr = spec_dispatch(spec_expr, false /* set_mode */, false /* int_mode */);

    std::ofstream rkt;
    std::string file_name = "halide_expr_" + benchmark_name + "_" + std::to_string(expr_id) + ".rkt";
    rkt.open(file_name);

    HydrideSynthEmitter HSE(benchmark_name);
    rkt << HSE.emit_racket_imports() << "\n";
    rkt << HSE.emit_racket_debug() << "\n";
    rkt << HSE.emit_set_current_bitwidth() << "\n";
    rkt << HSE.emit_set_memory_limit(20000) << "\n";
    rkt << HSE.emit_symbolic_buffers() << "\n";
    rkt << HSE.emit_buffer_id_map("id-map") << "\n";
    // rkt << HSE.emit_symbolic_buffers_vector("sym_env") << "\n";
    // rkt << sym_bufs.str() << "\n";
    // rkt << sym_vars.str() << "\n";
    // rkt << axioms.str() << "\n";
    // rkt << let_stmts.str() << "\n";

    rkt << "(define halide-expr \n";
    rkt << expr << "\n";
    rkt << ")\n\n";

    rkt << "(clear-vc!)"
        << "\n";

    const char *expr_depth_var = getenv("HL_EXPR_DEPTH");

    int expr_depth = 2;

    if (expr_depth_var) {
        expr_depth = (*expr_depth_var) - '0';
    }

    // If we simply want to identify the expressions in this benchmark given a particular depth
    if (HSE.extract_ops_only) {

        std::string prev_hash_path = HSE.get_expr_extract_filepath(expr_id - 1);
        std::string prev_hash_name = HSE.get_expr_extract_hash_name(expr_id - 1);

        std::string cur_hash_path = HSE.get_expr_extract_filepath(expr_id);
        std::string cur_hash_name = HSE.get_expr_extract_hash_name(expr_id);

        rkt << "(write-expression-hashes halide-expr \"" << prev_hash_path << "\"  \"" << prev_hash_name << "\" \"/tmp/" << cur_hash_path << "\"  \"" << cur_hash_name << "\" " << expr_depth << ")\n";

    } else {

        std::string prev_hash_path = HSE.get_synthlog_hash_filepath(expr_id - 1);
        std::string prev_hash_name = HSE.get_synthlog_hash_name(expr_id - 1);

        rkt << HSE.emit_iterative_optimize(/* Enable iterative? */ false) << "\n";

        rkt << "(define synth-res " + HSE.emit_hydride_synthesis("halide-expr", /* expr depth */ expr_depth, /* VF*/ orig_expr.type().lanes(), /* Reg Hash map name */ "id-map",
                                                                 /* Previous hash file path */ prev_hash_path,
                                                                 /* Previous hash  name */ prev_hash_name,
                                                                 /* target id */ target_str)
            << ")"
            << "\n";
        rkt << "(dump-synth-res-with-typeinfo synth-res id-map)"
            << "\n";

        std::string fn_name = "hydride.node." + benchmark_name + "." + std::to_string(expr_id);
        rkt << HSE.emit_compile_to_llvm("synth-res", "id-map", fn_name, benchmark_name);

        std::string cur_hash_path = HSE.get_synthlog_hash_filepath(expr_id);
        std::string cur_hash_name = HSE.get_synthlog_hash_name(expr_id);

        rkt << HSE.emit_write_synth_log_to_file("/tmp/" + cur_hash_path, cur_hash_name);
    }

    rkt.close();

    std::string cmd = "racket " + file_name;

    auto start = std::chrono::system_clock::now();
    int ret_code = system(cmd.c_str());
    auto end = std::chrono::system_clock::now();
    std::cout << "Synthesis completed with return code:\t" << ret_code << "\n";
    internal_assert(ret_code == 0) << "Synthesis crashed, exiting ..."
                                   << "\n";

    std::chrono::duration<double> elapsed_seconds = end - start;

    std::cout << "Synthesis took " << elapsed_seconds.count() << "seconds ..."
              << "\n";

    SkipNodes.clear();

    return spec_expr;
}

}  // namespace Hydride

Stmt hydride_preprocess_hvx(Stmt s) {

    Stmt distributed;

    std::set<const IRNode *> DeadStmts;

    auto FLS = Hydride::FoldLoadStores(DeadStmts);

    auto folded = FLS.mutate(s);
    debug(0) << "Printing Folded Stmt:\n";
    debug(0) << folded << "\n";

    debug(0) << "DEAD STMT SIZE: " << DeadStmts.size() << "\n";

    auto pruned = Hydride::RemoveRedundantStmt(DeadStmts).mutate(folded);
    debug(0) << "Printing Pruned Stmt:\n";
    debug(0) << pruned << "\n";

    std::vector<unsigned> hvx_vector_sizes = {2048, 1024};

    // bool model_sat_support = false;
    bool model_sat_support = false;

    const char *enable_hydride = getenv("HL_BENCH_MATMUL");
    if (enable_hydride) {
        debug(0) << "Setting model saturating support true"
                 << "\n";
        model_sat_support = true;
    }
    distributed = distribute_vector_exprs(pruned, hvx_vector_sizes, model_sat_support);

    // distributed = distribute_vector_exprs(s , hvx_vector_sizes, model_sat_support);

    return distributed;
}

Stmt hydride_preprocess_x86(Stmt s) {
    debug(0) << "Proprocess x86 hydride"
             << "\n";

    Stmt distributed;

    std::set<const IRNode *> DeadStmts;

    auto FLS = Hydride::FoldLoadStores(DeadStmts);

    auto folded = FLS.mutate(s);
    debug(0) << "Printing Folded Stmt:\n";
    debug(0) << folded << "\n";

    debug(0) << "DEAD STMT SIZE: " << DeadStmts.size() << "\n";

    auto pruned = Hydride::RemoveRedundantStmt(DeadStmts).mutate(folded);
    debug(0) << "Printing Pruned Stmt:\n";
    debug(0) << pruned << "\n";

    std::vector<unsigned> x86_vector_sizes = {512, 256, 128};

    bool model_sat_support = true;

    distributed = distribute_vector_exprs(pruned, x86_vector_sizes, model_sat_support);

    return distributed;
}

Stmt hydride_optimize_hvx(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs) {

    debug(0) << "Hydride Optimize HVX"
             << "\n";

    Stmt distributed;

    const char *disable_preprocess = getenv("HL_DISABLE_PREPROCESS");
    if (disable_preprocess) {
        debug(0) << "Disabling pre-processing pass\n";
        distributed = s;
    } else {

        std::set<const IRNode *> DeadStmts;
        auto FLS = Hydride::FoldLoadStores(DeadStmts);
        auto folded = FLS.mutate(s);
        debug(0) << "Printing Folded Stmt:\n";
        debug(0) << folded << "\n";

        debug(0) << "DEAD STMT SIZE: " << DeadStmts.size() << "\n";

        auto pruned = Hydride::RemoveRedundantStmt(DeadStmts).mutate(folded);
        debug(0) << "Printing Pruned Stmt:\n";
        debug(0) << pruned << "\n";

        std::vector<unsigned> hvx_vector_sizes = {2048, 1024};

        // bool model_sat_support = false;
        bool model_sat_support = true;

        const char *enable_hydride = getenv("HL_BENCH_MATMUL");
        if (enable_hydride) {
            debug(0) << "Setting model saturating support true"
                     << "\n";
            model_sat_support = true;
        }
        distributed = distribute_vector_exprs(pruned, hvx_vector_sizes, model_sat_support);
        // distributed = distribute_vector_exprs(s, hvx_vector_sizes, model_sat_support);
        debug(0) << "Distributed Stmt:\n";
        debug(0) << distributed << "\n";
    }

    srand(time(0));
    int random_seed = rand() % 1024;

    const char *benchmark_name = getenv("HYDRIDE_BENCHMARK");
    std::string name = benchmark_name ? std::string(benchmark_name) : "hydride";
    auto Result = Hydride::IROptimizer(fvb, HydrideSupportedArchitecture::HVX, mutated_exprs, random_seed, name).mutate(distributed);

    if (mutated_exprs.size()) {
        hydride_generate_llvm_bitcode(Target::Hexagon, "/tmp/" + name + ".rkt", "/tmp/" + name + ".ll", name);
    } else {
        debug(0) << "[Warning]: No hydride expressions synthesized (Make sure the input program is vectorized)\n";
    }

    return Result;
}

Stmt hydride_optimize_x86(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs) {
    debug(0) << "Hydride Optimize X86"
             << "\n";
    std::set<const IRNode *> DeadStmts;
    auto FLS = Hydride::FoldLoadStores(DeadStmts);
    auto folded = FLS.mutate(s);
    debug(1) << "Printing Folded Stmt:\n";
    debug(1) << folded << "\n";

    debug(1) << "DEAD STMT SIZE: " << DeadStmts.size() << "\n";

    auto pruned = Hydride::RemoveRedundantStmt(DeadStmts).mutate(folded);
    debug(1) << "Printing Pruned Stmt:\n";
    debug(1) << pruned << "\n";

    std::vector<unsigned> x86_vector_sizes = {512, 256, 128};
    auto distributed = distribute_vector_exprs(pruned, x86_vector_sizes, true);
    debug(0) << "Distributed Stmt:\n";
    debug(0) << distributed << "\n";

    srand(time(0));
    int random_seed = rand() % 1024;

    const char *benchmark_name = getenv("HYDRIDE_BENCHMARK");
    std::string name = benchmark_name ? std::string(benchmark_name) : "hydride";
    auto Result = Hydride::IROptimizer(fvb, HydrideSupportedArchitecture::X86, mutated_exprs, random_seed, name).mutate(distributed);

    if (mutated_exprs.size()) {
        hydride_generate_llvm_bitcode(Target::X86, "/tmp/" + name + ".rkt", "/tmp/" + name + ".ll", name);
    } else {
        debug(0) << "[Warning]: No hydride expressions synthesized (Make sure the input program is vectorized)\n";
    }

    return Result;
}

Stmt hydride_optimize_bitserial(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs) {
    debug(0) << "Hydride Optimize Bitserial"
             << "\n";
    std::set<const IRNode *> DeadStmts;
    auto FLS = Hydride::FoldLoadStores(DeadStmts);
    auto folded = FLS.mutate(s);
    debug(1) << "Printing Folded Stmt:\n";
    debug(1) << folded << "\n";

    debug(1) << "DEAD STMT SIZE: " << DeadStmts.size() << "\n";

    auto pruned = Hydride::RemoveRedundantStmt(DeadStmts).mutate(folded);
    debug(1) << "Printing Pruned Stmt:\n";
    debug(1) << pruned << "\n";

    auto distributed = pruned;
    debug(0) << "Distributed Stmt:\n";
    debug(0) << distributed << "\n";

    srand(time(0));
    int random_seed = rand() % 1024;

    const char *benchmark_name = getenv("HYDRIDE_BENCHMARK");
    std::string name = benchmark_name ? std::string(benchmark_name) : "hydride";
    auto Result = Hydride::IROptimizer(fvb, HydrideSupportedArchitecture::BitSerial, mutated_exprs, random_seed, name).mutate(distributed);

    if (mutated_exprs.size()) {
        hydride_generate_bitserial_llvm_bitcode("/tmp/" + name + ".rkt", "/tmp/" + name + ".ll", name);
    } else {
        debug(0) << "[Warning]: No hydride expressions synthesized (Make sure the input program is vectorized)\n";
    }

    debug(0) << "After Bitserial" << "\n";
    debug(0) << Result << "\n";

    return Result;
}


Stmt hydride_optimize_arm(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs) {

    debug(0) << "Hydride Optimize ARM"
             << "\n";

    Stmt distributed;

    const char *disable_preprocess = getenv("HL_DISABLE_PREPROCESS");
    if (disable_preprocess) {
        debug(0) << "Disabling pre-processing pass\n";
        distributed = s;
    } else {

        std::set<const IRNode *> DeadStmts;
        auto FLS = Hydride::FoldLoadStores(DeadStmts);
        auto folded = FLS.mutate(s);
        debug(0) << "Printing Folded Stmt:\n";
        debug(0) << folded << "\n";

        debug(0) << "DEAD STMT SIZE: " << DeadStmts.size() << "\n";

        auto pruned = Hydride::RemoveRedundantStmt(DeadStmts).mutate(folded);
        debug(0) << "Printing Pruned Stmt:\n";
        debug(0) << pruned << "\n";

        std::vector<unsigned> arm_vector_sizes = {128, 64};

        bool model_sat_support = true;

        // const char *enable_hydride = getenv("HL_BENCH_MATMUL");
        // if (enable_hydride) {
        //     debug(0) << "Setting model saturating support true"
        //              << "\n";
        //     model_sat_support = true;
        // }
        distributed = distribute_vector_exprs(pruned, arm_vector_sizes, model_sat_support);
        debug(0) << "Distributed Stmt:\n";
        debug(0) << distributed << "\n";
    }

    srand(time(0));
    int random_seed = rand() % 1024;

    const char *benchmark_name = getenv("HYDRIDE_BENCHMARK");
    std::string name = benchmark_name ? std::string(benchmark_name) : "hydride";
    auto Result = Hydride::IROptimizer(std::move(fvb), HydrideSupportedArchitecture::ARM, mutated_exprs, random_seed, name).mutate(distributed);

    if (!mutated_exprs.empty()) {
        hydride_generate_llvm_bitcode(Target::ARM, "/tmp/" + name + ".rkt", "/tmp/" + name + ".ll", name);
    } else {
        debug(0) << "[Warning]: No hydride expressions synthesized (Make sure the input program is vectorized)\n";
    }

    return Result;
}

Stmt optimize_x86_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb) {

    std::set<const BaseExprNode *> mutated_exprs;
    s = hydride_optimize_x86(fvb, s, mutated_exprs);

    return s;
}

Stmt optimize_bitserial_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb) {

    std::set<const BaseExprNode *> mutated_exprs;
    s = hydride_optimize_bitserial(fvb, s, mutated_exprs);

    return common_subexpression_elimination(s);
}

Stmt optimize_hexagon_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb) {

    // s = ReplaceDiv().mutate(s);
    // debug(0) << "Module  (firrst replace div):" << s << "\n";

    std::set<const BaseExprNode *> mutated_exprs;
    debug(0) << "Input Statement to Compile through HVX:\n"
             << s << "\n";
    s = hydride_optimize_hvx(fvb, s, mutated_exprs);

    debug(0) << "Module with hydride calls:"
             << "\n";
    debug(0) << s << "\n";

    // s = ReplaceDiv().mutate(s);
    // debug(0) << "Module with hydride calls (final replace div):" <<s << "\n";

    return common_subexpression_elimination(s);
}

Stmt optimize_arm_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb) {

    std::set<const BaseExprNode *> mutated_exprs;
    debug(0) << "Input Statement to Compile through HVX:\n"
             << s << "\n";
    s = hydride_optimize_arm(fvb, s, mutated_exprs);

    debug(0) << "Module with hydride calls:"
             << "\n";
    debug(0) << s << "\n";

    // s = ReplaceDiv().mutate(s);
    // debug(0) << "Module with hydride calls (final replace div):" <<s << "\n";

    return common_subexpression_elimination(s);
}

}  // namespace Internal
}  // namespace Halide
