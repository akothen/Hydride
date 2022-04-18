from Types import *
from Instructions import *
from PredefinedDSL import *

class Synthesizer:

    def __init__(self, spec = None, dsl_operators = [],
                 struct_definer = None, grammar_generator = None,
                 vectorization_factor = 8,
                 depth = 6):

        self.spec = spec
        self.dsl_operators = dsl_operators
        self.struct_definer = struct_definer
        self.grammar_generator = grammar_generator
        self.VF = vectorization_factor
        self.depth = depth
        self.output_slice_length = self.VF * self.spec.output_precision


    def get_memory_loads(self):
        load_factors = [0.5, 1.0, 1.5, 2.0]

        input_vector_sizes = []
        offsets = []
        num_elem_sizes = []
        precisions = []

        input_sizes = [shape[0] * shape[1] * self.spec.input_precision for shape in self.spec.input_shapes]



        for lf in load_factors:
            for input_size in input_sizes:
                num_elem = int(lf * self.VF)
                offset = "IDX_I"
                precision = self.spec.input_precision

                input_vector_sizes.append(input_size)
                offsets.append(offset)
                num_elem_sizes.append(num_elem)
                precisions.append(precision)


        return create_vector_load_dsl(input_vector_sizes = input_vector_sizes,
                                      offsets = offsets,
                                      num_elem_sizes = num_elem_sizes,
                                      precisions = precisions)

    def get_top_level_grammar_args(self):
        registers = 0
        for arg in self.spec.args:
            if isinstance(arg, BitVector):
                registers +=1

        return ["(reg {})".format(i) for i in range(0, registers)]



    def emit_synthesis_grammar(self):

        ## Memory loading layer
        spec_memory_loads = self.get_memory_loads()
        memory_dsl_insts = [spec_memory_loads] * len(spec_memory_loads.contexts)
        memory_dsl_args_list = [ctx.context_args for ctx in spec_memory_loads.contexts]

        ## Operation Layers

        operation_dsl_insts = []
        operation_dsl_args_list = []

        for dsl_inst in self.dsl_operators:

            if self.consider_dsl_inst(dsl_inst):
                operator_contexts = self.get_supported_context_for_dsl(dsl_inst, limit = 2)

                operation_dsl_insts += ([dsl_inst] * len(operator_contexts))
                operation_dsl_args_list += [ctx.context_args for ctx in operator_contexts]

        top_level_grammar_args = self.get_top_level_grammar_args()

        return self.grammar_generator.emit_grammar(
            memory_dsl_insts = memory_dsl_insts,
            memory_dsl_args_list = memory_dsl_args_list,
            operation_dsl_insts = operation_dsl_insts,
            operation_dsl_args_list = operation_dsl_args_list,
            top_level_grammar_args = top_level_grammar_args,
            depth = self.depth
        )







    def get_supported_context_for_dsl(self, dsl_inst, limit = None):
        assert self.consider_dsl_inst(dsl_inst), "Can not get supported contexts for dsl inst"

        contexts = []

        for ctx in dsl_inst.contexts:
            supports_inputs_prec = ctx.supports_input_precision(self.spec.input_precision)
            supports_outputs_prec = ctx.supports_output_precision(self.spec.output_precision)
            supports_output_length = ctx.supports_output_size(self.output_slice_length)

            if supports_inputs_prec or supports_outputs_prec or supports_output_length:
                contexts.append(ctx)

        if limit != None and len(contexts) > limit:
            return contexts[:limit]


        return contexts








    # Checks whether the operations performed
    # by a DSL instruction form a contigous
    # slice of operations within the
    # specification
    def does_dsl_ops_overlap(self, dsl_inst):
        spec_ops = self.spec.get_semantics_ops_list()
        dsl_ops = dsl_inst.get_semantics_ops_list()

        for idx in range(0, len(spec_ops) - len(dsl_ops) + 1):
            if spec_ops[idx:idx+len(dsl_ops)] == dsl_ops:
                return True

        return False


    # Check if the precisions of the specifications
    # and the DSL instruction overlap
    def does_dsl_configs_overlap(self, dsl_inst, match_all = False):

        if match_all:
            return  dsl_inst.supports_config(input_precision = self.spec.input_precision,
                                             output_precision = self.spec.output_precision,
                                             output_size = self.output_slice_length
                                             )
        else:
            supports_inputs_prec = dsl_inst.supports_input_precision(self.spec.input_precision)
            supports_outputs_prec = dsl_inst.supports_output_precision(self.spec.output_precision)

            supports_output_length = dsl_inst.supports_output_size(self.output_slice_length)

            return supports_inputs_prec or supports_outputs_prec or supports_output_length


    # Simple place holder
    def consider_dsl_inst(self, dsl_inst):
        return self.does_dsl_configs_overlap(dsl_inst) or self.does_dsl_ops_overlap(dsl_inst)





