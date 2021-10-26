from build_rosette import Builtin_Type
from build_rosette import Base_Type
import copy
import build_rosette

verbose = 0


def vprint(s):
    global verbose
    if verbose != 0:
        print(s)


def default_to_type():
    # Largest size that could be needed
    return Builtin_Type(None, None, None, False, Base_Type.UNKNOWN)


class Type_Info():
    def __init__(self, name, tname, size, ele_t, vec, signed, imm):
        self.name = name
        self.tname = tname
        self.size = size

        self.ele_t = ele_t

        self.vec = vec
        self.signed = signed
        self.imm = imm

    def get_builtin_type(self):
        if self.vec is False:
            return self.ele_t
        else:
            return build_rosette.Builtin_Type(self.name, self.size,
                                              self.signed, True,
                                              self.ele_t.base_type)


def get_rosette_builtin_type(T):
    if isinstance(T, Type_Info):
        return T.get_builtin_type()
    else:
        return T


def param_to_type(param, ele_t):
    lookup_type_size = {
        "__m64": 64,
        "__m128": 128,
        "__m128i": 128,
        "__m128d": 128,
        "__m256": 256,
        "__m256d": 256,
        "__m256i": 256,
        "__m512": 512,
        "__m512i": 512,
        "__m512d": 512
    }

    lookup_ele_t = {
        "SI8": Builtin_Type("SI8", 8, True, False, Base_Type.INT),
        "char": Builtin_Type("SI8", 8, True, False, Base_Type.INT),
        "SI16": Builtin_Type("SI16", 16, True, False, Base_Type.INT),
        "short": Builtin_Type("SI16", 16, True, False, Base_Type.INT),
        "SI32": Builtin_Type("SI32", 32, True, False, Base_Type.INT),
        "int": Builtin_Type("SI32", 32, True, False, Base_Type.INT),
        "const int": Builtin_Type("SI32", 32, True, False, Base_Type.INT),
        "SI64": Builtin_Type("SI64", 64, True, False, Base_Type.INT),
        "__int64": Builtin_Type("SI64", 64, True, False, Base_Type.INT),
        "UI8": Builtin_Type("UI8", 8, False, False, Base_Type.INT),
        "UI16": Builtin_Type("UI16", 16, False, False, Base_Type.INT),
        "unsigned short": Builtin_Type("UI16", 16, False, False,
                                       Base_Type.INT),
        "UI32": Builtin_Type("UI32", 32, False, False, Base_Type.INT),
        "unsigned int": Builtin_Type("UI32", 32, False, False, Base_Type.INT),
        "UI64": Builtin_Type("UI64", 64, False, False, Base_Type.INT),
        "unsigned __int64": Builtin_Type("UI64", 64, False, False,
                                         Base_Type.INT),
        "unsigned long": Builtin_Type("UI64", 64, False, False, Base_Type.INT),
        "FP32": Builtin_Type("FP32", 32, True, False, Base_Type.FP),
        "FP64": Builtin_Type("FP64", 64, True, False, Base_Type.FP),
        "__mmask8": Builtin_Type("M8", 8, False, False, Base_Type.BITS),
        "__mmask16": Builtin_Type("M16", 16, False, False, Base_Type.BITS),
        "__mmask32": Builtin_Type("M32", 32, False, False, Base_Type.BITS),
        "__mmask64": Builtin_Type("M64", 64, False, False, Base_Type.BITS),
        "MASK": Builtin_Type("M64", 64, False, False, Base_Type.BITS),
        "M128": Builtin_Type("M128", 128, False, False, Base_Type.BITS),
        "M256": Builtin_Type("M256", 256, False, False, Base_Type.BITS),
        "M512": Builtin_Type("M512", 512, False, False, Base_Type.BITS)
    }

    name = param.name
    tname = param.type
    if bool(param.is_imm):
        if name == "imm8":
            return Type_Info(
                name, tname, 8,
                Builtin_Type(name, 8, True, False, Base_Type.ICONST), False,
                False, True)
        else:
            builtin_info = copy.deepcopy(lookup_ele_t[tname])
            builtin_info.name = name
            builtin_info.base_type = Base_Type.ICONST
            return Type_Info(name, tname, builtin_info.size, builtin_info,
                             False, builtin_info.signed, True)
    # non vector builtin type
    if tname in lookup_ele_t:
        builtin_info = lookup_ele_t[tname]
        return Type_Info(name, tname, builtin_info.size, builtin_info, False,
                         builtin_info.signed, False)

    assert tname in lookup_type_size, "Unknown type: {}".format(param)
    assert ele_t in lookup_ele_t, "Unknown ele type: {}".format(ele_t)
    builtin_info = copy.deepcopy(lookup_ele_t[ele_t])
    builtin_info.name = name
    builtin_info.vec = True
    return Type_Info(name, tname, lookup_type_size[tname], builtin_info, True,
                     bool(param.is_signed), bool(param.is_imm))


class Sym():
    def __init__(self, name, T):
        self.name = name
        self.T = T


class Scope():
    def __init__(self):
        self.funcs = {}
        self.scope_list = []

    def reset(self):
        self.scope_list = []

    def add_func(self, func, ret_type):
        self.funcs[func] = ret_type

    def has_func(self, func):
        if func in self.funcs:
            return self.funcs[func]
        return None

    def add_sym(self, sym):
        assert len(self.scope_list) > 0
        self.scope_list[0][sym.name] = sym

    def has_sym(self, name):
        assert len(self.scope_list) > 0
        for scope in self.scope_list:
            if name in scope:
                return scope[name]
        return None

    def push_scope(self):
        self.scope_list.insert(0, {})

    def pop_scope(self):
        assert len(self.scope_list) > 0
        self.scope_list.pop(0)


class x86_CVT():
    def __init__(self, spec):
        self.spec = spec

        self.intrin_name = spec.intrin
        self.params = spec.params
        self.definition = spec.spec
        self.rettype = spec.rettype
        self.ele_t = spec.elem_type

        self.scope = Scope()

        self.lookup_funcs = {
            "BitSlice": self.cvt_BitSlice,
            "Var": self.cvt_Var,
            "Number": self.cvt_Number,
            "Update": self.cvt_Update,
            "OpUpdate": self.cvt_OpUpdate,
            "For": self.cvt_For,
            "While": self.cvt_While,
            "If": self.cvt_If,
            "Call": self.cvt_Call,
            "BinaryExpr": self.cvt_BinaryExpr,
            "UnaryExpr": self.cvt_UnaryExpr,
            "PseudoExpr": self.cvt_PseudoExpr,
            "PseudoStmt": self.cvt_PseudoStmt,
            "Return": self.cvt_Return,
            "Select": self.cvt_Select,
            "RegSel": self.cvt_RegSel,
            "Match": self.cvt_Match,
            "Case": self.cvt_Case,
            "Lookup": self.cvt_Lookup,
            "FuncDef": self.cvt_FuncDef,
            "Break": self.cvt_Break
        }

    def ast_node_typename(self, ast_node):
        return type(ast_node).__name__

    def error_msg(self):
        return "{}\n\n{}".format(self.intrin_name, self.definition)

    def cvt_olist(self, stmt_list):
        if isinstance(stmt_list, list):
            for stmt in stmt_list:
                self.cvt_ast(stmt)
        else:
            self.cvt_ast(stmt_list)

    def cvt_BitSlice(self, bitslice):
        vprint("Bitslice: {}".format(str(bitslice)))
        print(str(bitslice))
        return build_rosette.build_bitslice(self.cvt_ast(bitslice.bv),
                                            self.cvt_ast(bitslice.hi),
                                            self.cvt_ast(bitslice.lo))

    def cvt_Var(self, var):
        vprint("var: {}".format(str(var)))
        var_type_info = self.scope.has_sym(var.name)
        if var_type_info is None:
            var_type_info = default_to_type()
        else:
            var_type_info = var_type_info.T
        return build_rosette.build_var(var.name,
                                       get_rosette_builtin_type(var_type_info))

    def cvt_Number(self, number):
        vprint("number: {}".format(str(number)))
        return build_rosette.build_number(number.val)

    def cvt_Update(self, update):
        vprint("update: {}".format(str(update)))
        # This needs to change to handle bitvector vs vars
        return build_rosette.build_update(self.cvt_ast(update.lhs),
                                          self.cvt_ast(update.rhs))

    def cvt_OpUpdate(self, opupdate):
        vprint("opupdate: {}".format(str(opupdate)))
        self.cvt_ast(opupdate.op_name)
        return None

    def cvt_For(self, _for):
        vprint("for: {}".format(str(_for)))
        self.scope.push_scope()
        it_sym = Sym(_for.iterator,
                     Builtin_Type("SI32", 32, True, False, Base_Type.INT))
        self.scope.add_sym(it_sym)
        incr = 1
        if not _for.inc:
            incr = -1
        converted_body = []
        for expr in _for.body:
            converted_body.append(self.cvt_ast(expr))
        out = build_rosette.build_for(
            build_rosette.build_var(it_sym.name, it_sym.T),
            self.cvt_ast(_for.begin), self.cvt_ast(_for.end), incr,
            converted_body)

        self.scope.pop_scope()
        return out

    def cvt_While(self, _while):
        vprint("while: {}".format(str(_while)))
        self.scope.push_scope()
        self.cvt_ast(_while.cond)
        for expr in _while.body:
            self.cvt_ast(expr)
        self.scope.pop_scope()
        return None

    def cvt_If(self, _if):
        vprint("if: {}".format(str(_if)))

        converted_then = []
        converted_otherwise = []
        for expr in _if.then:
            converted_then.append(self.cvt_ast(expr))
        for expr in _if.otherwise:
            converted_otherwise.append(self.cvt_ast(expr))
        return build_rosette.build_if(self.cvt_ast(_if.cond), converted_then,
                                      converted_otherwise)

    def cvt_Call(self, call):
        vprint("call: {}".format(str(call)))
        ret_type = self.scope.has_func(call.func)
        assert ret_type is not None, "{}\n{}".format(call.func,
                                                     self.error_msg())

        converted_args = []
        for arg in call.args:
            converted_args.append(self.cvt_ast(arg))
        return build_rosette.build_call(call.func, converted_args, ret_type)

    def cvt_BinaryExpr(self, binaryexpr):
        vprint("binaryexpr: {}".format(str(binaryexpr)))
        # op goes directly to rosette
        # expr_id is int, unsure what to do with it
        assert binaryexpr.op is not None
        assert binaryexpr.a is not None
        assert binaryexpr.b is not None
        return build_rosette.build_binaryexpr(binaryexpr.op,
                                              self.cvt_ast(binaryexpr.a),
                                              self.cvt_ast(binaryexpr.b))

    def cvt_UnaryExpr(self, unaryexpr):
        vprint("unaryexpr: {}".format(str(unaryexpr)))
        # op goes directly to rosette

        return build_rosette.build_unaryexpr(unaryexpr.op,
                                             self.cvt_ast(unaryexpr.a))

    def cvt_PseudoExpr(self, pseudoexpr):
        vprint("pseudoexpr: {}".format(str(pseudoexpr)))
        assert False, "Not implemented!\n\n{}".format(self.error_msg())
        return None

    def cvt_PseudoStmt(self, pseudostmt):
        vprint("pseudostmt: {}".format(str(pseudostmt)))
        # Do nothing for now. But really what we need to do is define
        # two versions it appears
        return None

    def cvt_Return(self, _return):
        vprint("return: {}".format(str(_return)))
        return build_rosette.build_return(self.cvt_ast(_return.val))

    def cvt_Select(self, select):
        vprint("select: {}".format(str(select)))

        converted_then = []
        converted_otherwise = []
        then = select.then
        otherwise = select.otherwise
        if not isinstance(then, list):
            then = [then]
        if not isinstance(otherwise, list):
            otherwise = [otherwise]

        for expr in then:
            converted_then.append(self.cvt_ast(expr))
        for expr in otherwise:
            converted_otherwise.append(self.cvt_ast(expr))
        return build_rosette.build_if(self.cvt_ast(select.cond),
                                      converted_then, converted_otherwise)

    def cvt_RegSel(self, regsel):
        vprint("regsel: {}".format(str(regsel)))
        assert False, "Not implemented!\n\n{}".format(self.error_msg())
        return None

    def cvt_Match(self, match):
        vprint("match: {}".format(str(match)))
        self.cvt_ast(match.val)

        converted_cases = []
        for case in match.cases:
            converted_cases.append(self.cvt_ast(case))

        return build_rosette.build_match(self.cvt_ast(match.val),
                                         converted_cases)

    def cvt_Case(self, case):
        vprint("case: {}".format(str(case)))
        converted_stmts = []
        for stmt in case.stmts:
            converted_stmts.append(self.cvt_ast(stmt))
        return build_rosette.build_case(self.cvt_ast(case.val),
                                        converted_stmts)

    def cvt_Lookup(self, lookup):
        vprint("lookup: {}".format(str(lookup)))
        self.cvt_ast(lookup.obj)
        # key goes to rosette
        return None

    def cvt_FuncDef(self, funcdef):
        vprint("funcdef: {}".format(str(funcdef)))
        converted_params = []
        converted_body = []
        for param in funcdef.params:
            converted_params.append(self.cvt_ast(param))

        for expr in funcdef.body:
            converted_body.append(self.cvt_ast(expr))
        # name is passed to rosette
        out = build_rosette.build_funcdef(funcdef.name, converted_params,
                                          converted_body)
        self.scope.add_func(funcdef.name, out.get_type_info())
        return out

    def cvt_Break(self, _break):
        vprint("break: {}".format(str(_break)))
        assert False, "Not implemented!\n\n{}".format(self.error_msg())
        return None

    def cvt_ast(self, ast_node):
        typename = self.ast_node_typename(ast_node)
        assert typename in self.lookup_funcs, "\n\nCant find {}\n\n{}\n\n{}\n".format(
            typename, self.error_msg(), ast_node)

        cvt_func = self.lookup_funcs[typename]
        return cvt_func(ast_node)

    def cvt_all(self):
        self.scope.add_func(
            "FP32", Builtin_Type("FP32", 32, True, False, Base_Type.FP))
        self.scope.add_func(
            "FP64", Builtin_Type("FP64", 64, True, False, Base_Type.FP))
        self.scope.add_func("MIN", default_to_type())
        self.scope.add_func("MAX", default_to_type())
        self.scope.push_scope()
        print(
            "---------------------------------------------\n{}\n-----------------------------------------"
            .format(self.intrin_name))
        for param in self.params:

            builtin_t = param_to_type(param, self.ele_t).get_builtin_type()

            sym = Sym(builtin_t.name, builtin_t)
            self.scope.add_sym(sym)
            print(sym.name)

        for spec in self.definition:
            print(str(self.cvt_ast(spec).to_str()))
        print(
            "------------------------------------------------------------------\n"
        )
