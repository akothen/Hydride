#ifndef HL_VEC_INFO_H
#define HL_VEC_INFO_H

#include "Expr.h"
#include "Bounds.h"
#include <functional>
#include <string>


#include "ExprUsesVar.h"
#include "Substitute.h"
#include "CodeGen_Internal.h"
#include "Bounds.h"
#include "CSE.h"
#include "FindIntrinsics.h"
#include "IRMutator.h"
#include "IROperator.h"
#include "IREquality.h"
#include "IRPrinter.h"
#include "IRVisitor.h"
#include "ModulusRemainder.h"
#include "Simplify.h"
#include "Substitute.h"
#include <fstream>
#include <stack>
#include <set>
#include <map>

#include <chrono>

namespace Halide {

    namespace Internal {

        class VectorInfo : public IRVisitor {
            public:
                using IRVisitor::visit;

                unsigned max_width;
                bool contains_dynamic_shuffle;
                bool contains_vector_reduce;
                bool supports_saturating_operations;

                VectorInfo(bool sup_sat) : max_width(0), contains_dynamic_shuffle(false), contains_vector_reduce(false) ,supports_saturating_operations(sup_sat)  {}

                /*
                void visit(const Variable* op) override;
                void visit(const Call* op) override;
                void visit(const Cast* op) override;
                void visit(const Broadcast* op) override;
                void visit(const Load* op) override;
                void visit(const Add* op) override;
                void visit(const Sub* op) override;
                void visit(const Mul* op) override;
                void visit(const Div* op) override;
                void visit(const GE* op) override;
                void visit(const GT* op) override;
                void visit(const LT* op) override;
                void visit(const LT* op) override;
                void visit(const Max* op) override;
                void visit(const Min* op) override;
                void visit(const Not* op) override;
                void visit(const Or* op) override;
                void visit(const And* op) override;
                void visit(const Mod* op) override;
                void visit(const EQ* op) override;
                void visit(const NE* op) override;

                */
#define INFO_OP(OP_NAME) \
        void visit(const OP_NAME* op) override {\
        unsigned bitwidth = op->type.bits() * op->type.lanes();\
        max_width = std::max(bitwidth, max_width);\
        debug(0) << "INFO_OP " <<#OP_NAME << ":"<< bitwidth << "\n";\
        IRVisitor::visit(op); \
        }

        INFO_OP(Mod)
        INFO_OP(Div)
        INFO_OP(Mul)
        INFO_OP(Sub)
        INFO_OP(Add)
        INFO_OP(Max)
        INFO_OP(Min)
        INFO_OP(EQ)
        INFO_OP(NE)
        INFO_OP(LT)
        INFO_OP(LE)
        INFO_OP(GT)
        INFO_OP(GE)
        INFO_OP(And)
        INFO_OP(Or)
        INFO_OP(Variable)
        INFO_OP(Cast);
        INFO_OP(Broadcast);
        INFO_OP(Load);

#define INFO_CALL_INTERNAL_WIDEN_CLAUSE(OP_NAME) \
            if(op->is_intrinsic(Call::OP_NAME)){ \
                unsigned bitwidth = op->type.bits() * op->type.lanes() * 2;\
                max_width = std::max(bitwidth, max_width);\
                debug(0) << "Widenened maximum size: "<< max_width << "\n";\
                }

#define INFO_CALL_CLAUSE(OP_NAME) \
            if(op->is_intrinsic(Call::OP_NAME)){ \
                unsigned bitwidth = op->type.bits() * op->type.lanes() * 1;\
                debug(0) << "INFO_CALL_CLAUSE width : "<< op->name << ": "<<bitwidth << "\n";\
                max_width = std::max(bitwidth, max_width);\
                }


        void visit(const VectorReduce *op) override{
            contains_vector_reduce = true;

        }


        void visit(const Call* op) override {
            debug(0) << "Vector info on Call node\n";


            if(supports_saturating_operations){

                INFO_CALL_CLAUSE(saturating_add) // TODO: Widens internally, distribute differently
                INFO_CALL_CLAUSE(saturating_sub) // TODO: Widens internally, distribute differently

            } else {

                INFO_CALL_INTERNAL_WIDEN_CLAUSE(saturating_add) // TODO: Widens internally, distribute differently
                INFO_CALL_INTERNAL_WIDEN_CLAUSE(saturating_sub) // TODO: Widens internally, distribute differently

            }
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(halving_add)// TODO: Widens internally, distribute differently
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(halving_sub)// TODO: Widens internally, distribute differently
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(rounding_halving_add)  // TODO: Widens internally, distribute differently
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(rounding_halving_sub)// TODO: Widens internally, distribute differently
            INFO_CALL_CLAUSE(absd)
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(rounding_shift_right)// TODO: Widens internally, distribute differently
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(rounding_mul_shift_right)// TODO: Widens internally, distribute differently
            INFO_CALL_INTERNAL_WIDEN_CLAUSE(mul_shift_right)// TODO: Widens internally, distribute differently
            INFO_CALL_CLAUSE(widening_mul)
            INFO_CALL_CLAUSE(widening_add)
            INFO_CALL_CLAUSE(widening_sub)
            INFO_CALL_CLAUSE(widening_shift_right)
            INFO_CALL_CLAUSE(widening_shift_left)
            INFO_CALL_CLAUSE(dynamic_shuffle)

            if(op->is_intrinsic(Call::dynamic_shuffle)){
                contains_dynamic_shuffle = true;
            }




            unsigned bitwidth = op->type.bits() * op->type.lanes() ;
            max_width = std::max(bitwidth, max_width);

            IRVisitor::visit(op);

        }

        void visit(const IfThenElse *op) override{
            contains_dynamic_shuffle = true;
        }





        };


    }  // namespace Internal

}  // namespace Halide

#endif  // HL_VEC_INFO_H
