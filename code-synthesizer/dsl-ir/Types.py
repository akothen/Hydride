from enum import Enum, auto

class OperandType:

    class OperandTypeEnum(Enum):
        BitVector = auto()
        ConstBitVector = auto()
        LaneSize = auto()
        Precision = auto()
        Integer = auto()
        IndexVariable = auto()

    def __init__(self, Enum):
        self.TypeEnum = Enum
        self.is_hole = False

    def __eq__(self, Other):
        assert isinstance(Other, OperandType)
        return self.TypeEnum == Other.TypeEnum

    def __ne__(self, Other):
        assert isinstance(Other, OperandType)
        return self.TypeEnum != Other.TypeEnum

    def __hash__(self):
        return hash(self.TypeEnum)

    def get_rkt_comment(self):
        return ";; Base Operand Type"

    def print_operand(self, prefix = ""):
        print("{} Base OperandType".format(prefix))



class BitVector(OperandType):

    def __init__(self, name , size):

        self.size = size
        self.name = name
        super().__init__(OperandType.OperandTypeEnum.BitVector)
        self.is_hole = True


    def define_symbolic(self):
        label = "sym_"+this.name
        def_str = "(define-symbolic {} (bitvector {}))".format(label, self.size)

        return (label, def_str)


    def get_rkt_comment(self):
        return ";; {}-bit Bitvector operand".format(self.size)


    def print_operand(self, prefix = ""):
        print("{} {}\t| Symbolic Bitvector {}".format(prefix, self.name, self.size))



class ConstBitVector(OperandType):

    def __init__(self, value , size, name = None):

        self.name = name
        self.value = value
        self.size = size
        super().__init__(OperandType.OperandTypeEnum.ConstBitVector)


    def get_rkt_value(self):
        return "(bv {} (bitvector {}))".format(self.value , self.size)


    def get_rkt_definition(self):
        return "(define {} {})".format(self.name, self.get_rkt_value())

    def get_dsl_value(self):
        return "(lit {})".format(self.get_rkt_value())

    def get_rkt_comment(self):
        return ";; {}-bit Constant Bitvector operand".format(self.size)

    def print_operand(self, prefix = ""):
        trunc_value = self.value
        if len(trunc_value) > 20:
            trunc_value = self.value[:20] + "..."

        print("{} {}\t| Constant Bitvector {}".format(prefix, trunc_value, self.size))



class LaneSize(OperandType):

    def __init__(self, name, value = None):

        self.name = name
        self.value = value
        super().__init__(OperandType.OperandTypeEnum.LaneSize)


    def get_rkt_value(self):
        if self.value != None:
            return str(self.value)
        else:
            return str(self.name)


    def get_dsl_value(self):
        return self.get_rkt_value()


    def get_rkt_comment(self):
        return ";; Lane Size "


    def print_operand(self, prefix = ""):
        print("{} {}\t| Lane Size {}".format(prefix, self.name, self.value))


class Precision(OperandType):

    def __init__(self, name, input_precision = False, output_precision = False,  value = None):

        self.name = name
        self.value = value
        self.input_precision = input_precision
        self.output_precision = output_precision
        super().__init__(OperandType.OperandTypeEnum.Precision)


    def get_rkt_value(self):
        if self.value != None:
            return str(self.value)
        else:
            return str(self.name)


    def get_rkt_comment(self):
        return ";; Precision Operand "

    def get_dsl_value(self):
        return self.get_rkt_value()

    def print_operand(self, prefix = ""):
        print("{} {}\t| Precision {} bits , Is Input  = {}, Is Output = {}".format(prefix, self.name, self.value, self.input_precision, self.output_precision))


class Integer(OperandType):

    def __init__(self, name, value = None):

        self.name = name
        self.value = value
        super().__init__(OperandType.OperandTypeEnum.Integer)


    def get_rkt_value(self):
        if self.value != None:
            return str(self.value)
        else:
            return str(self.name)


    def get_rkt_comment(self):
        return ";; Integer Operand "

    def get_dsl_value(self):
        return self.get_rkt_value()


    def print_operand(self, prefix = ""):
        print("{} {}\t| Integer {}".format(prefix, self.name, self.value))


class IndexVariable(OperandType):

    def __init__(self, name = "idx-i"):

        self.name = name

        assert (name == "idx-i" or name == "idx-j"), "Unsupported Index Variable"


        super().__init__(OperandType.OperandTypeEnum.IndexVariable)


    def get_rkt_value(self):
        assert False , "Index variable has no corresponding racket value"


    def get_dsl_value(self):
        return "(idx-i 0)"


    def get_rkt_comment(self):
        return ";; Loop Index Variable "

    def print_operand(self, prefix = ""):
        print("{}\t| Index Variable {}".format(prefix, self.name))

class InstructionType:

    class InstructionTypeEnum(Enum):
        SIMD = auto()
        NON_SIMD = auto()
        Shuffle = auto()


    def __init__(self, Enum):
        self.TypeEnum = Enum

    def __eq__(self, Other):
        assert isinstance(Other, InstructionType)
        return self.TypeEnum == Other.TypeEnum

    def __ne__(self, Other):
        assert isinstance(Other, OperandType)
        return self.TypeEnum != Other.TypeEnum

    def __hash__(self):
        return hash(self.TypeEnum)
