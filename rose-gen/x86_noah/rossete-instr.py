class Expr():
    def __init__(self, op_type, operands, ctx):
        self.op_type = op_type
        self.operands = operands
        self.ctx = ctx


class Binary_Expr(Expr):
    def dump(self):
        print("TODO")


class Unary_Expr(Expr):
    def dump(self):
        print("TODO")


class Bitslice_Expr(Expr):
    def dump(self):
        print("TODO")

class Update(Expr):
    def dump(self):
        print("TODO")

class Cond():
    def __init__(self, expr, then, otherwise, ctx):
        self.expr = expr
        self.then = then
        self.otherwise = otherwise
        self.ctx = ctx

    
        


class For_Loop():
    def __init__(self, iterator, begin, end, body, inc, ctx):
        self.iterator = iterator
        self.begin = begin
        self.end = end
        self.body = body
        self.inc = inc
        self.ctx = ctx


class Var():
    def __init__(self, name, T, ctx):
        self.name = name
        self.T = T
        self.ctx = ctx


class Number():
    def __init__(self, val, T, ctx):
        self.val = val
        self.T = T
        self.ctx = ctx


class Update():
    def __init__(self, lhs, rhs):
        self.lhs = lhs
        self.rhs = rhs
