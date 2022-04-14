from Instructions import DSLInstruction
from Types import *

class StructDef:

    def __init__(self):
        return


    def emit_dsl_struct_def(self, dsl_inst):
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


    def emit_struct_defs(self, dsl_inst_ls):

        definitions = [self.emit_dsl_struct_def(dsl) for dsl in dsl_inst_ls]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" Struct Definitions"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        return prefix + "\n".join(definitions) + sufix

    def emit_dsl_struct_use(self, dsl_inst):
        dsl_name = dsl_inst.get_dsl_name()

        sample_ctx = dsl_inst.get_sample_context()

        struct_args = []
        for arg in sample_ctx.context_args:
            struct_args.append(arg.name)

        return "({} {})".format(dsl_name, " ".join(struct_args))



