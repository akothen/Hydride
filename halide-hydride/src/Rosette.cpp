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
#include <map>

using namespace std;



namespace Halide {

    int expr_id = 0;

    namespace Internal {

        namespace {

            typedef std::map<std::string, VarEncoding> Encoding;

            // For variables below load instruction
            // we do not need to emit any strings
            // as the code generator in LLVM 
            // would handle those.
            std::set<const IRNode*> SkipNodes;


            std::map<unsigned, const Load*> RegToLoadMap; // Map racket register expressions to Halide Load Instructions
            std::map<const Load*, unsigned> LoadToRegMap; // Map racket register expressions to Halide Load Instructions

            std::map<unsigned, const Variable*> RegToVariableMap; // Map racket register expressions to Halide Load Instructions
            std::map<const Variable*, unsigned> VariableToRegMap; // Map racket register expressions to Halide Load Instructions


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
                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            return "";
                        }

                        if(VariableToRegMap.find(op) != VariableToRegMap.end()){
                            std::string reg_name = "reg_"+std::to_string(VariableToRegMap[op]);
                            return tabs() + reg_name ;

                        }

                            std::string bits = std::to_string(op->type.bits() * op->type.lanes());
                            unsigned reg_counter = (RegToLoadMap.size()+ RegToVariableMap.size());

                            std::string reg_name = "reg_"+std::to_string(reg_counter);
                            std::cout << op->name << " maps to "<<reg_name << "\n";

                            RegToVariableMap[reg_counter] = op;
                            VariableToRegMap[op] = reg_counter;
                        return tabs() + reg_name;//op->name;
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

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("add", "+", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Sub *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("sub", "-", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Mul *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("mul", "*", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Div *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("div", "quotient", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Mod *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("mod", "modulo", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Min *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("min", "min", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Max *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("max", "max", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const EQ *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("eq", "eq?", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const NE *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("ne", "ne?", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const LT *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("lt", "<", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const LE *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("le", "<=", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const GT *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("gt", ">", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const GE *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("ge", ">", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const And *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("and", "and", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Or *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->a.get());
                            SkipNodes.insert(op->b.get());
                            return "";
                        }
                        return print_binary_op("or", "or", op->a, op->b, op->type.is_vector());
                    }

                    std::string visit(const Not *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
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

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->value.get());
                            return "";
                        }

                        indent.push(0);
                        std::string rkt_type = std::to_string(op->lanes);
                        std::string rkt_val = dispatch(op->value);
                        std::cout << "Broadcast "<<rkt_val << "to x"<<rkt_type <<"\n";
                        indent.pop();
                        return tabs() + "(x" + rkt_type + " " + rkt_val + ")";
                    }

                    std::string get_type_string(Type t) {
                        std::ostringstream stream;
                        stream << t;
                        return stream.str();
                    }

                    std::string visit(const Cast *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->value.get());
                            return "";
                        }

                        const std::string type_string = get_type_string(op->type);
                        std::cout << "Cast operation into: "<<type_string <<"\n";

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

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->value.get());
                            SkipNodes.insert(op->body.get());
                            return "";
                        }

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

                    std::string define_load_buffer(const Load *op){
                        std::string reg_name = "reg_" + std::to_string(LoadToRegMap[op]);
                        size_t bitwidth = op->type.bits() * op->type.lanes();

                        std::string elemT = "'"+type_to_rake_elem_type(op->type, false, true); // TODO

                        if(elemT == "'") return "";

                        std::string define_bitvector_str = "(define-symbolic "+reg_name+"_bitvector"+" "+ "(bitvector "+std::to_string(bitwidth)+")" +")";
                        std::string define_buffer_str = "(define "+reg_name+" (halide:create-buffer "+ reg_name+"_bitvector "+elemT +")"+")";

                        return define_bitvector_str + "\n" + define_buffer_str;
                    }

                    std::string visit(const Load *op) {
                        indent.push(0);

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

                        if(LoadToRegMap.find(op) != LoadToRegMap.end()){
                            return "reg_" + std::to_string(LoadToRegMap[op]);
                        }

                        if (op->type.is_scalar() && mode.top() == VarEncoding::Integer)
                            return tabs() + "(" + op->name + " " + rkt_idx + ")";
                        else if (op->type.is_scalar())
                            return tabs() + "(load-sca " + op->name + " " + rkt_idx + ")";
                        else{
                            std::string bits = std::to_string(op->type.bits() * op->type.lanes());
                            unsigned reg_counter = RegToLoadMap.size() + RegToVariableMap.size();
                            std::string reg_name = "reg_"+std::to_string(reg_counter);
                            RegToLoadMap[reg_counter] = op;
                            LoadToRegMap[op] = reg_counter;
                            std::string load_buff = define_load_buffer(op);
                            return tabs()   + reg_name; //+ load_buff + "\n"+ "(load " + reg_name + " " + rkt_idx + " " + alignment + ")";
                        }

                    }

                    std::string visit(const Ramp *op) {

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
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

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
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

                        if(SkipNodes.find((const IRNode*) op) != SkipNodes.end()){
                            SkipNodes.insert(op->value.get());
                            return "";
                        }
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


                class GatherVars : public IRVisitor {
                    Scope<> let_vars;

                    public:
                    using IRVisitor::visit;

                    void visit(const Variable *var) override {
                        if (!let_vars.contains(var->name)) {
                            names.insert(var->name);
                        }
                    }

                    void visit (const Let *let) override {
                        let->value.accept(this);
                        ScopedBinding<>(let_vars, let->name);
                        let->body.accept(this);
                    }

                    std::set<std::string> names;
                };

            }

            Encoding get_encoding(const Expr &expr, const std::map<std::string, Expr> &let_vars, const std::map<std::string, Expr> &llet_vars) {
                // Infer which encoding to use for symbolic vars
                InferVarEncodings ive(let_vars, llet_vars);
                expr.accept(&ive);
                return ive.getEncodings();
            }

            std::string expr_to_racket(const Expr &expr, int indent) {
                std::cout << "Invoked Expression to Racket" << "\n";
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
                    oss << "bfloat" << type.bits() ;
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
                        case 1:
                            // bool vectors are always emitted as uint8 in the C++ backend
                            if (type.is_vector()) {
                                //oss << "uint8x" << type.lanes() << "_t";

                            } else {
                                oss << "uint1";
                            }
                            break;
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


                // This IR mutator optimizes vector expressions for the Hexagon HVX ISA
                class IROptimizer : public IRMutator {

                    public:
                        using IRMutator::mutate;

                        enum Architecture {
                            HVX, ARM, X86
                        };

                        IROptimizer(FuncValueBounds fvb, Architecture _arch, std::set<const BaseExprNode *> &ms)
                            : arch(_arch), func_value_bounds(fvb), mutated_exprs(ms) {
                            }

                        // We don't currently perform any optimizations at the Stmt level
                        Stmt mutate(const Stmt &stmt) override {
                            return IRMutator::mutate(stmt);
                        }

                        Expr mutate(const Expr &expr) override {
                            if (arch == IROptimizer::ARM){
                                return expr;
                            }

                            switch(arch){
                                case IROptimizer::X86:
                                    // std::cout << "Using X86 Optimizer" <<"\n";
                                    break;
                                case IROptimizer::HVX:
                                    // std::cout << "Using Hexagon Optimizer" <<"\n";
                                    break;
                                default:
                                    break;

                            }

                            /* Disqualify expressions we do not currently support */

                            // If the expression produces a scalar output, ignore it
                            if (!expr.type().is_vector())
                                return IRMutator::mutate(expr);

                            // If the expression produces an output of float type, ignore it
                            if (expr.type().element_of().is_float())
                                return IRMutator::mutate(expr);

                            // If the expression produces an output of boolean type, ignore it
                            if (expr.type().element_of().is_bool())
                                return IRMutator::mutate(expr);


                            if (arch == IROptimizer::HVX) {
                                // If the expression produces a vector that is not a multiple of the base vector length, ignore it
                                if ((expr.type().bits() * expr.type().lanes() % 1024 != 0) && (expr.type().bits() > 1))
                                    return IRMutator::mutate(expr);
                            } else if (arch == IROptimizer::X86){
                                // std::cout << "Using X86 Optimizer" << "\n";
                                if ((expr.type().bits() * expr.type().lanes() % 128 != 0) && (expr.type().bits() > 1))
                                    return IRMutator::mutate(expr);

                                if((expr.type().bits() * expr.type().lanes() > 512)){
                                    return IRMutator::mutate(expr);
                                }
                            }

                            // If the expression is a dynamic shuffle, ignore it
                            const Call *c = expr.as<Call>();
                            if (c && c->is_intrinsic(Call::dynamic_shuffle))
                                return expr;

                            /* Ignore some qualifying but trivial expressions to reduce noise in the results */
                            Expr base_e = expr;
                            while (base_e.node_type() == IRNodeType::Let)
                                base_e = base_e.as<Let>()->body;

                            // If the expression is just a single ramp instruction, ignore it
                            if (base_e.node_type() == IRNodeType::Ramp)
                                return IRMutator::mutate(expr);

                            // If the expression is just a single load instruction, ignore it
                            if (base_e.node_type() == IRNodeType::Load)
                                return IRMutator::mutate(expr);

                            // If the expression is just a single broadcast instruction, ignore it
                            if (base_e.node_type() == IRNodeType::Broadcast)
                                return IRMutator::mutate(expr);

                            // If the expression is just a variable, ignore it
                            if (base_e.node_type() == IRNodeType::Variable)
                                return IRMutator::mutate(expr);

                            // If the expression is a conditional, optimize the branches individually
                            if (base_e.node_type() == IRNodeType::Select)
                                return IRMutator::mutate(expr);

                            // Abstract out unsupported nodes if they appear as sub-expressions
                            Expr spec_expr = AbstractUnsupportedNodes(IROptimizer::HVX, abstractions).mutate(expr);

                            // Lower intrinsics
                            spec_expr = LowerIntrinsics().mutate(spec_expr);

                            // Lift cse for more readable specs
                            spec_expr = common_subexpression_elimination(spec_expr);

                            // Re-write expression using synthesis
                            Expr optimized_expr = synthesize_impl(spec_expr, expr);

                            // Replace abstracted abstractions
                            Expr final_expr = ReplaceAbstractedNodes(abstractions, let_vars).mutate(optimized_expr);



                            Expr call_expr = ExtractIntoCall().generate_call("hydride.node.1", final_expr);


                            // Register that this node has been optimzied
                            mutated_exprs.insert(call_expr.get());

                            debug(0) << "\nOptimized expression: " << call_expr << "\n";

                            return call_expr;
                        }                  

                private:

                Architecture arch;
                FuncValueBounds func_value_bounds;
                std::set<const BaseExprNode *> &mutated_exprs;
                Scope<Interval> bounds;

                std::map<std::string, Expr> let_vars;
                std::map<std::string, Expr> linearized_let_vars;
                std::vector<std::string> let_decl_order;

                std::map<std::string, Expr> abstractions;

                /* Helper functions and visitors */

                // A custom version of lower intrinsics that skips a TODO in the existing lower_intrinsics
                class LowerIntrinsics : public IRMutator {
                    using IRMutator::visit;

                    Expr widen(Expr a) {
                        Type result_type = a.type().widen();
                        return Cast::make(result_type, std::move(a));
                    }

                    Expr narrow(Expr a) {
                        Type result_type = a.type().narrow();
                        return Cast::make(result_type, std::move(a));
                    }

                    Expr visit(const Call *op) override {
                        Expr lowered;
                        // Generate cleaner specs. Since performance is not a concern, we can freely
                        // use widening casts etc.
                        if (op->is_intrinsic(Call::saturating_add)) {
                            lowered = narrow(clamp(widen(op->args[0]) + widen(op->args[1]),
                                        op->args[0].type().min(), op->args[0].type().max()));
                        } 
                        else if (op->is_intrinsic(Call::saturating_sub)) {
                            lowered = narrow(clamp(widen(op->args[0]) - widen(op->args[1]),
                                        op->args[0].type().min(), op->args[0].type().max()));
                        } 
                        else if (op->is_intrinsic(Call::halving_add)) {
                            lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / 2);
                        } 
                        else if (op->is_intrinsic(Call::halving_sub)) {
                            lowered = narrow((widen(op->args[0]) - widen(op->args[1])) / 2);
                        } 
                        else if (op->is_intrinsic(Call::rounding_halving_add)) {
                            lowered = narrow((widen(op->args[0]) + widen(op->args[1]) + 1) / 2);
                        } 
                        else if (op->is_intrinsic(Call::rounding_halving_sub)) {
                            lowered = narrow((widen(op->args[0]) - widen(op->args[1]) + 1) / 2);
                        } 
                        else if (op->is_intrinsic(Call::rounding_halving_sub)) {
                            lowered = narrow((widen(op->args[0]) - widen(op->args[1]) + 1) / 2);
                        } 
                        else if (op->is_intrinsic(Call::sorted_avg)) {
                            lowered = narrow((widen(op->args[0]) + widen(op->args[1])) / 2);
                        } 
                        else {
                            lowered = lower_intrinsic(op);
                        }
                        if (lowered.defined()) {
                            return mutate(lowered);
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
                    Architecture _arch;

                    Expr visit(const Call *op) override {
                        if (op->is_intrinsic(Call::dynamic_shuffle)) {
                            std::string uname = unique_name('t');
                            abstractions[uname] = IRMutator::visit(op);
                            return Variable::make(op->type, uname);
                        } 
                        else if (op->is_intrinsic(Call::if_then_else)) {
                            //debug(0) << "ITE found: " << op << "\n";
                            std::string uname = unique_name('t');
                            //debug(0) << "Replaced with: " << uname << "\n";
                            abstractions[uname] = IRMutator::visit(op);
                            return Variable::make(op->type, uname);
                        } 
                        else
                            return IRMutator::visit(op);
                    }

                    Expr visit(const Cast *op) override {
                        Expr v = op->value;

                        std::vector<int> vec_lens;


                        switch(_arch){
                            case Architecture::ARM:
                                vec_lens.push_back(64);
                                break;
                            case Architecture::HVX:
                                vec_lens.push_back(1024);
                                break;
                            case Architecture::X86:
                                // Push in vector register sizes in descending order
                                vec_lens.push_back(1024);
                                vec_lens.push_back(512);
                                vec_lens.push_back(256);
                                vec_lens.push_back(128);


                        };

                        for(int vec_len : vec_lens){
                            if (v.type().is_vector() && (v.type().bits() * v.type().lanes() % vec_len != 0) && (v.type().bits() > 1)) {
                                std::string uname = unique_name('t');
                                abstractions[uname] = IRMutator::visit(op);
                                return Variable::make(op->type, uname);
                            }

                        }
                        return IRMutator::visit(op);
                    }

                    public:

                    AbstractUnsupportedNodes(Architecture a, std::map<std::string, Expr> &abstrs)
                        : abstractions(abstrs), _arch(a) {
                        }
                };


                class ExtractIntoCall : public IRMutator {
                    using IRMutator::visit;

                    public:

                    void get_call_args(const Expr &x, std::vector<Expr>& args){

                        for(auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++){
                            const Load* op = bi->first;

                            args.push_back(Load::make(op->type, op->name, op->index, op->image, op->param, op->predicate, op->alignment));
                        }
                    }

                    Expr generate_call(std::string function_name, const Expr &x){
                        std::vector<Expr> args;

                        get_call_args(x, args);

                        std::cout << "Generating Call with type: "<< x.type() << " and lanes "<< x.type().lanes()<<"\n";
                        return Call::make(x.type(), function_name, args, Call::Extern);
                    }

                    ExtractIntoCall(){}
                };

                class ReplaceAbstractedNodes : public IRMutator {
                    using IRMutator::visit;

                    std::map<std::string, Expr> &abstractions;
                    std::map<std::string, Expr> &letvars;

                    Expr visit(const Variable *v) override {
                        if (abstractions.count(v->name) == 0)
                            return IRMutator::visit(v);
                        return abstractions[v->name];
                    }

                    Expr visit(const Load *v) override {
                        //debug(0) << "LOAD NAME: " << v->name << "\n";
                        if (v->name.length() > 4) {
                            // Trim the "-buf" suffix generated by rake
                            std::string vname = v->name.substr(0, v->name.length() - 4);
                            //debug(0) << vname << abstractions.count(vname) << "\n ";
                            if (abstractions.count(vname) > 0) {
                                if (const Ramp *ramp = v->index.as<Ramp>()) {
                                    return Shuffle::make_slice(
                                            abstractions[vname],
                                            ((ramp->base).as<IntImm>())->value,
                                            ((ramp->stride).as<IntImm>())->value,
                                            ramp->lanes
                                            );
                                } else
                                    return abstractions[vname];
                            } else if (letvars.count(vname)) {
                                if (const Ramp *ramp = v->index.as<Ramp>()) {
                                    return Shuffle::make_slice(
                                            Variable::make(letvars[vname].type(), vname),
                                            ((ramp->base).as<IntImm>())->value,
                                            ((ramp->stride).as<IntImm>())->value,
                                            ramp->lanes);
                                }
                            } else if (v->name.substr(v->name.length() - 4, 4) == std::string("-buf")) {
                                if (const Ramp *ramp = v->index.as<Ramp>()) {
                                    return Shuffle::make_slice(
                                            // Todo: look for the actual variable, this type could be wrong
                                            Variable::make(v->type, vname),
                                            ((ramp->base).as<IntImm>())->value,
                                            ((ramp->stride).as<IntImm>())->value,
                                            ramp->lanes);
                                }
                            }
                        }
                        return IRMutator::visit(v);
                    }

                    public:
                    ReplaceAbstractedNodes(std::map<std::string, Expr> &abstrs, std::map<std::string, Expr> &lvs)
                        : abstractions(abstrs), letvars(lvs) {}
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
                    std::string uname = unique_name('t');
                    abstractions[uname] = e;
                    return Variable::make(e.type(), uname);
                }

                /* Some visitor overrides to track the context within which each expr appears */
                using IRMutator::visit;

                Stmt visit(const LetStmt *stmt) override {
                    // debug(0) << "Let Found: " << stmt->name << " = " << stmt->value << "\n";

                    Expr value = stmt->value;
                    value = LowerIntrinsics().mutate(value);
                    value = AbstractUnsupportedNodes(arch, abstractions).mutate(value);

                    bounds.push(stmt->name, bounds_of_expr_in_scope(value, bounds, func_value_bounds));
                    let_vars[stmt->name] = value;
                    linearized_let_vars[stmt->name] = linearize(value);
                    let_decl_order.push_back(stmt->name);
                    return IRMutator::visit(stmt);
                }

                // synthesis
                Expr synthesize_impl(Expr spec_expr, Expr orig_expr);
            };


            class HydrideSynthEmitter {
                public:
                    HydrideSynthEmitter() {};

                    std::string define_load_buffer(const Load *op){
                        std::string reg_name = "reg_"+ std::to_string(LoadToRegMap[op]);
                        size_t bitwidth = op->type.bits() * op->type.lanes();

                        std::string elemT = "'"+type_to_rake_elem_type(op->type, false, true); 

                        if(elemT == "'") return "";

                        std::string define_bitvector_str = "(define-symbolic "+reg_name+"_bitvector"+" "+ "(bitvector "+std::to_string(bitwidth)+")" +")";
                        std::string define_buffer_str = "(define "+reg_name+" (halide:create-buffer "+ reg_name+"_bitvector "+elemT +")"+")";

                        return define_bitvector_str + "\n" + define_buffer_str;
                    }



                    std::string define_variable_buffer(const Variable *op){
                        std::string reg_name = "reg_"+ std::to_string(VariableToRegMap[op]);
                        size_t bitwidth = op->type.bits() * op->type.lanes();

                        std::string elemT = "'"+type_to_rake_elem_type(op->type, false, true); 


                        if(elemT == "'") return "";

                        std::string define_bitvector_str = "(define-symbolic "+reg_name+"_bitvector"+" "+ "(bitvector "+std::to_string(bitwidth)+")" +")";
                        std::string define_buffer_str = "(define "+reg_name+" (halide:create-buffer "+ reg_name+"_bitvector "+elemT +")"+")";

                        return define_bitvector_str + "\n" + define_buffer_str;
                    }

                    std::string emit_buffer_id_map(std::string map_name){
                        std::string comment = "; Creating a map between buffers and halide call node arguments\n";
                        std::string define_buff_map = "(define "+map_name+" (make-hash))" +"\n";
                        std::string add_entry = "";

                        for(auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++){
                            unsigned id = bi->second;
                            add_entry += "(hash-set! "+ map_name+" "+"reg_"+std::to_string(id)+" "+ std::to_string(id) + ")"+"\n";


                        }

                        for(auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end(); bi++){
                            unsigned id = bi->second;
                            add_entry += "(hash-set! "+ map_name+" "+"reg_"+std::to_string(id)+" "+ std::to_string(id) + ")"+"\n";
                        }

                        return comment + define_buff_map + add_entry;

                    }



                    std::string emit_symbolic_buffers(){
                        std::string buffers = "";
                        for(auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++){
                            const Load* op = bi->first;
                            buffers += define_load_buffer(op) + "\n";
                        }

                        for(auto bi = VariableToRegMap.begin(); bi != VariableToRegMap.end(); bi++){
                            const Variable* op = bi->first;
                            buffers += define_variable_buffer(op) + "\n";
                        }

                        return buffers;

                    }


                    std::string emit_symbolic_buffers_vector(std::string vector_name){
                        std::string buffers = "(define "+vector_name+" (vector ";
                        for(auto bi = LoadToRegMap.begin(); bi != LoadToRegMap.end(); bi++){
                            const Load* op = bi->first;
                            buffers +=  "reg_"+std::to_string(LoadToRegMap[op]) + " ";
                        }

                        buffers += "))";
                        return buffers;

                    }

                    std::string emit_racket_imports(){
                        return "#lang rosette\n \
                            (require rosette/lib/synthax)\n \
                            (require rosette/lib/angelic)\n \
                            (require racket/pretty)\n \
                            (require data/bit-vector)\n \
                            (require rosette/lib/destruct)\n \
                            (require rosette/solver/smt/boolector)\n \
                            (require hydride)\n ";
                    }


                    std::string emit_racket_debug(){
                        return "\n \
                            ;; Uncomment the line below to enable verbose logging\n \
                            ;(enable-debug)\n"; 
                    }

                    std::string emit_set_current_bitwidth(size_t bw){
                        return "(current-bitwidth "+ std::to_string(bw)+")";
                    }

                    std::string emit_set_memory_limit(size_t MB){
                        return "(custodian-limit-memory (current-custodian) (* " +std::to_string(MB)+" 1024 1024))";
                    }

                    std::string emit_hydride_synthesis(std::string expr_name, size_t expr_depth, size_t VF, std::string id_map_name){
                        return "(synthesize-halide-expr "+expr_name+ " "+ id_map_name +" " +std::to_string(expr_depth) +" "+std::to_string(VF) + " )";
                    }

                    std::string emit_interpret_expr(std::string expr_name){
                        return "(halide:interpret "+expr_name+")";
                    }


                    std::string emit_assemble_result(std::string result_name , std::string expr_name,  size_t lanes){
                        return "(define "+ result_name +" (halide:assemble-bitvector "+emit_interpret_expr(expr_name) + " "+ std::to_string(lanes)+")"+")";
                    }








            };


            Expr IROptimizer::synthesize_impl(Expr spec_expr, Expr orig_expr) {

                std::cout << "Input expression to synthesize: "<< orig_expr <<"\n";


                RegToLoadMap.clear();
                LoadToRegMap.clear();

                RegToVariableMap.clear();
                VariableToRegMap.clear();

                Encoding encoding = get_encoding(spec_expr, let_vars, linearized_let_vars);

                // Infer symbolic variables
                //InferSymbolics symFinder(let_vars, linearized_let_vars, bounds, func_value_bounds, encoding);
                //spec_expr.accept(&symFinder);

                auto spec_dispatch = get_expr_racket_dispatch(spec_expr, encoding, let_vars);
                std::string expr = spec_dispatch(spec_expr, false /* set_mode */, false /* int_mode */);



                HydrideSynthEmitter HSE;
                std::ofstream rkt;
                std::string file_name = "halide_expr_"+std::to_string(expr_id)+".rkt";
                rkt.open(file_name);


                rkt << HSE.emit_racket_imports() << "\n";
                rkt << HSE.emit_racket_debug() << "\n";
                rkt << HSE.emit_set_current_bitwidth(16) << "\n";
                rkt << HSE.emit_set_memory_limit(20000) << "\n";
                rkt << HSE.emit_symbolic_buffers() << "\n";
                rkt << HSE.emit_buffer_id_map("id-map") << "\n";
                //rkt << HSE.emit_symbolic_buffers_vector("sym_env") << "\n";
                //rkt << sym_bufs.str() << "\n";
                //rkt << sym_vars.str() << "\n";
                //rkt << axioms.str() << "\n";
                //rkt << let_stmts.str() << "\n";

                rkt << "(define halide-expr \n";
                rkt << expr << "\n";
                rkt << ")\n\n";

                rkt << "(clear-vc!)" << "\n";
                rkt << "(define synth-res "+HSE.emit_hydride_synthesis("halide-expr", /* expr depth */ 1, /* VF*/ orig_expr.type().lanes(), /* Hash map name */  "id-map") << ")" <<"\n";
                rkt << "(pretty-print synth-res)"<<"\n";

                rkt.close();

                std::string cmd = "racket " + file_name;

                int ret_code = system(cmd.c_str());
                std::cout << "Synthesis completed with return code:\t"<< ret_code <<"\n";
                


                expr_id++;

                return spec_expr;

            }

        } // namespace Hydride


        Stmt hydride_optimize_hvx(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs) {
            return Hydride::IROptimizer(fvb, Hydride::IROptimizer::HVX, mutated_exprs).mutate(s);
        }


        Stmt hydride_optimize_x86(FuncValueBounds fvb, const Stmt &s, std::set<const BaseExprNode *> &mutated_exprs) {
            return Hydride::IROptimizer(fvb, Hydride::IROptimizer::X86, mutated_exprs).mutate(s);
        }

        Stmt optimize_x86_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb) {


    std::set<const BaseExprNode *> mutated_exprs;
    s = hydride_optimize_x86(fvb, s, mutated_exprs);

    return s;

}

Stmt optimize_hexagon_instructions_synthesis(Stmt s, const Target &t, FuncValueBounds fvb) {


    std::set<const BaseExprNode *> mutated_exprs;
    s = hydride_optimize_hvx(fvb, s, mutated_exprs);

    return s;

}

    }
}
