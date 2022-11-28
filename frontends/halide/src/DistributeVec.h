#ifndef HL_DISTRIBUTE_VEC_H
#define HL_DISTRIBUTE_VEC_H

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

        // Object to represent how 
        // the original vector expression
        // 'expr' is distributed into 
        // multiple expressions;
        struct DistributeInfo {
            const IRNode* expr_node;
            std::vector<Expr> distributed_expressions;
            unsigned distributed_size;

            // If the expression can be equally distributed into
            // multiple expressions. Otherwise final expression
            // may contain <= distributed_size expressions.
            bool equally_distributed;


        };

        class DistributeVec : public VariadicVisitor<DistributeVec, std::vector<Expr>, Stmt>{

            public:
                DistributeVec(unsigned bitvector_size) : bitvector_size(bitvector_size) {}

                unsigned bitvector_size;
                std::map<const IRNode*, DistributeInfo*> DistribMap;


                std::map<std::string, Expr> VariableNameToExpr;

                // Expressions
                std::vector<Expr> visit(const Load *op, unsigned num_chunks);
                std::vector<Expr> visit(const Add *op, unsigned num_chunks);
                std::vector<Expr> visit(const Ramp *op, unsigned num_chunks);
                std::vector<Expr> visit(const IntImm *op , unsigned num_chunks);
                std::vector<Expr> visit(const UIntImm *op , unsigned num_chunks);
                std::vector<Expr> visit(const FloatImm *op , unsigned num_chunks);
                std::vector<Expr> visit(const StringImm *op , unsigned num_chunks);
                std::vector<Expr> visit(const Broadcast *op , unsigned num_chunks);
                std::vector<Expr> visit(const Cast *op , unsigned num_chunks);
                std::vector<Expr> visit(const Variable *op , unsigned num_chunks);
                std::vector<Expr> visit(const Sub *op , unsigned num_chunks);
                std::vector<Expr> visit(const Mul *op , unsigned num_chunks);
                std::vector<Expr> visit(const Div *op , unsigned num_chunks);
                std::vector<Expr> visit(const Mod *op , unsigned num_chunks);
                std::vector<Expr> visit(const Min *op , unsigned num_chunks);
                std::vector<Expr> visit(const Max *op , unsigned num_chunks);
                std::vector<Expr> visit(const EQ *op , unsigned num_chunks);
                std::vector<Expr> visit(const NE *op , unsigned num_chunks);
                std::vector<Expr> visit(const LT *op , unsigned num_chunks);
                std::vector<Expr> visit(const LE *op , unsigned num_chunks);
                std::vector<Expr> visit(const GT *op , unsigned num_chunks);
                std::vector<Expr> visit(const GE *op , unsigned num_chunks);
                std::vector<Expr> visit(const And *op , unsigned num_chunks);
                std::vector<Expr> visit(const Or *op , unsigned num_chunks);
                std::vector<Expr> visit(const Not *op , unsigned num_chunks);
                std::vector<Expr> visit(const Select *op , unsigned num_chunks);
                std::vector<Expr> visit(const Call *op , unsigned num_chunks);
                std::vector<Expr> visit(const Shuffle *op , unsigned num_chunks);
                std::vector<Expr> visit(const VectorReduce *op , unsigned num_chunks);
                std::vector<Expr> visit(const Let *op , unsigned num_chunks);


                // Statements
                Stmt visit(const Store *op);
                Stmt visit(const LetStmt *op);
                Stmt visit(const AssertStmt *op);
                Stmt visit(const For *op);
                Stmt visit(const Provide *op);
                Stmt visit(const Allocate *op);
                Stmt visit(const Evaluate *op);
                Stmt visit(const ProducerConsumer *op);
                Stmt visit(const Block *op);
                Stmt visit(const Realize *op);
                Stmt visit(const Prefetch *op);
                Stmt visit(const Free *op);
                Stmt visit(const Acquire *op);
                Stmt visit(const Fork *op);
                Stmt visit(const IfThenElse *op);
                Stmt visit(const Atomic *op);






        };

        Stmt distribute_vector_exprs(Stmt S, unsigned bitwidth);

    }  // namespace Internal

}  // namespace Halide

#endif  // HL_DISTRIBUTE_VEC_H
