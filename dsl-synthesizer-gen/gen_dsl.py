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

    def get_dsl_calls(self, precision, length):

        self.log("get_dsl_calls with precision: {}, length: {}".format(precision,length))
        """Using those DSL instructions which can be
        correctly called with the argument types in the inputs"""

        valid_dsl = []

        if self.inclusion_scheme == "arg_superset":
            valid_dsl = [dsl_inst for dsl_inst in self.dsl_list if dsl_inst.isArgumentTypeSuperset(self.inputs)]
        elif self.inclusion_scheme == "bvops":
            assert self.spec_sema != "", "Must provide specification semantics for bvops inclusion scheme"
            valid_dsl = [dsl_inst for dsl_inst in self.dsl_list if dsl_inst.hasSameBVOps(self.spec_sema)]


        self.log("Number of Valid DSL instructions for this configuration: {}".format(len(valid_dsl)))

        dsl_calls = []

        for dsl_inst in valid_dsl:

            dsl_call = [dsl_inst.name]
            precision_arg_idx = dsl_inst.getPrecisionOperandIdx()
            length_arg_idx = dsl_inst.getLengthOperandIdx()

            for i in range(0, dsl_inst.getNumOperands()):
                ith_arg_ty = dsl_inst.getOperandType(i)

                if i == precision_arg_idx:
                    dsl_call.append(str(precision))
                elif i == length_arg_idx:
                    dsl_call.append(str(length))
                elif ith_arg_ty == ArgType.BitVectorSymbolic:
                    dsl_call.append("(expr)")
                elif ith_arg_ty == ArgType.IntSymbolic:
                    dsl_call.append("(?? integer?)")
                else:
                    assert (False), "Unsupported argument type used in "+dsl_inst.str()
            dsl_calls.append(dsl_call)

        return dsl_calls


    def permute_precision_and_length(self, total_bits):

        # Starting with 16 bit precision
        prec = 16


        dsl_calls = []
        """ While the precision evenly divides the total bits"""
        while total_bits % prec == 0 and prec < total_bits:
            length = total_bits // prec
            dsl_calls += self.get_dsl_calls(prec, length)

            prec = prec * 2

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
        expr = args + rosette_calls + [no_op_str,zero_bv, one_bv]

        args_str = "[arg (" +("\n\t".join((["choose"]+args)))+")]"
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
















