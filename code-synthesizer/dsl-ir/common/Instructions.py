from common.Types import *


SYM_BV_STR =  "SYMBOLIC_BV_"
CONST_BV_STR = "(bv"
IDX_I_STR = "IDX_I"
IDX_J_STR = "IDX_J"
IDX_IJ_STR = "IDX_IJ"
IDX_JI_STR = "IDX_JI"

BV_OPS = [
    "bveq", "bvslt", "bvult",
    "bvsle", "bvule", "bvsgt", "bvugt",
    "bvsge", "bvuge", "bvnot", "bvand",
    "bvor", "bvxor", "bvshl", "bvlshr",
    "bvashr", "bvneg", "bvadd", "bvsub",
    "bvmul", "bvsdiv", "bvudiv", "bvsrem",
    "bvurem", "bvurem", "bvsmod", "concat",
    "extract", "sign-extend", "zero-extend",
    # "bitvector->integer", "bitvector->natural", "integer->bitvector",
    "bvumaxval", "bvsmaxval",
    "bvuminval", "bvsminval",
    "bvssat", "bvusat",
    "bvaddnsw", "bvaddnuw","bvsubnsw", "bvsubnuw",
    "bvmulnsw", "bvmulnuw","if", "abs", "cond",
    "bvsmax", "bvumax", "bvsmin", "bvumin",
    "bvrol", "bvror",
    "ramp", "bvsaturate", "bvsizeext", "bvaddnw",
    "bvsubnw", "bvdiv", "bvrem", "bvmax", "bvmin",
    "bvlt", "bvle", "bvgt", "bvge",
]

BV_OP_VARIANTS = [
    ["bvadd","bvaddnsw", "bvaddnuw"],
    ["bvsub","bvsubnsw", "bvsubnuw"],
    ["bvmul", "bvmulnsw", "bvmulnuw" ],
    ["bvsdiv", "bvudiv"],
    ["bvule", "bvsle"],
    ["bvsgt", "bvugt"],
    ["zero-extend", "sign-extend"],
    ["bvsmin", "bvumin"],
    ["bvsmax", "bvumax"],
    ["bvsrem", "bvurem"],
    ["bvssat", "bvusat"],
    ["bvult", "bvslt"],
    ["bvlshr", "bvashr"]

]

NONSIGNED_OPS = [
    "bveq",
    "bvnot", "bvand",
    "bvor", "bvxor", "bvshl",
    "bvneg", "bvadd", "bvsub",
    "bvmul",
    "concat",
    "extract",
    #"bvaddnsw", "bvaddnuw","bvsubnsw", "bvsubnuw",
    "bvmulnsw", "bvmulnuw",
    "if", "abs", "cond",
    "bvrol", "bvror",
    "ramp",
    "bvsaturate", "bvsizeext", "bvaddnw",
    "bvsubnw"
]

UNSIGNED_OPS = [
    "bvult",
    "bvule",  "bvugt",
    "bvuge",
    "bvlshr",
    "bvudiv",
    "bvurem", "bvurem",
    "zero-extend",
    "bvumaxval",
    "bvuminval",
    "bvusat",
    "bvumax",  "bvumin",
    "bvaddnuw",
    "bvsubnuw",
]


SIGNED_OPS = [
    "bvslt"
    "bvsle",  "bvsgt",
    "bvsge",  "bvnot",
    "bvashr",
    "bvsdiv",  "bvsrem",
    "bvsmod",
    "sign-extend",
    "bvsmaxval",
    "bvsminval",
    "bvssat",
    "bvsmax",  "bvsmin",
    "bvaddnsw",
    "bvsubnsw",
]


SIGN_VARIANTS = {
    'bvsizeext' : {'signed': 'sign-extend', 'unsigned': 'zero-extend'},
    'bvsaturate' : {'signed': 'bvssat', 'unsigned':'bvusat'},
    'bvdiv' : {'signed': 'bvsdiv', 'unsigned': 'bvudiv'},
    'bvrem': {'signed': 'bvsrem', "unsigned": 'bvurem'},
    'bvmin': {'signed': 'bvsmin', "unsigned": 'bvumin'},
    'bvmax': {'signed': 'bvsmax', "unsigned": 'bvumax'},
    'bvaddnw' : {'signed': 'bvaddnsw', 'unsigned': 'bvaddnuw'},
    'bvsubnw' : {'signed': 'bvsubnsw', 'unsigned': 'bvsubnuw'},
    'bvlt' : {'signed': 'bvslt', 'unsigned': 'bvult'},
    'bvle' : {'signed': 'bvsle', 'unsigned': 'bvule'},
    'bvgt' : {'signed': 'bvsgt', 'unsigned': 'bvugt'},
    'bvge' : {'signed': 'bvsge', 'unsigned': 'bvuge'},
}

SIGN_AGNOSTIC_MAP = {
    "bvaddnw" : "bvadd",
    "bvsubnw" : "bvsub",
}

def get_variant_by_sign(op, sign):
    if sign == None:
        if op in SIGN_AGNOSTIC_MAP:
            return SIGN_AGNOSTIC_MAP[op]
        return op

    if op not in SIGN_VARIANTS:
        return op

    if sign == 1:
        return SIGN_VARIANTS[op]['signed']
    else:
        return SIGN_VARIANTS[op]['unsigned']



class Context:
    def __init__(self, name = "", in_vectsize = None, out_vectsize = None,
                 lane_size = None, in_precision = None,
                 out_precision = None, SIMD = False, args = [],
                 in_vectsize_index = None, out_vectsize_index = None,
                 in_precision_index = None,
                 out_precision_index = None, cost = None,
                 signedness = None, in_lanesize_index = None,
                 out_lanesize_index = None):
        self.name= name
        self.in_vectsize = in_vectsize
        self.out_vectsize = out_vectsize
        self.in_lanesize_index = in_lanesize_index
        self.out_lanesize_index = out_lanesize_index
        self.lane_size = lane_size
        self.in_precision = in_precision
        self.out_precision = out_precision
        self.SIMD = SIMD
        self.in_vectsize_index = in_vectsize_index
        self.out_vectsize_index = out_vectsize_index
        self.in_precision_index = in_precision_index
        self.out_precision_index = out_precision_index
        self.cost = cost
        self.signedness = signedness

        self.num_args = len(args)
        self.parse_args(args)


    # To scale the arguments of the context, we must have a defined
    # in_vectsize index and out_vectsize_index
    def can_scale_context(self):
        has_defined_io = self.has_output_size() and self.has_input_size()
        has_defined_lanesize = (self.in_lanesize_index != None) and (self.out_lanesize_index != None)
        return has_defined_io and (self.in_vectsize_index != None) and (self.out_vectsize_index != None) and has_defined_lanesize


    # Update context parameters to down scale the vector sizes parameters
    def scale_context(self, scale_factor, base_vector_size = None):
        assert self.can_scale_context(), "Context must be scalable to perform the operation scaling"
        scaled_args = []

        for idx, arg in enumerate(self.context_args):
            if isinstance(arg, BitVector):
                assert arg.size % scale_factor == 0, "scale_factor must evenly divide the operand sizes"
                scaled_bv_arg = BitVector(arg.name, int(arg.size // scale_factor))
                scaled_args.append(scaled_bv_arg)
            elif idx == self.in_vectsize_index or idx == self.out_vectsize_index:
                assert arg.value % scale_factor == 0, "scale_factor must evenly divide the operand sizes"
                scaled_vectsize_arg = Integer(arg.name, value = int(arg.value // scale_factor))
                scaled_args.append(scaled_vectsize_arg)

            # For scaling down of lane sizes , we only scale down the values if the scaled down lane
            # size is greater than or equal to the input  (output) precisions.
            elif idx == self.in_lanesize_index  and arg.value // scale_factor >=  self.in_precision:
                scaled_lanesize_arg = Integer(arg.name, value = int(arg.value // scale_factor))
                scaled_args.append(scaled_lanesize_arg)
                self.lane_size = self.lane_size // scale_factor


            elif idx == self.out_lanesize_index  and arg.value // scale_factor  >= self.out_precision:
                scaled_lanesize_arg = Integer(arg.name, value = int(arg.value // scale_factor))
                scaled_args.append(scaled_lanesize_arg)

            elif isinstance(arg, Integer):
                if arg.value == self.in_vectsize or arg.value == self.out_vectsize:
                    scaled_int = Integer(arg.name, value = int(arg.value // scale_factor))
                    scaled_args.append(scaled_int)
                elif base_vector_size != None and arg.value == base_vector_size:
                    scaled_int = Integer(arg.name, value = int(arg.value // scale_factor))
                    scaled_args.append(scaled_int)
                elif base_vector_size != None and arg.value == (base_vector_size // 2):
                    scaled_int = Integer(arg.name, value = int(arg.value // scale_factor))
                    scaled_args.append(scaled_int)
                else:
                    scaled_args.append(arg)
            else:
                scaled_args.append(arg)

        assert self.in_vectsize % scale_factor == 0, "scale_factor must evenly divide the input vector sizes"

        assert self.out_vectsize % scale_factor == 0, "scale_factor must evenly divide the input vector sizes"

        self.in_vectsize = int(self.in_vectsize // scale_factor)
        self.out_vectsize = int(self.out_vectsize // scale_factor)



        self.context_args = scaled_args




    def get_scalable_args_idx(self, base_vector_size = None):
        assert self.can_scale_context(), "Context must be scalable to perform the operation scaling " + self.name

        sample_scale_factor = 8
        scalable_idx = []
        for idx, arg in enumerate(self.context_args):
            if isinstance(arg, BitVector):
                pass
            elif idx == self.in_vectsize_index or idx == self.out_vectsize_index:
                scalable_idx.append(idx)

            # For scaling down of lane sizes , we only scale down the values if the scaled down lane
            # size is greater than or equal to the input  (output) precisions.
            elif idx == self.in_lanesize_index  and arg.value // sample_scale_factor >=  self.in_precision:
                scalable_idx.append(idx)
            elif idx == self.out_lanesize_index  and arg.value // sample_scale_factor  >= self.out_precision:
                scalable_idx.append(idx)
            elif isinstance(arg, Integer):
                if arg.value == self.in_vectsize or arg.value == self.out_vectsize:
                    scalable_idx.append(idx)
                elif base_vector_size != None and arg.value == base_vector_size:
                    scalable_idx.append(idx)
                elif base_vector_size != None and arg.value == (base_vector_size // 2):
                    scalable_idx.append(idx)

        return scalable_idx


    def is_signed(self):
        return (self.signedness != None) and self.signedness == 1

    def is_unsigned(self):
        return (self.signedness != None) and self.signedness == 0

    def is_nonsigned(self):
        return (self.signedness == None)

    def get_input_size(self, scale_factor = 1):
        assert (self.in_precision != None) and (self.in_vectsize != None) , "Unable to process input size for instruction"
        return self.in_vectsize // scale_factor


    def get_output_size(self, scale_factor = 1):
        assert (self.out_vectsize != None) , "Unable to process output size for instruction"+" "+self.name
        return self.out_vectsize // scale_factor

    def has_output_size(self):
        return self.out_vectsize != None

    def has_input_size(self):
        return self.in_vectsize != None

    def supports_input_precision(self, prec):
        return self.in_precision == prec


    def supports_output_precision(self, prec):
        return self.out_precision == prec


    def get_max_arg_size(self, scale_factor = 1):
        max_arg_size = 0
        for arg in self.context_args:
            if isinstance(arg, BitVector):
                if arg.size >= max_arg_size:
                    max_arg_size = arg.size

        return max_arg_size // scale_factor


    def get_min_arg_size(self, scale_factor = 1):
        min_arg_size = self.get_max_arg_size()
        for arg in self.context_args:
            if isinstance(arg, BitVector):
                if arg.size <= min_arg_size:
                    min_arg_size = arg.size

        return min_arg_size // scale_factor

    def supports_input_size(self, input_size, scale_factor = 1):
        for arg in self.context_args:
            if isinstance(arg, BitVector):
                if (arg.size // scale_factor) == input_size:
                    return True

        return False


    def supports_output_size(self, output_size, scale_factor = 1):
        #print("check if outvectsize for {} : {} supports {}".format(self.name, self.get_output_size(), output_size))
        if self.out_vectsize == None:
            return False
        return self.get_output_size(scale_factor = scale_factor) == output_size



    def supports_lane_size(self, lane_size):
        return self.lane_size == lane_size

    def print_context(self, prefix = ""):
        print("{} {}".format(prefix, self.name))
        print("In_vectsize: ",self.in_vectsize)
        print("out_vectsize: ",self.out_vectsize)

        for arg in self.context_args:
            arg.print_operand(prefix = prefix+"------>")




    def parse_args(self, args):

        context_args = []


        for idx , arg in enumerate(args):

            context_arg = None

            if isinstance(arg, OperandType):
                # If argument is already of an OperandType
                #, possibly generated by Synthesizer
                context_arg = arg
                context_args.append(context_arg)
                continue

            arg = str(arg) # Convert to str for non-operand type argument
            if arg.startswith(SYM_BV_STR):
                bv_size = int(arg.split(SYM_BV_STR)[-1])
                context_arg = BitVector("v{}".format(idx), bv_size)
            elif arg.startswith(CONST_BV_STR):
                tokens = arg.split(" ")
                assert len(tokens) == 3, "Unable to parse bv constant"

                # FIXME: dictionary currently says #x for values when it should be
                # using #b. Manually fix later
                value = tokens[1]#.replace("#x","#b")
                size = int(tokens[2].split(")")[0])

                context_arg = ConstBitVector(value, size, name = "vc_{}".format(idx))


            elif arg.startswith(IDX_IJ_STR):
                input_y_dim = ShapeVariable(name = "dim-y")
                i_index = IndexVariable(name = "idx-i")
                j_index = IndexVariable(name = "idx-j")
                i_x_y_dim = IndexExpr(i_index, input_y_dim, expr_type = IndexExprTypeEnum.Mul)
                context_arg = IndexExpr(i_x_y_dim, j_index, IndexExprTypeEnum.Add)
            elif arg.startswith(IDX_JI_STR):
                input_y_dim = ShapeVariable(name = "dim-y")
                i_index = IndexVariable(name = "idx-i")
                j_index = IndexVariable(name = "idx-j")
                j_x_y_dim = IndexExpr(j_index, input_y_dim, expr_type = IndexExprTypeEnum.Mul)
                context_arg = IndexExpr(j_x_y_dim, i_index, IndexExprTypeEnum.Add)
            elif arg.startswith(IDX_I_STR):
                context_arg = IndexVariable(name = "idx-i")
            elif arg.startswith(IDX_J_STR):
                context_arg = IndexVariable(name = "idx-j")
            elif idx == self.in_vectsize_index or idx == self.out_vectsize_index:

                is_in = (idx == self.in_vectsize_index)
                is_out = (idx == self.out_vectsize_index)

                in_str  = ""
                out_str = ""

                if is_in:
                    in_str = "_i"
                if is_out:
                    out_str = "_o"

                context_arg = Integer("size{}{}".format(in_str,out_str), value = int(arg))

            #elif idx == self.lanesize_index:
            #    lane_size = int(arg)
            #    is_in = (idx == self.in_precision_index)
            #    is_out = (idx == self.out_precision_index)
            #    context_arg = LaneSize("lane_size", value =  lane_size, input_precision = is_in, output_precision = is_out)
            elif idx == self.in_precision_index or  idx == self.out_precision_index:
                precision_value = int(arg)

                is_in = (idx == self.in_precision_index)
                is_out = (idx == self.out_precision_index)

                in_str  = ""
                out_str = ""

                if is_in:
                    in_str = "_i"
                if is_out:
                    out_str = "_o"

                context_arg = Precision("prec{}{}".format(in_str,out_str),
                                        input_precision = is_in,
                                        output_precision = is_out,
                                        value = precision_value)
            elif arg.isnumeric() or type(arg) == int or arg.lstrip('-+').isnumeric() :

                context_arg = Integer("num_{}".format(idx), int(arg))

            else:
                print("ARG {}:\t{}".format(idx, arg ))
                print(issubclass(type(arg), OperandType))
                print(type(arg))
                print(self.name)
                assert False, "Unsupported operand type"


            context_args.append(context_arg)


        self.context_args = context_args












class DSLInstruction(InstructionType):

    def __init__(self, name = None,
                 shuffle = False, semantics = None,
                 operation = False, simd = False):

        self.name = name
        self.semantics = semantics
        self.shuffle = shuffle
        self.operation = operation
        self.simd = simd



        assert (not (shuffle and operation)), "Instruction must be either a shuffle or computation"



        # We may have multiple instances for a given
        # target agnostic DSL instruction. contexts refers
        # a list of the specific concrete instances.
        self.contexts = []

        if simd:
            super().__init__(InstructionType.InstructionTypeEnum.SIMD)
        elif shuffle:
            super().__init__(InstructionType.InstructionTypeEnum.Shuffle)
        else:
            super().__init__(InstructionType.InstructionTypeEnum.NON_SIMD)










    def add_context(self, name = "", in_vectsize = None, out_vectsize = None,
                    lane_size = None, in_precision = None,
                    out_precision = None, SIMD = False, args = [],
                    in_vectsize_index = None, out_vectsize_index = None,
                    in_precision_index = None,
                    out_precision_index = None, cost = None,
                    signedness = None, in_lanesize_index = None,
                    out_lanesize_index = None):

        self.contexts.append(
            Context(name = name, in_vectsize = in_vectsize, out_vectsize = out_vectsize,
                    lane_size = lane_size, in_precision = in_precision,
                    out_precision = out_precision, SIMD = SIMD, args = args,
                    in_vectsize_index = in_vectsize_index,
                    out_vectsize_index = out_vectsize_index,
                    in_precision_index = in_precision_index,
                    out_precision_index = out_precision_index,
                    cost = cost, signedness = signedness,
                    in_lanesize_index = in_lanesize_index,
                    out_lanesize_index = out_lanesize_index)
        )

    def print_instruction(self):
        print("="*60)
        print(" "*20, self.name , " "*25)
        print("="*60)
        print("SIMD: ", self.simd)
        print("="*60)

        for ctx in self.contexts:
            ctx.print_context(prefix = "---")

        print("="*60)
        print("semantics:")
        print(self.get_semantics())
        print("="*60)
        print(self.get_semantics_ops_list())

        print("="*60)


    def get_cost(self):
        return self.get_sample_context().cost

    def get_dsl_name(self):
        return self.name +"_dsl"

    def get_semantics(self):
        return "\n".join([line.replace("\"","") for line in self.semantics])


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
                    insert_bvmul = all([suffix not in line for suffix in ["bvmulnsw", "bvmulnuw", "bvmulnw"]])
                    if insert_bvmul:
                        operations.append(bvop)
                elif bvop == "bvadd" and bvop in line:
                    insert_bvadd = all([suffix not in line for suffix in ["bvaddnsw", "bvaddnuw", "bvaddnw"]])
                    if insert_bvadd:
                        operations.append(bvop)
                elif bvop == "bvsub" and bvop in line:
                    insert_bvsub = all([suffix not in line for suffix in ["bvsubnsw", "bvsubnuw","bvsubnw" ]])
                    if insert_bvsub:
                        operations.append(bvop)
                elif bvop in line:
                    operations.append(bvop)


        return operations

    def get_sample_context(self):
        assert len(self.contexts) != 0, "DSL instruction must have at least one context"
        return self.contexts[0]


    def supports_input_precision(self, prec):
        return any([ctx.supports_input_precision(prec) for ctx in self.contexts])


    def supports_output_precision(self, prec):
        return any([ctx.supports_output_precision(prec) for ctx in self.contexts])


    def has_output_sizes_defined(self):
        return any([ctx.has_output_size() for ctx in self.contexts])

    def has_input_sizes_defined(self):
        return any([ctx.has_input_size() for ctx in self.contexts])



    def supports_input_size(self, input_size, scale_factor = 1):
        return any([ctx.supports_input_size(input_size, scale_factor = scale_factor) for ctx in self.contexts])

    def supports_output_size(self, output_size, scale_factor = 1):
        return any([ctx.supports_output_size(output_size, scale_factor = scale_factor) for ctx in self.contexts])

    def supports_lane_size(self, lane_size):
        return any([ctx.supports_lane_size(lane_size) for ctx in self.contexts])

    def supports_config(self, input_precision = None, output_precision = None, lane_size = None,
                        input_size = None, output_size = None):

        def supports(ctx):

            if input_precision == None:
                pass
            elif not ctx.supports_input_precision(input_precision):
                return False

            if output_precision == None:
                pass
            elif not ctx.supports_output_precision(output_precision):
                return False

            if lane_size == None:
                pass
            elif not ctx.supports_lane_size(lane_size):
                return False


            if input_size == None:
                pass
            elif not ctx.supports_input_size(input_size):
                return False


            if output_size == None:
                pass
            elif not ctx.supports_output_size(output_size):
                return False

            return True

        return any([supports(ctx) for ctx in self.contexts])


    def supports_scaling(self):
        return all([ctx.can_scale_context() for ctx in self.contexts])

    def scale_contexts(self, scale_factor, base_vector_size = None):

        scaled_contexts = []
        for ctx in self.contexts:
            if ctx.can_scale_context():
                ctx.scale_context(scale_factor, base_vector_size = base_vector_size)
                scaled_contexts.append(ctx)

        self.contexts = scaled_contexts














