from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *


class StructDef:

    def __init__(self):
        return

    def emit_default_def(self):
        defaults = []

        defaults.append("(struct reg (id) #:transparent #:mutable)")
        defaults.append("(struct lit (val) #:transparent )")
        defaults.append("(struct idx-i (id) #:transparent #:mutable)")
        defaults.append("(struct idx-j (id) #:transparent #:mutable)")
        defaults.append("(struct dim-x (id) #:transparent #:mutable)")
        defaults.append("(struct dim-y (id) #:transparent #:mutable)")
        defaults.append("(struct nop (v1) #:transparent)")
        defaults.append(
            "(struct idx-add ([i1 #:mutable] [i2 #:mutable] ) #:transparent )")
        defaults.append(
            "(struct idx-mul ([i1 #:mutable] [i2 #:mutable] ) #:transparent )")

        # defaults.append(self.emit_dsl_struct_def(dummy_vector_load_dsl))
        # defaults.append(self.emit_dsl_struct_def(dummy_vector_swizzle_dsl))

        for structs in default_structs:
            defaults.append(self.emit_dsl_struct_def(structs))

        return defaults

    def emit_dsl_struct_def(self, dsl_inst):
        dsl_name = dsl_inst.get_dsl_name()

        sample_ctx = dsl_inst.get_sample_context()

        struct_args = []
        for arg in sample_ctx.context_args:

            struct_arg = None

            if isBitVectorType(arg):
                struct_arg = "{}".format(arg.name)
            else:
                struct_arg = "{}".format(arg.name)

            struct_args.append(struct_arg)

        return "(struct {} ({}) #:transparent #:mutable)".format(dsl_name, " ".join(struct_args))

    def emit_struct_defs(self, dsl_inst_ls):

        definitions = self.emit_default_def(
        ) + [self.emit_dsl_struct_def(dsl) for dsl in dsl_inst_ls]

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " Struct Definitions"+'\n'
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
