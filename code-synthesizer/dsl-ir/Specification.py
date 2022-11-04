from Types import *
from Instructions import *

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


    def get_output_size(self):
        return self.output_precision * self.output_shape[0] * self.output_shape[1]


    def get_semantics_ops_list(self, exclude_concat = True, exclude_extract = True):
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
                elif bvop == "bvadd" and bvop in line:
                    insert_bvadd = all([suffix not in line for suffix in ["bvaddnsw", "bvaddnuw"]])
                    if insert_bvadd:
                        operations.append(bvop)
                elif bvop == "bvsub" and bvop in line:
                    insert_bvsub = all([suffix not in line for suffix in ["bvsubnsw", "bvsubnuw"]])
                    if insert_bvsub:
                        operations.append(bvop)
                elif bvop in line:
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

