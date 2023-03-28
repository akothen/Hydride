from collections import namedtuple

# Instructions
Instruction = namedtuple('Instruction', ['instName', 'instEncodings', 'instPostDecode', 'instExecute', 'instConditional'])
InstructionEncoding = namedtuple('InstructionEncoding', ['encName', 'encInstrSet', 'encFields', 'encOpcodeMask', 'encGuard', 'encUnpredictable', 'encDecode'])
InstructionField = namedtuple('InstructionField', ['instFieldName', 'instFieldBegin', 'instFieldOffset'])

# Definitions
DefTypeBuiltin = namedtuple('DefTypeBuiltin', ['id'])
DefTypeAbstract = namedtuple('DefTypeAbstract', ['id'])
DefTypeAlias = namedtuple('DefTypeAlias', ['id', 'ty'])
DefTypeStruct = namedtuple('DefTypeStruct', ['qid', 'symboldecls'])
DefTypeEnum = namedtuple('DefTypeEnum', ['id', 'ids'])
DefConst = namedtuple('DefConst', ['id', 'ty', 'expr'])
DefArray = namedtuple('DefArray', ['id', 'ty', 'indexty'])
DefCallable = namedtuple('DefCallable', ['callableName', 'callableArgs', 'callableRets', 'callableStmts'])
DefGetter = namedtuple('DefGetter', ['qid', 'maybe_symboldecls', 'tys', 'stmts'])
DefSetter = namedtuple('DefSetter', ['qid', 'maybe_setterargs', 'symboldecl', 'stmts'])
SetterArg = namedtuple('SetterArg', ['symboldecl', 'boolval'])

# Types
TypeRef = namedtuple('TypeRef', ['qid'])
TypeFun = namedtuple('TypeFun', ['id', 'expr'])
TypeOf = namedtuple('TypeOf', ['expr'])
TypeReg = namedtuple('TypeReg', ['integer', 'regfields'])
TypeArray = namedtuple('TypeArray', ['ty', 'indexty'])
TypeTuple = namedtuple('TypeTuple', ['tys'])
IxTypeRange = namedtuple('IxTypeRange', ['expr0', 'expr1'])
IxTypeRef = namedtuple('IxTypeRef', ['id'])
RegField = namedtuple('RegField', ['id', 'slices'])

# Statements
LValIgnore = namedtuple('LValIgnore', [])
LValVarRef = namedtuple('LValVarRef', ['qid'])
LValMember = namedtuple('LValMember', ['lvalexpr', 'id'])
LValMemberArray = namedtuple('LValMemberArray', ['lvalexpr', 'ids'])
LValArrayIndex = namedtuple('LValArrayIndex', ['lvalexpr', 'slices'])
LValSliceOf = namedtuple('LValSliceOf', ['lvalexpr', 'slices'])
LValArray = namedtuple('LValArray', ['lvalexprs'])
LValTuple = namedtuple('LValTuple', ['lvalexprs'])
LValMemberBits = namedtuple('LValMemberBits', ['lvalexpr', 'ids'])
LValSlice = namedtuple('LValSlice', ['lvalexprs'])

StmtVarsDecl = namedtuple('StmtVarsDecl', ['ty', 'ids'])
StmtVarDeclInit = namedtuple('StmtVarDeclInit', ['symboldecl', 'expr'])
StmtConstDecl = namedtuple('StmtConstDecl', ['symboldecl', 'expr'])
StmtAssign = namedtuple('StmtAssign', ['lvalexpr', 'expr'])
StmtCall = namedtuple('StmtCall', ['qid', 'exprs'])
StmtReturn = namedtuple('StmtReturn', ['maybe_expr'])
StmtAssert = namedtuple('StmtAssert', ['expr'])
StmtUnpredictable = namedtuple('StmtUnpredictable', [])
StmtImpDef = namedtuple('StmtImpDef', ['text'])
StmtIf = namedtuple('StmtIf', ['exprandstmtslist', 'maybe_stmts'])
ExprAndStmts = namedtuple('ExprAndStmts', ['expr', 'stmts']) # added
StmtFor = namedtuple('StmtFor', ['id', 'expr0', 'expr1', 'stmts'])
StmtWhile = namedtuple('StmtWhile', ['expr', 'stmts'])
StmtRepeat = namedtuple('StmtRepeat', ['stmts', 'expr'])
StmtThrow = namedtuple('StmtThrow', ['id'])
StmtUndefined = namedtuple('StmtUndefined', [])
StmtSeeExpr = namedtuple('StmtSeeExpr', ['expr'])
StmtSeeString = namedtuple('StmtSeeString', ['text'])
StmtTry = namedtuple('StmtTry', ['stmts', 'id', ])
StmtDefEnum = namedtuple('StmtDefEnum', ['id', 'ids'])

CaseWhen = namedtuple('CaseWhen', ['casepatterns', 'maybe_expr', 'stmts'])
CaseOtherwise = namedtuple('CaseOtherwise', ['stmts'])

CasePatternInt = namedtuple('CasePatternInt', ['integer'])
CasePatternBin = namedtuple('CasePatternBin', ['bitvector'])
CasePatternMask = namedtuple('CasePatternMask', ['mask'])
CasePatternIdentifier = namedtuple('CasePatternIdentifier', ['id'])
CasePatternIgnore = namedtuple('CasePatternIgnore', [])
CasePatternTuple = namedtuple('CasePatternTuple', ['casepatterns'])

CatchWhen = namedtuple('CatchWhen', ['expr', 'stmts'])
CatchOtherwise = namedtuple('CatchOtherwise', ['stmts'])

# Expressions
ExprLitString = namedtuple('ExprLitString', ['text'])
ExprLitInt = namedtuple('ExprLitInt', ['integer'])
ExprLitReal = namedtuple('ExprLitReal', ['interger0', 'integer1'])
ExprLitBin = namedtuple('ExprLitBin', ['bitvector'])
ExprLitMask = namedtuple('ExprLitMask', ['mask'])
ExprVarRef = namedtuple('ExprVarRef', ['qid'])
ExprImpDef = namedtuple('ExprImpDef', ['maybe_text', 'ty'])
ExprSlice = namedtuple('ExprSlice', ['expr', 'slices'])
ExprIndex = namedtuple('ExprIndex', ['expr', 'slices'])
ExprUnOp = namedtuple('ExprUnOp', ['unop', 'expr'])
ExprBinOp = namedtuple('ExprBinOp', ['binop', 'lhs', 'rhs'])
ExprMembers = namedtuple('ExprMembers', ['expr', 'ids'])
ExprInMask = namedtuple('ExprInMask', ['expr', 'mask'])
ExprMemberBits = namedtuple('ExprMemberBits', ['expr', 'ids'])
ExprCall = namedtuple('ExprCall', ['qid', 'exprs'])
ExprInSet = namedtuple('ExprInSet', ['expr', 'setelements'])
ExprUnknown = namedtuple('ExprUnknown', ['ty'])
ExprTuple = namedtuple('ExprTuple', ['exprs'])
ExprIf = namedtuple('ExprIf', []) # TODO
ExprMember = namedtuple('ExprMember', ['expr', 'id'])
# TODO: StmtSee


SetEltSingle = namedtuple('SetEltSingle', ['expr'])
SetEltRange = namedtuple('SetEltRange', ['expr0', 'expr1'])

SliceSingle = namedtuple('SliceSingle', ['expr'])
SliceOffset = namedtuple('SliceOffset', ['expr0', 'expr1'])
SliceRange = namedtuple('SliceRange', ['expr0', 'expr1'])
