from enum import Enum, auto

class OperandType:
    class OperandTypeEnum(Enum):
        BitVector = auto()
        ConstBitVector = auto()
        LaneSize = auto()
        Precision = auto()
        Integer = auto()
        IndexVariable = auto()
        ShapeVariable = auto()
        IndexExpr = auto()

    def __init__(self, Enum):
        self.TypeEnum = Enum
        self.is_hole = False

    def __eq__(self, Other):
        if Other == None:
            return False

        assert isinstance(Other, OperandType)
        return self.TypeEnum == Other.TypeEnum

    def __ne__(self, Other):
        if Other == None:
            return True
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
        label = "sym_"+self.name
        def_str = "(define-symbolic {} (bitvector {}))".format(label, self.size)

        return (label, def_str)

    def get_rkt_value(self):
        return "BV_"+str(self.size)

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

    def __init__(self, name, value = None, input_precision = False,
                 output_precision = False):

        self.name = name
        self.value = value
        self.input_precision = input_precision
        self.output_precision = output_precision
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
        print("{} {} {} \t| Lane Size {}".format(prefix, self.name, self.value, self.value))


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
        print("{} {} {} \t| Integer {}".format(prefix, self.name, self.value,  self.value))


class IndexVariable(OperandType):

    def __init__(self, name = "idx-i"):

        self.name = name

        assert (name == "idx-i" or name == "idx-j"), "Unsupported Index Variable"


        super().__init__(OperandType.OperandTypeEnum.IndexVariable)


    def get_rkt_value(self):
        assert False , "Index variable has no corresponding racket value"


    def get_dsl_value(self):
        if self.name == "idx-i":
            return "(idx-i 0)"
        elif self.name == "idx-j":
            return "(idx-j 0)"


    def get_rkt_comment(self):
        return ";; Loop Index Variable "

    def print_operand(self, prefix = ""):
        print("{}\t| Index Variable {}".format(prefix, self.name))


class ShapeVariable(OperandType):

    def __init__(self, name = "dim-x"):

        self.name = name

        assert (name == "dim-x" or name == "dim-y"), "Unsupported Index Variable"


        super().__init__(OperandType.OperandTypeEnum.ShapeVariable)


    def get_rkt_value(self):
        assert False , "Shape variable has no corresponding racket value"


    def get_dsl_value(self):
        if self.name == "dim-x":
            return "(dim-x 0)"
        elif self.name == "dim-y":
            return "(dim-y 0)"


    def get_rkt_comment(self):
        return ";; Shape Variable "

    def print_operand(self, prefix = ""):
        print("{}\t| Shape Variable {}".format(prefix, self.name))


class IndexExprTypeEnum(Enum):
    Add = auto()
    Mul = auto()


class IndexExpr(OperandType):
    def __init__(self, lhs, rhs,  expr_type = IndexExprTypeEnum.Add):
        self.expr_type = expr_type
        self.lhs = lhs
        self.rhs = rhs
        self.is_hole = False
        super().__init__(OperandType.OperandTypeEnum.IndexExpr)

    def get_rkt_value(self):
        assert False, "Index expression has no corresponding racket value"


    def get_rkt_comment(self):
        return ""

    def get_dsl_value(self):

        lhs_str = self.lhs.get_dsl_value()
        rhs_str = self.rhs.get_dsl_value()

        if self.expr_type == IndexExprTypeEnum.Add:
            return "(idx-add {} {})".format(lhs_str, rhs_str)
        elif self.expr_type == IndexExprTypeEnum.Mul:
            return "(idx-mul {} {})".format(lhs_str, rhs_str)


# Utility function to create expressions of the form
# a x (idx-i) + b x (idx-j) + k
def create_affine_index_expr(i_coef, j_coef, bias):
    i_expr = None
    j_expr = None
    bias_expr = None

    i_index = IndexVariable(name = "idx-i")
    j_index = IndexVariable(name = "idx-j")

    if i_coef == "dim-x":
        dim_x = ShapeVariable(name = "dim-x")
        i_expr = IndexExpr(i_index, dim_x, expr_type = IndexExprTypeEnum.Mul)
    elif i_coef == "dim-y":
        dim_y = ShapeVariable(name = "dim-y")
        i_expr = IndexExpr(i_index, dim_y, expr_type = IndexExprTypeEnum.Mul)
    elif i_coef == None:
        i_expr = None
    else:
        integer = Integer("i_coef", value = int(i_coef))
        i_expr = IndexExpr(i_index, integer , expr_type = IndexExprTypeEnum.Mul)


    if j_coef == "dim-x":
        dim_x = ShapeVariable(name = "dim-x")
        j_expr = IndexExpr(j_index, dim_x, expr_type = IndexExprTypeEnum.Mul)
    elif j_coef == "dim-y":
        dim_y = ShapeVariable(name = "dim-y")
        j_expr = IndexExpr(j_index, dim_y, expr_type = IndexExprTypeEnum.Mul)
    elif j_coef == None:
        j_expr = None
    else:
        integer = Integer("j_coef", value = int(j_coef))
        j_expr = IndexExpr(j_index, integer , expr_type = IndexExprTypeEnum.Mul)


    if isinstance(bias, OperandType):
        bias_expr = bias
    elif bias == "dim-x":
        bias_expr = ShapeVariable(name = "dim-x")
    elif bias == "dim-y":
        bias_expr = ShapeVariable(name = "dim-y")
    elif bias == None:
        bias_expr = None
    else:
        bias_expr = Integer("bias", value = int(bias))

    expr = None

    if i_expr != None:
        if expr == None:
            expr = i_expr
        else:
            expr = i_expr


    if j_expr != None:
        if expr == None:
            expr = j_expr
        else:
            expr = IndexExpr(expr, j_expr, expr_type = IndexExprTypeEnum.Add)


    if bias_expr != None:
        if expr == None:
            expr = bias_expr
        else:
            expr = IndexExpr(expr, bias_expr, expr_type = IndexExprTypeEnum.Add)

    assert expr != None, "Should not be creating a undefined expression"

    return expr




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



def isBitVectorType(arg):
    return isinstance(arg, BitVector) or isinstance(arg, ConstBitVector)
