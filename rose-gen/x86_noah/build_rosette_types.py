import copy
import builtin_types
from builtin_types import Base_Type
import x86_types
import print_rosette
import sema_ast
from vprint import vprint, vvprint


class VarNamer():
    def __init__(self):
        self.names = {}

    def get_name(self, base_name):
        if base_name not in self.names:
            self.add_name(base_name)
        return self.names[base_name][0]

    def add_name(self, base_name):
        self.names[base_name] = [base_name, 0]

    def update_name(self, base_name):
        if base_name not in self.names:
            return
        prev_pair = self.names[base_name]
        new_pair = [base_name + str(prev_pair[1]), prev_pair[1] + 1]
        self.names[base_name] = new_pair


in_appliable = 0
tmp_count = 0
var_namer = VarNamer()


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
    if a.bit_based() and b.bit_based():
        return True
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


class Var_Info():
    def __init__(self, name, type_info):
        self.name = name
        self.type_info = copy.deepcopy(type_info)
        self.def_count = 0

    def new_name(self):
        out = self.cur_name()
        self.def_count += 1
        return out

    def cur_name(self):
        return "{}-{}".format(self.name, self.def_count)


class Scope():
    def __init__(self):
        self.funcs = {}
        self.scope_list = []

        self.cur_funcs = []
        self.cur_func = None

        self.func_scope = {}

    def add_func_info(self, func, ret_t):
        self.funcs[func] = copy.deepcopy(ret_t)

    def get_func_info(self, func):
        if func in self.funcs:
            return copy.deepcopy(self.funcs[func])
        return None

    def add_var_info(self, name, info):
        vvprint("New Var({}): {} ({})".format(self.cur_func, name,
                                              info.dump()))
        assert self.cur_func is not None
        assert len(self.scope_list) > 0
        self.scope_list[0][name] = copy.deepcopy(info)
        self.func_scope[self.cur_func][name] = copy.deepcopy(info)

    def get_var_info(self, name):
        assert len(self.scope_list) > 0
        for scope in self.scope_list:
            if name in scope:
                return copy.deepcopy(scope[name])
        return None

    def get_var_or_func_info(self, name):
        assert len(self.scope_list) > 0
        ret = self.get_func_info(name)
        if ret is not None:
            return ret
        ret = self.get_var_info(name)
        return ret

    def update_var_info(self, name, info):
        assert len(self.scope_list) > 0
        for i in range(0, len(self.scope_list)):
            if name in self.scope_list[i]:
                self.scope_list[i][name] = copy.deepcopy(info)
                self.func_scope[self.cur_func][name] = copy.deepcopy(info)
                return
        assert False, "Unable to find {}".format(name)

    def push_scope(self, func):
        self.scope_list.insert(0, {})
        assert func not in self.func_scope

        self.func_scope[func] = {}
        self.cur_funcs.append(func)
        self.cur_func = func

    def pop_scope(self):
        assert len(self.scope_list) > 0
        self.scope_list.pop(0)
        self.cur_funcs.pop()
        self.cur_func = self.cur_funcs[0]

    def func_iter(self):
        all_funcs = []
        for func in self.funcs:
            all_funcs.append(Var_Info(func, self.funcs[func]))
        return all_funcs

    def var_iter(self):
        all_vars = []
        for i in range(0, len(self.scope_list)):
            for name in self.scope_list[i]:
                all_vars.append(Var_Info(name, self.scope_list[i][name]))
        return all_vars

    def func_var_iter(self, func):
        all_func_vars = []

        for name in self.func_scope[func]:
            all_func_vars.append(Var_Info(name, self.func_scope[func][name]))
        return all_func_vars

    def dump(self):
        for func in self.funcs:
            print("FuncDef: {} -> {}".format(func, self.funcs[func].dump()))

        for i in range(0, len(self.scope_list)):
            for name in self.scope_list[i]:
                print("Var: {} -> {}".format(name,
                                             self.scope_list[i][name].dump()))


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
        fmt_out = "----------------\n"
        fmt_out += "{}\n----------------\n"
        fmt_out += "{}\n----------------\n"
        return fmt_out.format(self.builtin_type.dump(), str(self.args))


def list_to_str(_list, delim):
    out = ""
    for l in _list:
        assert isinstance(l, Node)
        out += delim + l.to_str()
    return out


def any_list_to_str(_list, delim):
    assert isinstance(_list, list)
    if len(_list) == 0:
        return ""
    elif isinstance(_list[0], Node):
        return list_to_str(_list, delim)
    elif isinstance(_list[0], str):
        return delim.join(_list)
    else:
        assert False, _list[0].__name__


def get_typename(T):
    return type(T).__name__.lower()


class Node():
    def get_node_typename(self):
        return get_typename(self).lower()

    def get_type_info(self):
        return self.type_info

    def dump(self):
        return self.type_info.dump()


class Empty(Node):
    def __init__(self, type_info):
        self.type_info = type_info

    def returnable(self):
        return False

    def to_str(self):
        return ""


class Bitslice(Node):
    def __init__(self, bv, hi, lo, type_info):
        self.bv = bv
        self.hi = hi
        self.lo = lo
        self.type_info = type_info

    def returnable(self):
        return True

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

    def returnable(self):
        return True

    def update(self):
        var_namer.update_name(self.name)

    def to_str(self):
        assert isinstance(self.name, str)
        return print_rosette.print_var(var_namer.get_name(self.name))


class Number(Node):
    def __init__(self, val, type_info):
        self.val = val
        self.type_info = type_info

    def returnable(self):
        return True

    def to_str(self):
        assert isinstance(self.val, int) or isinstance(self.val, float)
        if self.type_info.sliced:
            #            _call = Call("max", [new_Number(8), self.type_info.sliced_sz],
            #                         builtin_types.Builtin_Type_I32(""))

            return print_rosette.print_const_bv(
                str(self.val), self.type_info.sliced_sz.to_str())
        elif self.type_info.bit_based():
            return print_rosette.print_const_bv(str(self.val),
                                                self.type_info.get_size)
        else:
            return print_rosette.print_number(str(self.val))


def new_Number(v):
    v = int(v)
    return Number(v, builtin_types.Builtin_Type_ICONST(v))


class Define(Node):
    def __init__(self, var, type_info):
        self.var = var
        self.type_info = type_info

    def returnable(self):
        return False

    def to_str(self):
        assert isinstance(self.var, Var)
        return print_rosette.print_new_bv_define(self.var.to_str(),
                                                 self.type_info.get_size())


class MultiSlice(Node):
    def __init__(self, lhs, slices):
        self.lhs = lhs
        self.slices = slices

    def returnable(self):
        return True

    def to_str(self):
        assert isinstance(self.lhs, Var)
        assert isinstance(self.slices, list)

        return print_rosette.print_concat_update(self.lhs.to_str(),
                                                 list_to_str(self.slices, " "))


class Update(Node):
    def __init__(self, lhs, rhs, type_info):
        self.lhs = lhs
        self.rhs = rhs
        self.type_info = type_info

    def returnable(self):
        return False

    def get_var(self):
        return self.lhs.get_var()

    def update_lhs_var(self):
        return self.lhs.get_var().update()

    def to_str(self):
        assert isinstance(self.lhs, Node)
        assert isinstance(self.rhs, Node)

        global in_appliable

        if self.lhs.get_type_info().sliced is True:
            assert (self.lhs.get_node_typename()
                    == "bitslice") or (self.lhs.get_node_typename()
                                       == "var"), "{} -> \n{}\n".format(
                                           self.lhs.get_node_typename(),
                                           self.lhs.get_type_info().dump())

            update_list = []
            need_if = False
            rhs_s = ""
            lo = Empty(None)
            hi = Empty(None)
            empty_cnt = 2
            if in_appliable != 0:
                return self.rhs.to_str()

            elif isinstance(self.lhs, Var):
                update_list = [self.lhs, self.rhs]
            else:
                if isinstance(self.lhs.lo, Number):
                    if self.lhs.lo.val != 0:
                        lo = Bitslice(self.lhs.bv,
                                      new_Number(self.lhs.lo.val - 1),
                                      new_Number(0), self.type_info)
                        empty_cnt -= 1

                else:
                    need_if = True
                    lo = Bitslice(
                        self.lhs.bv,
                        Binaryexpr("-", self.lhs.lo,
                                   new_Number(1), self.lhs.lo.type_info),
                        new_Number(0), self.type_info)
                    empty_cnt -= 1

                if isinstance(self.lhs.hi, Number):
                    if self.lhs.hi.val != self.type_info.get_size() - 1:
                        hi = Bitslice(
                            self.lhs.bv,
                            new_Number(self.type_info.get_size() - 1),
                            new_Number(self.lhs.hi.val + 1), self.type_info)
                        empty_cnt -= 1
                else:
                    need_if = True
                    hi = Bitslice(
                        self.lhs.bv, new_Number(self.type_info.get_size() - 1),
                        Binaryexpr("+", self.lhs.hi, new_Number(1),
                                   self.lhs.hi.type_info), self.type_info)
                    empty_cnt -= 1

                update_list = [hi, self.rhs, lo]
            if need_if:
                rhs_s = Bitslice(
                    If(
                        Binaryexpr("==", self.lhs.lo, new_Number(0),
                                   self.lhs.lo.type_info),
                        [MultiSlice(self.lhs.get_var(), [hi, self.rhs])],
                        [MultiSlice(self.lhs.get_var(), [hi, self.rhs, lo])],
                        self.lhs.type_info),
                    new_Number(self.type_info.get_size() - 1), new_Number(0),
                    self.type_info).to_str()

                rhs_s = print_rosette.print_sliced_update(rhs_s)

                if in_appliable != 0:
                    return rhs_s
            else:
                if len(update_list) - empty_cnt != 1:
                    rhs_s = print_rosette.print_sliced_update(
                        list_to_str(update_list, " "))
                    if in_appliable != 0:
                        return rhs_s

                else:
                    rhs_s = list_to_str(update_list, " ")

            self.update_lhs_var()
            lhs_s = self.get_var().to_str()
            return print_rosette.print_update(lhs_s, rhs_s)
        else:
            assert (self.lhs.get_node_typename() == "var"
                    ), "Invalid typename: {}\n{}".format(
                        self.lhs.get_node_typename(),
                        self.lhs.get_type_info().dump())

            rhs_s = self.rhs.to_str()
            self.update_lhs_var()
            lhs_s = self.lhs.to_str()
            return print_rosette.print_update(lhs_s, rhs_s)


class For(Node):
    def __init__(self, iterator, begin, end, body, incr, type_info):
        self.iterator = iterator
        self.begin = begin
        self.end = end
        self.body = body
        self.incr = incr
        self.type_info = type_info

    def returnable(self):
        return True

    def to_str(self):
        assert isinstance(self.iterator, Node)
        assert isinstance(self.begin, Node)
        assert isinstance(self.end, Node)
        assert isinstance(self.body, list)
        assert isinstance(self.incr, Node)
        global in_appliable
        in_appliable += 1
        out = print_rosette.print_for(self.iterator.to_str(),
                                      self.begin.to_str(), self.end.to_str(),
                                      self.incr.to_str(),
                                      list_to_str(self.body, " "))
        in_appliable -= 1
        if isinstance(self.body[len(self.body) - 1], Update):
            self.body[len(self.body) - 1].update_lhs_var()
            return print_rosette.print_update(
                self.body[len(self.body) - 1].get_var().to_str(), out)
        return out


class While(Node):
    def __init__(self, cond, body, type_info):
        self.cond = cond
        self.body = body
        self.type_info = type_info

    def returnable(self):
        return True

    def to_str(self):
        assert isinstance(self.cond, Node)
        assert isinstance(self.body, list)
        return print_rosette.print_while(self.cond.to_str(),
                                         list_to_str(self.body, " "))


class BV_Expand(Node):
    def __init__(self, expr, type_info):
        self.expr = expr
        self.type_info = type_info

    def returnable(self):
        return True

    def get_var(self):
        return self.expr.get_var()

    def to_str(self):
        if not (self.expr.type_info.bit_based()
                and self.type_info.bit_based()):

            return self.expr.to_str()
        missing_sz = self.type_info.get_size()
        if self.expr.type_info.get_size() < missing_sz:
            if self.expr.type_info.sliced:
                missing_sz = Binaryexpr(
                    "-", new_Number(missing_sz), self.expr.type_info.sliced_sz,
                    builtin_types.Builtin_Type_I32(self.type_info.name +
                                                   "-adjust_size"))
            else:
                missing_sz = new_Number(missing_sz -
                                        self.expr.type_info.get_size())
            return print_rosette.print_bv_expand(missing_sz.to_str(),
                                                 self.expr.to_str())
        else:
            return self.expr.to_str()


class Binaryexpr(Node):
    def __init__(self, op, a, b, type_info):
        self.op = op
        self.a = a
        self.b = b
        self.type_info = type_info

    def returnable(self):
        return True

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
            _a = BV_Expand(self.a, self.type_info)
            _b = BV_Expand(self.b, self.type_info)
            return print_rosette.print_bv_binaryexpr(self.op, _a.to_str(),
                                                     _b.to_str(),
                                                     self.type_info.signed)


class Unaryexpr(Node):
    def __init__(self, op, a, type_info):
        self.op = op
        self.a = a
        self.type_info = type_info

    def returnable(self):
        return True

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

    def returnable(self):
        return True

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

        self.name = func

    def returnable(self):
        return True

    def get_var(self):
        return self

    def to_str(self):
        assert isinstance(self.func, str)
        assert isinstance(self.args, list)

        return print_rosette.print_call(self.func, list_to_str(self.args, " "))


class Select(If):
    pass


class Case(Node):
    def __init__(self, val, stmts, type_info):
        self.cond_val = None
        self.val = val
        self.stmts = stmts
        self.type_info = type_info

    def returnable(self):
        return True

    def is_update(self):
        return isinstance(self.stmts[len(self.stmts) - 1], Update)

    def update_lhs_var(self):
        assert self.is_update()
        self.stmts[len(self.stmts) - 1].update_lhs_var()

    def get_var(self):
        assert self.is_update()
        return self.stmts[len(self.stmts) - 1].get_var()

    def to_str(self):
        assert self.cond_val is not None
        assert isinstance(self.cond_val, Node)
        assert isinstance(self.val, Node)
        assert isinstance(self.stmts, list)

        cond = Binaryexpr("==", self.cond_val, self.val,
                          self.cond_val.get_type_info())
        return print_rosette.print_case(cond.to_str(),
                                        list_to_str(self.stmts, " "))


class Match(Node):
    def __init__(self, val, cases, type_info):
        self.val = val
        self.cases = cases
        self.type_info = type_info

    def returnable(self):
        return True

    def to_str(self):
        assert isinstance(self.val, Node)
        assert isinstance(self.cases, list)
        global in_appliable
        in_appliable += 1
        out = print_rosette.print_match(self.val.to_str(),
                                        list_to_str(self.cases, " "))
        in_appliable -= 1

        if self.cases[len(self.cases) - 1].is_update():
            self.cases[len(self.cases) - 1].update_lhs_var()
            return print_rosette.print_update(
                self.cases[len(self.cases) - 1].get_var().to_str(), out)
        return out


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
        assert self.val.returnable()
        return print_rosette.print_return(self.val.to_str())


def ensure_list(possible_list):
    if not isinstance(possible_list, list):
        possible_list = [possible_list]
    return possible_list


class Func_Info():
    def __init__(self, mangled_name, initializers):
        self.mangled_name = mangled_name
        self.initializers = initializers


class Builder():
    def __init__(self, UID, init_func_list, init_var_list, converter):
        self.UID = UID
        self.converter = converter
        self.scope = Scope()
        self.stmts = []

        self.init_params = []

        self.internal_funcs = {}

        for func in init_func_list:
            self.scope.add_func_info(func.name, func)

        self.scope.push_scope(UID)
        for var in init_var_list:
            self.init_params.append(self.build_typed_var(var.name, var))

    def do_nothing(arg):
        return arg

    def internal_func(self, name, params):
        mangled_name = "{}{}".format(name, self.UID)
        initializers = []
        for p in params:
            initializers.append(self.do_nothing)

        assert name not in self.internal_funcs

        self.internal_funcs[name] = Func_Info(mangled_name, initializers)
        return mangled_name

    def func_name(self, name):
        if name in self.internal_funcs:
            return self.internal_funcs[name].mangled_name
        return name

    def internal_func_init(self, params, initializers):
        for i in range(0, len(params)):
            params[i] = initializers[i](params)

    def func_init(self, name, params):
        if name in self.internal_funcs:
            return self.internal_func_init(
                params, self.internal_func[name].initializers)
        return params

    def build_empty(self):
        return Empty(builtin_types.Builtin_Type_Empty("EMPTY"))

    def build_bitslice(self, bv, hi, lo):
        bv = self.converter.cvt(bv)
        hi = self.converter.cvt(hi)
        lo = self.converter.cvt(lo)
        vvprint("Bitslice: ({})".format(bv.get_var().name))
        bv_t = self.scope.get_var_info(bv.get_var().name)
        if bv_t is None:
            bv_t = bv.get_type_info()
            self.scope.add_var_info(bv.get_var().name, bv_t)
        assert bv_t is not None
        assert not bv_t.fp_pure()

        if bv_t.inner_T is None:
            tmp = copy.deepcopy(bv_t)
            tmp.name = tmp.name + "-inner"
            bv_t.inner_T = tmp

        bv_t.vec = True
        bv_t.base_type = Base_Type.VEC_OF
        bv_t.sliced = True
        bv_t.sliced_sz = Binaryexpr(
            "+",
            Binaryexpr("-", hi, lo,
                       builtin_types.Builtin_Type_I32(bv_t.name +
                                                      "-slice_sz")),
            new_Number(1),
            builtin_types.Builtin_Type_I32(bv_t.name + "-slice_sz"))

        self.scope.update_var_info(bv.get_var().name, bv_t)

        vvprint("Bitslice({}):\n{}\nvs\n{}\n".format(
            len(self.scope.scope_list), bv_t.dump(),
            bv.get_type_info().dump()))
        assert bv_t.sliced
        return Bitslice(bv, hi, lo, bv_t)

    def build_typed_var(self, name, builtin_t):
        self.scope.add_var_info(name, builtin_t)
        return Var(name, builtin_t)

    def build_new_var(self, name):
        builtin_t = builtin_types.Builtin_Type_Empty(name)
        return self.build_typed_var(name, builtin_t)

    def build_var(self, name):
        builtin_t = self.scope.get_var_info(name)
        if builtin_t is None:
            return self.build_new_var(name)
        builtin_t.valid_T()
        return self.build_typed_var(name, builtin_t)

    def build_number(self, val):
        return Number(val, builtin_types.Builtin_Type_ICONST(val))

    def build_update(self, lhs, rhs):
        lhs = self.converter.cvt(lhs)
        rhs = self.converter.cvt(rhs)
        if isinstance(rhs, Number):
            if isinstance(lhs, Bitslice):
                if isinstance(lhs.hi, Var):
                    if lhs.hi.name == "MAX":
                        if isinstance(lhs.lo, Number):
                            return Empty(None)

        assert lhs.get_node_typename() == "var" or lhs.get_node_typename(
        ) == "bitslice", "Invalid type for update"

        # Apply type info to updated side

        lhs_t = self.scope.get_var_info(lhs.get_var().name)
        if lhs_t is None:
            vvprint("Unknown: {}".format(lhs.get_var().name))
            lhs_t = rhs.get_type_info()
            self.scope.add_var_info(lhs.get_var().name, lhs_t)
        assert lhs_t is not None

        do_rest = False
        if lhs_t.base_type == Base_Type.UNKNOWN:
            do_rest = True
            lhs_t.base_type = rhs.get_type_info().base_type
        if do_rest or lhs_t.signed is None:
            do_rest = True
            lhs_t.signed = rhs.get_type_info().signed
        if do_rest or lhs_t.vec is None:
            do_rest = True
            lhs_t.vec = rhs.get_type_info().vec
            lhs_t.base_type = rhs.get_type_info().base_type
        if do_rest or lhs_t.get_size() is None or lhs_t.get_size() <= 0:
            do_rest = True
            lhs_t.set_size(rhs.get_type_info())
        if do_rest:
            lhs_t.inner_T = copy.deepcopy(rhs.get_type_info().inner_T)

        lhs_t.sliced = rhs.get_type_info().sliced
        lhs_t.sliced_sz = copy.deepcopy(rhs.get_type_info().sliced_sz)

        lhs_t.valid_T()
        rhs.get_type_info().valid_T()
        vvprint("Updating({})\nFrom:\n{}\n\nTo:\n{}\n".format(
            len(self.scope.scope_list), lhs_t.dump(),
            rhs.get_type_info().dump()))
        self.scope.update_var_info(lhs.get_var().name, lhs_t)
        vvprint("Final:\n{}\n".format(
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

        # x86 spec loops are inclusive. Rosette ranges are not
        end_incl = Binaryexpr("+", end, incr, end.get_type_info())

        # Last statement in for is the "return"
        out = For(iterator, begin, end_incl, body, incr,
                  body[len(body) - 1].get_type_info())

        return out

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
        if isinstance(a, Number) is not isinstance(b, Number):
            if isinstance(a, Number):
                a.type_info = copy.deepcopy(b.type_info)
            else:
                b.type_info = copy.deepcopy(a.type_info)

        bv_t = copy.deepcopy(a.get_type_info())

        if a.get_type_info().bit_based() and b.get_type_info().bit_based():
            if b.get_type_info().get_size() > a.get_type_info().get_size():
                bv_t.set_size(b.get_type_info())

        assert compatible(
            a.get_type_info(),
            b.get_type_info()), "Incompatiable nodes: \n{}\nvs\n{}\n".format(
                a.dump(), b.dump())

        return Binaryexpr(op, a, b, bv_t)

    def build_unaryexpr(self, op, a):
        assert isinstance(op, str)

        a = self.converter.cvt(a)

        return Unaryexpr(op, a, a.get_type_info())

    def build_if(self, cond, then, otherwise):
        then = ensure_list(then)
        otherwise = ensure_list(otherwise)
        vvprint("IF Statement\n")
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

        internal_func_name = self.func_name(func)

        vvprint("Building Call: {}({})".format(func, str(args)))
        ret_t = self.scope.get_func_info(internal_func_name)
        if ret_t is None or ret_t.base_type == Base_Type.UNKNOWN:
            ret_t = self.scope.get_var_or_func_info(args[0].get_var().name)
            vvprint("Ret Unknown ({}) -> [{}]".format(internal_func_name,
                                                      args[0].get_var().name))
            self.scope.add_func_info(internal_func_name, ret_t)
            vvprint("New Ret: [{} -> {}]".format(func, ret_t.dump()))


#            ret_t = self.scope.get_func_info(func)
        assert ret_t is not None, "Unknown func: {}".format(func)

        return Call(internal_func_name, args, ret_t)

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

        out_t = None

        for i in range(0, len(cases)):
            if i == 0:
                out_t = cases[0].get_type_info()
            else:
                out_t = gct(out_t, cases[i].get_type_info())

            cases[i].cond_val = copy.deepcopy(val)
            if isinstance(cases[i].val, Number):
                cases[i].val.type_info = copy.deepcopy(val.type_info)

        return Match(val, cases, out_t)

    def build_funcdef(self, name, params, body):
        internal_func_name = self.internal_func(name, params)

        assert self.scope.get_func_info(internal_func_name) is None
        assert isinstance(name, str)

        body = ensure_list(body)

        self.scope.push_scope(internal_func_name)

        params = self.converter.cvt_list(params)
        for i in range(0, len(params)):
            params[i] = params[i].get_var()

        body = self.converter.cvt_list(body)
        ret_t = body[len(body) - 1].get_type_info()

        self.scope.add_func_info(name, ret_t)
        out = Funcdef(internal_func_name, params, body, ret_t)

        self.scope.pop_scope()
        return out

    def build_return(self, val):
        val = self.converter.cvt(val)
        # In rosette this is really the last operation
        return Return(val, val.get_type_info())

    def build_lookup(self, obj, key):
        assert isinstance(key, str)
        obj = self.converter.cvt(obj)
        obj.get_type_info().valid_T()
        
        T = x86_types.str_to_type(key)
        T.name = make_tmp_name(obj.get_type_info().name)
        return self.build_typed_var(T.name, T)

    def build_index(self, obj, idx):
        obj = self.converter.cvt(obj)
        vvprint("Build_Index!")
        obj_t = obj.get_type_info()
        obj_t.valid_T()
        if obj_t.inner_T is None:
            tmp = copy.deepcopy(obj_t)
            tmp.name = obj_t.name + "-inner"
            tmp.vec = False
            obj_t.inner_T = tmp

        obj_t.inner_T.valid_T()
        obj_t.base_type = Base_Type.VEC_OF
        obj_t.vec = True
        obj_t.sliced = True
        if obj_t.inner_T.sliced:
            obj_t.sliced_sz = copy.deepcopy(obj_t.inner_T.sliced_sz)
        else:
            obj_t.sliced_sz = new_Number(obj_t.inner_T.get_size())
        self.scope.add_var_info(obj.get_var().name, obj_t)

        obj_size = obj_t.inner_T.get_size()

        ret_t = obj_t.inner_T
        ret_t.sliced = True
        ret_t.sliced_sz = new_Number(obj_size)
        ret_t.valid_T()
        obj_t.valid_T()
        lo = sema_ast.BinaryExpr("*", idx, sema_ast.Number(obj_size), 0)
        hi = sema_ast.BinaryExpr("+", lo, sema_ast.Number(obj_size - 1), 0)
        return Bitslice(obj, self.converter.cvt(hi), self.converter.cvt(lo),
                        ret_t)


class Converter():
    def __init__(self, init_func_list, init_var_list, func_name):
        self.func_name = func_name
        self.main = []
        self.funcs = []

        self.builder = Builder(self.func_name, init_func_list, init_var_list,
                               self)
        self.params = self.builder.init_params

    def func_find_forward_declares(self, func_name, func_params):
        func_params_matcher = {}
        for param in func_params:
            func_params_matcher[param.name] = True

        forward_declares = {}
        for var in self.builder.scope.func_var_iter(func_name):
            vprint("{} -> {} [{}]({})".format(func_name, var.name, var.name
                                              in func_params_matcher,
                                              func_params_matcher))
            if var.name in func_params_matcher:
                continue
            if not (var.type_info.sliced or var.type_info.vec
                    or var.type_info.is_unknown()):
                continue

            vprint("\tAdding")
            forward_declares[var.name] = Define(Var(var.name, var.type_info),
                                                var.type_info)
        out = []
        for key in forward_declares:
            out.append(forward_declares[key])
        return out

    def func_to_str(self, func_name, func_params, nodes):
        global var_namer
        var_namer = VarNamer()

        forward_declares = self.func_find_forward_declares(
            func_name, func_params)
        params = list_to_str(func_params, " ")
        body = list_to_str(forward_declares, " ")
        body += list_to_str(nodes, " ")
        return print_rosette.print_funcdef(func_name, params, body)

    def to_str(self):
        out = print_rosette.print_provide(self.func_name,
                                          list_to_str(self.params, " "))
        out = ""
        for func in self.funcs:
            out += self.func_to_str(func.name, func.params, func.body)
        out += self.func_to_str(self.func_name, self.params, self.main)
        return out

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
        vvprint("{} -> {}".format(node, node_typename))
        assert node_typename in lookup_cvt_funcs, "Unknown type: {}".format(
            node_typename)

        cvt_func = lookup_cvt_funcs[node_typename]
        ret = cvt_func(node)
        assert ret is not None, node_typename
        return ret

    def cvt_spec(self, node):
        node_typename = get_typename(node)
        if node_typename == "funcdef":
            self.funcs.append(self.cvt(node))
        else:
            self.main.append(self.cvt(node))
