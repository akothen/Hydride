from enum import Enum
from collections import Counter

bv_ops = [
  'bvnot', 'bvand', 'bvor', 'bvxor', 'bvshl', 'bvlshr', 'bvashr',
  'bvneg', 'bvadd', 'bvsub', 'bvmul', 'bvsdiv', 'bvudiv',
  'bvsrem', 'bvurem', 'bvsmod',
  'bvsmin', 'bvumin', 'bvsmax', 'bvumax',
  'bveq', 'bvslt', 'bvult', 'bvsle', 'bvule', 'bvsgt', 'bvugt', 'bvsge', 'bvuge'
]

class ArgType(Enum):
    IntConst = 1
    BitVectorConst = 2
    IntSymbolic = 3
    BitVectorSymbolic = 4
    PrecisionConst = 5
    LengthConst = 6

class DSLArg:

    def __init__(self, name, arg_ty, total_bits = 0, concrete_value = "", is_in_precision = True,
                 precision_value = 0):
        self.name = name
        self.arg_ty = arg_ty
        self.is_precision = (arg_ty == ArgType.PrecisionConst)
        self.is_length = (arg_ty == ArgType.LengthConst)
        self.total_bits = total_bits
        self.concrete_value = concrete_value
        self.is_in_precision = is_in_precision
        self.precision_value = precision_value



class DSLInst:
    """ Base class to represent Target Agnostic DSL Instructions"""

    def __init__(self, name, inputs, semantics = None):
        self.name = name
        self.inputs = inputs
        self.semantics = semantics


    """ Returns true if each arg from arg_list can be used
    to uniquely map to one of the instructions operands. Note
    we can not directly use set superset since the number
    of duplicates is important."""
    def isArgumentTypeSuperset(self, arg_list):
        arg_list_types = [arg.arg_ty for arg in arg_list]
        inst_types = [arg.arg_ty for arg in self.inputs]


        count_arg_list = Counter(arg_list_types)
        count_inst_types = Counter(inst_types)



        for arg_ty in count_inst_types:
            if arg_ty == ArgType.PrecisionConst or arg_ty == ArgType.LengthConst:
                continue

            if arg_ty not in count_arg_list:
                return False

            if count_arg_list[arg_ty] > count_arg_list[arg_ty]:
                return False

        return True

    """ Returns true if each arg from arg_list can be used
    to directly mapped to at least one of the arguments present
    in arg_list. Note that a particular argument may be repeated
    across locations"""
    def isArgumentTypeSupersetWithRepitition(self, arg_list):
        arg_list_types = set([arg.arg_ty for arg in arg_list])
        inst_types = set([arg.arg_ty for arg in self.inputs])

        return inst_types.issubset(arg_list_types)


    """ Given the racket semantics of the current
    DSL instruction and the semantics of some user's
    code, we return true if they contain the same
    underlying bitvector operations."""
    def hasSameBVOps(self, spec_sema):
        dsl_sema = self.semantics
        # print(dsl_sema)
        bvops_list = list()
        for op in bv_ops:
            if op in dsl_sema:
                bvops_list.append(op)
        for op in bvops_list:
            if op not in spec_sema:
                return False
            #print(spec_sema)
        return True



    def getOperandType(self, idx):
        assert (idx < len(self.inputs)), "Out of bounds argument indexing!"
        return  self.inputs[idx].arg_ty

    def getNumOperands(self):
        return len(self.inputs)


    """
    in_precision : true if requesting in precision, false
    if requesting the output precision
    """
    def getPrecisionOperandIdx(self, in_precision = True):
        for idx, arg in enumerate(self.inputs):
            if arg.is_precision:
                """ If the argument type is a precision
                type and corresponds to an incoming precision"""
                if in_precision and arg.is_in_precision:
                    return idx


                """ If the argument type is a precision
                type and corresponds to an out precision"""
                if not in_precision and not arg.is_in_precision:
                    return idx
        return -1


    """ For DSL instructions with multiple dimensions,
    the length number specifies the specific dimension
    (starting from 0 )"""
    def getLengthOperandIdx(self, length_num = 0):
        for idx, arg in enumerate(self.inputs):
            if arg.is_length:
                if length_num == 0:
                    return idx
                length_num -= 1
        return -1

    def getLengthOperandsIndices(self):
        ops = []
        for idx, arg in enumerate(self.inputs):
            if arg.is_length:
                ops.append(idx)
        return ops



    def getLengthOperands(self):
        ops = []
        for idx, arg in enumerate(self.inputs):
            if arg.is_length:
                ops.append(arg)
        return ops

    def getNumLengthParams(self):
        num = 0
        for idx, arg in enumerate(self.inputs):
            if arg.is_length:
                num += 1
        return num


    def str(self):
        dsl_str_list = [self.name] + [str(arg.arg_ty.name) for arg in self.inputs]
        semantics_str = ""

        if self.semantics != None:
            semantics_str = self.semantics
        return "("+(" ".join(dsl_str_list))+")" +"\n"+semantics_str





