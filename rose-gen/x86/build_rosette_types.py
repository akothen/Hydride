import copy
import builtin_types
from builtin_types import Base_Type
import x86_types
import print_rosette
import sema_ast
from vprint import vprint, vvprint

tmp_count = 0


def make_tmp_name(base_name):
    global tmp_count
    new_name = "_tmp-{}-{}".format(base_name, tmp_count)
    tmp_count += 1
    return new_name


def lct(a, b):
    if a.base_type.value < b.base_type.value:
        return a
    return b


def gct(a, b):
    if a.base_type.value < b.base_type.value:
        return b
    return a


def compatible(a, b):
    if a.base_type == b.base_type and a.vec == b.vec:
        return True
    if (a.int_based() or b.bit_based()) and (b.int_based() or b.bit_based()):
        return True
    if a.fp_based() and b.fp_based():
        return True
    if a.is_unknown() or b.is_unknown():
        return True
    if (a.fp_based() and b.is_iconst()) or (b.fp_based() or a.is_iconst()):
        return True
    return True


class Scope():
    def __init__(self):
        self.funcs = {}
        self.scope_list = []

    def add_func_info(self, func, ret_t):
        self.funcs[func] = copy.deepcopy(ret_t)

    def get_func_info(self, func):
        if func in self.funcs:
            return copy.deepcopy(self.funcs[func])
        return None

    def add_var_info(self, name, info):
        assert len(self.scope_list) > 0
        self.scope_list[0][name] = copy.deepcopy(info)

    def get_var_info(self, name):
        assert len(self.scope_list) > 0
        for scope in self.scope_list:
            if name in scope:
                return copy.deepcopy(scope[name])
        return None

    def update_var_info(self, name, info):
        assert len(self.scope_list) > 0
        for i in range(0, len(self.scope_list)):
            if name in self.scope_list[i]:
                self.scope_list[i][name] = copy.deepcopy(info)
                return
        assert False, "Unable to find {}".format(name)

    def push_scope(self):
        self.scope_list.insert(0, {})

    def pop_scope(self):
        assert len(self.scope_list) > 0
        self.scope_list.pop(0)


class Rosette_Stmt():
    def __init__(self, args, builtin_type):
        self.args
        self.builtin_type = builtin_type

    def to_str(self):
        return self.val

    def get_type_info(self):
        return self.builtin_type

    def set_type_info(self, builtin_type):
        self.builtin_type = builtin_type

    def dump(self):
        return "----------------\n{}\n----------------\n{}\n----------------\n".format(
            self.builtin_type.dump(), str(self.args))


def list_to_str(_list, delim):
    out = ""
    for l in _list:
        assert isinstance(l, Node)
        out += delim + l.to_str()
    return out


def get_typename(T):
    return type(T).__name__.lower()


class Node():
    def get_node_typename(self):
        return get_typename(self).lower()

    def get_type_info(self):
        return self.type_info

    def dump(self):
        return self.type_info.dump()


class Empty():
    def __init__(self, type_info):
        self.type_info = type_info

    def to_str(self):
        return ""


class Bitslice(Node):
    def __init__(self, bv, hi, lo, type_info):
        self.bv = bv
        self.hi = hi
        self.lo = lo
        self.type_info = type_info

    def get_var(self):
        return self.bv

    def to_str(self):
        assert isinstance(self.bv, Node)
        assert isinstance(self.hi, Node)
        assert isinstance(self.lo, Node)

        return print_rosette.print_bitslice(self.bv.to_str(), self.hi.to_str(),
                                            self.lo.to_str())


class Var(Node):
    def __init__(self, name, type_info):
        self.name = name
        self.type_info = type_info

    def get_var(self):
        return self

    def to_str(self):
        assert isinstance(self.name, str)
        return print_rosette.print_var(self.name)


class Number(Node):
    def __init__(self, val, type_info):
        self.val = val
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.val, int) or isinstance(self.val, float)
        return print_rosette.print_number(str(self.val))


class Update(Node):
    def __init__(self, lhs, rhs, type_info):
        self.lhs = lhs
        self.rhs = rhs
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.lhs, Node)
        assert isinstance(self.rhs, Node)

        if self.lhs.get_type_info().sliced is True:
            assert (self.lhs.get_node_typename()
                    == "bitslice") or (self.lhs.get_node_typename()
                                       == "var"), "{} -> \n{}\n".format(
                                           self.lhs.get_node_typename(),
                                           self.lhs.get_type_info().dump())
            return print_rosette.print_sliced_update(self.lhs.to_str(),
                                                     self.rhs.to_str())
        else:
            assert self.lhs.get_node_typename(
            ) == "var", "Invalid typename: {}\n{}".format(
                self.lhs.get_node_typename(),
                self.lhs.get_type_info().dump())
            return print_rosette.print_update(self.lhs.to_str(),
                                              self.rhs.to_str())


class For(Node):
    def __init__(self, iterator, begin, end, body, incr, type_info):
        self.iterator = iterator
        self.begin = begin
        self.end = end
        self.body = body
        self.incr = incr
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.iterator, Node)
        assert isinstance(self.begin, Node)
        assert isinstance(self.end, Node)
        assert isinstance(self.body, list)
        assert isinstance(self.incr, Node)
        return print_rosette.print_for(self.iterator.to_str(),
                                       self.begin.to_str(), self.end.to_str(),
                                       self.incr.to_str(),
                                       list_to_str(self.body, " "))


class While(Node):
    def __init__(self, cond, body, type_info):
        self.cond = cond
        self.body = body
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.cond, Node)
        assert isinstance(self.body, list)
        return print_rosette.print_while(self.cond.to_str(),
                                         list_to_str(self.body, " "))


class Binaryexpr(Node):
    def __init__(self, op, a, b, type_info):
        self.op = op
        self.a = a
        self.b = b
        self.type_info = type_info

    def get_var(self):
        return self.a.get_var()

    def to_str(self):
        assert isinstance(self.op, str)
        assert isinstance(self.a, Node)
        assert isinstance(self.b, Node)
        if ((self.type_info.base_type == Base_Type.INT) or
            (self.type_info.base_type
             == Base_Type.ICONST)) and (self.type_info.vec is False):
            return print_rosette.print_int_binaryexpr(self.op, self.a.to_str(),
                                                      self.b.to_str())
        elif (self.type_info.base_type == Base_Type.FP):
            return print_rosette.print_fp_binaryexpr(self.op, self.a.to_str(),
                                                     self.b.to_str())
        else:
            return print_rosette.print_bv_binaryexpr(self.op, self.a.to_str(),
                                                     self.b.to_str(),
                                                     self.type_info.signed)


class Unaryexpr(Node):
    def __init__(self, op, a, type_info):
        self.op = op
        self.a = a
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.op, str)
        assert isinstance(self.a, Node)

        if ((self.type_info.base_type == Base_Type.INT) or
            (self.type_info.base_type
             == Base_Type.ICONST)) and (self.type_info.vec is False):
            return print_rosette.print_int_unaryexpr(self.op, self.a.to_str())
        elif (self.type_info.base_type == Base_Type.FP):
            return print_rosette.print_fp_unaryexpr(self.op, self.a.to_str())
        else:
            return print_rosette.print_bv_unaryexpr(self.op, self.a.to_str())


class If(Node):
    def __init__(self, cond, then, otherwise, type_info):
        self.cond = cond
        self.then = then
        self.otherwise = otherwise
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.cond, Node)
        assert isinstance(self.then, list)
        assert isinstance(self.otherwise, list)

        return print_rosette.print_if(self.cond.to_str(),
                                      list_to_str(self.then, " "),
                                      list_to_str(self.otherwise, " "))


class Call(Node):
    def __init__(self, func, args, type_info):
        self.func = func
        self.args = args
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.func, str)
        assert isinstance(self.args, list)

        return print_rosette.print_call(self.func, list_to_str(self.args, " "))


class Select(If):
    pass


class Case(Node):
    def __init__(self, val, stmts, type_info):
        self.val = val
        self.stmts = stmts
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.val, Node)
        assert isinstance(self.stmts, list)
        return print_rosette.print_case(self.val.to_str(),
                                        list_to_str(self.stmts, " "))


class Match(Node):
    def __init__(self, val, cases, type_info):
        self.val = val
        self.cases = cases
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.val, Node)
        assert isinstance(self.cases, list)

        return print_rosette.print_match(self.val.to_str(),
                                         list_to_str(self.cases, " "))


class Funcdef(Node):
    def __init__(self, name, params, body, type_info):
        self.name = name
        self.params = params
        self.body = body
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.name, str)
        assert isinstance(self.params, list)
        assert isinstance(self.body, list)

        return print_rosette.print_funcdef(self.name,
                                           list_to_str(self.params, " "),
                                           list_to_str(self.body, " "))


class Return(Node):
    def __init__(self, val, type_info):
        self.val = val
        self.type_info = type_info

    def to_str(self):
        assert isinstance(self.val, Node)

        return print_rosette.print_return(self.val.to_str())


def ensure_list(possible_list):
    if not isinstance(possible_list, list):
        possible_list = [possible_list]
    return possible_list


class Builder():
    def __init__(self, init_func_list, init_var_list, converter):
        self.converter = converter
        self.scope = Scope()
        self.stmts = []
        self.scope.push_scope()

        for func in init_func_list:
            self.scope.add_func_info(func.name, func)

        for var in init_var_list:
            self.scope.add_var_info(var.name, var)

    def build_empty(self):
        return Empty(builtin_types.Builtin_Type_Empty("EMPTY"))

    def build_bitslice(self, bv, hi, lo):
        bv = self.converter.cvt(bv)
        hi = self.converter.cvt(hi)
        lo = self.converter.cvt(lo)

        bv_t = self.scope.get_var_info(bv.get_var().name)
        if bv_t is None:
            bv_t = bv.get_type_info()
            self.scope.add_var_info(bv.get_var().name, bv_t)
        assert bv_t is not None
        assert not bv_t.fp_pure()

        bv_t.vec = True
        self.scope.update_var_info(bv.get_var().name, bv_t)

        bv_t.sliced = True
        vprint("Bitslice({}):\n{}\nvs\n{}\n".format(len(self.scope.scope_list),
                                                    bv_t.dump(),
                                                    bv.get_type_info().dump()))

        return Bitslice(bv, hi, lo, bv_t)

    def build_typed_var(self, name, builtin_t):
        return Var(name, builtin_t)

    def build_new_var(self, name):
        builtin_t = builtin_types.Builtin_Type_Empty(name)
        self.scope.add_var_info(name, builtin_t)
        return Var(name, builtin_t)

    def build_var(self, name):
        builtin_t = self.scope.get_var_info(name)
        if builtin_t is None:
            return self.build_new_var(name)
        return self.build_typed_var(name, builtin_t)

    def build_number(self, val):
        return Number(val, builtin_types.Builtin_Type_ICONST(val))

    def build_update(self, lhs, rhs):
        lhs = self.converter.cvt(lhs)
        rhs = self.converter.cvt(rhs)

        assert lhs.get_node_typename() == "var" or lhs.get_node_typename(
        ) == "bitslice", "Invalid type for update"

        # Apply type info to updated side
        lhs_t = self.scope.get_var_info(lhs.get_var().name)
        if lhs_t is None:
            lhs_t = lhs.get_type_info()
            self.scope.add_var_info(lhs.get_var().name, lhs_t)

        assert lhs_t is not None
        if lhs_t.base_type == Base_Type.UNKNOWN:
            lhs_t.base_type = rhs.get_type_info().base_type
        if lhs_t.signed is None:
            lhs_t.signed = rhs.get_type_info().signed
        lhs_t.sliced = rhs.get_type_info().sliced

        vprint("Updating({})\nFrom:\n{}\n\nTo:\n{}\n".format(
            len(self.scope.scope_list), lhs_t.dump(),
            rhs.get_type_info().dump()))
        self.scope.update_var_info(lhs.get_var().name, lhs_t)
        vprint("Final:\n{}\n".format(
            self.scope.get_var_info(lhs.get_var().name).dump()))

        return Update(lhs, rhs, lhs_t)

    def build_for(self, iterator, begin, end, body, incr):
        body = ensure_list(body)

        iterator = self.build_typed_var(
            iterator, builtin_types.Builtin_Type_I32(iterator))
        begin = self.converter.cvt(begin)
        end = self.converter.cvt(end)
        body = self.converter.cvt_list(body)
        incr = self.converter.cvt(incr)

        # Last statement in for is the "return"
        return For(iterator, begin, end, body, incr,
                   body[len(body) - 1].get_type_info())

    def build_while(self, cond, body):
        body = ensure_list(body)

        cond = self.converter.cvt(cond)
        body = self.converter.cvt_list(body)

        # Last statement in for is the "return"
        return While(cond, body, body[len(body) - 1].get_type_info())

    def build_binaryexpr(self, op, a, b):
        assert isinstance(op, str)
        a = self.converter.cvt(a)
        b = self.converter.cvt(b)

        assert compatible(
            a.get_type_info(),
            b.get_type_info()), "Incompatiable nodes: \n{}\nvs\n{}\n".format(
                a.dump(), b.dump())

        return Binaryexpr(op, a, b, a.get_type_info())

    def build_unaryexpr(self, op, a):
        assert isinstance(op, str)

        a = self.converter.cvt(a)

        return Unaryexpr(op, a, a.get_type_info())

    def build_if(self, cond, then, otherwise):
        then = ensure_list(then)
        otherwise = ensure_list(otherwise)
        vprint("IF Statement\n")
        cond = self.converter.cvt(cond)
        then = self.converter.cvt_list(then)
        otherwise = self.converter.cvt_list(otherwise)

        then_t = then[len(then) - 1].get_type_info()
        otherwise_t = builtin_types.Builtin_Type_Empty("EMPTY")
        if len(otherwise) != 0:
            otherwise_t = otherwise[len(otherwise) - 1].get_type_info()

        # Return most generic type from possibilities
        return If(cond, then, otherwise, lct(then_t, otherwise_t))

    def build_call(self, func, args):
        assert isinstance(func, str)
        args = ensure_list(args)
        args = self.converter.cvt_list(args)

        ret_t = self.scope.get_func_info(func)
        if ret_t is None:
            self.scope.add_func_info(func,
                                     builtin_types.Builtin_Type_Empty(func))
            ret_t = self.scope.get_func_info(func)
        assert ret_t is not None, "Unknown func: {}".format(func)

        return Call(func, args, ret_t)

    def build_select(self, cond, then, otherwise):
        return self.build_if(cond, then, otherwise)

    def build_case(self, val, stmts):
        stmts = ensure_list(stmts)

        val = self.converter.cvt(val)
        stmts = self.converter.cvt_list(stmts)

        return Case(val, stmts, stmts[len(stmts) - 1].get_type_info())

    def build_match(self, val, cases):
        cases = ensure_list(cases)

        val = self.converter.cvt(val)
        cases = self.converter.cvt_list(cases)

        out_t = cases[0].get_type_info()
        for i in range(1, len(cases)):
            out_t = gct(out_t, cases[i].get_type_info())

        return Match(val, cases, out_t)

    def build_funcdef(self, name, params, body):
        assert self.scope.get_func_info(name) is None
        assert isinstance(name, str)
        body = ensure_list(body)

        self.scope.push_scope()

        params = self.converter.cvt_list(params)
        body = self.converter.cvt_list(body)
        ret_t = body[len(body) - 1].get_type_info()

        self.scope.add_func_info(name, ret_t)
        out = Funcdef(name, params, body, ret_t)
        self.scope.pop_scope()
        return out

    def build_return(self, val):
        val = self.converter.cvt(val)
        # In rosette this is really the last operation
        return Return(val, val.get_type_info())

    def build_lookup(self, obj, key):
        assert isinstance(key, str)

        obj = self.converter.cvt(obj)
        T = x86_types.str_to_type(key)
        T.name = make_tmp_name(obj.get_type_info().name)
        return self.build_typed_var(T.name, T)

    def build_index(self, obj, idx):
        obj = self.converter.cvt(obj)

        obj_t = obj.get_type_info()
        obj_t.vec = True
        obj_t.sliced = True
        self.scope.add_var_info(obj.get_var().name, obj_t)

        obj_size = obj_t.size

        lo = sema_ast.BinaryExpr("*", idx, sema_ast.Number(obj_size), 0)
        hi = sema_ast.BinaryExpr("+", lo, sema_ast.Number(obj_size - 1), 0)
        return Bitslice(obj, self.converter.cvt(hi), self.converter.cvt(lo),
                        obj_t)


class Converter():
    def __init__(self, init_func_list, init_var_list, func_name):
        self.func_name = func_name
        self.params = ""
        self.nodes = []

        for var in init_var_list:
            self.params += " " + var.name

        self.builder = Builder(init_func_list, init_var_list, self)

    def to_str(self):
        body = ""
        for node in self.nodes:
            body += node.to_str()

        return print_rosette.print_funcdef(self.func_name, self.params, body)

    def cvt_bitslice(self, bitslice):
        return self.builder.build_bitslice(bitslice.bv, bitslice.hi,
                                           bitslice.lo)

    def cvt_var(self, var):
        return self.builder.build_var(var.name)

    def cvt_number(self, number):
        return self.builder.build_number(number.val)

    def cvt_update(self, update):
        return self.builder.build_update(update.lhs, update.rhs)

    def cvt_opupdate(self, opupdate):
        return self.builder.build_opupdate(opupdate.op_name)

    def cvt_for(self, _for):
        assert isinstance(_for.inc, bool)
        incr = None
        if _for.inc:
            incr = sema_ast.Number(1)
        else:
            incr = sema_ast.Number(-1)
        return self.builder.build_for(_for.iterator, _for.begin, _for.end,
                                      _for.body, incr)

    def cvt_while(self, _while):
        return self.builder.build_while(_while.cond, _while.body)

    def cvt_if(self, _if):
        return self.builder.build_if(_if.cond, _if.then, _if.otherwise)

    def cvt_call(self, call):
        return self.builder.build_call(call.func, call.args)

    def cvt_binaryexpr(self, binaryexpr):
        return self.builder.build_binaryexpr(binaryexpr.op, binaryexpr.a,
                                             binaryexpr.b)

    def cvt_unaryexpr(self, unaryexpr):
        return self.builder.build_unaryexpr(unaryexpr.op, unaryexpr.a)

    def cvt_pseudoexpr(self, pseudoexpr):
        assert False, "not implemented"

    def cvt_pseudostmt(self, pseudostmt):
        assert False, "not implemented"

    def cvt_return(self, _return):
        return self.builder.build_return(_return.val)

    def cvt_select(self, select):
        return self.builder.build_select(select.cond, select.then,
                                         select.otherwise)

    def cvt_regsel(self, regsel):
        assert False, "not implemented"

    def cvt_match(self, match):
        return self.builder.build_match(match.val, match.cases)

    def cvt_case(self, case):
        return self.builder.build_case(case.val, case.stmts)

    def cvt_lookup(self, lookup):
        return self.builder.build_lookup(lookup.obj, lookup.key)

    def cvt_index(self, index):
        if get_typename(index.obj) == "lookup":
            return self.builder.build_index(index.obj, index.idx)
        else:
            return self.builder.build_bitslice(index.obj, index.idx, index.idx)

    def cvt_funcdef(self, funcdef):
        return self.builder.build_funcdef(funcdef.name, funcdef.params,
                                          funcdef.body)

    def cvt_break(self, _break):
        assert False, "not implemented"

    def cvt_empty(self, _break):
        return self.builder.build_empty()

    def cvt_list(self, node_list):
        assert isinstance(node_list, list)
        for i in range(0, len(node_list)):
            node_list[i] = self.cvt(node_list[i])
        return node_list

    def cvt(self, node):
        lookup_cvt_funcs = {
            "bitslice": self.cvt_bitslice,
            "var": self.cvt_var,
            "number": self.cvt_number,
            "update": self.cvt_update,
            "opupdate": self.cvt_opupdate,
            "for": self.cvt_for,
            "while": self.cvt_while,
            "if": self.cvt_if,
            "call": self.cvt_call,
            "binaryexpr": self.cvt_binaryexpr,
            "unaryexpr": self.cvt_unaryexpr,
            "pseudoexpr": self.cvt_pseudoexpr,
            "pseudostmt": self.cvt_pseudostmt,
            "return": self.cvt_return,
            "select": self.cvt_select,
            "regsel": self.cvt_regsel,
            "match": self.cvt_match,
            "case": self.cvt_case,
            "lookup": self.cvt_lookup,
            "index": self.cvt_index,
            "funcdef": self.cvt_funcdef,
            "break": self.cvt_break
        }
        node_typename = get_typename(node)
        vprint("{} -> {}".format(node, node_typename))
        assert node_typename in lookup_cvt_funcs, "Unknown type: {}".format(
            node_typename)

        cvt_func = lookup_cvt_funcs[node_typename]
        ret = cvt_func(node)
        assert ret is not None, node_typename
        return ret

    def cvt_spec(self, node):
        self.nodes.append(self.cvt(node))
