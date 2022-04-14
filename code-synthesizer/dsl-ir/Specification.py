from Types import *
from Instructions import *

class Specification:

    def __init__(self, name = None, semantics = None,
                 output_shape = [], input_shape = [] ,args = [], input_precision = None,
                 output_precision = None, spec_invokation = ""):
        self.name = name
        self.semantics = semantics
        self.input_shape = input_shape
        self.output_shape = output_shape
        self.args = self.parse_args(args)
        self.input_precision = input_precision
        self.output_precision = output_precision
        self.spec_invokation = spec_invokation



    def get_semantics_ops_list(self, exclude_concat = True, exclude_extract = True):
        operations = []
        for line in self.semantics:
            for bvop in BV_OPS:
                if bvop == "concat" and exclude_concat:
                    continue

                if bvop == "extract" and exclude_extract:
                    continue

                if bvop in line:
                    operations.append(bvop)

        return operations


    def parse_args(self, args):

        spec_args = []

        for idx, arg in enumerate(args):
            spec_arg = None

            if arg.startswith(SYM_BV_STR):
                bv_size = int(arg.split(SYM_BV_STR)[-1])
                spec_arg = BitVector("v{}".format(idx), bv_size)
            else:
                assert False, "Unsupported Specificaton argument"

            spec_args.append(spec_arg)

        return spec_args

    def emit_invoke_spec(self, args):
        return self.spec_invokation.format(" ".join(args))

    def emit_spec_semantics(self):
        return "\n".join([line.replace("\"","") for line in self.semantics])


    # Checks whether the operations performed
    # by a DSL instruction form a contigous
    # slice of operations within the
    # specification
    def does_dsl_ops_overlap(self, dsl_inst):
        spec_ops = self.get_semantics_ops_list()
        dsl_ops = dsl_inst.get_semantics_ops_list()

        for idx in range(0, len(spec_ops) - len(dsl_ops) + 1):
            if spec_ops[idx:idx+len(dsl_ops)] == dsl_ops:
                print("MATCH", dsl_ops)
                return True

        return False


    # Check if the precisions of the specifications
    # and the DSL instruction overlap
    def does_dsl_configs_overlap(self, dsl_inst, match_all = False):

        if match_all:
            return  dsl_inst.supports_config(input_precision = self.input_precision,
                                             output_precision = self.output_precision)
        else:
            supports_inputs = dsl_inst.supports_input_precision(self.input_precision)
            supports_outputs = dsl_inst.supports_output_precision(self.output_precision)

            return supports_inputs or supports_outputs

    # Simple place holder
    def consider_dsl_inst(self, dsl_inst):
        return self.does_dsl_configs_overlap(dsl_inst) or self.does_dsl_ops_overlap(dsl_inst)



def parse_spec(spec_dict):
    return Specification(
        name = spec_dict['name'],
        semantics = spec_dict['semantics'],
        input_shape = spec_dict['input_shape'],
        output_shape = spec_dict['output_shape'],
        args = spec_dict['args'],
        spec_invokation = spec_dict['spec_invokation']
    )

