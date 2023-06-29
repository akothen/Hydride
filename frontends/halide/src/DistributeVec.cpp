#include "DistributeVec.h"
#include "CSE.h"
#include "VectorInfo.h"


using namespace std;


namespace Halide {
    namespace Internal {


        // ==================== Expressions ===========================

        std::vector<Expr> DistributeVec::visit(const Ramp* op, unsigned num_chunks){
            debug(0) << "Distribute ramp into "<<num_chunks << " chunks \n";



            Expr OrigRamp = Ramp::make(op->base, op->stride, op->lanes);

            std::vector<Expr> exprs;

            if(num_chunks == 1){
                exprs.push_back(Ramp::make(op->base, op->stride, op->lanes));
                return exprs;
            }



            unsigned num_bits = op->type.bits() * op->type.lanes();

            // Ramps by definition produce a vector, so we can avoid
            // checking if it's of vector type.
            if(num_chunks > 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;


                Expr start = op->base;
                Expr stride = op->stride;

                int lanes_per_chunk = op-> lanes / num_chunks ;

                // Distribute ramp over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_start = start + ((int)i * lanes_per_chunk * stride);
                    Expr new_stride = stride;

                    exprs.push_back(Ramp::make(new_start, new_stride, lanes_per_chunk));
                }


                // Add new DistributeInfo entry to avoid re-calculation
                DistributeInfo* DI = new DistributeInfo;
                DI->expr_node = op;
                DI->distributed_expressions = exprs;
                DI->distributed_size = bitvector_sizes[0];
                DI->equally_distributed = !divisible;

                DistribMap[op] = DI;


            } 

            return exprs;
        }

        std::vector<Expr> DistributeVec::visit(const Load* op, unsigned num_chunks){

            debug(0) << "Distribute Load into " << num_chunks << "!\n";


            std::vector<Expr> exprs;


            if(op->type.is_scalar() || num_chunks == 1){
                exprs.push_back(Load::make(op->type, op->name, op->index, op->image, op->param, op->predicate, op->alignment));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks >= 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;



                std::vector<Expr> distributed_index = dispatch(op->index, num_chunks);
                std::vector<Expr> distributed_predicate = dispatch(op->predicate, num_chunks);


                int lanes_per_chunk = op->type.lanes() / num_chunks ;

                Type new_load_ty = Type(op->type.code(), op->type.bits(), lanes_per_chunk);


                //int step_size = op->type.lanes() / (int) num_chunks;

                Expr Combined = Load::make(op->type, op->name, op->index , op->image, op->param, op->predicate , op->alignment );
                // Distribute load over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    debug(0) << "Original Load: "<<Combined <<"\n";
                    debug(0) << "Original predicate: " << op->predicate << "\n";
                    debug(0) << "Original index: "<< op->index <<"\n";
                    debug(0) << "Distributed Index size: "<< distributed_index.size() << "\n";
                    debug(0) << "Distributed Predicate size: "<< distributed_predicate.size() << "\n";
                    

                    debug(0) << "Vector lanes of Load: "<< new_load_ty.lanes() << ", vector lanes of predicate: "<<distributed_predicate[i].type().lanes()<<"\n";
                    Expr new_load = Load::make(new_load_ty, op->name, distributed_index[i], op->image, op->param, distributed_predicate[i], op->alignment );

                    debug(0) << "NewLoad: "<<new_load<<"\n";
                    
                    exprs.push_back(new_load);


                    /*
                    Expr new_load_slice = Shuffle::make_slice(Combined, (int) i * lanes_per_chunk, 1, lanes_per_chunk);

                    debug(0) << "NewLoad Slice: "<<new_load_slice<<"\n";
                    exprs.push_back(new_load_slice);
                    */

                }

                // TODO: This is expensive for when the load does not utilize the full vector length: Add a clause to simplify slice_vector 
                // the given load

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                }



            }




            debug(0) << "Completed distributing Load...\n";
            return exprs;
        }




#define DISTRIBUTE_BINARY_OP(OP_NAME) \
        std::vector<Expr> DistributeVec::visit(const OP_NAME* op, unsigned num_chunks){ \
            debug(0) << "Distributing Binary Op " << #OP_NAME << "!  into num chunks " << num_chunks << "\n";\
            std::vector<Expr> exprs; \
            \
            \
            if(op->type.is_scalar()){\
                Expr DistributedBOP = OP_NAME::make(dispatch(op->a,1)[0], dispatch(op->b,1)[0]);\
                exprs.push_back(DistributedBOP);\
                return exprs;\
            }\
            unsigned orig_num_chunks = num_chunks;\
            if(distribution_look_ahead){\
                size_t expr_bitwidth = op->type.lanes() * op->type.bits();\
                    for (unsigned bv : bitvector_sizes){\
                        if(expr_bitwidth % bv == 0){\
                            num_chunks = expr_bitwidth / bv;\
                            break;\
                        }\
                    }\
            }\
            Expr OrigBOP = OP_NAME::make(op->a, op->b); \
            \
            unsigned num_bits = op->type.bits() * op->type.lanes(); \
                bool divisible = (bitvector_sizes[0] % num_bits) == 0; \
                \
                \
                std::vector<Expr> distributed_a = dispatch(op->a, num_chunks); \
                std::vector<Expr> distributed_b = dispatch(op->b, num_chunks); \
                if(distributed_a.size() != distributed_b.size()) { \
                    debug(0) << "Orig op"<< OrigBOP << "\n"; \
                    debug(0) << "Distributed a size:" << distributed_a.size() << "\n"; \
                    debug(0) << "Distributed b size:" << distributed_b.size() << "\n"; \
                    for(auto A : distributed_a){ \
                        debug(0) << "A:" << A <<"\n";\
                    }\
                    for(auto B : distributed_b){ \
                        debug(0) << "B:" << B <<"\n";\
                    }\
                }\
                internal_assert(distributed_a.size() == distributed_b.size()) << "Distributed arguments require same number of operands\n"; \
                internal_assert(distributed_a.size() == num_chunks) << "Distributed arguments must have required  number of operands\n"; \
                \
                for(unsigned i = 0; i < num_chunks; i++){ \
                    Expr new_bop = OP_NAME::make((distributed_a[i]), (distributed_b[i])); \
                    exprs.push_back((new_bop)); \
                } \
                DistributeInfo* DI = new DistributeInfo; \
                DI->expr_node = op; \
                DI->distributed_expressions = exprs; \
                DI->distributed_size = bitvector_sizes[0]; \
                DI->equally_distributed = !divisible; \
                DistribMap[op] = DI; \
            if(orig_num_chunks != num_chunks){\
                std::vector<Expr> new_expr;\
                Expr CombinedExpr = Shuffle::make_concat(exprs);\
                int lanes_per_chunk = op->type.lanes() / orig_num_chunks;\
                for(unsigned i = 0; i < orig_num_chunks;i++){\
                    Expr new_slice = Shuffle::make_slice(CombinedExpr,(int) i * lanes_per_chunk, 1, lanes_per_chunk);\
                    new_expr.push_back((new_slice));\
                }\
                exprs = new_expr;\
            }\
            return exprs; \
        } 


        

        DISTRIBUTE_BINARY_OP(Mod)
        DISTRIBUTE_BINARY_OP(Div)
        DISTRIBUTE_BINARY_OP(Mul)
        DISTRIBUTE_BINARY_OP(Sub)
        DISTRIBUTE_BINARY_OP(Add)
        DISTRIBUTE_BINARY_OP(Max)
        DISTRIBUTE_BINARY_OP(Min)
        DISTRIBUTE_BINARY_OP(EQ)
        DISTRIBUTE_BINARY_OP(NE)
        DISTRIBUTE_BINARY_OP(LT)
        DISTRIBUTE_BINARY_OP(LE)
        DISTRIBUTE_BINARY_OP(GT)
        DISTRIBUTE_BINARY_OP(GE)
        DISTRIBUTE_BINARY_OP(And)
        DISTRIBUTE_BINARY_OP(Or)


        std::vector<Expr> DistributeVec::visit(const Not* op, unsigned num_chunks){



            std::vector<Expr> exprs;


            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back(Not::make(op->a));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks > 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;


                std::vector<Expr> distributed_a = dispatch(op->a, num_chunks);

                // Distribute not over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_not = Not::make(distributed_a[i]);
                    exprs.push_back(new_not);

                }

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                }

                // Add new DistributeInfo entry to avoid re-calculation
                DistributeInfo* DI = new DistributeInfo;
                DI->expr_node = op;
                DI->distributed_expressions = exprs;
                DI->distributed_size = bitvector_sizes[0];
                DI->equally_distributed = !divisible;

                DistribMap[op] = DI;


            }
            return exprs;
        }


        Expr DistributeVec::RewriteAsDoubleCast(const Cast* op){

            unsigned result_num_bits = op->type.bits();            
            unsigned operand_num_bits = op->value.type().bits();

            Expr NewCast;
            Expr IntermediateCast;

            // Widening case
            if(result_num_bits > operand_num_bits && result_num_bits / operand_num_bits == 4){

                IntermediateCast = Cast::make(op->value.type().widen(), op->value);
                NewCast = Cast::make(op->type, IntermediateCast);


            // Narrowing Case
            } else if (result_num_bits < operand_num_bits && operand_num_bits / result_num_bits == 4){

                IntermediateCast = Cast::make(op->value.type().narrow(), op->value);
                NewCast = Cast::make(op->type, IntermediateCast);
            } 

            return NewCast;

        }

        bool DistributeVec::isDoubleCast(const Cast* op){

            if(!op->type.is_vector() || !op->type.is_int_or_uint()) return false;

            unsigned result_num_bits = op->type.bits();            
            unsigned operand_num_bits = op->value.type().bits();

            // Widening case
            if(result_num_bits > operand_num_bits){
                return result_num_bits / operand_num_bits == 4;
            // Narrowing Case
            } else if (result_num_bits < operand_num_bits){
                return operand_num_bits / result_num_bits == 4;
            } else {
                return false;
            }
        }


        std::vector<Expr> DistributeVec::visit(const Cast* op, unsigned num_chunks){

            Expr OrigExpr = Cast::make(op->type, op->value);
            debug(0) << "Distribute Cast "<< OrigExpr <<" into " << num_chunks<< "!\n";

            if(isDoubleCast(op)){
                debug(0) << "Double cast: split into two exprs "<<"\n";
                Expr SplitCast = RewriteAsDoubleCast(op);
                debug(0) << SplitCast <<"\n";
                return dispatch(SplitCast, num_chunks);
            }


            std::vector<Expr> exprs;


            if(op->type.is_scalar()){
                exprs.push_back(Cast::make(op->type, op->value));
                return exprs;
            }


            unsigned orig_num_chunks = num_chunks;

            size_t larger_size = std::max(op->type.lanes() * op->type.bits(), op->value.type().lanes() * op->value.type().bits());

            if(distribution_look_ahead){
                size_t expr_bitwidth = std::max(op->type.lanes() * op->type.bits(), op->value.type().lanes() * op->value.type().bits());
                    for (unsigned bv : bitvector_sizes){
                        if(expr_bitwidth % bv == 0){
                            num_chunks = expr_bitwidth / bv;
                            break;
                        }
                    }
                    debug(0) << "Distrubtion of cast using new num_chunks: "<< num_chunks << "\n";
            }










            // Calculate operand_num_chunks which may be different from the num_chunks 
            // passed to this method. We want to fit all operations
            // in the desired vector width 'bitvector_size'
            unsigned result_num_bits = op->type.bits() * op->type.lanes();  
            unsigned operand_num_bits = op->value.type().bits() * op->value.type().lanes(); 


            int start, end, step;

            // If down-casting then traverse bitvector sizes from smallest to largest for fit
            if(result_num_bits < operand_num_bits){
                start = bitvector_sizes.size() - 1;
                end = -1;
                step = -1;
            } else {
                start = 0;
                end = bitvector_sizes.size();
                step = 1;
            }

            bool possible_to_lower = false;
            std::vector<Expr> distributed_value;
            //for(unsigned bitvector_size : bitvector_sizes){
            for(int i = start; i != end; i += step){

                unsigned bitvector_size = bitvector_sizes[i];
                
                if(larger_size % bitvector_size != 0) continue; 
                debug(0) << "Using "<<bitvector_size << " to lower cast \n";
                possible_to_lower = true;

                // Handle distribution differently based on whether we are increasing bitwidth or decreasing bitwidth
            
                unsigned operand_num_chunks = 0;
                if(result_num_bits > operand_num_bits){
                    // Increasing bitwidth, give larger register size to result
                    operand_num_chunks = result_num_bits / bitvector_size;
                    

                } else if (operand_num_bits > result_num_bits ){
                    // Decreasing bitwidth, give larger register size to operand
                    //operand_num_chunks = operand_num_bits / bitvector_size;
                    operand_num_chunks = operand_num_bits / (bitvector_sizes[i + step]);
                } else {
                    operand_num_chunks = orig_num_chunks;
                }


                debug(0) << "Operand num chunks for cast is "<< operand_num_chunks <<"\n";
                distributed_value = dispatch(op->value, operand_num_chunks);

                std::vector<Expr> DistributedCasts;

                int lanes_per_chunk = op->type.lanes() / (int) operand_num_chunks;

                internal_assert((op->type.lanes() * op->type.bits()) / bitvector_size == operand_num_chunks) << "Cast Distribution broken..." << "\n";


                debug(0) << "Lanes per chunk for cast is " << lanes_per_chunk << "\n";
                Type new_cast_ty = op->type.with_lanes(lanes_per_chunk);

                for (auto distrib_value : distributed_value){
                    DistributedCasts.push_back(Cast::make(new_cast_ty , distrib_value));
                }


                if(operand_num_chunks != orig_num_chunks){
                    debug(0) << "[CAST]: distribution is different "<<"\n"; 
                    Expr Combined = Shuffle::make_concat(DistributedCasts);
                    debug(0) << "[CAST]: Combined: "<< Combined <<"\n";

                    std::vector<Expr> new_expr;
                    int lanes_per_chunk = op->type.lanes() / orig_num_chunks;
                    for(unsigned i = 0; i < orig_num_chunks;i++){
                        Expr new_slice = Shuffle::make_slice(Combined,(int) i * lanes_per_chunk, 1, lanes_per_chunk);
                        debug(0) << "Slicing concatenation of cast "<< new_slice <<"\n";
                        new_expr.push_back((new_slice));
                    }
                    exprs = new_expr;
                    return exprs;

                } else {
                    return DistributedCasts;
                }



#if 0
                unsigned operands_num_chunks = larger_size / bitvector_size; // 2 ?
                distributed_value = dispatch(op->value, operands_num_chunks);

                // In the case where the operands are distributed by 
                // into different number of chunks, we first concatenate 
                // the results and then extract the slices accordingly.
                if(operands_num_chunks != num_chunks){
                    internal_assert(distributed_value.size() != 0) << "Concat empty vectors for cast nodes\n";
                    debug(0) << "make concat "<<"cast"<<"\n";
                    for(auto val : distributed_value){
                        debug(0) << "Individual elem: "<<val<<"\n";
                    }
                    // SIMPLIFY ADDED
                    Expr Combined = (Shuffle::make_concat(distributed_value));
                    


                    // Distribute not over 'chunks' number of equally sized
                    // expressions.
                    std::vector<Expr> slice_casts;
                    if(num_chunks == 1){
                        slice_casts.push_back(Combined);
                    } else {
                        int step_size = op->type.lanes() / (int) num_chunks;
                        for(unsigned i = 0; i < num_chunks; i++){
                            // SIMPLIFY ADDED
                            Expr new_shuffle = (Shuffle::make_slice(Combined, (int) i * step_size, 1, step_size));
                            slice_casts.push_back(new_shuffle);
                        }
                    }

                    distributed_value = slice_casts;
                    //break;
                }

                //? break;
#endif
            }

            // Simply split current expression and return
            if(!possible_to_lower){
                int step_size = op->type.lanes() / (int) orig_num_chunks;
                for(unsigned i = 0; i < orig_num_chunks; i++){
                    // SIMPLIFY ADDED
                    Expr new_shuffle = (Shuffle::make_slice(OrigExpr, (int) i * step_size, 1, step_size));
                    exprs.push_back(new_shuffle);
                }
                return exprs;
            }

            internal_assert(possible_to_lower) << "Unable to identify lowering strategy for cast operations\n";

            int lanes_per_chunk = op->type.lanes() / (int) num_chunks;

            Type new_cast_ty = op->type.with_lanes(lanes_per_chunk);

            // Distribute not over 'chunks' number of equally sized
            // expressions.
            for(unsigned i = 0; i < num_chunks; i++){
                Expr new_cast = Cast::make(new_cast_ty , distributed_value[i]);
                exprs.push_back(new_cast);
            }



            if(orig_num_chunks != num_chunks){
                std::vector<Expr> new_expr;
                Expr CombinedExpr = Shuffle::make_concat(exprs);
                int lanes_per_chunk = op->type.lanes() / orig_num_chunks;
                for(unsigned i = 0; i < orig_num_chunks;i++){
                    Expr new_slice = Shuffle::make_slice(CombinedExpr,(int) i * lanes_per_chunk, 1, lanes_per_chunk);
                    new_expr.push_back((new_slice));
                }
                exprs = new_expr;
            }
            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const Variable* op, unsigned num_chunks){


            std::vector<Expr> exprs;

            if(VariableNameToExpr.count(op->name) != 0){
                return dispatch(VariableNameToExpr[op->name], num_chunks);
            }


            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back(Variable::make(op->type, op->name));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks > 1){

                // Split variable into num_chunks 

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;



                Expr OrigVar = Variable::make(op->type, op->name);
                int step_size = op->type.lanes() / (int) num_chunks;

                // Distribute not over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_shuffle = Shuffle::make_slice(OrigVar, (int) i * step_size, 1, step_size);
                    exprs.push_back(new_shuffle);

                }

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                }

                // Add new DistributeInfo entry to avoid re-calculation
                DistributeInfo* DI = new DistributeInfo;
                DI->expr_node = op;
                DI->distributed_expressions = exprs;
                DI->distributed_size = bitvector_sizes[0];
                DI->equally_distributed = !divisible;
                DistribMap[op] = DI;
            }
            return exprs;
        }

        std::vector<Expr> DistributeVec::visit(const Select* op, unsigned num_chunks){


            std::vector<Expr> exprs;


            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back(Select::make(op->condition, op->true_value, op->false_value));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks > 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;


                std::vector<Expr> distributed_cond = dispatch(op->condition, num_chunks);
                std::vector<Expr> distributed_true_value = dispatch(op->true_value, num_chunks);
                std::vector<Expr> distributed_false_value = dispatch(op->false_value, num_chunks);

                // Distribute not over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_select = Select::make(distributed_cond[i], distributed_true_value[i], distributed_false_value[i]);
                    exprs.push_back(new_select);

                }

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                }

                // Add new DistributeInfo entry to avoid re-calculation
                DistributeInfo* DI = new DistributeInfo;
                DI->expr_node = op;
                DI->distributed_expressions = exprs;
                DI->distributed_size = bitvector_sizes[0];
                DI->equally_distributed = !divisible;
                DistribMap[op] = DI;
            }
            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const VectorReduce* op, unsigned num_chunks){


            debug(0) << "Distribute VectorReduce with num chunks: " << num_chunks << "\n";
            std::vector<Expr> exprs;
            internal_assert(num_chunks == 1) << "Vector Reduce can only be distributed as 1!\n";\


            exprs.push_back(VectorReduce::make(op->op, dispatch(op->value, num_chunks)[0], op->type.lanes()));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const IntImm* op, unsigned num_chunks){


            std::vector<Expr> exprs;


            exprs.push_back(IntImm::make(op->type, op->value));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const UIntImm* op, unsigned num_chunks){


            std::vector<Expr> exprs;

            exprs.push_back(UIntImm::make(op->type, op->value));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const FloatImm* op, unsigned num_chunks){


            std::vector<Expr> exprs;

            exprs.push_back(FloatImm::make(op->type, op->value));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const StringImm* op, unsigned num_chunks){


            std::vector<Expr> exprs;


            exprs.push_back(StringImm::make( op->value));

            return exprs;
        }

        std::vector<Expr> DistributeVec::visit(const Broadcast* op, unsigned num_chunks){

            
            Expr OrigBroadcast = Broadcast::make(op->value, op->type.lanes());
            debug(0) << "Distribute Broadcast "<< OrigBroadcast << " into " << num_chunks << "!\n";

            std::vector<Expr> exprs;


            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back(Broadcast::make(op->value, op->lanes));
                debug(0) << "Completed distributing broadcast!\n";
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks > 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;

                // Distribute not over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    int lanes_per_chunk = op->type.lanes() / (int) num_chunks;
                    Expr new_broadcast = Broadcast::make(op->value, lanes_per_chunk);
                    exprs.push_back(new_broadcast);

                }

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                }

                // Add new DistributeInfo entry to avoid re-calculation
                DistributeInfo* DI = new DistributeInfo;
                DI->expr_node = op;
                DI->distributed_expressions = exprs;
                DI->distributed_size = bitvector_sizes[0];
                DI->equally_distributed = !divisible;
                DistribMap[op] = DI;
            }
            debug(0) << "Completed distributing broadcast!\n";
            return exprs;
        }


#define DISTRIBUTE_CALL_CLAUSE(OP_NAME) \
            if(op->is_intrinsic(Call::OP_NAME)){ \
                Expr Arg0 = op->args[0];\
                Expr Arg1 = op->args[1];\
                debug(0) << "Distributing: "<< op->name << "into "<< num_chunks <<"\n";\
                distrib = true; \
                unsigned expr_bitwidth = (op->type.bits() * op->type.lanes());\
                unsigned orig_num_chunks = num_chunks;\
                if(distribution_look_ahead){\
                    for (unsigned bv : bitvector_sizes){\
                        if(expr_bitwidth % bv == 0){\
                            num_chunks = expr_bitwidth / bv;\
                            break;\
                        }\
                    }\
                }\
                std::vector<Expr> distributed_op_0 = dispatch(op->args[0], num_chunks); \
                std::vector<Expr> distributed_op_1 = dispatch(op->args[1], num_chunks); \
                debug(0) << "Distributed op 0 size: " << distributed_op_0.size() <<"\n";\
                debug(0) << "Distributed op 1 size: " << distributed_op_1.size() <<"\n";\
                debug(0) << Arg0 <<"\n" << Arg1 <<"\n";\
                internal_assert(distributed_op_0.size() == distributed_op_1.size()) << "DISTRIBUTE_CALL_CLAUSE divided operands differently!\n";\
                    for(unsigned i = 0; i < num_chunks; i++){\
                        Expr call_op_i = OP_NAME(distributed_op_0[i], distributed_op_1[i]); \
                            exprs.push_back(call_op_i); \
                    } \
                if(orig_num_chunks != num_chunks){\
                std::vector<Expr> new_expr;\
                Expr CombinedExpr = Shuffle::make_concat(exprs);\
                int lanes_per_chunk = op->type.lanes() / orig_num_chunks;\
                for(unsigned i = 0; i < orig_num_chunks;i++){\
                    Expr new_slice = Shuffle::make_slice(CombinedExpr,(int) i * lanes_per_chunk, 1, lanes_per_chunk);\
                    new_expr.push_back((new_slice));\
                }\
                exprs = new_expr;\
                }\
            }


// Certain intrinstics widen internally and then narrow before returning
// the result. This case accounts for the internal widening when deciding
// to distribute the vectors.
//
#define DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(OP_NAME) \
            if(op->is_intrinsic(Call::OP_NAME)){ \
                \
                unsigned operands_num_bits = (op->type.bits() * op->type.lanes()) * 2;\
                std::vector<Expr> distributed_value;\
                for(unsigned bitvector_size : bitvector_sizes){\
                    \
                    if(operands_num_bits % bitvector_size != 0) continue;\
                    \
                    unsigned operands_num_chunks = operands_num_bits / bitvector_size ; \
                    distrib = true; \
\
                    std::vector<Expr> distributed_op_0 = dispatch(op->args[0], operands_num_chunks); \
                    std::vector<Expr> distributed_op_1 = dispatch(op->args[1], operands_num_chunks); \
                    for(unsigned i = 0; i < operands_num_chunks; i++){\
                        Expr call_op_i = OP_NAME(distributed_op_0[i], distributed_op_1[i]); \
                        exprs.push_back((call_op_i)); \
                    } \
\
                    if(operands_num_chunks != num_chunks){ \
                        internal_assert(exprs.size() != 0) << "Concat empty vectors for internal widen call nodes\n";\
                    debug(0) << "make concat "<<"call"<<"\n";\
                        Expr Combined = (Shuffle::make_concat(exprs)); \
                        std::vector<Expr> slice_casts;\
                        if(num_chunks == 1){\
                            slice_casts.push_back(Combined); \
                        } else { \
                            int step_size = op->type.lanes() / (int) num_chunks; \
                            for(unsigned i = 0; i < num_chunks; i++){ \
                                Expr new_shuffle = Shuffle::make_slice(Combined, (int) i * step_size, 1, step_size); \
                                slice_casts.push_back(new_shuffle); \
                            }\
                        } \
                        exprs = slice_casts; \
                    }\
                    break; \
                }\
            }

        std::vector<Expr> DistributeVec::visit(const int op, unsigned num_chunks){
            std::vector<Expr> exprs;

            for(unsigned i = 0; i < num_chunks; i++){
                exprs.push_back(Expr(op));
            }

            return exprs;

        }

        std::vector<Expr> DistributeVec::visit(const Call* op, unsigned num_chunks){
            std::vector<Expr> exprs;

            Expr  CallExpr = Call::make(op->type, op->name, op->args, op->call_type, op->func, op->value_index, op->image, op->param);


            if(op->type.is_scalar() ){
                exprs.push_back(CallExpr);
                return exprs;
            }



            bool distrib = false;


            if(op->is_intrinsic(Call::dynamic_shuffle)){
                std::vector<Expr> distributed_args;
                distributed_args.push_back(dispatch(op->args[0], 1)[0]);
                distributed_args.push_back(dispatch(op->args[1], 1)[0]);
                distributed_args.push_back(op->args[2]);

                distributed_args.push_back(op->args[3]);

                CallExpr = Call::make(op->type, Call::dynamic_shuffle, distributed_args, op->call_type);



            }


            if(supports_saturating_operations){
                DISTRIBUTE_CALL_CLAUSE(saturating_add) // TODO: Widens internally, distribute differently
                DISTRIBUTE_CALL_CLAUSE(saturating_sub) // TODO: Widens internally, distribute differently

            } else {
                DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(saturating_add) // TODO: Widens internally, distribute differently
                DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(saturating_sub) // TODO: Widens internally, distribute differently
            }
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(halving_add)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(halving_sub)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(rounding_halving_add)  // TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(rounding_halving_sub)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_CLAUSE(absd)
            //DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(rounding_shift_right)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_CLAUSE(rounding_shift_right)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_CLAUSE(widening_mul)
            DISTRIBUTE_CALL_CLAUSE(widening_add)
            DISTRIBUTE_CALL_CLAUSE(widening_sub)
            DISTRIBUTE_CALL_CLAUSE(widening_shift_right)
            DISTRIBUTE_CALL_CLAUSE(widening_shift_left)

            // Rounding mul_shift right performs widening and then narrowing.
            // Hence, we distribute the call such that the widened 
            // call fits into bitvector sizes supported.
            if(op->is_intrinsic(Call::rounding_mul_shift_right)){

                unsigned operands_num_bits = (op->type.bits() * op->type.lanes()) * 2; // widened size

                std::vector<Expr> distributed_value;
                for(unsigned bitvector_size : bitvector_sizes){

                    if(operands_num_bits % bitvector_size != 0) continue;

                    unsigned operands_num_chunks = operands_num_bits / bitvector_size ;
                    distrib = true; 

                    std::vector<Expr> distributed_op_0 = dispatch(op->args[0], operands_num_chunks); 
                    std::vector<Expr> distributed_op_1 = dispatch(op->args[1], operands_num_chunks); 
                    std::vector<Expr> distributed_op_2 = dispatch(op->args[2], operands_num_chunks); 
                    for(unsigned i = 0; i < operands_num_chunks; i++){
                        Expr call_op_i = rounding_mul_shift_right(distributed_op_0[i], distributed_op_1[i], distributed_op_2[i]); 
                        exprs.push_back(call_op_i); 
                    } 

                    // In the case where the operands are distributed by 
                    // into different number of chunks, we first concatenate 
                    // the results and then extract the slices accordingly.
                    if(operands_num_chunks != num_chunks){
                        internal_assert(exprs.size() != 0) << "Concat empty vectors for rounding_mul_shift_right nodes\n";
                        debug(0) << "make concat "<<"rounding_mul_shift_right"<<"\n";
                        Expr Combined = simplify(Shuffle::make_concat(exprs));


                        std::vector<Expr> slice_casts;
                        if(num_chunks == 1){
                            slice_casts.push_back(Combined);
                        } else {
                            int step_size = op->type.lanes() / (int) num_chunks;
                            // Distribute not over 'chunks' number of equally sized
                            // expressions.
                            for(unsigned i = 0; i < num_chunks; i++){

                                Expr new_shuffle = Shuffle::make_slice(Combined, (int) i * step_size, 1, step_size);
                                slice_casts.push_back(new_shuffle);
                            }
                        }
                        exprs = slice_casts;

                    }

                    break;

                }
            }

            if(op->is_intrinsic(Call::mul_shift_right)){

                unsigned operands_num_bits = (op->type.bits() * op->type.lanes()) * 2; // widened size

                std::vector<Expr> distributed_value;
                for(unsigned bitvector_size : bitvector_sizes){

                    if(operands_num_bits % bitvector_size != 0) continue;

                    unsigned operands_num_chunks = operands_num_bits / bitvector_size ;
                    distrib = true; 

                    std::vector<Expr> distributed_op_0 = dispatch(op->args[0], operands_num_chunks); 
                    std::vector<Expr> distributed_op_1 = dispatch(op->args[1], operands_num_chunks); 
                    std::vector<Expr> distributed_op_2 = dispatch(op->args[2], operands_num_chunks); 
                    for(unsigned i = 0; i < operands_num_chunks; i++){
                        Expr call_op_i = mul_shift_right(distributed_op_0[i], distributed_op_1[i], distributed_op_2[i]); 
                        exprs.push_back(call_op_i); 
                    } 

                    // In the case where the operands are distributed by 
                    // into different number of chunks, we first concatenate 
                    // the results and then extract the slices accordingly.
                    if(operands_num_chunks != num_chunks){
                        internal_assert(exprs.size() != 0) << "Concat empty vectors for mul_shift_right nodes\n";
                        debug(0) << "make concat "<<"mul_shift_right"<<"\n";
                        Expr Combined = simplify(Shuffle::make_concat(exprs));


                        std::vector<Expr> slice_casts;
                        if(num_chunks == 1){
                            slice_casts.push_back(Combined);
                        } else {
                            int step_size = op->type.lanes() / (int) num_chunks;
                            // Distribute not over 'chunks' number of equally sized
                            // expressions.
                            for(unsigned i = 0; i < num_chunks; i++){

                                Expr new_shuffle = simplify(Shuffle::make_slice(Combined, (int) i * step_size, 1, step_size));
                                slice_casts.push_back(new_shuffle);
                            }
                        }
                        exprs = slice_casts;
                    }
                    break;
                }
            }



            if(!distrib){
                debug(0) << "Fallback splitting for "<< CallExpr << " into "<<num_chunks <<"\n";
                int step_size = op->type.lanes() / (int) num_chunks;

                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_shuffle = Shuffle::make_slice(CallExpr, (int) i * step_size, 1, step_size);
                    exprs.push_back(new_shuffle);

                }
            }




            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const Let* op, unsigned num_chunks){
            std::vector<Expr> exprs;

            VariableNameToExpr[op->name] = op->value;
            exprs.push_back(Let::make(op->name, op->value, op->body));



            return exprs;
        }


        // Cross lane operation, hence not as simple to distribute. Currently, we simplify extract the results of the expression
        std::vector<Expr> DistributeVec::visit(const Shuffle* op, unsigned num_chunks){


            std::vector<Expr> exprs;

            Expr OrigShuff;

            if(op->is_interleave()){
                OrigShuff = Shuffle::make_interleave(op->vectors);
            } else if (op->is_broadcast()){
                OrigShuff = Shuffle::make_broadcast(op->vectors[0], op->broadcast_factor());
            } else if (op->is_concat()){
                internal_assert(op->vectors.size() != 0) << "Distributed arguments require same number of operands\n"; 
                debug(0) << "make concat "<<"OrigShuff"<<"\n";
                OrigShuff = Shuffle::make_concat(op->vectors);
            } else if (op->is_extract_element()){
                OrigShuff = Shuffle::make_extract_element(op->vectors[0], op->indices[0]);
            } else if (op->is_slice()){
                OrigShuff = Shuffle::make_slice(op->vectors[0], op->slice_begin(), op->slice_stride(), op->type.lanes());
            }

            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back((OrigShuff));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks >= 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;

                int step_size = op->type.lanes() / (int) num_chunks;
                // Distribute shuffle over 'chunks' number of equally sized
                // expressions by extract contigous slices.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_shuffle = Shuffle::make_slice(OrigShuff, (int) i * step_size, 1, step_size);
                    exprs.push_back(simplify(new_shuffle));

                }

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                }

                // Add new DistributeInfo entry to avoid re-calculation
                DistributeInfo* DI = new DistributeInfo;
                DI->expr_node = op;
                DI->distributed_expressions = exprs;
                DI->distributed_size = bitvector_sizes[0];
                DI->equally_distributed = !divisible;
                DistribMap[op] = DI;
            }
            return exprs;
        }

        // ==================== Statements ===========================


        Stmt DistributeVec::visit(const Store* op){

            Stmt OrigStore =  Store::make(op->name, op->value, op->index, op->param, op->predicate, op->alignment);

            // Vector Reduce Operands may need to be distributed properly
            if(op->value.as<VectorReduce>()){
                debug(0) << "Found scalar store of vector reduce ..." << "\n";
                Expr DistribVal = dispatch(op->value, 1)[0];
                Stmt NewStoredVal = Store::make(op->name, DistribVal, op->index, op->param, op->predicate, op->alignment);
                return NewStoredVal;

            }

            // Un-neccessary to distribute loads and variable copies
            if(op->value.type().is_scalar() || op->value.as<Load>() || op->value.as<Variable>() || op->value.as<Broadcast>()){
                debug(0) << "Skipping Distributing Store: "<< OrigStore << "\n";
                debug(0) << "With Stored Value: "<< op->value << "\n";
                return OrigStore;
            }


            unsigned num_lanes = op->value.type().lanes();
            unsigned bits = op->value.type().bits();
            VectorInfo VI(supports_saturating_operations);
            op->value.accept(&VI);


            unsigned expr_bitwidth = bits * num_lanes;

            unsigned max_bitwidth = VI.max_width; //bits * num_lanes;





            debug(0) << "DistributeVec on store \n"<<OrigStore  << " producing bitvectors of size "<< expr_bitwidth 
             << " with maximum bitwidth "<<max_bitwidth<<" \n";


            if(VI.contains_dynamic_shuffle){
                debug(0) << "Contains dynamic shuffle, skipping!" << "\n";
                //return OrigStore;
                Expr DistribVal = dispatch(op->value, 1)[0];
                Stmt NewStoredVal = Store::make(op->name, DistribVal, op->index, op->param, op->predicate, op->alignment);
                debug(0) << "New Store: "<< NewStoredVal << "\n";
                return NewStoredVal;

            }

            if(VI.contains_vector_reduce){
                debug(0) << "Contains vector reduce, skipping!" << "\n";
                Expr DistribVal = dispatch(op->value, 1)[0];
                Stmt NewStoredVal = Store::make(op->name, DistribVal, op->index, op->param, op->predicate, op->alignment);
                return NewStoredVal;

            }

            OrigStore = substitute_in_all_lets(OrigStore);






            
            for(unsigned bitvector_size : bitvector_sizes){

                if(max_bitwidth == bitvector_size){
                    debug(0) << "Store expression fits entirely into supported vector register! " << "\n";
                    break;
                }

                if(max_bitwidth < bitvector_size){
                    debug(0) << "Store smaller than "<< bitvector_size<<"\n";
                    continue;
                }

                // First handle cases when equally divisible
                if(max_bitwidth % bitvector_size != 0){
                    debug(0) << "Store not fully divisible\n";
                    continue;
                }

                // Need to distribute

                unsigned num_chunks = max_bitwidth / bitvector_size;

                if(distribution_look_ahead){
                    for (unsigned bv : bitvector_sizes){
                        if(expr_bitwidth % bv == 0){
                            num_chunks = expr_bitwidth / bv;
                            break;
                        }
                    }
                }

                //if(!is_divisible_into_vector_size(num_chunks * bits)){
                //    num_chunks = 1; 
                //}

                debug(0) << "Need to distribute stores into "<<num_chunks <<" chunks!\n";

                std::vector<Expr> distributed_predicate = dispatch(op->predicate, num_chunks);
                std::vector<Expr> distributed_index = dispatch(op->index, num_chunks);
                std::vector<Expr> distributed_value = dispatch(op->value, num_chunks);

                std::vector<Stmt> Stores;

                bool single_store = is_divisible_into_vector_size(expr_bitwidth);

                if (single_store && num_chunks != 1){
                    debug(0) << "Using single store for OrigStore:"<<OrigStore<<"\n";
                    Expr CombinedExpr = Shuffle::make_concat(distributed_value);
                    
                    Stmt CombinedStore =  Store::make(op->name, CombinedExpr, op->index, op->param, op->predicate, op->alignment);
                    
                    debug(0) << "New Store: "<< CombinedStore <<"\n";

                    return CombinedStore;

                } else if(single_store){
                    internal_assert(distributed_value.size() == 1) << "Single store distribute requires single returned value after distribution\n"<<"\n";
                    debug(0) << "Single Store where immediate child is also one value"<<"\n";
                    Stmt SingleStore = Store::make(op->name, distributed_value[0], op->index, op->param, op->predicate, op->alignment);


                    debug(0) << "New Store: "<< SingleStore <<"\n";
                    debug(0) << "New Simplified Store: "<< simplify(SingleStore) <<"\n";

                    return simplify(SingleStore);


                } else {
                    for(unsigned i = 0; i < num_chunks; i++){
                        Stores.push_back(
                                (Store::make(op->name, distributed_value[i], distributed_index[i], op->param, distributed_predicate[i], op->alignment)
                                ));
                    }

                    for(auto e : Stores){
                        debug(0) << "New Store: "<< e <<"\n";
                        debug(0) << "New Simplified Store: "<< simplify(e) <<"\n";
                    }

                    // Create a block of statements
                    return  Block::make(Stores);

                }
                
            }

            return OrigStore;
        }

        Stmt DistributeVec::visit(const LetStmt* op){


            debug(0) << "Distributing Let\n";
            if(is_pure(op->value)){
                VariableNameToExpr[op->name] = op->value;
            }
            return LetStmt::make(op->name, dispatch(op->value, /* num_chunks */ 1)[0], dispatch(op->body));
        }


        Stmt DistributeVec::visit(const AssertStmt* op){
            return AssertStmt::make(op->condition, op->message);
        }

        
        Stmt DistributeVec::visit(const For* op){

            debug(0) << "Distributing For\n";

            Stmt new_for =  For::make(op->name, op->min, op->extent, op->for_type, op->device_api, dispatch(op->body));
            debug(0) << "Completed Distributing For\n";
            return new_for;
        }

        Stmt DistributeVec::visit(const Provide* op){
            return Provide::make(op->name, op->values, op->args, op->predicate);
        }


        Stmt DistributeVec::visit(const Allocate* op){
            return Allocate::make(op->name, op->type, op->memory_type, op->extents, op->condition, dispatch(op->body), op->new_expr, op->free_function);
        }


        Stmt DistributeVec::visit(const Evaluate* op){
            return Evaluate::make(op->value);
        }


        Stmt DistributeVec::visit(const Free* op){
            return Free::make(op->name);
        }


        Stmt DistributeVec::visit(const ProducerConsumer* op){
            debug(0) << "Distributing ProducerConsumer\n";
            Stmt new_pc = ProducerConsumer::make(op->name, op->is_producer, dispatch(op->body));
            debug(0) << "Completed Distributing ProducerConsumer\n";

            return new_pc;
        }


        Stmt DistributeVec::visit(const Block* op){
            debug(0) << "Distributing Block\n";
            //debug(0) << "old_block first:" << op->first <<"\n";
            //debug(0) << "old_block rest:" << op->rest <<"\n";
            Stmt new_block = Block::make(dispatch(op->first), dispatch(op->rest));


            debug(0) << "Completed Distributing Block\n";
            return new_block;
        }


        Stmt DistributeVec::visit(const Prefetch* op){
            return Prefetch::make(op->name, op->types, op->bounds, op->prefetch, op->condition, dispatch(op->body));
        }


        Stmt DistributeVec::visit(const Realize* op){
            return Realize::make(op->name, op->types, op->memory_type, op->bounds, op->condition, dispatch(op->body));
        }

        Stmt DistributeVec::visit(const Acquire* op){
            return Acquire::make(op->semaphore, op->count, dispatch(op->body));
        }


        Stmt DistributeVec::visit(const Fork* op){
            return Fork::make(dispatch(op->first), dispatch(op->rest));
        }


        Stmt DistributeVec::visit(const IfThenElse* op){
            debug(0) << "distributing IfThenElse\n";
            Stmt new_if =  IfThenElse::make(op->condition, dispatch(op->then_case), dispatch(op->else_case));
            debug(0) << "Completed distributing IfThenElse\n";
            return new_if ;
        }


        Stmt DistributeVec::visit(const Atomic* op){
            debug(0) << "distributing Atomic\n";
            return Atomic::make(op->producer_name, op->mutex_name, dispatch(op->body));

        }


        bool DistributeVec::can_type_fit_vector_sizes(Type t){
            return true;
        }

        bool DistributeVec::is_divisible_into_vector_size(size_t sz){

            for(unsigned bitvector_size : bitvector_sizes){
                if(sz % bitvector_size == 0) return true;
            }
            return false;
        }


        // High level driver for distributing vector expressions
        Stmt distribute_vector_exprs(Stmt S, unsigned bitwidth){
            debug(0) << "Invoked distribute_vector_exprs with bitwidth:\t"<<bitwidth<<"\n";
            Stmt inlined = substitute_in_all_lets(S);

            std::vector<unsigned> bv_sizes = { bitwidth };

            return DistributeVec(bv_sizes).dispatch(inlined);


        }

        // High level driver for distributing vector expressions
        Stmt distribute_vector_exprs(Stmt S, std::vector<unsigned> bv_sizes,bool supports_sat_operations){
            debug(0) << "Invoked distribute_vector_exprs with multiple bitwidths \n";
            Stmt inlined = substitute_in_all_lets(S);

            return ((DistributeVec(bv_sizes,supports_sat_operations).dispatch(inlined)));


        }





    } // namespace Internal
} // namespace Halide

