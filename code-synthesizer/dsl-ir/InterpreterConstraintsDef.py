from Instructions import DSLInstruction, Context
from Types import *
from PredefinedDSL import *


"""
To ensure that the Hydride Synthesizer emits programs which are
legal with respect to the type of the expected operands, this class
analyzes the target agnostic instructions to infer such constraints so that they may be included during the synthesis process.
"""
class InterpreterConstraintsDef:

    def __init__(self ):
        return

    def emit_get_length_operand(self, op, env_name = "env", get_len_name = "get-length"):
        return "({} {} {})".format(get_len_name, op, env_name)

    def emit_pairwise_length_constraint(self, lhs, rhs):
        return "(assert (equal? {} {}))".format(lhs, rhs)


    def get_bitvector_operand_indices(self, dsl_inst):
        indices = []

        sample_ctx = dsl_inst.get_sample_context()

        for idx, arg in enumerate(sample_ctx.context_args):
            if isinstance(arg, BitVector):
                indices.append(idx)

        return indices

    def get_size_operand_indices(self, dsl_inst):
        indices = []

        sample_ctx = dsl_inst.get_sample_context()

        for idx, arg in enumerate(sample_ctx.context_args):
            if isinstance(arg, Integer):
                if arg.name.startswith("size"):
                    indices.append(idx)

        return indices

    def get_simd_constraints(self, dsl_inst, env_name = "env",
                             get_len_name = "get-length"):
        assert dsl_inst.simd , "DSL Instruction expected to be SIMD"
        constraints = []

        sample_ctx = dsl_inst.get_sample_context()
        indices = self.get_bitvector_operand_indices(dsl_inst)


        # Get all pair-wise constraints on the bitvector operands
        for idx_i in range(len(indices)):
            for idx_j in range(idx_i + 1, len(indices)):
                lhs_arg = sample_ctx.context_args[indices[idx_i]]
                rhs_arg = sample_ctx.context_args[indices[idx_j]]

                # Sanity Check, SIMD operands must be of the same bv length. May have
                # an exception for Masked operations. Hence we skip length constraints on
                # the mask bv.
                if lhs_arg.size != rhs_arg.size:
                    continue

                lhs_arg_name = lhs_arg.name
                rhs_arg_name = rhs_arg.name

                lhs_len = self.emit_get_length_operand(lhs_arg_name, env_name = env_name,
                                                       get_len_name = get_len_name)
                rhs_len = self.emit_get_length_operand(rhs_arg_name, env_name = env_name,
                                                       get_len_name = get_len_name)

                constraint = self.emit_pairwise_length_constraint(lhs_len, rhs_len)

                constraints.append(constraint)

        return constraints




    def get_constraints_across_contexts(self, dsl_inst, env_name = "env",
                                        get_len_name = "get-length"):

        size_indices = self.get_size_operand_indices(dsl_inst)
        bv_op_indices = self.get_bitvector_operand_indices(dsl_inst)



        # List to keep track of constraints (i.e. pairs of operands to the DSL instruction) which are
        # inconsistent across contexts. We do not emit
        # any constraints for these instructions
        inconsistent = set()


        constraints = {}

        def get_key_name(lhs, rhs):
            return "{}+{}".format(lhs.name, rhs.name)

        def constraint_exists(lhs, lhs_idx,  rhs, rhs_idx):
            key = get_key_name(lhs, rhs)

            if key not in constraints:
                return False

            for cons in constraints[key]:
                if cons['lhs_idx'] == lhs_idx and cons['rhs_idx'] == rhs_idx:
                    return True
            return False


        def get_constraint(lhs, lhs_idx,  rhs, rhs_idx):
            key = get_key_name(lhs, rhs)


            for cons in constraints[key]:
                if cons['lhs_idx'] == lhs_idx and cons['rhs_idx'] == rhs_idx:
                    return cons


        def constraint_eq(lhs, lhs_idx,  rhs, rhs_idx):
            return {
                "lhs": lhs.name,
                "rhs": rhs.name,
                "type": "EQ",
                "lhs_idx": lhs_idx,
                "rhs_idx": rhs_idx,
                "lhs_type": type(lhs),
                "rhs_type": type(rhs),
            }


        def constraint_neq(lhs, lhs_idx,  rhs, rhs_idx):
            return {
                "lhs": lhs.name,
                "rhs": rhs.name,
                "type": "NEQ",
                "lhs_idx": lhs_idx,
                "rhs_idx": rhs_idx,
                "lhs_type": type(lhs),
                "rhs_type": type(rhs),
            }


        for idx, ctx in enumerate(dsl_inst.contexts):

            # Many of the DSL instructions
            # pass in an operand specifying the
            # length of the input bitvectors. We
            # identify such constraints here
            for si in size_indices:
                for bi in bv_op_indices:
                    size_arg = ctx.context_args[si]
                    bv_arg = ctx.context_args[bi]

                    assert isinstance(size_arg, Integer), "Size must be of numeric type"
                    assert isinstance(bv_arg, BitVector) or isinstance(bv_arg, ConstBitVector), "BV_Arg must be of bitvector type"

                    # If size is not for the size of the inputs
                    if "_i" not in size_arg.name:
                        continue

                    size = int(size_arg.value)
                    bv_size = int(bv_arg.size)

                    key_name = get_key_name(size_arg, bv_arg)

                    if key_name not in constraints:
                        constraints[key_name] = []

                    cons = {}

                    if size == bv_size:
                        cons = constraint_eq(size_arg, si, bv_arg, bi)
                    else:

                        cons = constraint_neq(size_arg, si, bv_arg, bi)


                    if constraint_exists(size_arg, si, bv_arg, bi):
                        # Check whether the constraint is consistent
                        exist_cons = get_constraint(size_arg, si, bv_arg, bi)

                        if exist_cons['type'] != cons['type']:
                            inconsistent.add(key_name)


                    else:
                        constraints[key_name].append(cons)


                    # For SIMD instructions, we've seperately
                    # accounted for length constraints between
                    # bitvector operands
                    if dsl_inst.simd:
                        continue


                    for idx_i in range(len(bv_op_indices)):
                        for idx_j in range(idx_i + 1, len(bv_op_indices)):
                            left_arg = ctx.context_args[bv_op_indices[idx_i]]
                            right_arg = ctx.context_args[bv_op_indices[idx_j]]

                            key_name = get_key_name(left_arg, right_arg)

                            if key_name not in constraints:
                                constraints[key_name] = []

                            left_len = left_arg.size
                            right_len = right_arg.size

                            cons = {}

                            if left_len == right_len:
                                cons = constraint_eq(left_arg, bv_op_indices[idx_i], right_arg, bv_op_indices[idx_j])
                            else:

                                cons = constraint_neq(left_arg, bv_op_indices[idx_i], right_arg, bv_op_indices[idx_j])


                            if constraint_exists(left_arg, bv_op_indices[idx_i], right_arg, bv_op_indices[idx_j]):
                                # Check whether the constraint is consistent
                                exist_cons = get_constraint(left_arg, bv_op_indices[idx_i], right_arg, bv_op_indices[idx_j])

                                if exist_cons['type'] != cons['type']:
                                    inconsistent.add(key_name)
                            else:
                                constraints[key_name].append(cons)


        across_ctx_cons = []

        # During the constraint analysis, a bitvector operand may be a constant bv in some contexts and a symbolic bv in another. Hence the naming convention for each context will vary slightly. Hence we only keep the constraints which use the cannonical naming convention (which is the sample context)
        sample_ctx = dsl_inst.get_sample_context()
        sample_arg_names = [arg.name for arg in sample_ctx.context_args]
        skip_constraint = lambda v : v not in sample_arg_names

        for key_name in constraints:
            if key_name in inconsistent:
                continue


            for cons in constraints[key_name]:

                # We only add constraints on equality,
                # The NEQ constraints are used to detect
                # inconsistencies
                if cons['type'] == 'NEQ':
                    continue


                if skip_constraint(cons['lhs']):
                    continue

                if skip_constraint(cons['rhs']):
                    continue

                pair_ctx = None

                # Size + Bitvector constraint
                if cons['lhs_type'] is Integer:
                    rhs_len = self.emit_get_length_operand(cons['rhs'], env_name = env_name, get_len_name = get_len_name)
                    pair_ctx = self.emit_pairwise_length_constraint(cons['lhs'], rhs_len)
                else:
                    # Bitvector + Bitvector constraint
                    lhs_len = self.emit_get_length_operand(cons['lhs'], env_name = env_name, get_len_name = get_len_name)
                    rhs_len = self.emit_get_length_operand(cons['rhs'], env_name = env_name, get_len_name = get_len_name)
                    pair_ctx = self.emit_pairwise_length_constraint(lhs_len, rhs_len)

                across_ctx_cons.append(pair_ctx)




        return across_ctx_cons











    def emit_dsl_interpreter_constraints(self, dsl_inst,  struct_definer, env_name = "env", get_len_name = "get-length"):

        constraints = []

        if dsl_inst.simd:
            constraints += self.get_simd_constraints(dsl_inst, env_name = env_name , get_len_name = get_len_name)

        constraints += self.get_constraints_across_contexts(dsl_inst, env_name = env_name, get_len_name = get_len_name)


        return constraints


