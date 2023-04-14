from common.Types import *
from common.Instructions import *

class Specification:

    def __init__(self, name = None, semantics = None,
                 output_shape = [], input_shapes = [] ,args = [], input_precision = [],
                 output_precision = None, spec_invokation = "", imms = []):
        self.name = name
        self.semantics = semantics
        self.input_shapes = input_shapes
        self.output_shape = output_shape
        self.args = self.parse_args(args)
        self.input_precision = input_precision
        self.output_precision = output_precision
        self.spec_invokation = spec_invokation
        self.imms = imms

    def set_target(self,target):
        self.target = target

    def get_output_size(self):
        return self.output_precision * self.output_shape[0] * self.output_shape[1]

    def has_signed_ops(self):
        spec_ops = self.get_semantics_ops_list()
        return any([op in SIGNED_OPS for op in spec_ops])

    def has_unsigned_ops(self):
        spec_ops = self.get_semantics_ops_list()
        return any([op in UNSIGNED_OPS for op in spec_ops])


    def target_sema_supports_maxmin(self):
        return self.target not in ["hvx"]


    ## Currently for mullo and hvx multiplication ops
    ## some variants used signed and unsigned interchangeably
    ## even when the types of the operands are the same.
    ## Once that get's resolved this would not be needed.
    def get_target_specific_ops(self, ops):

        if self.target == "hvx":

            if "bvmul" in ops and (32 == self.output_precision or 32 in self.input_precision) and False:
                ops += ["sign-extend", "zero-extend"]
        elif self.target == "x86":
            if "bvmul" in ops:
                ops += ["sign-extend", "zero-extend"]


        return ops



    def get_semantics_ops_list(self, exclude_concat = True, exclude_extract = True, supports_absd = True):
        operations = []
        for line in self.semantics:
            for bvop in BV_OPS:
                if bvop == "concat" and exclude_concat:
                    continue

                if bvop == "extract" and exclude_extract:
                    continue


                # only include bvmul when
                # bvmul is in the line
                # but the other saturating operations
                # arent
                if bvop == "bvmul" and bvop in line:
                    insert_bvmul = all([suffix not in line for suffix in ["bvmulnsw", "bvmulnuw"]])
                    if insert_bvmul:
                        operations.append(bvop)
                    if "bvmul " in line:
                        operations.append("bvmul")
                elif bvop == "bvadd" and bvop in line:
                    insert_bvadd = all([suffix not in line for suffix in ["bvaddnsw", "bvaddnuw"]])
                    if insert_bvadd:
                        operations.append(bvop)
                    if "bvadd " in line:
                        operations.append("bvadd")
                elif bvop == "bvsub" and bvop in line:
                    insert_bvsub = all([suffix not in line for suffix in ["bvsubnsw", "bvsubnuw"]])
                    if insert_bvsub:
                        operations.append(bvop)
                    if "bvsub " in line:
                        operations.append("bvsub")
                elif bvop in line:
                    operations.append(bvop)

        if not self.target_sema_supports_maxmin():
            # remove maxs /mins as hvx implements max and mins with gt lt
            #operations = [op for op in operations if op not in ['bvsmax', 'bvumax', 'bvsmin', 'bvumin']]

            op_map = {"bvsmax": "bvsgt", "bvumax": "bvugt", "bvsmin": "bvslt", "bvumin": "bvult" }

            new_ops = []

            for op in operations:
                if op in op_map:
                    new_ops.append(op_map[op])
                else:
                    new_ops.append(op)

            operations = new_ops



        operations = self.get_target_specific_ops(operations)



        return list(set(operations))

    def contains_conditional(self):
        CONDITIONAL_OPS = ["bveq", "if", "cond"]
        self_ops = self.get_semantics_ops_list()
        for cond in CONDITIONAL_OPS:
            if cond in self_ops:
                return True
        return False


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

    def emit_specification(self):
        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" Reference Specification"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        return prefix + self.emit_spec_semantics() + sufix

    def emit_spec_semantics(self):
        return "\n".join([line.replace("\"","") for line in self.semantics])





def parse_spec(spec_dict):
    return Specification(
        name = spec_dict['name'],
        semantics = spec_dict['semantics'],
        input_shapes = spec_dict['input_shapes'],
        output_shape = spec_dict['output_shape'],
        args = spec_dict['args'],
        spec_invokation = spec_dict['spec_invokation'],
        input_precision = spec_dict['input_precision'],
        output_precision = spec_dict['output_precision'],
        imms = spec_dict['imms']
    )

