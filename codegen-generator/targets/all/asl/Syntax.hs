module Language.ASL.Syntax where

import Data.Text(Text)

-- TODO: what is the real meaning of these Unknown bits?

-- Infrastructure ---------------------------------------------------

type Identifier = Text

data QualifiedIdentifier = QualifiedIdentifier ArchQualifier Identifier
  deriving(Show, Eq)

data ArchQualifier = ArchQualAArch32
                   | ArchQualAArch64
                   | ArchQualAny
  deriving(Show, Eq)

type SymbolDecl = (Identifier, Type)

data MaskBit = MaskBitSet | MaskBitUnset | MaskBitEither
    deriving(Show, Eq)

type BitVector = [Bool]
type Mask = [MaskBit]

-- System Registers -------------------------------------------------

data Register =
  Register { regName   :: Text
           , regLength :: Integer
           , regFields :: [RegisterField]
           }

data RegisterField =
  RegisterField { regFieldName :: Maybe Text
                , regFieldLo   :: Integer
                , regFieldHi   :: Integer
                }

data RegisterArray =
  RegisterArray { regIndexMin :: Integer
                , regIndexMax :: Integer
                , regDef      :: Register
                }

data RegisterDefinition =
    RegisterDefSingle Register
  | RegisterDefArray RegisterArray

-- Instructions -----------------------------------------------------

data Instruction =
  Instruction { instName        :: Text
              , instEncodings   :: [InstructionEncoding]
              , instPostDecode  :: [Stmt]
              , instExecute     :: [Stmt]
              , instConditional :: Bool
              }
  deriving(Show, Eq)

data InstructionSet = A32 | T32 | T16 | A64
  deriving(Show, Eq, Ord)

data InstructionEncoding =
  InstructionEncoding { encName          :: Text
                      , encInstrSet      :: InstructionSet
                      , encFields        :: [InstructionField]
                      , encOpcodeMask    :: Mask
                      , encGuard         :: Maybe Expr
                      , encUnpredictable :: [(Integer, Bool)]
                      , encDecode        :: [Stmt]
                      }
  deriving(Show, Eq)

data InstructionField =
  InstructionField { instFieldName   :: Identifier
                   , instFieldBegin  :: Integer
                   , instFieldOffset :: Integer
                   }
  deriving(Show, Eq)

-- Definitions ------------------------------------------------------

data Definition =
    DefTypeBuiltin      Identifier
  | DefTypeAbstract     Identifier
  | DefTypeAlias        Identifier Type
  | DefTypeStruct       QualifiedIdentifier [SymbolDecl]
  | DefTypeEnum         Identifier [Identifier]
  | DefVariable         QualifiedIdentifier Type
  | DefConst            Identifier Type Expr
  | DefArray            Identifier Type IndexType
  | DefCallable         { callableName ::  QualifiedIdentifier
                        , callableArgs ::  [SymbolDecl]
                        , callableRets ::  [Type]
                        , callableStmts :: [Stmt]
                        }
  | DefGetter           QualifiedIdentifier (Maybe [SymbolDecl]) [Type] [Stmt]
  | DefSetter           QualifiedIdentifier (Maybe [SetterArg]) SymbolDecl [Stmt]
  deriving(Show, Eq)

data SetterArg = SetterArg SymbolDecl Bool
  deriving(Show, Eq)

-- Types ------------------------------------------------------------

data Type =
    TypeRef   QualifiedIdentifier
  | TypeFun   Identifier Expr
  | TypeOf    Expr
  | TypeReg   Integer [RegField]
  | TypeArray Type IndexType
  | TypeTuple [Type]
  deriving(Show, Eq)

data IndexType =
    IxTypeRange Expr Expr
  | IxTypeRef   Identifier
  deriving(Show, Eq)

data RegField = RegField Identifier [Slice]
  deriving(Show, Eq)

-- Statements -------------------------------------------------------

data LValExpr =
    LValIgnore
  | LValVarRef QualifiedIdentifier
  | LValMember LValExpr Identifier
  | LValMemberArray LValExpr [Identifier]
  | LValArrayIndex LValExpr [Slice]
  | LValSliceOf LValExpr [Slice]
  | LValArray [LValExpr]
  | LValTuple [LValExpr]
  | LValMemberBits LValExpr [Identifier]
  | LValSlice [LValExpr]
  deriving(Show, Eq)

data Stmt =
    StmtVarsDecl Type [Identifier]
  | StmtVarDeclInit  SymbolDecl Expr
  | StmtConstDecl SymbolDecl Expr
  | StmtAssign LValExpr Expr
  | StmtCall QualifiedIdentifier [Expr]
  | StmtReturn (Maybe Expr)
  | StmtAssert Expr
  | StmtUnpredictable
  | StmtImpDef Text
  | StmtIf [(Expr, [Stmt])] (Maybe [Stmt])
  | StmtCase Expr [CaseAlternative]
  | StmtFor Identifier (Expr, Expr) [Stmt]
  | StmtWhile Expr [Stmt]
  | StmtRepeat [Stmt] Expr
  | StmtThrow Identifier
  | StmtUndefined
  | StmtSeeExpr Expr
  | StmtSeeString Text
  | StmtTry [Stmt] Identifier [CatchAlternative]
  | StmtDefEnum Identifier [Identifier]
  deriving(Show, Eq)

data CaseAlternative =
    CaseWhen [CasePattern] (Maybe Expr) [Stmt]
  | CaseOtherwise [Stmt]
  deriving(Show, Eq)

data CasePattern =
    CasePatternInt Integer
  | CasePatternBin BitVector
  | CasePatternMask Mask
  | CasePatternIdentifier Identifier
  | CasePatternIgnore
  | CasePatternTuple [CasePattern]
  deriving(Show, Eq)

data CatchAlternative =
    CatchWhen Expr [Stmt]
  | CatchOtherwise [Stmt]
  deriving(Show, Eq)

-- Expressions ------------------------------------------------------

data Expr =
    ExprLitString Text
  | ExprLitInt Integer
  | ExprLitReal Integer Integer
  | ExprLitBin BitVector
  | ExprLitMask Mask
  | ExprVarRef QualifiedIdentifier
  | ExprImpDef (Maybe Text) Type
  | ExprSlice Expr [Slice]
  | ExprIndex Expr [Slice]
  | ExprUnOp UnOp Expr
  | ExprBinOp BinOp Expr Expr
  | ExprMembers Expr [Identifier]
  | ExprInMask Expr Mask
  | ExprMemberBits Expr [Identifier]
  | ExprCall QualifiedIdentifier [Expr]
  | ExprInSet Expr [SetElement]
  | ExprUnknown Type
  | ExprTuple [Expr]
  | ExprIf {- test, result -} [(Expr, Expr)]
           {- else -}Expr
  | ExprMember Expr Identifier
  deriving(Show, Eq)

data SetElement =
    SetEltSingle Expr
  | SetEltRange Expr Expr
  deriving(Show, Eq)

data Slice =
    SliceSingle Expr
  | SliceOffset Expr Expr
  | SliceRange Expr Expr
  deriving(Show, Eq)

data UnOp =
    UnOpNot
  | UnOpNeg
  deriving(Show, Eq)

data BinOp =
    BinOpEQ
  | BinOpNEQ
  | BinOpGT
  | BinOpGTEQ
  | BinOpShiftRight
  | BinOpLT
  | BinOpLTEQ
  | BinOpShiftLeft
  | BinOpAdd
  | BinOpSub
  | BinOpMul
  | BinOpDivide
  | BinOpPow
  | BinOpLogicalAnd
  | BinOpLogicalOr
  | BinOpBitwiseOr
  | BinOpBitwiseAnd
  | BinOpBitwiseXor
  | BinOpPlusPlus   -- this is the '++' operator - doesn't appear in out.asl - what does it mean?
  | BinOpQuot
  | BinOpRem
  | BinOpDiv
  | BinOpMod
  | BinOpConcat
  deriving(Show, Eq)
