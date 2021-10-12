from dsl_class import *



class DSLGen:

    def __init__(self, inputs, outputs, num_input_bits ,dsl_list, verbose = False, spec_sema = "" , inclusion_scheme = "bvops"):
        """ Taking in the input and output types, generate a Rossete
        synthesis grammar """

        self.inputs = inputs
        self.outputs = outputs
        self.dsl_list = dsl_list
        self.num_input_bits = num_input_bits
        self.verbose = verbose
        self.inclusion_scheme = inclusion_scheme
        self.spec_sema = spec_sema

    def log(self, val):
        if self.verbose:
            print(val)

    def get_dsl_calls_ND(self, input_precision, output_precision , length_list):

        self.log("get_dsl_calls_ND with precision: {}, length: {}".format(input_precision,length_list))
        """Using those DSL instructions which can be
        correctly called with the argument types in the inputs"""

        valid_dsl = []

        if self.inclusion_scheme == "arg_superset":
            valid_dsl = [dsl_inst for dsl_inst in self.dsl_list if dsl_inst.isArgumentTypeSuperset(self.inputs)]
        elif self.inclusion_scheme == "bvops":
            assert self.spec_sema != "", "Must provide specification semantics for bvops inclusion scheme"
            valid_dsl = [dsl_inst for dsl_inst in self.dsl_list if dsl_inst.hasSameBVOps(self.spec_sema)]

        """ Only Supporting N = len(length_list) dimensional instructions"""
        valid_dsl = [dsl_inst for dsl_inst in valid_dsl if dsl_inst.getNumLengthParams() == len(length_list)]

        self.log("Number of Valid DSL instructions for this configuration: {}".format(len(valid_dsl)))

        dsl_calls = []

        for dsl_inst in valid_dsl:

            self.log("Processing "+dsl_inst.name)
            dsl_call = [dsl_inst.name]
            input_precision_arg_idx = dsl_inst.getPrecisionOperandIdx(in_precision = True)
            output_precision_arg_idx = dsl_inst.getPrecisionOperandIdx(in_precision = False)
            length_arg_idxs = dsl_inst.getLengthOperandsIndices()
            self.log("input_prec_idx {}, output_prec_idx {}, length_arg_list {}".format(input_precision_arg_idx, output_precision_arg_idx, length_arg_idxs))

            for i in range(0, dsl_inst.getNumOperands()):
                ith_arg_ty = dsl_inst.getOperandType(i)

                if i == input_precision_arg_idx:
                    dsl_call.append(str(input_precision))
                elif i == output_precision_arg_idx:
                    dsl_call.append(str(output_precision))
                elif i in length_arg_idxs:
                    length_val = length_list[length_arg_idxs.index(i)]
                    dsl_call.append(str(length_val))
                elif ith_arg_ty == ArgType.BitVectorSymbolic:
                    dsl_call.append("(expr)")
                elif ith_arg_ty == ArgType.IntSymbolic:
                    dsl_call.append("(?? integer?)")
                else:
                    assert (False), "Unsupported argument type used in operand "+str(i)+" for "+dsl_inst.str()
            dsl_calls.append(dsl_call)

        return dsl_calls


    def permute_precision_and_length(self, total_bits):

        dsl_calls = []

        """
        1D permuation's of length and precision
        restricting ourselves to vector-like
        operations
        """
        # Starting with 16 bit precision
        prec = 16


        """ While the precision evenly divides the total bits"""
        while total_bits % prec == 0 and prec < total_bits:
            length = total_bits // prec
            dsl_calls += self.get_dsl_calls_ND(prec, prec , [length])

            prec = prec * 2



        """
        2D permuation's of length and precision
        restricting ourselves to tile-like
        operations
        """

        # Starting with 8 bit precision
        prec = 8

        while total_bits % prec == 0:
            total_length = total_bits // prec

            left_bound = 1
            while left_bound < total_length:
                right_bound = total_length // left_bound
                dsl_calls += self.get_dsl_calls_ND(prec, self.outputs[0].precision_value , [left_bound, right_bound])
                left_bound = left_bound *  2

            prec *= 2


        return dsl_calls


    def convert_calls_to_rosette(self, dsl_calls):

        rosette_calls = []

        for call in dsl_calls:
            rosette_call = "("+(" ".join(call))+")"
            rosette_calls.append(rosette_call)

        return rosette_calls

    def generate_grammar(self, rosette_calls):
        args = ["arg"+str(i) for i in range(0,len(self.inputs))]
        no_op_def = "(define (no-op a) a)"
        no_op_str = "(no-op (expr))"
        zero_bv = "(bv 0 (bitvector "+str(self.inputs[0].total_bits)+"))"
        one_bv = ""#"(bv 1 (bitvector "+str(self.inputs[0].total_bits)+"))"
        hint_str = ""  #"(vector-add (vector-mul (expr) (expr) 32 32) (vector-mac (expr) (expr) (expr) 32 32) 64 16)"
        expr = args + rosette_calls + [no_op_str,zero_bv, one_bv, hint_str]

        args_str = "" #"[arg (" +("\n\t".join((["choose"]+args)))+")]"
        expr_str = "[expr (" +("\n\t".join((["choose"]+expr)))+")]"


        grammar_prototype = "("+ (" ".join(["gen-grammar"]+args)) +")"

        grammar_str = "("+"define-grammar " + grammar_prototype+"\n"+expr_str+"\n"+args_str+"\n"+")"
        self.log("\n")
        self.log(grammar_str)

        return  grammar_str







    def generate(self):
        dsl_call_desc = self.permute_precision_and_length(self.num_input_bits)
        dsl_rosette_calls = self.convert_calls_to_rosette(dsl_call_desc)

        self.log("\n"+"="*4+"Generated Rossete Calls"+"="*4)
        [self.log(call) for call in dsl_rosette_calls]

        return self.generate_grammar(dsl_rosette_calls)
















