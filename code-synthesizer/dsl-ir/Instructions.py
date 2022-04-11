from Types import OperandType, InstructionType



class Context:
    def __init__(self, in_vectsize = None, out_vectsize = None,
                 lane_size = None, in_precision = None,
                 out_precision = None):
        self.in_vectsize = in_vectsize
        self.out_vectsize = out_vectsize
        self.lane_size = lane_size
        self.in_precision = in_precision
        self.out_precision = out_precision

    def get_input_size(self):
        assert (self.in_precision != None) and (self.in_vectsize != None) , "Unable to process input size for instruction"
        return self.in_precision * self.in_vectsize


    def get_output_size(self):
        assert (self.out_precision != None) and (self.out_vectsize != None) , "Unable to process output size for instruction"
        return self.out_precision * self.out_vectsize



class Instruction(InstructionType):

    def __init__(self, name = None, args = [],
                 in_vectsize = None, out_vectsize = None,
                 lane_size = None, in_precision = None,
                 out_precision = None, SIMD = False,
                 shuffle = False, semantics = None,
                 operation = False):

        self.name = name
        self.semantics = semantics
        self.SIMD = SIMD
        self.shuffle = shuffle
        self.operation = operation


        assert (not (shuffle and operation)), "Instruction must be either a shuffle or computation"



        # We may have multiple instances for a given
        # target agnostic DSL instruction. contexts refers
        # a list of the specific concrete instances.
        self.contexts = []





    def add_context(self, in_vectsize = None, out_vectsize = None,
                    lane_size = None, in_precision = None,
                    out_precision = None):

        self.contexts.append(
            Context(in_vectsize = in_vectsize, out_vectsize,
                    lane_size = lane_size, in_precision = in_precision,
                    out_precision = out_precision)
        )








