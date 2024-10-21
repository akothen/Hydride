

import ply.lex as lex
import ply.yacc as yacc
from .ARMAST import *

reserved = {
    'INSTRUCTIONS',
    'INSTRUCTION',
    'INSTRUCTIONENCODING',
    'INSTRUCTIONUNPREDICTABLEUNLESS',
    'LIST',
    'INSTRUCTIONFIELD',
    'EXPRLITBIN',
    'EXPRLITMASK',
    'EXPRLITNAT',
    'EXPRLITHEX',
    'EXPRVARREF',
    'EXPRSLICE',
    'EXPRINDEX',
    'EXPRUNOP',
    'EXPRBINOP',
    'EXPRCALL',
    'EXPRMEMBERBITS',
    'EXPRINSET',
    'EXPRUNKNOWN',
    'EXPRTUPLE',
    'EXPRIF',
    'EXPRMEMBER',
    'QUALIFIEDIDENTIFIER',
    'AARCH32',
    'AARCH64',
    'ANY',
    'JUST',
    'STMTVARSDECL',
    'STMTVARDECLINIT',
    'STMTCONSTDECL',
    'STMTASSIGN',
    'STMTCALL',
    'STMTASSERT',
    'STMTUNPREDICTABLE',
    'STMTIF',
    'STMTELSIF',
    'STMTCASE',
    'STMTFOR',
    'STMTWHILE',
    'STMTUNDEFINED',
    'STMTSEE',
    'TYPEREF',
    'TYPEFUN',
    'TYPEARRAY',
    'IXTYPERANGE',
    'SYMDECL',
    'LVALIGNORE',
    'LVALVARREF',
    'LVALMEMBER',
    'LVALARRAYINDEX',
    'LVALSLICEOF',
    'LVALTUPLE',
    'LVALMEMBERBITS',
    'LVALSLICE',
    'SLICESINGLE',
    'SLICERANGE',
    'TO',
    'CASEALTWHEN',
    'CASEALTOTHERWISE',
    'CASEPATTERNNAT',
    'CASEPATTERNBIN',
    'CASEPATTERNMASK',
    'CASEPATTERNIDENTIFIER',
    'STMTBLOCK',
    'NOTHING',
    'SETELEMENTSINGLE',
    'SET',
    'CONDITIONAL',
}
unOps = {
    r'"NOT"': 'UNOPNOT',
    r'"!"':   'UNOPNOT',
    r'"-"':   'UNOPNEG',
}
binOps = {
    r'"=="': 'BINOPEQ',
    r'"!="': 'BINOPNEQ',
    r'">"':  'BINOPGT',
    r'">="': 'BINOPGTEQ',
    r'">>"': 'BINOPSHIFTRIGHT',
    r'"<"':  'BINOPLT',
    r'"<="': 'BINOPLTEQ',
    r'"<<"': 'BINOPSHIFTLEFT',
    r'"\+"': 'BINOPADD',
    # r'"-"':  'BINOPSUB', use UNOPNEG
    r'"\*"': 'BINOPMUL',
    r'"/"':  'BINOPDIVIDE',
    r'"\^"': 'BINOPPOW',
    r'"&&"': 'BINOPLOGICALAND',
    r'"\|\|"': 'BINOPLOGICALOR',
    r'"OR"':  'BINOPBITWISEOR',
    r'"AND"': 'BINOPBITWISEAND',
    r'"EOR"': 'BINOPBITWISEXOR',
    r'"\+\+"': 'BINOPPLUSPLUS',
    r'"QUOT"': 'BINOPQUOT',
    r'"REM"': 'BINOPREM',
    r'"DIV"': 'BINOPDIV',
    r'"MOD"': 'BINOPMOD',
    r'":"': 'BINOPCONCAT',
}
punc = {
    r'\(': "LPAREN",
    r'\)': "RPAREN",
}
tokens = [
    'HEXNUMBER',
    'NUMBER',
    'SEEMESSAGE',
    'BITSTRING',
    'ID'
] + list(reserved) + ['UNOPNOT', 'UNOPNEG'] + list(binOps.values()) + list(punc.values())


def t_UNOPNOT(t):
    r'("NOT")|("\!")'
    return t


def t_UNOPNEG(t):
    r'"\-"'
    return t


for k, v in binOps.items():
    locals()['t_'+v] = k
for k, v in punc.items():
    locals()['t_'+v] = k

Parser = None


def t_HEXNUMBER(t):
    r'\"0x[0-9A-F]+\"'
    t.value = t.value[1:-1]
    return t


def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t


def t_SEEMESSAGE(t):
    r'\"SEE.*\"'
    t.value = t.value[1:-1]
    return t


def t_BITSTRING(t):
    r'\'[01x ]+\''
    t.value = t.value[1:-1]
    return t


def t_ID(t):
    r'[a-zA-Z_#][a-zA-Z_0-9\.]*'
    lexed = t.value.upper()
    if lexed in reserved:
        t.type = lexed
        t.value = lexed
    if lexed in binOps:
        t.type = binOps[lexed]
        t.value = binOps[lexed]
    if lexed in unOps:
        t.type = unOps[lexed]
        t.value = unOps[lexed]
    return t


t_ignore = ' \t'


def t_newline(t):
    r'\n'
    t.lexer.lineno += 1


# def t_COMMENT(t):
#     r'//.*'


def t_error(t):
    print(t.lexer.lineno)
    assert False



def p_archqualifier(p):
    '''archqualifier : AARCH32
                     | AARCH64
                     | ANY
                     '''
    p[0] = p[1]


def p_qid(p):
    '''qid : LPAREN QUALIFIEDIDENTIFIER archqualifier ID RPAREN'''
    p[0] = QualifiedIdentifier(p[3], p[4])


def p_indextype(p):
    '''indextype : LPAREN IXTYPERANGE expr expr RPAREN'''
    p[0] = IxTypeRange(p[3], p[4])


def p_type(p):
    '''type : LPAREN TYPEREF   qid RPAREN
            | LPAREN TYPEFUN   ID expr RPAREN
            | LPAREN TYPEARRAY type indextype RPAREN
            '''
    if p[2] == "TYPEREF":
        p[0] = TypeRef(p[3])
    elif p[2] == "TYPEFUN":
        p[0] = TypeFun(p[3], p[4])
    elif p[2] == "TYPEARRAY":
        p[0] = TypeArray(p[3], p[4])


def p_symdecl(p):
    '''symdecl : LPAREN SYMDECL ID type RPAREN'''
    p[0] = SymbolDecl(p[3], p[4])


def p_ids(p):
    '''ids : ID
           | ids ID
           '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_slice(p):
    '''slice : LPAREN SLICESINGLE expr RPAREN
             | LPAREN SLICERANGE expr expr RPAREN
             '''
    if p[2] == "SLICESINGLE":
        p[0] = SliceSingle(p[3])
    elif p[2] == "SLICERANGE":
        p[0] = SliceRange(p[3], p[4])


def p_slices(p):
    '''slices : slice
              | slices slice
              '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_lvalexpr(p):
    '''lvalexpr : LPAREN LVALIGNORE RPAREN
                | LPAREN LVALVARREF qid RPAREN
                | LPAREN LVALMEMBER lvalexpr ID RPAREN
                | LPAREN LVALARRAYINDEX lvalexpr LPAREN LIST slices RPAREN RPAREN
                | LPAREN LVALARRAYINDEX lvalexpr LPAREN LIST RPAREN RPAREN
                | LPAREN LVALSLICEOF lvalexpr LPAREN LIST slices RPAREN RPAREN
                | LPAREN LVALSLICEOF lvalexpr LPAREN LIST RPAREN RPAREN
                | LPAREN LVALTUPLE LPAREN LIST lvalexprs RPAREN RPAREN
                | LPAREN LVALTUPLE LPAREN LIST RPAREN RPAREN
                | LPAREN LVALMEMBERBITS lvalexpr LPAREN LIST ids RPAREN RPAREN
                | LPAREN LVALMEMBERBITS lvalexpr LPAREN LIST RPAREN RPAREN
                | LPAREN LVALSLICE LPAREN LIST lvalexprs RPAREN RPAREN
                | LPAREN LVALSLICE LPAREN LIST RPAREN RPAREN
                '''
    if p[2] == "LVALIGNORE":
        p[0] = LValIgnore()
    elif p[2] == "LVALVARREF":
        p[0] = LValVarRef(p[3])
    elif p[2] == "LVALMEMBER":
        p[0] = LValMember(p[3], p[4])
    elif p[2] == "LVALARRAYINDEX" and len(p) == 9:
        p[0] = LValArrayIndex(p[3], p[6])
    elif p[2] == "LVALARRAYINDEX" and len(p) == 8:
        p[0] = LValArrayIndex(p[3], [])
    elif p[2] == "LVALSLICEOF" and len(p) == 9:
        p[0] = LValSliceOf(p[3], p[6])
    elif p[2] == "LVALSLICEOF" and len(p) == 8:
        p[0] = LValSliceOf(p[3], [])
    elif p[2] == "LVALTUPLE" and len(p) == 8:
        p[0] = LValTuple(p[5])
    elif p[2] == "LVALTUPLE" and len(p) == 7:
        p[0] = LValTuple([])
    elif p[2] == "LVALMEMBERBITS" and len(p) == 9:
        p[0] = LValMemberBits(p[3], p[6])
    elif p[2] == "LVALMEMBERBITS" and len(p) == 8:
        p[0] = LValMemberBits(p[3], [])
    elif p[2] == "LVALSLICE" and len(p) == 8:
        p[0] = LValSlice(p[5])
    elif p[2] == "LVALSLICE" and len(p) == 7:
        p[0] = LValSlice([])


def p_lvalexprs(p):
    '''lvalexprs : lvalexpr
                 | lvalexprs lvalexpr
                 '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_casepattern(p):
    '''casepattern : LPAREN CASEPATTERNBIN BITSTRING RPAREN
                   | LPAREN CASEPATTERNNAT NUMBER RPAREN
                   | LPAREN CASEPATTERNMASK BITSTRING RPAREN
                   | LPAREN CASEPATTERNIDENTIFIER ID RPAREN
                   '''
    if p[2] == "CASEPATTERNBIN":
        p[0] = CasePatternBin(p[3])
    elif p[2] == "CASEPATTERNNAT":
        p[0] = CasePatternInt(p[3])
    elif p[2] == "CASEPATTERNMASK":
        p[0] = CasePatternMask(p[3])
    elif p[2] == "CASEPATTERNIDENTIFIER":
        p[0] = CasePatternIdentifier(p[3])


def p_casepatterns(p):
    '''casepatterns : casepattern
                    | casepatterns casepattern
                    '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_casealternative(p):
    '''casealternative : LPAREN CASEALTWHEN LPAREN LIST casepatterns RPAREN maybeexpr stmtblock RPAREN
                       | LPAREN CASEALTWHEN LPAREN LIST RPAREN maybeexpr stmtblock RPAREN
                       | LPAREN CASEALTOTHERWISE stmtblock RPAREN
                       '''
    if p[2] == "CASEALTWHEN" and len(p) == 10:
        p[0] = CaseWhen(p[5], p[7], p[8])
    elif p[2] == "CASEALTWHEN" and len(p) == 9:
        p[0] = CaseWhen([], p[6], p[7])
    elif p[2] == "CASEALTOTHERWISE":
        p[0] = CaseOtherwise(p[3])


def p_casealternatives(p):
    '''casealternatives : casealternative
                        | casealternatives casealternative
                        '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_elseif(p):
    '''elseif : LPAREN STMTELSIF expr stmtblock RPAREN'''
    p[0] = StmtIfCase(p[3], p[4])


def p_elseifs(p):
    '''elseifs : elseif
               | elseifs elseif
               '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_stmt(p):
    '''stmt : LPAREN STMTVARSDECL LPAREN LIST ids RPAREN type RPAREN
            | LPAREN STMTVARSDECL LPAREN LIST RPAREN type RPAREN
            | LPAREN STMTVARDECLINIT symdecl expr RPAREN
            | LPAREN STMTCONSTDECL symdecl expr RPAREN
            | LPAREN STMTASSIGN lvalexpr expr RPAREN
            | LPAREN STMTCALL qid LPAREN LIST exprs RPAREN RPAREN
            | LPAREN STMTCALL qid LPAREN LIST RPAREN RPAREN
            | LPAREN STMTASSERT expr RPAREN
            | LPAREN STMTUNPREDICTABLE RPAREN
            | LPAREN STMTIF expr stmtblock LPAREN LIST elseifs RPAREN maybestmtblock RPAREN
            | LPAREN STMTIF expr stmtblock LPAREN LIST RPAREN maybestmtblock RPAREN
            | LPAREN STMTCASE expr LPAREN LIST casealternatives RPAREN RPAREN
            | LPAREN STMTCASE expr LPAREN LIST RPAREN RPAREN
            | LPAREN STMTFOR ID expr TO expr stmtblock RPAREN
            | LPAREN STMTWHILE expr stmtblock RPAREN
            | LPAREN STMTUNDEFINED RPAREN
            | LPAREN STMTSEE SEEMESSAGE RPAREN
            '''
    if p[2] == "STMTVARSDECL" and len(p) == 9:
        p[0] = StmtVarsDecl(p[5], p[7])
    elif p[2] == "STMTVARSDECL" and len(p) == 8:
        p[0] = StmtVarsDecl([], p[6])
    elif p[2] == "STMTVARDECLINIT":
        p[0] = StmtVarDeclInit(p[3], p[4])
    elif p[2] == "STMTCONSTDECL":
        p[0] = StmtConstDecl(p[3], p[4])
    elif p[2] == "STMTASSIGN":
        p[0] = StmtAssign(p[3], p[4])
    elif p[2] == "STMTCALL" and len(p) == 9:
        p[0] = StmtCall(p[3], p[6])
    elif p[2] == "STMTCALL" and len(p) == 8:
        p[0] = StmtCall(p[3], [])
    elif p[2] == "STMTASSERT":
        p[0] = StmtAssert(p[3])
    elif p[2] == "STMTUNPREDICTABLE":
        p[0] = StmtUnpredictable()
    elif p[2] == "STMTIF" and len(p) == 11:
        p[0] = StmtIf([StmtIfCase(p[3], p[4])] + p[7], p[9])
    elif p[2] == "STMTIF" and len(p) == 10:
        p[0] = StmtIf([StmtIfCase(p[3], p[4])], p[8])
    elif p[2] == "STMTCASE" and len(p) == 9:
        p[0] = StmtCase(p[3], p[6])
    elif p[2] == "STMTCASE" and len(p) == 8:
        p[0] = StmtCase(p[3], [])
    elif p[2] == "STMTFOR":
        p[0] = StmtFor(p[3], p[4], p[6], p[7])
    elif p[2] == "STMTWHILE":
        p[0] = StmtWhile(p[3], p[4])
    elif p[2] == "STMTUNDEFINED":
        p[0] = StmtUndefined()
    elif p[2] == "STMTSEE":
        p[0] = StmtSeeString(p[3])


def p_stmts(p):
    '''stmts : stmt
             | stmts stmt
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_stmtblock(p):
    '''stmtblock : LPAREN STMTBLOCK LPAREN LIST stmts RPAREN RPAREN
                 | LPAREN STMTBLOCK LPAREN LIST RPAREN RPAREN
                 '''
    if len(p) == 8:
        p[0] = p[5]
    else:
        p[0] = []

# The stmts should be maybestmtblock and with ancestor StmtBlock


def p_maybestmtblock(p):
    '''maybestmtblock : LPAREN JUST stmtblock RPAREN
                      | NOTHING
                      '''
    if p[1] == "NOTHING":
        p[0] = Nothing()
    else:
        p[0] = p[3]


def p_unop(p):
    '''unop : UNOPNOT
            | UNOPNEG
            '''
    p[0] = p[1]


def p_binop(p):
    '''binop : BINOPEQ
             | BINOPNEQ
             | BINOPGT
             | BINOPGTEQ
             | BINOPSHIFTRIGHT
             | BINOPLT
             | BINOPLTEQ
             | BINOPSHIFTLEFT
             | BINOPADD
             | UNOPNEG
             | BINOPMUL
             | BINOPDIVIDE
             | BINOPPOW
             | BINOPLOGICALAND
             | BINOPLOGICALOR
             | BINOPBITWISEOR
             | BINOPBITWISEAND
             | BINOPBITWISEXOR
             | BINOPPLUSPLUS
             | BINOPQUOT
             | BINOPREM
             | BINOPDIV
             | BINOPMOD
             | BINOPCONCAT
             '''
    if p[1] == "UNOPNEG":
        p[1] = "BINOPSUB"
    p[0] = p[1]


def p_setelement(p):
    '''setelement : LPAREN SETELEMENTSINGLE expr RPAREN'''
    p[0] = SetEltSingle(p[3])


def p_setelements(p):
    '''setelements : setelement
                   | setelements setelement
                   '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_expr(p):
    '''expr : LPAREN EXPRLITBIN BITSTRING RPAREN
            | LPAREN EXPRLITMASK BITSTRING RPAREN
            | LPAREN EXPRLITNAT NUMBER RPAREN
            | LPAREN EXPRLITHEX HEXNUMBER RPAREN
            | LPAREN EXPRVARREF qid RPAREN
            | LPAREN EXPRSLICE expr LPAREN LIST slices RPAREN RPAREN
            | LPAREN EXPRSLICE expr LPAREN LIST RPAREN RPAREN
            | LPAREN EXPRINDEX expr LPAREN LIST slices RPAREN RPAREN
            | LPAREN EXPRINDEX expr LPAREN LIST RPAREN RPAREN
            | LPAREN EXPRUNOP unop expr RPAREN
            | LPAREN EXPRBINOP binop expr expr RPAREN
            | LPAREN EXPRCALL qid LPAREN LIST exprs RPAREN RPAREN
            | LPAREN EXPRCALL qid LPAREN LIST RPAREN RPAREN
            | LPAREN EXPRMEMBERBITS expr LPAREN LIST ids RPAREN RPAREN
            | LPAREN EXPRMEMBERBITS expr LPAREN LIST RPAREN RPAREN
            | LPAREN EXPRINSET expr LPAREN SET LPAREN LIST setelements RPAREN RPAREN RPAREN
            | LPAREN EXPRINSET expr LPAREN SET LPAREN LIST RPAREN RPAREN RPAREN
            | LPAREN EXPRUNKNOWN type RPAREN
            | LPAREN EXPRTUPLE LPAREN LIST exprs RPAREN RPAREN
            | LPAREN EXPRTUPLE LPAREN LIST RPAREN RPAREN
            | LPAREN EXPRIF expr expr LPAREN LIST RPAREN expr RPAREN
            | LPAREN EXPRMEMBER expr ID RPAREN
            '''
    if p[2] == "EXPRLITBIN":
        p[0] = ExprLitBin(p[3])
    elif p[2] == "EXPRLITMASK":
        p[0] = ExprLitMask(p[3])
    elif p[2] == "EXPRLITNAT":
        p[0] = ExprLitInt(p[3])
    elif p[2] == "EXPRLITHEX":
        p[0] = ExprLitInt(int(p[3], 0))
    elif p[2] == "EXPRVARREF":
        p[0] = ExprVarRef(p[3])
    elif p[2] == "EXPRSLICE" and len(p) == 9:
        p[0] = ExprSlice(p[3], p[6])
    elif p[2] == "EXPRSLICE" and len(p) == 8:
        p[0] = ExprSlice(p[3], [])
    elif p[2] == "EXPRINDEX" and len(p) == 9:
        p[0] = ExprIndex(p[3], p[6])
    elif p[2] == "EXPRINDEX" and len(p) == 8:
        p[0] = ExprIndex(p[3], [])
    elif p[2] == "EXPRUNOP":
        p[0] = ExprUnOp(p[3], p[4])
    elif p[2] == "EXPRBINOP":
        p[0] = ExprBinOp(p[3], p[4], p[5])
    elif p[2] == "EXPRCALL" and len(p) == 9:
        p[0] = ExprCall(p[3], p[6])
    elif p[2] == "EXPRCALL" and len(p) == 8:
        p[0] = ExprCall(p[3], [])
    elif p[2] == "EXPRMEMBERBITS" and len(p) == 9:
        p[0] = ExprMemberBits(p[3], p[6])
    elif p[2] == "EXPRMEMBERBITS" and len(p) == 8:
        p[0] = ExprMemberBits(p[3], [])
    elif p[2] == "EXPRINSET" and len(p) == 12:
        p[0] = ExprInSet(p[3], p[8])
    elif p[2] == "EXPRINSET" and len(p) == 11:
        p[0] = ExprInSet(p[3], [])
    elif p[2] == "EXPRUNKNOWN":
        p[0] = ExprUnknown(p[4])
    elif p[2] == "EXPRTUPLE" and len(p) == 8:
        p[0] = ExprTuple(p[5])
    elif p[2] == "EXPRTUPLE" and len(p) == 7:
        p[0] = ExprTuple([])
    elif p[2] == "EXPRIF":
        p[0] = ExprIf(p[3], p[4], p[8])
    elif p[2] == "EXPRMEMBER":
        p[0] = ExprMember(p[3], p[4])


def p_exprs(p):
    '''exprs : expr
             | exprs expr
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_maybeexpr(p):
    '''maybeexpr : LPAREN JUST expr RPAREN
                 | NOTHING
                 '''
    if p[1] == "NOTHING":
        p[0] = Nothing()
    else:
        p[0] = p[3]


def p_encfield(p):
    '''encfield : LPAREN INSTRUCTIONFIELD ID NUMBER NUMBER RPAREN'''
    p[0] = InstructionField(p[3], p[4], p[5])


def p_encfields(p):
    '''encfields : encfield
                 | encfields encfield
                 '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_instunpredictable(p):
    '''instunpredictable : LPAREN INSTRUCTIONUNPREDICTABLEUNLESS NUMBER BITSTRING RPAREN'''
    boolval = p[4] == '1'
    p = InstructionUnpredictable(p[3], boolval)


def p_instunpredictables(p):
    '''instunpredictables : instunpredictable
                          | instunpredictables instunpredictable
                          '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_instencoding(p):
    '''instencoding : LPAREN INSTRUCTIONENCODING ID ID LPAREN LIST encfields RPAREN BITSTRING maybeexpr LPAREN LIST RPAREN maybestmtblock RPAREN
                    | LPAREN INSTRUCTIONENCODING ID ID LPAREN LIST RPAREN BITSTRING maybeexpr LPAREN LIST RPAREN maybestmtblock RPAREN
                    | LPAREN INSTRUCTIONENCODING ID ID LPAREN LIST encfields RPAREN BITSTRING maybeexpr LPAREN LIST instunpredictables RPAREN maybestmtblock RPAREN
                    | LPAREN INSTRUCTIONENCODING ID ID LPAREN LIST RPAREN BITSTRING maybeexpr LPAREN LIST instunpredictables RPAREN maybestmtblock RPAREN
                    '''
    if len(p) == 16 and p[8] == ")":
        p[0] = InstructionEncoding(p[3], p[4], p[7], p[9], p[10], [], p[14])
    elif len(p) == 16:
        p[0] = InstructionEncoding(p[3], p[4], [], p[8], p[9], p[12], p[14])
    elif len(p) == 17:
        p[0] = InstructionEncoding(p[3], p[4], p[7], p[9], p[10], p[13], p[15])
    elif len(p) == 15:
        p[0] = InstructionEncoding(p[3], p[4], [], p[8], p[9], [], p[13])


def p_instencodings(p):
    '''instencodings : instencoding
                     | instencodings instencoding
                     '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_inst(p):
    '''inst : LPAREN INSTRUCTION ID LPAREN LIST instencodings RPAREN maybestmtblock maybestmtblock LPAREN CONDITIONAL ID RPAREN RPAREN'''
    if p[12] == 'False':
        p[0] = Instruction(p[3], p[6], p[8], p[9], False)
    if p[12] == 'True':
        p[0] = Instruction(p[3], p[6], p[8], p[9], True)


def p_insts(p):
    '''insts : inst
             | insts inst
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_program(p):
    '''program : LPAREN INSTRUCTIONS insts RPAREN'''
    p[0] = p[3]


def preprocess_data():
    with open('text.original') as f:
        data = f.read()
    with open('text', 'w') as f:
        f.write(data)


def get_parser(start='program'):
    lexer = lex.lex()
    Parser = yacc.yacc(start=start)
    return Parser


if __name__ == "__main__":
    if False:
        data = "if HaveMTE2Ext() then\n    SetTagCheckedInstruction(tag_checked);\n\nCheckFPAdvSIMDEnabled64();\n\nbits(64) address;\nbits(64) offs;\nbits(128) rval;\nbits(esize) element;\nconstant integer ebytes = esize DIV 8;\n\nif n == 31 then\n    CheckSPAlignment();\n    address = SP[];\nelse\n    address = X[n];\n\noffs = Zeros();\nif replicate then\n    // load and replicate to all elements\n    for s = 0 to selem-1\n        element = Mem[address + offs, ebytes, AccType_VEC];\n        // replicate to fill 128- or 64-bit register\n        V[t] = Replicate(element, datasize DIV esize);\n        offs = offs + ebytes;\n        t = (t + 1) MOD 32;\nelse\n    // load/store one element per register\n    for s = 0 to selem-1\n        rval = V[t];\n        if memop == MemOp_LOAD then\n            // insert into one lane of 128-bit register\n            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];\n            V[t] = rval;\n        else // memop == MemOp_STORE\n            // extract from one lane of 128-bit register\n            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];\n        offs = offs + ebytes;\n        t = (t + 1) MOD 32;\n\nif wback then\n    if m != 31 then\n        offs = X[m];\n    if n == 31 then\n        SP[] = address + offs;\n    else\n        X[n] = address + offs;"
        lexer = lex.lex()
        lexer.input(data)
        while True:
            tok = lexer.token()
            if not tok:
                break
            print(tok)
    else:
        filename = 'arm_instrs.sexpr'
        # filename = 'simple.sexpr'
        # filename = 'parser_tests/stmtif2.sexpr'
        # filename = 'parser_tests/binminus.sexpr'
        with open(filename) as f:
            data = f.read()

    lexer = lex.lex()
    Parser = yacc.yacc(start='program')
    Parser.parse(data)
    # print(Parser.parse(data))
