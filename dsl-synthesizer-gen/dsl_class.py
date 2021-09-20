from enum import Enum
from collections import Counter



class ArgType(Enum):
    IntConst = 1
    BitVectorConst = 2
    IntSymbolic = 3
    BitVectorSymbolic = 4

class DSLArg:

    def __init__(self, name, arg_ty, is_precision = False, is_length = False):
        self.name = name
        self.arg_ty = arg_ty
        self.is_precision = False
        self.is_length = False

        assert (not (is_precision and is_length)), "Argument can not be precision and length simultaneously!"


class DSLInst:
    """ Base class to represent Target Agnostic DSL Instructions"""
    
    def __init__(self, name, inputs):
        
        self.name = name
        self.inputs = inputs 

    
    """ Returns true if each arg from arg_list can be used
    to directly map to one of the instructions operands. Note
    we can not directly use set superset since the number
    of duplicates is important."""
    def isArgumentTypeSuperset(self, arg_list):
        arg_list_types = [arg.arg_ty for arg in arg_list]
        inst_types = [arg.arg_ty for arg in self.inputs]


        count_arg_list = Counter(arg_list_types)
        count_inst_types = Counter(inst_types)


        for arg_ty in count_inst_types:
            if arg_ty not in count_arg_list:
                return False

            if count_arg_list[arg_ty] > count_arg_list[arg_ty]:
                return False

        return True

    
    def getOperandType(self, idx):
        assert (idx < len(self.inputs)), "Out of bounds argument indexing!"
        return  self.inputs[idx].arg_ty


    def getPrecisionOperandIdx(self):

        for idx, arg in enumerate(self.inputs):
            if arg.is_precision:
                return idx
        return -1


    def getLengthOperandIdx(self):

        for idx, arg in enumerate(self.inputs):
            if arg.is_length:
                return idx
        return -1



        





    

    
