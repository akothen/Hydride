from common.Types import *
import sys


SYM_BV_STR =  "SYMBOLIC_BV_"
BOUNDED_BV_STR =  "BOUNDED_SYMBOLIC_BV_"
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
    "bvlt", "bvle", "bvgt", "bvge", "bvmulnw"
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
    def __init__(self, name = "", dsl_name = "", in_vectsize = None, out_vectsize = None,
                 lane_size = None, in_precision = None,
                 out_precision = None, SIMD = False, args = [],
                 in_vectsize_index = None, out_vectsize_index = None,
                 in_precision_index = None,
                 out_precision_index = None, cost = None,
                 signedness = None, in_lanesize_index = None,
                 out_lanesize_index = None, semantics = None,
                 ):
        self.name= name
        self.dsl_name  = dsl_name
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
        self.semantics = semantics
        self.precision_scaled = False
        self.enable_mixed_scaling = False
        self.unscaled_sym_bvs_idx = []
        self.is_bounded = False

        self.num_args = len(args)
        self.parse_args(args)
        self.create_bounded_args_map()



    def get_bv_ops(self):
        function_prototype = self.semantics[0].replace("(define", "").lstrip()

        # Map the formal parameter names to instructions
        # formal argument index

        formal_param_to_arg_idx  = {}

        tokens = function_prototype.replace("\"","").replace(")","").replace("(","").strip().split(" ")
        tokens = [tk for tk in tokens if tk != ""]

        # token 0 is the name of the instruction
        for idx, token in enumerate(tokens[1:]):
            formal_param_to_arg_idx[token] = idx





        # Helper method to handle higher level bvops with parameterized signedness
        def handle_signed_variant_op(op_name, line):
            substr = line.split(op_name)[-1].replace(")","").replace("\"","").strip()
            # Check bvadd's signedness
            signedness_val = substr.split(" ")[-1]

            # Signedness could either be a constant value or a formal parameter

            signedness = None

            if signedness_val == "-1":
                signedness = None
            elif signedness_val == "0":
                signedness = 0
            elif signedness == "1":
                signedness = 1
            elif signedness_val in formal_param_to_arg_idx:
                index = formal_param_to_arg_idx[signedness_val]
                arg = self.context_args[index]
                assert isinstance(arg, Integer), "Operation signedness must be of integer type"
                assert arg.value in [0,-1,1], "Signedness of bvoperation must be in [0,-1,1]"

                if arg.value == -1:
                    signedness = None
                else:
                    signedness = arg.value

            else:
                assert False, "Unable to infer bvop signedness for  {} in line {}".format(self.name, line)

            return get_variant_by_sign(op_name, signedness)

        operations = []
        for line in self.semantics[1:]:
            for bvop in BV_OPS:


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
                elif bvop in ["bvaddnw", "bvsubnw", "bvsizeext", "bvsaturate", "bvdiv",
                              "bvrem", "bvmin", "bvmax", "bvlt", "bvle", "bvgt", "bvge"] and bvop in line:
                    specialized_op = handle_signed_variant_op(bvop, line)
                    operations.append(specialized_op)

                elif bvop in line and bvop not in ["concat", "extract"]:
                    operations.append(bvop)



        return list(set(operations))









    # To scale the arguments of the context, we must have a defined
    # in_vectsize index and out_vectsize_index
    def can_scale_context(self, scale_factor = None):

        if self.is_bounded:
            return False

        has_defined_io = self.has_output_size() and self.has_input_size()
        has_defined_lanesize = (self.in_lanesize_index != None) and (self.out_lanesize_index != None)

        scale_factor_cond = True
        if scale_factor != None:
            for idx, arg in enumerate(self.context_args):
                if isinstance(arg, BitVector):
                    scale_factor_cond = scale_factor_cond and (arg.size % scale_factor == 0)

        return has_defined_io and (self.in_vectsize_index != None) and (self.out_vectsize_index != None) and has_defined_lanesize and scale_factor_cond



    def is_broadcast_like_operation(self):
        ops = self.get_bv_ops()

        return all([op in ["sign-extend", "zero-extend", "extract", "concat", "bvssat", "bvusat", "bveq" ,"if" ,"cond", "bvsaturate", "bvsizeext"] for op in ops]) or ops == []


    def is_elementwise_logical_like_operation(self):

        if self.is_broadcast_like_operation():
            return False

        ops = self.get_bv_ops()

        bitwise_logical_ops = ["bvor", "bvxor", "bvand", "bvnot", "bvneg", "extract", "concat"]

        return all([ (op in bitwise_logical_ops) for op in ops ])



    # Update context parameters to down scale the vector sizes parameters
    def scale_context(self, scale_factor, base_vector_size = None):
        assert self.can_scale_context(), "Context must be scalable to perform the operation scaling"
        scaled_args = []

        lane_size_scaled = False
        need_to_scale_lanesize = False


        ## Generally we don't want to scale the precisions
        ## however for bitwise operations where we have
        ## lane_size = precision = vector_lengths we would
        ## have to scale the precisions.

        scale_io_prec = False

        for idx, arg in enumerate(self.context_args):
            if isinstance(arg, BitVector):
                assert arg.size % scale_factor == 0, "scale_factor {} must evenly divide the operand sizes {}".format(scale_factor, arg.size)
                scaled_bv_arg = BitVector(arg.name, int(arg.size // scale_factor))
                if arg.size // scale_factor == 1 and self.enable_mixed_scaling :
                    # For Scalar vector ops, try keeping the scalar args the same size
                    # and hope verification fails any mis-scaling
                    scaled_args.append(arg)
                    self.unscaled_sym_bvs_idx.append(idx)
                else:
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
                lane_size_scaled = True
                need_to_scale_lanesize = True


            elif idx == self.out_lanesize_index  and arg.value // scale_factor  >= self.out_precision:

                scaled_lanesize_arg = Integer(arg.name, value = int(arg.value // scale_factor))
                scaled_args.append(scaled_lanesize_arg)


            elif isinstance(arg, Precision) and self.is_elementwise_logical_like_operation() and arg.value not in [8,16,32,64]:
                scaled_prec = Precision(arg.name, input_precision = arg.input_precision, output_precision = arg.output_precision, value = arg.value // scale_factor)

                scaled_args.append(scaled_prec)
                scale_io_prec = True
                self.precision_scaled = True

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

        if not lane_size_scaled and (need_to_scale_lanesize or self.lane_size >= 1024):
            self.lane_size = int(self.lane_size // scale_factor)

        if scale_io_prec:
            assert self.in_precision == self.out_precision, "Only scale precision for elementwise bitwise operations"
            self.in_precision = self.in_precision // scale_factor
            self.out_precision = self.out_precision // scale_factor

        self.in_vectsize = int(self.in_vectsize // scale_factor)
        self.out_vectsize = int(self.out_vectsize // scale_factor)





        self.context_args = scaled_args





    def get_scalable_args_idx(self, base_vector_size = None):
        assert self.can_scale_context(), "Context must be scalable to perform the operation scaling " + self.name

        sample_scale_factor = 4#32
        scalable_idx = []
        for idx, arg in enumerate(self.context_args):
            if isinstance(arg, BitVector):
                if arg.size // sample_scale_factor == 1 and self.enable_mixed_scaling :
                    self.unscaled_sym_bvs_idx.append(idx)
                pass
            elif idx == self.in_vectsize_index or idx == self.out_vectsize_index:
                scalable_idx.append(idx)

            # For scaling down of lane sizes , we only scale down the values if the scaled down lane
            # size is greater than or equal to the input  (output) precisions.
            elif idx == self.in_lanesize_index  and arg.value // sample_scale_factor >=  self.in_precision:
                scalable_idx.append(idx)
            elif idx == self.out_lanesize_index  and arg.value // sample_scale_factor  >= self.out_precision:
                scalable_idx.append(idx)

            elif isinstance(arg, Precision) and self.is_elementwise_logical_like_operation() and self.precision_scaled :
                scalable_idx.append(idx)
            elif isinstance(arg, Integer):
                if arg.value == self.in_vectsize or arg.value == self.out_vectsize:
                    scalable_idx.append(idx)
                elif base_vector_size != None and arg.value == base_vector_size:
                    scalable_idx.append(idx)
                elif base_vector_size != None and arg.value == (base_vector_size // 2):
                    scalable_idx.append(idx)

        return scalable_idx

    def get_bounded_bv_size(self):
        for arg in self.context_args:
            if isinstance(arg, BoundedBitVector):
                return arg.size
        return -1

    def create_bounded_args_map(self):
        self.in_bound_map = {}
        self.out_bound_map = {}
        if not self.is_bounded:
            return


        ## Currently assuming only one such bounded variable
        ## exists per context, can generalize later when a different case
        ## arises
        in_knob_0 = self.in_precision_index[0]
        assert in_knob_0[0] == "variable_idx", "Unsupported token when creating bounded args map"

        in_index = in_knob_0[1]

        for i in range(1, len(self.in_precision_index)):
            prec_str, value = self.in_precision_index[i]
            prec = prec_str.split("precision")[-1]

            self.in_bound_map[prec] = (in_index, value)


        out_knob_0 = self.out_precision_index[0]
        assert out_knob_0[0] == "variable_idx", "Unsupported token when creating bounded args map"

        out_index = out_knob_0[1]

        for i in range(1, len(self.out_precision_index)):
            prec_str, value = self.out_precision_index[i]
            prec = prec_str.split("precision")[-1]

            self.out_bound_map[prec] = (out_index, value)













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

        for k in self.in_bound_map:
            #print("Bounded Precision:",k)
            if int(k) == prec:

                #print("SUCCESS!")
                return True

        return self.in_precision == prec


    def supports_output_precision(self, prec):

        for k in self.out_bound_map:
            if int(k) == prec:
                return True

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
            if isinstance(arg, Context):
                arg.print_context(prefix = prefix + "\t")
            else:
                arg.print_operand(prefix = prefix+"------>")


    def get_expr_type_info(self):

        type_info = []

        for arg in self.context_args:
            if isinstance(arg, Context):
                type_info += arg.get_expr_type_info()
            elif isinstance(arg, Reg):
                type_info.append((arg.precision, arg.size))

        return type_info

    def print_context_expr(self, prefix = ""):
        print("{} ({} ; {}".format(prefix, self.dsl_name + "_dsl", self.name))

        for arg in self.context_args:
            if isinstance(arg, Context):
                arg.print_context_expr(prefix = prefix + "\t")
            else:
                print(prefix +"\t" + arg.get_dsl_value() )

        print("{} )".format(prefix))


    def specialize_context_bounded(self, prec):
        new_context_args = []

        #print("Specializing context ", self.name)
        bounded_bv_size = self.get_bounded_bv_size()
        for arg in self.context_args:
            if isinstance(arg, BoundedBitVector):
                value = None

                setting = self.out_bound_map[str(prec)]

                value = str(setting[1])

                context_arg = ConstBitVector(value, bounded_bv_size, name = "vc_{}".format("bounded"))
                new_context_args.append(context_arg)
            else:
                new_context_args.append(arg)

        # No longer bounded since specialized
        self.context_args = new_context_args
        self.is_bounded = False
        self.in_precision = prec
        self.out_precision = prec





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
            elif arg.startswith(BOUNDED_BV_STR):
                bv_size = int(arg.split(BOUNDED_BV_STR)[-1])
                context_arg = BoundedBitVector("v{}".format(idx), bv_size)
                self.is_bounded = True
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
            Context(name = name, dsl_name = self.name, in_vectsize = in_vectsize, out_vectsize = out_vectsize,
                    lane_size = lane_size, in_precision = in_precision,
                    out_precision = out_precision, SIMD = SIMD, args = args,
                    in_vectsize_index = in_vectsize_index,
                    out_vectsize_index = out_vectsize_index,
                    in_precision_index = in_precision_index,
                    out_precision_index = out_precision_index,
                    cost = cost, signedness = signedness,
                    in_lanesize_index = in_lanesize_index,
                    out_lanesize_index = out_lanesize_index,
                    semantics = self.semantics
                    )
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
        for line in self.semantics[1:]:
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



    def has_bounded_behavior(self):
        return any([ctx.is_bounded for ctx in self.contexts])

    def supports_scaling(self):


        return any([ctx.can_scale_context() for ctx in self.contexts])

    def scale_contexts(self, scale_factor, base_vector_size = None):

        scaled_contexts = []
        #test_args = []
        for ctx in self.contexts:

            if ctx.can_scale_context(scale_factor = scale_factor):
                ctx.scale_context(scale_factor, base_vector_size = base_vector_size)
                scaled_contexts.append(ctx)




        # Discards contexts
        self.contexts = scaled_contexts














