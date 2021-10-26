import sema_ast


class cvt_Base():
    def cvt_class(self):
        assert False, "Not Implemented!"


class cvt_BitSlice(cvt_Base):
    def __init__(self, bitslice):
        self.bitslice = bitslice
        print("init Bitslice")

    def cvt_class(self):
        print("cvt class")


class cvt_Var(cvt_Base):
    def __init__(self, var):
        self.var = var
        print("init var")


class cvt_Number(cvt_Base):
    def __init__(self, number):
        self.number = number
        print("init number")


class cvt_Update(cvt_Base):
    def __init__(self, update):
        self.update = update
        print("init update")


class cvt_OpUpdate(cvt_Base):
    def __init__(self, opupdate):
        self.opupdate = opupdate
        print("init opupdate")


class cvt_For(cvt_Base):
    def __init__(self, _for):
        self._for = _for
        print("init for")


class cvt_While(cvt_Base):
    def __init__(self, _while):
        self._while = _while
        print("init while")


class cvt_If(cvt_Base):
    def __init__(self, _if):
        self._if = _if
        print("init if")


class cvt_Call(cvt_Base):
    def __init__(self, call):
        self.call = call
        print("init call")


class cvt_BinaryExpr(cvt_Base):
    def __init__(self, binaryexpr):
        self.binaryexpr = binaryexpr
        print("init binaryexpr")


class cvt_UnaryExpr(cvt_Base):
    def __init__(self, unaryexpr):
        self.unaryexpr = unaryexpr
        print("init unaryexpr")


class cvt_PseudoExpr(cvt_Base):
    def __init__(self, pseudoexpr):
        self.pseudoexpr = pseudoexpr
        print("init pseudoexpr")


class cvt_PseudoStmt(cvt_Base):
    def __init__(self, pseudostmt):
        self.pseudostmt = pseudostmt
        print("init pseudostmt")


class cvt_Return(cvt_Base):
    def __init__(self, _return):
        self._return = _return
        print("init return")


class cvt_Select(cvt_Base):
    def __init__(self, select):
        self.select = select
        print("init select")


class cvt_RegSel(cvt_Base):
    def __init__(self, regsel):
        self.regsel = regsel
        print("init regsel")


class cvt_Match(cvt_Base):
    def __init__(self, match):
        self.match = match
        print("init match")


class cvt_Case(cvt_Base):
    def __init__(self, case):
        self.case = case
        print("init case")


class cvt_Lookup(cvt_Base):
    def __init__(self, lookup):
        self.lookup = lookup
        print("init lookup")


class cvt_FuncDef(cvt_Base):
    def __init__(self, funcdef):
        self.funcdef = funcdef
        print("init funcdef")


class cvt_Break(cvt_Base):
    def __init__(self, _break):
        self._break = _break
        print("init _break")


def cvt_ast(ast_node):
    lookup_funcs = {
        "BitSlice": cvt_BitSlice,
        "Var": cvt_Var,
        "Number": cvt_Number,
        "Update": cvt_Update,
        "OpUpdate": cvt_OpUpdate,
        "For": cvt_For,
        "While": cvt_While,
        "If": cvt_If,
        "Call": cvt_Call,
        "BinaryExpr": cvt_BinaryExpr,
        "UnaryExpr": cvt_UnaryExpr,
        "PseudoExpr": cvt_PseudoExpr,
        "PseudoStmt": cvt_PseudoStmt,
        "Return": cvt_Return,
        "Select": cvt_Select,
        "RegSel": cvt_RegSel,
        "Match": cvt_Match,
        "Case": cvt_Case,
        "Lookup": cvt_Lookup,
        "FuncDef": cvt_FuncDef,
        "Break": cvt_Break
    }

    assert ast_node.name in lookup_funcs

    cvt_class = lookup_funcs[ast_node.name]
    return cvt_class.code()
