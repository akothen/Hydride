from collections import namedtuple


# Infrastructure
QualifiedIdentifier = namedtuple('QualifiedIdentifier', ['archQualifier', 'id'])
ArchQualifier = namedtuple('ArchQualifier', ['id'])
SymbolDecl = namedtuple('SymbolDecl', ['id', 'ty'])
Nothing = namedtuple('Nothing', [])

# Instructions
Instruction = namedtuple('Instruction', ['instName', 'instEncodings', 'instPostDecode', 'instExecute', 'instConditional'])
InstructionEncoding = namedtuple('InstructionEncoding', ['encName', 'encInstrSet', 'encFields', 'encOpcodeMask', 'encGuard', 'encUnpredictable', 'encDecode'])
InstructionField = namedtuple('InstructionField', ['instFieldName', 'instFieldBegin', 'instFieldOffset'])
InstructionUnpredictable = namedtuple('InstructionUnpredictable', ['integer', 'boolval'])

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
TypeOf = namedtuple('TypeOf', ['expr']) # unused
TypeReg = namedtuple('TypeReg', ['integer', 'regfields']) # unused
TypeArray = namedtuple('TypeArray', ['ty', 'indexty'])
TypeTuple = namedtuple('TypeTuple', ['tys']) # unused
IxTypeRange = namedtuple('IxTypeRange', ['expr0', 'expr1'])
IxTypeRef = namedtuple('IxTypeRef', ['id']) # unused
RegField = namedtuple('RegField', ['id', 'slices'])

# Statements
LValIgnore = namedtuple('LValIgnore', [])
LValVarRef = namedtuple('LValVarRef', ['qid'])
LValMember = namedtuple('LValMember', ['lvalexpr', 'id'])
LValMemberArray = namedtuple('LValMemberArray', ['lvalexpr', 'ids']) # unused
LValArrayIndex = namedtuple('LValArrayIndex', ['lvalexpr', 'slices'])
LValSliceOf = namedtuple('LValSliceOf', ['lvalexpr', 'slices'])
LValArray = namedtuple('LValArray', ['lvalexprs']) # unused
LValTuple = namedtuple('LValTuple', ['lvalexprs'])
LValMemberBits = namedtuple('LValMemberBits', ['lvalexpr', 'ids'])
LValSlice = namedtuple('LValSlice', ['lvalexprs'])

StmtVarsDecl = namedtuple('StmtVarsDecl', ['ids', 'ty'])
StmtVarDeclInit = namedtuple('StmtVarDeclInit', ['symboldecl', 'expr'])
StmtConstDecl = namedtuple('StmtConstDecl', ['symboldecl', 'expr'])
StmtAssign = namedtuple('StmtAssign', ['lvalexpr', 'expr'])
StmtCall = namedtuple('StmtCall', ['qid', 'exprs'])
StmtReturn = namedtuple('StmtReturn', ['maybe_expr']) # unused
StmtAssert = namedtuple('StmtAssert', ['expr'])
StmtUnpredictable = namedtuple('StmtUnpredictable', [])
StmtImpDef = namedtuple('StmtImpDef', ['text']) # unused
StmtIf = namedtuple('StmtIf', ['stmtifcases', 'maybe_stmts'])
StmtIfCase = namedtuple('StmtIfCase', ['expr', 'stmts']) # added to deal with StmtIf
StmtCase = namedtuple('StmtCase', ['expr', 'casealternatives'])
StmtFor = namedtuple('StmtFor', ['id', 'expr0', 'expr1', 'stmts'])
StmtWhile = namedtuple('StmtWhile', ['expr', 'stmts'])
StmtRepeat = namedtuple('StmtRepeat', ['stmts', 'expr']) # unused
StmtThrow = namedtuple('StmtThrow', ['id']) # unused
StmtUndefined = namedtuple('StmtUndefined', [])
StmtSeeExpr = namedtuple('StmtSeeExpr', ['expr']) # unused
StmtSeeString = namedtuple('StmtSeeString', ['text'])
StmtTry = namedtuple('StmtTry', ['stmts', 'id', 'catchalternative']) # unused
StmtDefEnum = namedtuple('StmtDefEnum', ['id', 'ids']) # unused

CaseWhen = namedtuple('CaseWhen', ['casepatterns', 'maybe_expr', 'stmts'])
CaseOtherwise = namedtuple('CaseOtherwise', ['stmts'])

CasePatternInt = namedtuple('CasePatternInt', ['integer'])
CasePatternBin = namedtuple('CasePatternBin', ['bitvector'])
CasePatternMask = namedtuple('CasePatternMask', ['mask'])
CasePatternIdentifier = namedtuple('CasePatternIdentifier', ['id'])
CasePatternIgnore = namedtuple('CasePatternIgnore', []) # unused
CasePatternTuple = namedtuple('CasePatternTuple', ['casepatterns']) # unused

CatchWhen = namedtuple('CatchWhen', ['expr', 'stmts'])
CatchOtherwise = namedtuple('CatchOtherwise', ['stmts'])

# Expressions
ExprLitString = namedtuple('ExprLitString', ['text']) # unused
ExprLitInt = namedtuple('ExprLitInt', ['integer'])
ExprLitReal = namedtuple('ExprLitReal', ['interger0', 'integer1']) # unused
ExprLitBin = namedtuple('ExprLitBin', ['bitvector'])
ExprLitMask = namedtuple('ExprLitMask', ['mask'])
ExprVarRef = namedtuple('ExprVarRef', ['qid'])
ExprImpDef = namedtuple('ExprImpDef', ['maybe_text', 'ty']) # unused
ExprSlice = namedtuple('ExprSlice', ['expr', 'slices'])
ExprIndex = namedtuple('ExprIndex', ['expr', 'slices'])
ExprUnOp = namedtuple('ExprUnOp', ['unop', 'expr'])
ExprBinOp = namedtuple('ExprBinOp', ['binop', 'lhs', 'rhs'])
ExprMembers = namedtuple('ExprMembers', ['expr', 'ids']) # unused
ExprInMask = namedtuple('ExprInMask', ['expr', 'mask']) # unused
ExprMemberBits = namedtuple('ExprMemberBits', ['expr', 'ids'])
ExprCall = namedtuple('ExprCall', ['qid', 'exprs'])
ExprInSet = namedtuple('ExprInSet', ['expr', 'setelements'])
ExprUnknown = namedtuple('ExprUnknown', ['ty'])
ExprTuple = namedtuple('ExprTuple', ['exprs'])
ExprIf = namedtuple('ExprIf', ['exprtest', 'exprresult', 'exprelse']) # TODO
ExprMember = namedtuple('ExprMember', ['expr', 'id'])

SetEltSingle = namedtuple('SetEltSingle', ['expr'])
SetEltRange = namedtuple('SetEltRange', ['expr0', 'expr1']) # unused

SliceSingle = namedtuple('SliceSingle', ['expr'])
SliceOffset = namedtuple('SliceOffset', ['expr0', 'expr1']) # unused
SliceRange = namedtuple('SliceRange', ['expr0', 'expr1'])
