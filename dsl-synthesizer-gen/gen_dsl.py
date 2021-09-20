from dsl_class import *



class DSLGen:

    def __init__(self, inputs, outputs, num_input_bits ,dsl_list):
        """ Taking in the input and output types, generate a Rossete 
        synthesis grammar """

        self.inputs = inputs
        self.outputs = outputs
        self.dsl_list = dsl_list
        self.num_input_bits = num_input_bits

    def get_dsl_calls(self, precision, length):

        print("get_dsl_calls with precision: {}, length: {}".format(precision,length))
        """Using those DSL instructions which can be 
        correctly called with the argument types in the inputs"""

        valid_dsl = [dsl_inst for dsl_inst in self.dsl_list if dsl_inst.isArgumentTypeSuperset(self.inputs)]

        print("Number of Valid DSL instructions for this configuration: {}".format(len(valid_dsl)))

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
                    dsl_call.append("(arg)")
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
        while total_bits % prec == 0:
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

    
    def generate(self):
        dsl_call_desc = self.permute_precision_and_length(self.num_input_bits)
        dsl_rosette_calls = self.convert_calls_to_rosette(dsl_call_desc)

        print("\n","="*4, "Generated Rossete Calls","="*4)
        [print(call) for call in dsl_rosette_calls] 








            



        


        
