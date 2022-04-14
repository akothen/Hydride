from Instructions import DSLInstruction
from Types import *

class StructDef:

    def __init__(self):
        return


    def emit_dsl_struct(self, dsl_inst):
        dsl_name = dsl_inst.get_dsl_name()

        sample_ctx = dsl_inst.get_sample_context()

        struct_args = []
        for arg in sample_ctx.context_args:

            struct_arg = None

            if isinstance(arg, BitVector) or isinstance(arg, ConstBitVector):
                struct_arg = "[{} #:mutable]".format(arg.name)
            else:
                struct_arg = "{}".format(arg.name)

            struct_args.append(struct_arg)

        return "(struct {} ({}) #:transparent)".format(dsl_name, " ".join(struct_args))




