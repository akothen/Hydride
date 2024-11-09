from enum import Enum, auto

class OperandType:
    class OperandTypeEnum(Enum):
        BitVector = auto()
        ConstBitVector = auto()
        LaneSize = auto()
        Precision = auto()
        Integer = auto()
        Bool = auto()
        IndexVariable = auto()
        ShapeVariable = auto()
        IndexExpr = auto()
        BoundedBitVector = auto()
        Reg = auto()

    def __init__(self, Enum):
        self.TypeEnum = Enum
        self.is_hole = False

    #def __eq__(self, Other):
    #    if Other == None:
    #        return False
    #
    #    assert isinstance(Other, OperandType)
    #    return self.TypeEnum == Other.TypeEnum

    #def __ne__(self, Other):
    #    if Other == None:
    #        return True
    #    assert isinstance(Other, OperandType)
    #    return self.TypeEnum != Other.TypeEnum

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

    def get_dsl_value(self):
        return "(symbolic_bitvector {})".format(self.size)


    def print_operand(self, prefix = ""):
        print("{} {}\t| Symbolic Bitvector {}".format(prefix, self.name, self.size))



# Bitvector type operand which essentially
# controls the precision on which the operation will be performed
class BoundedBitVector(OperandType):

    def __init__(self, name , size):

        self.size = size
        self.name = name
        super().__init__(OperandType.OperandTypeEnum.BoundedBitVector)
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
        print("{} {}\t| Bounded Bitvector {}".format(prefix, self.name, self.size))

class ConstBitVector(OperandType):

    def __init__(self, value , size, name = None):

        self.name = name
        self.value = value
        self.size = size
        super().__init__(OperandType.OperandTypeEnum.ConstBitVector)


    def __eq__(self, Other):
        if Other == None:
            return False

        if isinstance(Other, ConstBitVector):
            return (Other.value == self.value) and (Other.size == self.size)
        else:
            return False

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


    def __eq__(self, Other):
        if Other == None:
            return False

        if isinstance(Other, LaneSize):
            return (Other.value == self.value) and (Other.input_precision == self.input_precision) and (Other.output_precision == self.output_precision)
        else:
            return False

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


    def __eq__(self, Other):
        if Other == None:
            return False

        if isinstance(Other, Precision):
            return (Other.value == self.value) and (Other.input_precision == self.input_precision) and (Other.output_precision == self.output_precision)
        else:
            return False

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


class Bool(OperandType):

    def __init__(self, name, value = None):

        self.name = name
        self.value = value
        super().__init__(OperandType.OperandTypeEnum.Bool)


    def get_rkt_value(self):
        if self.value != None:
            return str(self.value)
        else:
            return str(self.name)


    def to_int(self):
        if self.value == "#t":
            return 1
        elif self.value == "#f":
            return 0
        else:
            assert False, "Unrecognized value!:\t"+self.value
    def get_rkt_comment(self):
        return ";; Boolean Operand "

    def get_dsl_value(self):
        return self.get_rkt_value()


    def print_operand(self, prefix = ""):
        print("{} {} {} \t| Boolean {}".format(prefix, self.name, self.value,  self.value))

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



class Reg(OperandType):

    def __init__(self, index , precision, size, signed = False):

        self.index = index
        self.precision = precision
        self.size = size
        self.signed = signed

        assert self.precision != None, "precision for reg needs to be provied"
        assert self.size != None, "size for reg needs to be provided"
        super().__init__(OperandType.OperandTypeEnum.Reg)


    def __eq__(self, Other):
        if Other == None:
            return False

        if isinstance(Other, Reg):
            return Other.index == self.index
        else:
            return False

    def get_rkt_value(self):
        return "(reg (bv "+str(self.index) +" (bitvector 8)))"

    def get_halide_dsl_value(self):
        type_prefix = "'"
        if not self.signed:
            type_prefix = "'u"
        type_core = "int"+str(self.precision)

        type_str = type_prefix + type_core

        return "(buffer-index  "+str(self.index) +" "+type_str+" "+str(self.size)+") ; < {} x i{}> {}".format(self.size // self.precision, self.precision, self.signed)

    def get_dsl_value(self):
        return "(reg (bv "+str(self.index) +" (bitvector 8))) ; < {} x i{}> {}".format(self.size // self.precision, self.precision, self.signed)

    def get_rkt_comment(self):
        return ";; {}-bit reg operand".format(self.size)


    def print_operand(self, prefix = ""):
        print("{} Reg {} \t| <{} x i{}>".format(prefix, self.index, self.size // self.precision, self.precision))



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
    return isinstance(arg, BitVector) or isinstance(arg, ConstBitVector) or isinstance(arg, BoundedBitVector)
