from Types import *


SYM_BV_STR =  "SYMBOLIC_BV_"
CONST_BV_STR = "(bv"

BV_OPS = [
    "bveq", "bvslt", "bvult",
    "bvsle", "bvule", "bvsgt", "bvugt",
    "bvsge", "bvuge", "bvnot", "bvand",
    "bvor", "bvxor", "bvshl", "bvlshr",
    "bvashr", "bvneg", "bvadd", "bvsub",
    "bvmul", "bvsdiv", "bvudiv", "bvsrem",
    "bvurem", "bvurem", "bvsmod", "concat",
    "extract", "sign-extend", "zero-extend",
    "bitvector->integer", "bitvector->natural",
    "integer->bitvector",
]


class Context:
    def __init__(self, name = "", in_vectsize = None, out_vectsize = None,
                 lane_size = None, in_precision = None,
                 out_precision = None, SIMD = False, args = [],
                 in_vectsize_index = None, out_vectsize_index = None,
                 lanesize_index = None, in_precision_index = None,
                 out_precision_index = None, cost = None):
        self.name= name
        self.in_vectsize = in_vectsize
        self.out_vectsize = out_vectsize
        self.lane_size = lane_size
        self.in_precision = in_precision
        self.out_precision = out_precision
        self.SIMD = SIMD
        self.in_vectsize_index = in_vectsize_index
        self.out_vectsize_index = out_vectsize_index
        self.lanesize_index = lanesize_index
        self.in_precision_index = in_precision_index
        self.out_precision_index = out_precision_index
        self.cost = cost

        self.num_args = len(args)
        self.parse_args(args)



    def get_input_size(self):
        assert (self.in_precision != None) and (self.in_vectsize != None) , "Unable to process input size for instruction"
        return self.in_precision * self.in_vectsize


    def get_output_size(self):
        assert (self.out_precision != None) and (self.out_vectsize != None) , "Unable to process output size for instruction"
        return self.out_precision * self.out_vectsize

    def supports_input_precision(self, prec):
        return self.in_precision == prec


    def supports_output_precision(self, prec):
        return self.out_precision == prec

    def supports_lane_size(self, lane_size):
        return self.lane_size == lane_size

    def print_context(self, prefix = ""):
        print("{} {}".format(prefix, self.name))

        for arg in self.context_args:
            arg.print_operand(prefix = prefix+"------>")




    def parse_args(self, args):

        context_args = []


        for idx , arg in enumerate(args):

            context_arg = None


            if arg.startswith(SYM_BV_STR):
                bv_size = int(arg.split(SYM_BV_STR)[-1])
                context_arg = BitVector("v{}".format(idx), bv_size)
            elif arg.startswith(CONST_BV_STR):
                tokens = arg.split(" ")
                assert len(tokens) == 3, "Unable to parse bv constant"
                value = tokens[1]
                size = int(tokens[2].split(")")[0])

                context_arg = ConstBitVector(value, size, name = "vc_{}".format(idx))

            elif idx == self.lanesize_index:
                lane_size = int(arg)
                context_arg = LaneSize("lane_size", value =  lane_size)
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

            elif arg.isnumeric() or type(arg) == int:

                context_arg = Integer("num_{}".format(idx), int(arg))

            else:
                print(idx)
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
                    lanesize_index = None, in_precision_index = None,
                    out_precision_index = None, cost = None):

        self.contexts.append(
            Context(name = name, in_vectsize = in_vectsize, out_vectsize = out_vectsize,
                    lane_size = lane_size, in_precision = in_precision,
                    out_precision = out_precision, SIMD = SIMD, args = args,
                    in_vectsize_index = in_vectsize_index,
                    out_vectsize_index = out_vectsize_index,
                    lanesize_index = lanesize_index,
                    in_precision_index = in_precision_index,
                    out_precision_index = out_precision_index,
                    cost = cost)
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

                if bvop in line:
                    operations.append(bvop)

        return operations

    def get_sample_context(self):
        assert len(self.contexts) != 0, "DSL instruction must have at least one context"
        return self.contexts[0]


    def supports_input_precision(self, prec):
        return any([ctx.supports_input_precision(prec) for ctx in self.contexts])


    def supports_output_precision(self, prec):
        return any([ctx.supports_output_precision(prec) for ctx in self.contexts])


    def supports_lane_size(self, lane_size):
        return any([ctx.supports_lane_size(lane_size) for ctx in self.contexts])

    def supports_config(self, input_precision = None, output_precision = None, lane_size = None):

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

            return True

        return any([supports(ctx) for ctx in self.contexts])













