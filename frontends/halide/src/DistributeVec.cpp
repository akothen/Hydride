#include "DistributeVec.h"
#include "VectorInfo.h"


using namespace std;


namespace Halide {
    namespace Internal {


        // ==================== Expressions ===========================

        std::vector<Expr> DistributeVec::visit(const Ramp* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }


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

                // Epilogue code to create < bitvector_size expression.
                if(!divisible){
                    Expr new_start = start + ((int) num_chunks * lanes_per_chunk * stride);
                    Expr new_stride = stride;
                    int new_lanes = (bitvector_sizes[0] % num_bits) / op->type.bits();

                    exprs.push_back(Ramp::make(new_start, new_stride, new_lanes));
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

            debug(0) << "Distribute Load!\n";

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;


            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back(Load::make(op->type, op->name, op->index, op->image, op->param, op->predicate, op->alignment));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks > 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;


                std::vector<Expr> distributed_predicate = dispatch(op->predicate, num_chunks);
                std::vector<Expr> distributed_index = dispatch(op->index, num_chunks);


                int lanes_per_chunk = op->type.lanes() / num_chunks ;

                Type new_load_ty = Type(op->type.code(), op->type.bits(), lanes_per_chunk);


                // Distribute load over 'chunks' number of equally sized
                // expressions.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_load = Load::make(new_load_ty, op->name, distributed_index[i], op->image, op->param, distributed_predicate[i], op->alignment );
                    exprs.push_back(new_load);

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




#define DISTRIBUTE_BINARY_OP(OP_NAME) \
        std::vector<Expr> DistributeVec::visit(const OP_NAME* op, unsigned num_chunks){ \
            debug(0) << "Distributing Binary Op! into num chunks " << num_chunks << "\n";\
            if(DistribMap.find(op) != DistribMap.end()){ \
                return  DistribMap[op]->distributed_expressions; \
            } \
            std::vector<Expr> exprs; \
            \
            \
            if(op->type.is_scalar()){\
                exprs.push_back(OP_NAME::make(op->a, op->b));\
                return exprs;\
            }\
            \
            unsigned num_bits = op->type.bits() * op->type.lanes(); \
                bool divisible = (bitvector_sizes[0] % num_bits) == 0; \
                \
                \
                std::vector<Expr> distributed_a = dispatch(op->a, num_chunks); \
                std::vector<Expr> distributed_b = dispatch(op->b, num_chunks); \
                internal_assert(distributed_a.size() == distributed_b.size()) << "Distributed arguments require same number of operands\n"; \
                internal_assert(distributed_a.size() == num_chunks) << "Distributed arguments must have required  number of operands\n"; \
                \
                for(unsigned i = 0; i < num_chunks; i++){ \
                    Expr new_bop = OP_NAME::make(distributed_a[i], distributed_b[i]); \
                    exprs.push_back(new_bop); \
                } \
                DistributeInfo* DI = new DistributeInfo; \
                DI->expr_node = op; \
                DI->distributed_expressions = exprs; \
                DI->distributed_size = bitvector_sizes[0]; \
                DI->equally_distributed = !divisible; \
                DistribMap[op] = DI; \
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


            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

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


        std::vector<Expr> DistributeVec::visit(const Cast* op, unsigned num_chunks){
            debug(0) << "Distribute Cast!\n";

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;


            if(op->type.is_scalar()){
                exprs.push_back(Cast::make(op->type, op->value));
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();



            bool divisible = (bitvector_sizes[0] % num_bits) == 0;


            // Calculate operand_num_chunks which may be different from the num_chunks 
            // passed to this method. We want to fit all operations
            // in the desired vector width 'bitvector_size'
            unsigned operands_num_bits = op->value.type().bits() * op->value.type().lanes();

            bool possible_to_lower = false;
            std::vector<Expr> distributed_value;
            for(unsigned bitvector_size : bitvector_sizes){

                if(operands_num_bits % bitvector_size != 0) continue;
                possible_to_lower = true;

                unsigned operands_num_chunks = operands_num_bits / bitvector_size ;
                distributed_value = dispatch(op->value, operands_num_chunks);

                // In the case where the operands are distributed by 
                // into different number of chunks, we first concatenate 
                // the results and then extract the slices accordingly.
                if(operands_num_chunks != num_chunks){
                    Expr Combined = Shuffle::make_concat(distributed_value);


                    // Distribute not over 'chunks' number of equally sized
                    // expressions.
                    std::vector<Expr> slice_casts;
                    if(num_chunks == 1){
                        slice_casts.push_back(Combined);
                    } else {
                        int step_size = op->type.lanes() / (int) num_chunks;
                        for(unsigned i = 0; i < num_chunks; i++){
                            Expr new_shuffle = Shuffle::make_slice(Combined, (int) i * step_size, 1, step_size);
                            slice_casts.push_back(new_shuffle);
                        }
                    }

                    distributed_value = slice_casts;

                }

                break;
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
            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const Variable* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

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

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

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

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;


            exprs.push_back(VectorReduce::make(op->op, op->value, op->type.lanes()));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const IntImm* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;


            exprs.push_back(IntImm::make(op->type, op->value));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const UIntImm* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;

            exprs.push_back(UIntImm::make(op->type, op->value));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const FloatImm* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;

            exprs.push_back(FloatImm::make(op->type, op->value));

            return exprs;
        }


        std::vector<Expr> DistributeVec::visit(const StringImm* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;


            exprs.push_back(StringImm::make( op->value));

            return exprs;
        }

        std::vector<Expr> DistributeVec::visit(const Broadcast* op, unsigned num_chunks){

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;


            if(op->type.is_scalar() || num_chunks <= 1){
                exprs.push_back(Broadcast::make(op->value, op->lanes));
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
            return exprs;
        }


#define DISTRIBUTE_CALL_CLAUSE(OP_NAME) \
            if(op->is_intrinsic(Call::OP_NAME)){ \
                distrib = true; \
                std::vector<Expr> distributed_op_0 = dispatch(op->args[0], num_chunks); \
                std::vector<Expr> distributed_op_1 = dispatch(op->args[1], num_chunks); \
                for(unsigned i = 0; i < num_chunks; i++){\
                    Expr call_op_i = OP_NAME(distributed_op_0[i], distributed_op_1[i]); \
                    exprs.push_back(call_op_i); \
                } \
            }


// Certain intrinstics widen internally and then narrow before returning
// the result. This case accounts for the internal widening when deciding
// to distribute the vectors.
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
                        exprs.push_back(call_op_i); \
                    } \
\
                    if(operands_num_chunks != num_chunks){ \
                        Expr Combined = Shuffle::make_concat(exprs); \
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

            unsigned num_bits = op->type.bits() * op->type.lanes();

            bool divisible = (bitvector_sizes[0] % num_bits) == 0;

            bool distrib = false;

            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(saturating_add) // TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(saturating_sub) // TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(halving_add)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(halving_sub)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(rounding_halving_add)  // TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(rounding_halving_sub)// TODO: Widens internally, distribute differently
            DISTRIBUTE_CALL_CLAUSE(absd)
            DISTRIBUTE_CALL_INTERNAL_WIDEN_CLAUSE(rounding_shift_right)// TODO: Widens internally, distribute differently
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
                        Expr Combined = Shuffle::make_concat(exprs);


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
                        Expr Combined = Shuffle::make_concat(exprs);


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



            if(!distrib){
                int step_size = op->type.lanes() / (int) num_chunks;

                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_shuffle = Shuffle::make_slice(CallExpr, (int) i * step_size, 1, step_size);
                    exprs.push_back(new_shuffle);

                }
            }

            // Add new DistributeInfo entry to avoid re-calculation
            DistributeInfo* DI = new DistributeInfo;
            DI->expr_node = op;
            DI->distributed_expressions = exprs;
            DI->distributed_size = bitvector_sizes[0];
            DI->equally_distributed = !divisible;
            DistribMap[op] = DI;



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

            if(DistribMap.find(op) != DistribMap.end()){
                return  DistribMap[op]->distributed_expressions;
            }

            std::vector<Expr> exprs;

            Expr OrigShuff;

            if(op->is_interleave()){
                OrigShuff = Shuffle::make_interleave(op->vectors);
            } else if (op->is_broadcast()){
                OrigShuff = Shuffle::make_broadcast(op->vectors[0], op->broadcast_factor());
            } else if (op->is_concat()){
                OrigShuff = Shuffle::make_concat(op->vectors);
            } else if (op->is_extract_element()){
                OrigShuff = Shuffle::make_extract_element(op->vectors[0], op->indices[0]);
            } else if (op->is_slice()){
                OrigShuff = Shuffle::make_slice(op->vectors[0], op->slice_begin(), op->slice_stride(), op->type.lanes());
            }

            if(op->type.is_scalar() || num_chunks <= 0){
                exprs.push_back(OrigShuff);
                return exprs;
            }


            unsigned num_bits = op->type.bits() * op->type.lanes();


            if(num_chunks > 1){

                bool divisible = (bitvector_sizes[0] % num_bits) == 0;

                int step_size = op->type.lanes() / (int) num_chunks;
                // Distribute shuffle over 'chunks' number of equally sized
                // expressions by extract contigous slices.
                for(unsigned i = 0; i < num_chunks; i++){
                    Expr new_shuffle = Shuffle::make_slice(OrigShuff, (int) i * step_size, 1, step_size);
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

        // ==================== Statements ===========================


        Stmt DistributeVec::visit(const Store* op){

            Stmt OrigStore =  Store::make(op->name, op->value, op->index, op->param, op->predicate, op->alignment);

            if(op->value.type().is_scalar()){
                return OrigStore;
            }


            unsigned num_lanes = op->value.type().lanes();
            unsigned bits = op->value.type().bits();
            VectorInfo VI;
            op->value.accept(&VI);


            unsigned expr_bitwidth = bits * num_lanes;

            unsigned max_bitwidth = VI.max_width; //bits * num_lanes;





            debug(0) << "DistributeVec on store "<<OrigStore  << " producing bitvectors of size "<< expr_bitwidth 
             << " with maximum bitwidth "<<max_bitwidth<<" \n";

            OrigStore = substitute_in_all_lets(OrigStore);





            
            for(unsigned bitvector_size : bitvector_sizes){

                if(max_bitwidth < bitvector_size){
                    debug(0) << "Store smaller than "<< bitvector_size<<"\n";
                    continue;
                }

                // First handle cases when equally divisible
                if(max_bitwidth % bitvector_size != 0){
                    debug(0) << "Store not fully divisible\n";
                    continue;
                }


                unsigned num_chunks = max_bitwidth / bitvector_size;

                debug(0) << "Need to distribute stores into "<<num_chunks <<" chunks!\n";

                std::vector<Expr> distributed_predicate = dispatch(op->predicate, num_chunks);
                std::vector<Expr> distributed_index = dispatch(op->index, num_chunks);
                std::vector<Expr> distributed_value = dispatch(op->value, num_chunks);

                std::vector<Stmt> Stores;

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

            return OrigStore;
        }

        Stmt DistributeVec::visit(const LetStmt* op){

            if(is_pure(op->value)){
                VariableNameToExpr[op->name] = op->value;
            }
            return LetStmt::make(op->name, op->value, dispatch(op->body));
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


        // High level driver for distributing vector expressions
        Stmt distribute_vector_exprs(Stmt S, unsigned bitwidth){
            debug(0) << "Invoked distribute_vector_exprs with bitwidth:\t"<<bitwidth<<"\n";
            Stmt inlined = substitute_in_all_lets(S);

            std::vector<unsigned> bv_sizes = { bitwidth };

            return DistributeVec(bv_sizes).dispatch(inlined);


        }

        // High level driver for distributing vector expressions
        Stmt distribute_vector_exprs(Stmt S, std::vector<unsigned> bv_sizes){
            debug(0) << "Invoked distribute_vector_exprs with multiple bitwidths \n";
            Stmt inlined = substitute_in_all_lets(S);

            return simplify(DistributeVec(bv_sizes).dispatch(inlined));


        }





    } // namespace Internal
} // namespace Halide

