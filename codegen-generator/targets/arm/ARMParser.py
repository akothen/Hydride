from ARMManualCorrectAST import ManualAST
from ARMReadableSemantics import map2Code
import pprint
from ARMASTPrinter import *
from ARMRoseTypes import *

from ARMTypes import *
import sys

import ply.lex as lex
import ply.yacc as yacc


class SimpleParser(object):
    # List of token names.   This is always required

    reserved_types = list([i.upper() for i in asl_type_bits.keys()])
    reserved = [
        'FOR', 'TO',
        'IF',
        'THEN',
        'ELSE',
        'CASE', 'OF', 'WHEN', 'DIV', 'AND', 'OR', 'BITS',  'EOR', 'MOD', 'UNDEFINED', 'OTHERWISE'
    ]
    tokens = [
        'CONSTANT',
        'IDENTIFIER',
        'STRING',
        'LEFT_OP',
        'RIGHT_OP',
        'LE_OP',
        'GE_OP',
        'EQ_OP',
        'NE_OP',
        'LAND_OP',
        'LOR_OP',
    ] + list(reserved)+reserved_types

    # Regular expression rules for simple tokens
    literals = "+-*/()[]{}=,.;?:<>!~"
    t_LEFT_OP = r"<<"
    t_RIGHT_OP = r">>"
    t_LE_OP = r"<="
    t_GE_OP = r">="
    t_EQ_OP = r"=="
    t_NE_OP = r"!="
    t_LAND_OP = r"&&"
    t_LOR_OP = r"\|\|"

    # A regular expression rule with some action code
    # Note addition of self parameter since we're in a class

    def new_id(self):
        self.id += 1
        return str(self.id)

    def t_STRING(self, t):
        r"\'([^\\\n]|(\\.))*?\'"
        t.value = t.value[1:-1]
        return t

    def t_CONSTANT(self, t):
        r'\d+'
        t.value = int(t.value)
        return t

    # Define a rule so we can track line numbers
    def t_newline(self, t):
        r'\n+'
        t.lexer.lineno += len(t.value)

    def t_IDENTIFIER(self, t):
        r'[a-zA-Z_][a-zA-Z_0-9.]*'
        # Check for reserved words
        if t.value in asl_type_bits:
            t.type = t.value.upper()
        elif t.value.upper() in self.reserved:
            t.type = t.value.upper()
        else:
            t.type = 'IDENTIFIER'

        return t

    # A string containing ignored characters (spaces and tabs)
    t_ignore = ' \t'

    # Error handling rule
    def t_error(self, t):
        assert False, "Illegal character '%s'" % t.value[0]
        # print("Illegal character '%s'" % t.value[0], file=sys.stderr)
        # t.lexer.skip(1)

    def p_primary_expression(self, p):
        '''primary_expression : IDENTIFIER 
        | CONSTANT
        | '(' expression ')' 
        '''
        if len(p) == 2:
            if type(p[1]) == int:
                p[0] = Number(p[1])
            else:
                p[0] = Var(p[1], self.new_id())
            # assert False, p[1]
        else:
            p[0] = p[2]

    def p_primary_expression_string(self, p):
        '''primary_expression : STRING
        '''
        p[0] = BitVec(p[1])

    def p_postfix_expression(self, p):
        '''postfix_expression : primary_expression
        | postfix_expression '[' ']'
        | postfix_expression '[' argument_expression_list ']'
        | postfix_expression '(' ')'
        | postfix_expression '(' argument_expression_list ')'
        '''
        if len(p) == 2:
            p[0] = p[1]
        elif len(p) == 4 and p[2] == '[':
            p[0] = ArrayIndex(p[1], [], self.new_id())
        elif p[2] == '[':
            if isinstance(p[1], Var):
                if p[1].name == "Elem":
                    assert len(p[3]) == 3
                    p[0] = ElemSlice(p[3][0], p[3][1], p[3][2], self.new_id())
                elif p[1].name in ["V", "X"]:
                    assert len(p[3]) == 1
                    p[0] = VReg(p[3][0], self.new_id())
                elif p[1].name == "Vpart":
                    assert len(p[3]) == 2
                    p[0] = VPartReg(p[3][0], p[3][1], self.new_id())
                else:
                    p[0] = ArrayIndex(p[1], p[3], self.new_id())
            else:
                p[0] = ArrayIndex(p[1], p[3], self.new_id())
        elif len(p) == 4 and p[2] == '(':
            p[0] = Call(p[1].name, [], self.new_id())
        elif len(p) == 5 and p[2] == '(':
            p[0] = Call(p[1].name, p[3], self.new_id())
        elif len(p) == 6:
            p[0] = ArrayIndex(p[1], SliceRange(
                p[5], p[3], self.new_id()), self.new_id())
        else:
            assert False

    def p_unary_expression(self, p):
        '''unary_expression : postfix_expression
        | '-' unary_expression
        | '!' unary_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = UnaryExpr(p[1], p[2], self.new_id())

    def p_argument_expression_list(self, p):
        '''argument_expression_list : expression
        | argument_expression_list ',' expression
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[3]]

    def p_binary_expression(self, p):
        '''multiplicative_expression : unary_expression
        | multiplicative_expression '*' unary_expression
        | multiplicative_expression DIV unary_expression
        | multiplicative_expression MOD unary_expression
        | multiplicative_expression ':' unary_expression
        additive_expression : multiplicative_expression
        | additive_expression '+' multiplicative_expression
        | additive_expression '-' multiplicative_expression
        shift_expression : additive_expression
        | shift_expression LEFT_OP additive_expression
        | shift_expression RIGHT_OP additive_expression
        relational_expression : shift_expression
        | relational_expression '<' shift_expression
        | relational_expression '>' shift_expression
        | relational_expression LE_OP shift_expression
        | relational_expression GE_OP shift_expression
        equality_expression : relational_expression
        | equality_expression EQ_OP relational_expression
        | equality_expression NE_OP relational_expression
        and_expression : equality_expression
        | and_expression AND equality_expression
        exclusive_or_expression : and_expression
        | exclusive_or_expression '^' and_expression
        inclusive_or_expression : exclusive_or_expression
        | inclusive_or_expression OR exclusive_or_expression
        | inclusive_or_expression EOR exclusive_or_expression
        logical_and_expression : inclusive_or_expression
        | logical_and_expression LAND_OP inclusive_or_expression
        logical_or_expression : logical_and_expression
        | logical_or_expression LOR_OP logical_and_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = BinaryExpr(p[2], p[1], p[3], self.new_id())

    def p_sliced_expression(self, p):
        '''sliced_expression : logical_or_expression
        | sliced_expression '~' logical_or_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = SliceRange(p[3], p[1], self.new_id())

    def p_conditional_expression(self, p):
        '''conditional_expression : sliced_expression
        | expression IF sliced_expression ELSE conditional_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = IfElseExpr(p[3], p[1], p[5], self.new_id())

    def p_expression(self, p):
        '''expression : conditional_expression
        | postfix_expression '=' conditional_expression
        '''
        if len(p) == 2:
            p[0] = p[1]
        else:
            p[0] = Update(p[1], p[3])

    def p_expression_statement(self, p):
        '''expression_statement : ';'
        | expression ';'
        '''
        if len(p) == 2:
            p[0] = None
        else:
            p[0] = p[1]

    def p_selection_statement(self, p):
        '''selection_statement : IF expression THEN statement
        | IF expression THEN statement ELSE statement
        | CASE expression OF statement
        '''
        if p[1] == 'case':
            p[0] = Match(p[2], p[4], self.new_id())
        elif len(p) == 7:
            p[0] = IfElseStmt(p[2], p[4], p[6], self.new_id())
        else:
            p[0] = IfStmt(p[2], p[4], self.new_id())

    def p_case_statement(self, p):
        '''case_statement : WHEN expression OF statement
        '''
        p[0] = Case(p[2], p[4], self.new_id())

    def p_case_statement_base(self, p):
        '''case_statement : OTHERWISE statement
        '''
        p[0] = CaseBase(p[2], self.new_id())

    def p_iteration_statement(self, p):
        '''iteration_statement : FOR IDENTIFIER '=' expression TO expression statement
        '''
        p[0] = For(Var(p[2], self.new_id()), p[4],
                   p[6], p[7], 1, self.new_id())

    def p_compound_statement(self, p):
        '''compound_statement : '{' '}'
        | '{' statement_list '}'
        '''
        if len(p) == 3:
            p[0] = []
        else:
            p[0] = p[2]

    def p_statement(self, p):
        '''statement : expression_statement
        | compound_statement
        | selection_statement
        | iteration_statement
        | case_statement
        | declaration
        | UNDEFINED
        '''
        if p[1] == 'UNDEFINED':
            p[0] = Undefined()
        else:
            p[0] = p[1]

    def p_statement_list(self, p):
        '''statement_list : statement
        | statement_list statement
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[2]]

    def p_declaration(self, p):
        '''declaration : declaration_specifiers init_declarator_list ';'
        '''
        # if isinstance(p[2][0], Update):
        #     p[0] = VarDeclInit(VarsDecl([p[2][0].lhs], p[1],
        #                        self.new_id()), p[2][0].rhs, self.new_id())
        # elif isinstance(p[2], List):

        p[0] = VarsDecl(p[2], p[1], self.new_id())
        # else:
        #     assert False, p[2]

    def p_declaration_specifiers(self, p):
        '''declaration_specifiers : BITS '(' expression ')'
        | BOOLEAN
        | INTEGER
        | BIT
        | COMPAREOP
        | COUNTOP
        | LOGICALOP
        | MEMOP
        | REDUCEOP
        | VBITOP
        '''
        if p[1] == 'bits':
            p[0] = ('bits', p[3])
        elif p[1] in asl_type_bits:
            p[0] = (p[1], Number(asl_type_bits[p[1]]))
        else:
            assert False, p[1]

    def p_init_declarator_list(self, p):
        '''init_declarator_list : init_declarator
        | init_declarator_list ',' init_declarator
        '''
        if len(p) == 2:
            p[0] = [p[1]]
        else:
            p[0] = p[1]+[p[3]]

    def p_init_declarator(self, p):
        '''init_declarator : IDENTIFIER
        | IDENTIFIER '=' expression'''
        if len(p) == 2:
            p[0] = VarDeclUndef(Var(p[1], self.new_id()), self.new_id())
        else:
            # p[0] = p[3]
            p[0] = VarDeclInit(Var(p[1], self.new_id()), p[3], self.new_id())

    # Error rule for syntax errors

    def p_error(self, p):
        # print("Syntax error in input!", p)
        assert False, p

    # Build the lexer
    def build(self, **kwargs):
        self.lexer = lex.lex(module=self, **kwargs)
        self.parser = yacc.yacc(
            module=self, start='statement', ** kwargs)
        self.id = 0

    # Test it output
    def test_lex(self, data):
        self.lexer.input(data)
        while True:
            tok = self.lexer.token()
            if not tok:
                break
            print(tok)

    def test_parse(self, data):
        result = self.parser.parse(data)
        print(result)

    def parse(self, data):
        return self.parser.parse(data)


def verify(s1: ASTNode, s2: ASTNode):
    assert type(s1) == type(s2), f"Unmatched type:\n {s1} \n ---- \n {s2}"
    if isinstance(s1, list):
        for i, j in zip(s1, s2):
            verify(i, j)
    elif isinstance(s1, tuple):
        for i, j in zip(s1, s2):
            verify(i, j)
    elif isinstance(s1, VarDeclInit):
        verify(s1.lhs, s2.lhs)
        verify(s1.rhs, s2.rhs)
    elif isinstance(s1, VarDeclUndef):
        verify(s1.lhs, s2.lhs)
    elif isinstance(s1, VarsDecl):
        verify(s1.basetype, s2.basetype)
        verify(s1.init_list, s2.init_list)
    elif isinstance(s1, For):
        verify(s1.iterator, s2.iterator)
        verify(s1.begin, s2.begin)
        verify(s1.end, s2.end)
        verify(s1.stmts, s2.stmts)
    elif isinstance(s1, Update):
        verify(s1.lhs, s2.lhs)
        verify(s1.rhs, s2.rhs)
    elif isinstance(s1, IfElseStmt):
        verify(s1.cond, s2.cond)
        verify(s1.then, s2.then)
        verify(s1.otherwise, s2.otherwise)
    elif isinstance(s1, IfElseExpr):
        verify(s1.cond, s2.cond)
        verify(s1.then, s2.then)
        verify(s1.otherwise, s2.otherwise)
    elif isinstance(s1, IfStmt):
        verify(s1.cond, s2.cond)
        verify(s1.then, s2.then)
    elif isinstance(s1, Match):
        verify(s1.val, s2.val)
        verify(s1.cases, s2.cases)
    elif isinstance(s1, Case):
        verify(s1.val, s2.val)
        verify(s1.body, s2.body)
    elif isinstance(s1, ArrayIndex):
        verify(s1.obj, s2.obj)
        verify(s1.slices, s2.slices)
    elif isinstance(s1, VReg):
        verify(s1.reg, s2.reg)
    elif isinstance(s1, VPartReg):
        verify(s1.reg, s2.reg)
        verify(s1.part, s2.part)
    elif isinstance(s1, ElemSlice):
        verify(s1.op, s2.op)
        verify(s1.cnt, s2.cnt)
        verify(s1.esize, s2.esize)
    elif isinstance(s1, SliceRange):
        verify(s1.lo, s2.lo)
        verify(s1.hi, s2.hi)
    elif isinstance(s1, Var):
        verify(s1.name, s2.name)
    elif isinstance(s1, Number):
        verify(s1.val, s2.val)
    elif isinstance(s1, BitVec):
        verify(s1.bv, s2.bv)
    elif isinstance(s1, BinaryExpr):
        verify(s1.op, s2.op)
        verify(s1.a, s2.a)
        verify(s1.b, s2.b)
    elif isinstance(s1, UnaryExpr):
        verify(s1.op, s2.op)
        verify(s1.a, s2.a)
    elif isinstance(s1, Call):
        verify(s1.funcname, s2.funcname)
        verify(s1.args, s2.args)
    elif isinstance(s1, Undefined):
        pass
    elif isinstance(s1, CaseBase):
        verify(s1.body, s2.body)
    else:
        assert s1 == s2, f's1 != s2 {s1} {s2}, {type(s1)}, {isinstance(s1, tuple)}'


def test():
    from ARMSemanticGen import SemaGenerator
    S = SemaGenerator(True)
    res = S.getResult()
    # ans = emitSema(res["vdot_s32"].spec)
    # for i in ans:
    #     print(i)
    for n, Semas in res.items():
        print(n)
        spec = Semas.spec
        data = "\n".join(emitSema(spec))
        # data = preprocess(data)
        p = SimpleParser()
        p.build()
        # print(data)
        # p.test_lex(data)
        # print(Semas.spec)
        # print(p.parse(data))
        new_spec = p.parse(data)
        # print(spec)
        # print(new_spec)
        verify(spec, new_spec)


def verify_against():
    # test()
    from asl.ARMParser import get_parser
    from asl.ARMAST import Instruction
    from ARMIntrinsicClassify import Intrinsics2Encodings
    print("loading...")
    with open(JSONDIR+"asl/arm_instrs.sexpr") as f:
        data = f.read()
    parser = get_parser()
    print("parsing...")
    Instrs: List[Instruction] = parser.parse(data)
    print("parse done...")

    encodingNames = set(Intrinsics2Encodings.values())
    oldMap2AST = {}
    for i in Instrs:
        for j in i.instEncodings:
            if j.encName in encodingNames:
                wholeCode = j.encDecode
                if type(j.encDecode) != asl.Nothing:
                    wholeCode += i.instPostDecode
                oldMap2AST[j.encName] = (
                    ASTShrink(i.instExecute), ASTShrink(wholeCode))
    assert len(map2AST) == len(encodingNames)
    print("map2AST done...")
    # newMap2Code = {}
    # global indentation
    # indentation = 12
    # for i, j in oldMap2AST.items():
    #     newMap2Code[i] = {"decode": "\n".join(emitSema(j[1])), "execute": "\n".join(
    #         emitSema(j[0])), }
    # with open("ARMReadableSemantics.py", "w") as f:
    #     f.write("map2Code = {\n")
    #     for i, j in newMap2Code.items():
    #         f.write(f'    "{i}":'+'{\n')
    #         for k, v in j.items():
    #             f.write(f'        "{k}": """{v}""",\n')
    #         f.write("    },\n")
    #     f.write("}\n")

    from ARMReadableSemantics import map2Code
    for i, j in map2Code.items():
        p = SimpleParser()
        p.build()
        execute = p.parse(j["execute"])
        p.build()
        decode = p.parse(j["decode"])
        verify(oldMap2AST[i][0], execute)
        verify(oldMap2AST[i][1], decode)


def verify_single(s: str):
    print(s)
    p = SimpleParser()
    p.build()
    ast = p.parse(s)
    print(ast)
    regen = "\n".join(emitSema(ast))
    p.build()
    print(regen)
    ast2 = p.parse(regen)
    verify(ast, ast2)


def verify2():
    for i, j in map2Code.items():
        using = ManualAST.get(i, j)
        verify_single(using["execute"])
        verify_single(using["decode"])


if __name__ == "__main__":
    # verify_against()
    verify2()


map2AST = {}
for i, j in map2Code.items():
    p = SimpleParser()
    using = ManualAST.get(i, j)
    # print(using["execute"])
    p.build()
    execute = p.parse(using["execute"])
    p.build()
    decode = p.parse(using["decode"])
    map2AST[i] = (execute, decode)
