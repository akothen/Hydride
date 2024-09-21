{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
module Language.ASL.Parser
( parseAslDefs
, parseAslInsts
, parseAslRegs
, parseAslDefsFile
, parseAslInstsFile
, parseAslRegsFile
) where

import Data.Text(Text, pack, unpack)
import qualified Data.Text as Text
import Text.Parsec.Text(Parser)
import qualified Text.Parsec.Char as P
import qualified Text.Parsec as P
import Numeric(readFloat, showFFloat, readHex)

import Data.SCargot(encodeOne, decodeOne, SExprPrinter(..), SExprParser(..)
                   , basicPrint, setFromCarrier)
import Data.SCargot.Parse(mkParser, asWellFormed )
import Data.SCargot.Repr(WellFormedSExpr(..), fromWellFormed)
import Control.Monad.Except(Except(..), MonadError(..), runExcept)

import qualified Language.ASL.Syntax as Syn

-- PARSING INFRASTRUCTURE -------------------------------------------

data Atom = AtomId   Syn.Identifier
          | AtomInt  Integer
          | AtomReal Integer Integer
          | AtomMask Syn.Mask
          | AtomBin  Syn.BitVector
          | AtomString Text
  deriving(Show, Eq)

runParseAtom :: String -> Either P.ParseError Atom
runParseAtom t = P.parse parseAtom "<input>" (pack t)

showAtom :: Atom -> Text
showAtom = \case
    AtomId i -> i
    AtomInt n -> pack $ show n
    AtomReal i f -> pack $ show i <> "." <> show f
    AtomMask m -> "'" <> (pack $ fmap showMaskBit m)  <> "'"
    AtomBin b -> "'" <> (pack $ fmap showBinBit b) <> "'"
    AtomString s -> "\"" <> s <> "\""
  where
    showBinBit = \case
      True -> '1'
      False -> '0'

    showMaskBit = \case
      Syn.MaskBitEither -> 'x'
      Syn.MaskBitSet    -> '1'
      Syn.MaskBitUnset  -> '0'

parseAtom :: Parser Atom
parseAtom = P.choice $ [ parseIdentifierAtom
                       , P.try parseRealAtom
                       , parseIntAtom
                       , P.try parseBinAtom
                       , parseMaskAtom
                       , parseStringAtom
                       ]
  where
    parseIdentifierAtom = do
      l <- P.choice [ P.letter, P.char '_' ]
      r <- P.many $ P.choice [ P.alphaNum, P.char '_', P.char '.' ]
      return (AtomId $ pack (l:r))

    parseStringAtom :: Parser Atom
    parseStringAtom = do
      _   <- P.char '"'
      str <- P.many (P.noneOf ['"'])
      _   <- P.char '"'
      return (AtomString $ pack str)

    parseIntAtom = do
      n <- P.many1 P.digit
      return (AtomInt $ read n)

    parseRealAtom = do
      i <- P.many1 P.digit
      d <- P.char '.'
      f <- P.many1 P.digit
      return (AtomReal (read i) (read f))

    parseBinAtom = do
      _ <- P.char '\''
      bits <- P.many (P.oneOf "10 ")
      _ <- P.char '\''
      return (AtomBin $ parseBits bits)

    parseMaskAtom = do
      _ <- P.char '\''
      bits <- P.many (P.oneOf "10x ")
      _ <- P.char '\''
      return (AtomMask $ parseMaskBits bits)

    parseBit b = b == '1'
    parseBits bs = parseBit <$> (filter (`elem` ['0', '1']) bs)

    parseMaskBit b = case b of
      '0' -> Syn.MaskBitUnset
      '1' -> Syn.MaskBitSet
      'x' -> Syn.MaskBitEither
      _   -> error "invalid mask bit"
    parseMaskBits bs = parseMaskBit <$> (filter (`elem` ['0', '1', 'x']) bs)

type SExprA = WellFormedSExpr Atom

sexprParser :: SExprParser Atom (SExprA)
sexprParser = asWellFormed (mkParser parseAtom)

sexprPrinter :: SExprPrinter Atom (SExprA)
sexprPrinter = setFromCarrier fromWellFormed (basicPrint showAtom)

-- SEXPR PARSER -----------------------------------------------------

type SExprAParser a = Except Text a

errCtx :: Text -> SExprA -> SExprAParser a -> SExprAParser a
errCtx ctxName form p =
  p `catchError` \e -> throwError $ e <> "\n in " <> ctxName <> " : " <> encodeOne sexprPrinter form

err :: Text -> Except Text a
err t = throwError t

unexpectedForm :: Text -> SExprA -> SExprAParser a
unexpectedForm desc expr = err msg
  where
    msg = "unexpected form in " <> desc <> " : " <> encodeOne sexprPrinter expr

-- tryWith :: Text -> SExprA -> Except [(Text, SExprA)] a -> Except [(Text, SExprA)] a
-- tryWith t s c = c `catchError` \es -> err $ (t,s):err

nameArgs :: SExprA -> SExprAParser (Syn.Identifier, [SExprA])
nameArgs (WFSList (nmA:argsA)) = do
  nm <- parseId nmA
  return (nm, argsA)
nameArgs s = unexpectedForm "nameArgs" s


parseRegs :: SExprA -> SExprAParser [Syn.RegisterDefinition]
parseRegs s = nameArgs s >>= \case
  ("AslRegisters", regs) -> mapM parseRegDef regs
  _ -> throwError "parseRegs failed"

parseRegDef :: SExprA -> SExprAParser Syn.RegisterDefinition
parseRegDef s = nameArgs s >>= \case
  ("RegisterDefBasic", [reg]) -> do
    reg' <- parseReg reg
    return $ Syn.RegisterDefSingle reg'
  ("RegisterDefArray", [areg]) -> do
    areg' <- parseRegArray areg
    return $ Syn.RegisterDefArray areg'
  _ -> unexpectedForm "parseRegDef" s

parseReg :: SExprA -> SExprAParser Syn.Register
parseReg s = nameArgs s >>= \case
  ("Register", [name, length, fields]) -> do
    name' <- parseId name
    length' <- parseNatLit length
    fields' <- parseList parseRegisterField fields
    return $ Syn.Register name' length' fields'
  _ -> unexpectedForm "parseReg" s

parseRegArray :: SExprA -> SExprAParser Syn.RegisterArray
parseRegArray s = nameArgs s >>= \case
  ("RegisterArray", [min, max, reg]) -> do
    min' <- parseNatLit min
    max' <- parseNatLit max
    reg' <- parseReg reg
    return $ Syn.RegisterArray min' max' reg'
  _ -> unexpectedForm "parseRegArray" s

parseRegisterField :: SExprA -> SExprAParser Syn.RegisterField
parseRegisterField s = nameArgs s >>= \case
  ("RegisterField", [name, lo, hi]) -> do
    name' <- parseMaybe parseId name
    lo' <- parseNatLit lo
    hi' <- parseNatLit hi
    return $ Syn.RegisterField name' lo' hi'
  _ -> unexpectedForm "parseRegField" s

parseInsts :: SExprA -> SExprAParser [Syn.Instruction]
parseInsts s = nameArgs s >>= \case
  ("Instructions", insts) -> mapM parseInst insts
  _ -> throwError "parseInsts failed"

parseInst :: SExprA -> SExprAParser Syn.Instruction
parseInst s = nameArgs s >>= \case
  ("Instruction", [name, encodings, postDecode, impl, conditional]) -> do
    name' <- parseId name
    encodings' <- parseList parseInstEncoding encodings
    postDecode' <- listMaybeToList <$> parseMaybe parseStmtBlock postDecode
    impl' <- listMaybeToList <$> parseMaybe parseStmtBlock impl
    conditional' <- parseConditional conditional
    return $ Syn.Instruction name' encodings' postDecode' impl' conditional'
  _ -> unexpectedForm "parseInst" s

parseConditional :: SExprA -> SExprAParser Bool
parseConditional s = nameArgs s >>= \case
  ("Conditional", [b]) -> do
    b' <- parseBoolLit b
    return $ b'
  _ -> unexpectedForm "parseConditional" s

parseInstEncoding :: SExprA -> SExprAParser Syn.InstructionEncoding
parseInstEncoding s = nameArgs s >>= \case
  ("InstructionEncoding", [name, iset, flds, opMsk, guard, unpreds, decoder]) -> do
    name' <- parseId name
    iset' <- parseId iset >>= \case
      "A32" -> return Syn.A32
      "T32" -> return Syn.T32
      "T16" -> return Syn.T16
      "A64" -> return Syn.A64
      _ -> unexpectedForm "parseInstEncoding" s

    flds' <- parseList parseInstField flds
    opMsk' <- parseMaskLit opMsk
    guard' <- parseMaybe parseExpr guard
    unpreds' <- parseList parseUnpredUnless unpreds
    decoder' <- listMaybeToList <$> parseMaybe parseStmtBlock decoder
    return $ Syn.InstructionEncoding name' iset' flds' opMsk' guard' unpreds' decoder'
  _ -> unexpectedForm "parseInstEncoding" s

parseInstField :: SExprA -> SExprAParser Syn.InstructionField
parseInstField s = nameArgs s >>= \case
  ("InstructionField", [n, b, o]) -> do
    n' <- parseId n
    b' <- parseNatLit b
    o' <- parseNatLit o
    return $ Syn.InstructionField n' b' o'

  _ -> unexpectedForm "parseInstField" s

parseUnpredUnless :: SExprA -> SExprAParser (Integer, Bool)
parseUnpredUnless s = nameArgs s >>= \case
    ("InstructionUnpredictableUnless", [n, b]) -> do
      n' <- parseNatLit n
      b' <- parseBinLit b >>= \case
        [a] -> return a
        _   -> unexpectedForm "parseUnpredUnless" s

      return $ (n', b')

    _ -> unexpectedForm "parseUnpredUnless" s

parseDefs :: SExprA -> SExprAParser [Syn.Definition]
parseDefs ds = nameArgs ds >>= \case
  ("AslDefinitions", defs) -> mapM parseDef defs
  _                        -> throwError "Expecting AslDefinitions"

parseDef :: SExprA -> SExprAParser Syn.Definition
parseDef d = errCtx "definition" d $ nameArgs d >>= \case
  ("DefTypeBuiltin", [i]) -> do
    name <- parseId i
    return $ Syn.DefTypeBuiltin name

  ("DefTypeAbstract", [i]) -> do
    name <- parseId i
    return $ Syn.DefTypeAbstract name

  ("DefTypeAlias", [i,t]) -> do
    name <- parseId i
    typ <- parseType t
    return $ Syn.DefTypeAlias name typ

  ("DefTypeStruct", [q,sdecls]) -> do
    name <- parseQualId q
    decls <- parseList parseSymDecl sdecls
    return $ Syn.DefTypeStruct name decls

  ("DefTypeEnum", [i,ns]) -> do
    name <- parseId i
    eNames <- parseList parseId ns
    return $ Syn.DefTypeEnum name eNames

  ("DefVariable", [i,t]) -> do
    name <- parseQualId i
    typ <- parseType t
    return $ Syn.DefVariable name typ

  ("DefConst", [i,t,e]) -> do
    name <- parseId i
    typ <- parseType t
    expr <- parseExpr e
    return $ Syn.DefConst name typ expr

  ("DefArray", [i,t,ix]) -> do
    name <- parseId i
    typ <- parseType t
    ixTyp <- parseIxType ix
    return $ Syn.DefArray name typ ixTyp

  ("DefCallable", [n,a,r,s]) -> do
    n' <- parseQualId n
    a' <- parseList parseSymDecl a
    r' <- listMaybeToList <$> parseMaybe parseReturnType r
    s' <- listMaybeToList <$> parseMaybe parseStmtBlock s
    return $ Syn.DefCallable n' a' r' s'

  ("DefGetter", [i,decls,rt,stmt]) -> do
    i' <- parseQualId i
    decls' <- parseMaybe (parseList parseSymDecl) decls
    rt' <- parseReturnType rt
    stmt' <- listMaybeToList <$> parseMaybe parseStmtBlock stmt
    return $ Syn.DefGetter i' decls' rt' stmt'

  ("DefSetter", [i,a,d,stmt]) -> do
    i' <- parseQualId i
    a' <- parseMaybe (parseList parseSetterArg) a
    d' <- parseSymDecl d
    stmt' <- listMaybeToList <$> parseMaybe parseStmtBlock stmt
    return $ Syn.DefSetter i' a' d' stmt'

  _ -> unexpectedForm "parseDef" d

parseSetterArg :: SExprA -> SExprAParser Syn.SetterArg
parseSetterArg s = nameArgs s >>= \case
  ("SetterArg", [i,t,r]) -> do
    i' <- parseId i
    t' <- parseType t
    r' <- parseId r >>= \case
      "Value"     -> return False
      "Reference" -> return True
      _ -> unexpectedForm "parseSetterArg" s

    return $ Syn.SetterArg (i', t') r'

  _ -> unexpectedForm "parseSetterArg" s

parseType :: SExprA -> SExprAParser Syn.Type
parseType s = nameArgs s >>= \case
  ("TypeRef", [q]) -> do
    qid <- parseQualId q
    return $ Syn.TypeRef qid

  ("TypeFun", [i,e]) -> do
    i' <- parseId i
    e' <- parseExpr e
    return $ Syn.TypeFun i' e'

  ("TypeOf", [e]) -> do
    e' <- parseExpr e
    return $ Syn.TypeOf e'

  ("TypeReg", [n, fs]) -> do
    n' <- parseNatLit n
    fs' <- parseList parseRegField fs
    return $ Syn.TypeReg n' fs'

  ("TypeArray", [t, ix]) -> do
    t' <- parseType t
    ix' <- parseIxType ix
    return $ Syn.TypeArray t' ix'

  _ -> unexpectedForm "parseType" s

parseRegField :: SExprA -> SExprAParser Syn.RegField
parseRegField s = nameArgs s >>= \case
  ("RegField", [i, sls]) -> do
    i' <- parseId i
    sls' <- parseList parseSlice sls
    return $ Syn.RegField i' sls'

parseReturnType :: SExprA -> SExprAParser [Syn.Type]
parseReturnType s = nameArgs s >>= \case
  ("ReturnType", [l]) -> parseList parseType l
  _                   -> unexpectedForm "parseReturnType" s


parseStmtBlock :: SExprA -> SExprAParser [Syn.Stmt]
parseStmtBlock s = nameArgs s >>= \case
  ("StmtBlock", [l]) -> parseList parseStmt l
  _                  -> unexpectedForm "parseStmtBlock" s

parseStmt :: SExprA -> SExprAParser Syn.Stmt
parseStmt s = errCtx "statement" s $ nameArgs s >>= \case
  ("StmtVarsDecl", [is, t]) -> do
    t' <- parseType t
    is' <- parseList parseId is
    return $ Syn.StmtVarsDecl t' is'

  ("StmtVarDeclInit", [s, e]) -> do
    s' <- parseSymDecl s
    e' <- parseExpr e
    return $ Syn.StmtVarDeclInit s' e'

  ("StmtConstDecl", [s, e]) -> do
    s' <- parseSymDecl s
    e' <- parseExpr e
    return $ Syn.StmtConstDecl s' e'

  ("StmtAssign", [lv, e]) -> do
    lv' <- parseLValExpr lv
    e' <- parseExpr e
    return $ Syn.StmtAssign lv' e'

  ("StmtCall", [i, es]) -> do
    i'  <- parseQualId i
    es' <- parseList parseExpr es
    return $ Syn.StmtCall i' es'

  ("StmtReturn", [e]) -> do
    e' <- parseMaybe parseExpr e
    return $ Syn.StmtReturn e'

  ("StmtAssert", [e]) -> do
    e' <- parseExpr e
    return $ Syn.StmtAssert e'

  ("StmtUnpredictable", []) -> return Syn.StmtUnpredictable

  ("StmtImpDef", [s]) -> do
    s' <- parseStringLit s
    return $ Syn.StmtImpDef s'

  ("StmtIf", [testE, thenS, elsifs, elseE]) -> do
    testE' <- parseExpr testE
    thenS' <- parseStmtBlock thenS
    elsifs' <- parseList parseElsIf elsifs
    elseE' <- parseMaybe parseStmtBlock elseE
    return $ Syn.StmtIf ((testE', thenS') : elsifs') elseE'

  ("StmtCase", [e, cs]) -> do
    e' <- parseExpr e
    cs' <- parseList parseCaseAlt cs
    return $ Syn.StmtCase e' cs'

  ("StmtFor", [i, be, dir, ee, stmts]) -> do
    i' <- parseId i
    be' <- parseExpr be
    ee' <- parseExpr ee
    dir' <- parseId dir
    bnds <- case dir' of
      "to"     -> return (be', ee')
      "downto" -> return (ee', be')
      _        -> unexpectedForm "parseStmt" s

    stmts' <- parseStmtBlock stmts
    return $ Syn.StmtFor i' bnds stmts'

  ("StmtWhile", [e, ss]) -> do
    e' <- parseExpr e
    ss' <- parseStmtBlock ss
    return $ Syn.StmtWhile e' ss'

  ("StmtRepeat", [ss, e]) -> do
    ss' <- parseStmtBlock ss
    e' <- parseExpr e
    return $ Syn.StmtRepeat ss' e'

  ("StmtThrow", [i]) -> do
    i' <- parseId i
    return $ Syn.StmtThrow i'

  ("StmtUndefined", []) -> return Syn.StmtUndefined

  -- TODO: this is kind of messed up
  ("StmtSee", [s]) -> do
    s' <- parseStringLit s
    return $ Syn.StmtSeeString s'

  ("StmtTry", [i, ss, ca]) -> do
    i' <- parseId i
    ss' <- parseStmtBlock ss
    ca' <- parseList parseCatchAlt ca
    return $ Syn.StmtTry ss' i' ca'

  ("StmtDefEnum", [i, ns]) -> do
    i' <- parseId i
    ns' <- parseList parseId ns
    return $ Syn.StmtDefEnum i' ns'

  _ -> unexpectedForm "parseStmt" s

  where
    parseElsIf e = nameArgs e >>= \case
      ("StmtElsIf", [e, ss]) -> do
        e' <- parseExpr e
        ss' <- parseStmtBlock ss
        return $ (e',  ss')

parseCaseAlt :: SExprA -> SExprAParser Syn.CaseAlternative
parseCaseAlt s = nameArgs s >>= \case
  ("CaseAltWhen", [pats, guard, stmts]) -> do
    pats' <- parseList parseCasePattern pats
    guard' <- parseMaybe parseExpr guard
    ss' <- parseStmtBlock stmts
    return $ Syn.CaseWhen pats' guard' ss'

  ("CaseAltOtherwise", [stmts]) -> do
    stmts' <- parseStmtBlock stmts
    return $ Syn.CaseOtherwise stmts'

  _ -> unexpectedForm "parseCaseAlt" s

parseCasePattern :: SExprA -> SExprAParser Syn.CasePattern
parseCasePattern s = nameArgs s >>= \case
  ("CasePatternNat", [n]) ->  Syn.CasePatternInt <$>  parseNatLit n
  ("CasePatternHex", [h]) -> Syn.CasePatternInt <$> parseHexLit h
  ("CasePatternBin", [b]) -> Syn.CasePatternBin <$> parseBinLit b
  ("CasePatternMask", [m]) -> Syn.CasePatternMask <$> parseMaskLit m
  ("CasePatternIdentifier", [i]) -> Syn.CasePatternIdentifier <$> parseId i
  ("CasePatternIgnore", []) -> return Syn.CasePatternIgnore
  ("CasePatternTuple", [b]) -> do
    b' <- parseList parseCasePattern b
    return $ Syn.CasePatternTuple b'

parseCatchAlt :: SExprA -> SExprAParser Syn.CatchAlternative
parseCatchAlt s = nameArgs s >>= \case
  ("CatchWhen", [e, ss]) -> do
    e' <- parseExpr e
    ss' <- parseStmtBlock ss
    return $ Syn.CatchWhen e' ss'

  ("CatchOtherwise", [ss]) -> do
    ss' <- parseStmtBlock ss
    return $ Syn.CatchOtherwise ss'

parseLValExpr :: SExprA -> SExprAParser Syn.LValExpr
parseLValExpr s = nameArgs s >>= \case
  ("LValIgnore", []) -> return Syn.LValIgnore

  ("LValVarRef", [i]) -> do
    i' <- parseQualId i
    return $ Syn.LValVarRef i'

  ("LValMember", [lv, i]) -> do
    lv' <- parseLValExpr lv
    i'  <- parseId i
    return $ Syn.LValMember lv' i'

  ("LValMemberArray", [lv, is]) -> do
    lv' <- parseLValExpr lv
    is' <- parseList parseId is
    return $ Syn.LValMemberArray lv' is'

  ("LValArrayIndex", [lv, ss]) -> do
    lv' <- parseLValExpr lv
    ss' <- parseList parseSlice ss
    return $ Syn.LValArrayIndex lv' ss'

  ("LValSliceOf", [lv, ss]) -> do
    lv' <- parseLValExpr lv
    ss' <- parseList parseSlice ss
    return $ Syn.LValSliceOf lv' ss'

  ("LValArray", [lv]) -> do
    lv' <- parseList parseLValExpr lv
    return $ Syn.LValArray lv'

  ("LValTuple", [lv]) -> do
    lv' <- parseList parseLValExpr lv
    return $ Syn.LValTuple lv'

  ("LValMemberBits", [lv, is]) -> do
    lv' <- parseLValExpr lv
    is' <- parseList parseId is
    return $ Syn.LValMemberBits lv' is'

  ("LValSlice", [lvs]) -> do
    lvs' <- parseList parseLValExpr lvs
    return $ Syn.LValSlice lvs'


parseExpr :: SExprA -> SExprAParser Syn.Expr
parseExpr s = errCtx "expression" s $ nameArgs s >>= \case
  ("ExprLitString", [n]) -> Syn.ExprLitString <$> parseStringLit n
  ("ExprLitNat", [n]) -> Syn.ExprLitInt <$> parseNatLit n
  ("ExprLitHex", [n]) -> Syn.ExprLitInt <$> parseHexLit n
  ("ExprLitReal", [n]) -> uncurry Syn.ExprLitReal <$>  parseRealLit n
  ("ExprLitBin", [n]) -> Syn.ExprLitBin <$> parseBinLit n
  ("ExprLitMask", [n]) -> Syn.ExprLitMask <$> parseMaskLit n
  ("ExprVarRef", [n]) -> Syn.ExprVarRef <$> parseQualId n
  ("ExprImpDef", [s, t])  -> do
    s' <- parseMaybe parseStringLit s
    t' <- parseType t
    return $ Syn.ExprImpDef s' t'
  ("ExprSlice", [e, sl]) -> do
    e' <- parseExpr e
    sl' <- parseList parseSlice sl
    return $ Syn.ExprSlice e' sl'

  ("ExprIndex", [e, sl]) -> do
    e' <- parseExpr e
    sl' <- parseList parseSlice sl
    return $ Syn.ExprIndex e' sl'

  ("ExprUnOp", [op, e]) -> do
    e' <- parseExpr e
    op' <- parseStringLit op >>= \case
      "NOT" -> return Syn.UnOpNot
      "!"   -> return Syn.UnOpNot
      "-"   -> return Syn.UnOpNeg
      _     -> unexpectedForm "parseExpr" s
    return $ Syn.ExprUnOp op' e'

  ("ExprBinOp", [op, e1, e2]) -> do
    e1' <- parseExpr e1
    e2' <- parseExpr e2
    op' <- parseStringLit op >>= lookupBinOp
    return $ Syn.ExprBinOp op' e1' e2'

  ("ExprMembers", [e, ms]) -> do
    e' <- parseExpr e
    ms' <- parseList parseId ms
    return $ Syn.ExprMembers e' ms'

  ("ExprInMask", [e, m]) -> do
    e' <- parseExpr e
    m' <- parseMaskLit m
    return $ Syn.ExprInMask e' m'

  ("ExprMemberBits", [e, ms]) -> do
    e' <- parseExpr e
    ms' <- parseList parseId ms
    return $ Syn.ExprMemberBits e' ms'

  ("ExprCall", [fun, args]) -> do
    fun' <- parseQualId fun
    args' <- parseList parseExpr args
    return $ Syn.ExprCall fun' args'

  ("ExprInSet", [e, set]) -> do
    e' <- parseExpr e
    set' <- parseSet set
    return $ Syn.ExprInSet e' set'

  ("ExprUnknown", [t]) -> do
    t' <- parseType t
    return $ Syn.ExprUnknown t'

  ("ExprTuple", [es]) -> Syn.ExprTuple <$> parseList parseExpr es
  ("ExprIf", [test, thn, elsifs, els]) -> do
    test' <- parseExpr test
    thn' <- parseExpr thn
    elsifs' <- parseList parseElsIf elsifs
    els <- parseExpr els
    let ts = (test', thn'):elsifs'
    return $ Syn.ExprIf ts els

  ("ExprMember", [e, i]) -> do
    e' <- parseExpr e
    i' <- parseId i
    return $ Syn.ExprMember e' i'

  _ -> unexpectedForm "parseExpr" s

  where
    parseElsIf elsif = nameArgs elsif >>= \case
      ("ExprElsIf", [test, r]) -> do
        test' <- parseExpr test
        r' <- parseExpr r
        return $ (test', r')

    lookupBinOp = \case
      "=="   -> return Syn.BinOpEQ
      "!="   -> return Syn.BinOpNEQ
      ">"    -> return Syn.BinOpGT
      ">="   -> return Syn.BinOpGTEQ
      ">>"   -> return Syn.BinOpShiftRight
      "<"    -> return Syn.BinOpLT
      "<="   -> return Syn.BinOpLTEQ
      "<<"   -> return Syn.BinOpShiftLeft
      "+"    -> return Syn.BinOpAdd
      "-"    -> return Syn.BinOpSub
      "*"    -> return Syn.BinOpMul
      "/"    -> return Syn.BinOpDivide
      "^"    -> return Syn.BinOpPow
      "&&"   -> return Syn.BinOpLogicalAnd
      "||"   -> return Syn.BinOpLogicalOr
      "OR"   -> return Syn.BinOpBitwiseOr
      "AND"  -> return Syn.BinOpBitwiseAnd
      "EOR"  -> return Syn.BinOpBitwiseXor
      "++"   -> return Syn.BinOpPlusPlus
      "QUOT" -> return Syn.BinOpQuot
      "REM"  -> return Syn.BinOpRem
      "DIV"  -> return Syn.BinOpDiv
      "MOD"  -> return Syn.BinOpMod
      ":"    -> return Syn.BinOpConcat
      _      -> unexpectedForm "parseExpr" s

parseSetElement :: SExprA -> SExprAParser Syn.SetElement
parseSetElement s = nameArgs s >>= \case
  ("SetElementSingle", [e]) -> Syn.SetEltSingle <$> parseExpr e
  ("SetElementRange", [e1, e2]) -> do
    e1' <- parseExpr e1
    e2' <- parseExpr e2
    return $ Syn.SetEltRange e1' e2'
  _ -> unexpectedForm "parseSetElement" s

parseSet :: SExprA -> SExprAParser [Syn.SetElement]
parseSet s = nameArgs s >>= \case
  ("Set", [elts]) -> parseList parseSetElement elts
  _ -> unexpectedForm "parseSet" s

parseSlice :: SExprA -> SExprAParser Syn.Slice
parseSlice s = nameArgs s >>= \case
  ("SliceSingle", [e]) -> do
    e' <- parseExpr e
    return $ Syn.SliceSingle e'

  ("SliceRange", [e1, e2]) -> do
    e1' <- parseExpr e1
    e2' <- parseExpr e2
    return $ Syn.SliceRange e1' e2'

  ("SliceOffset", [e1, e2]) -> do
    e1' <- parseExpr e1
    e2' <- parseExpr e2
    return $ Syn.SliceOffset e1' e2'

  _ -> unexpectedForm "parseSlice" s

parseIxType :: SExprA -> SExprAParser Syn.IndexType
parseIxType s = nameArgs s >>= \case
  ("IxTypeRange", [e1,e2]) -> do
    e1' <- parseExpr e1
    e2' <- parseExpr e2
    return $ Syn.IxTypeRange e1' e2'

  ("IxTypeRef", [i]) -> do
    i' <- parseId i
    return $ Syn.IxTypeRef i'

  _ -> unexpectedForm "parseIxType" s

parseSymDecl :: SExprA -> SExprAParser Syn.SymbolDecl
parseSymDecl s = nameArgs s >>= \case
  ("SymDecl", [i, t]) -> do
    ident <- parseId i
    typ <- parseType t
    return (ident, typ)
  _ -> unexpectedForm "parseSymDecl" s

parseQualId :: SExprA -> SExprAParser Syn.QualifiedIdentifier
parseQualId s = nameArgs s >>= \case
  ("QualifiedIdentifier", [a, i]) -> do
    archId <- parseId a
    iden <- parseId i
    arch <- case archId of
      "AArch32" -> return Syn.ArchQualAArch32
      "AArch64" -> return Syn.ArchQualAArch64
      "Any"     -> return Syn.ArchQualAny
      _         -> unexpectedForm "parseQualId" s

    return $ Syn.QualifiedIdentifier arch iden

  _ -> unexpectedForm "parseQualId" s

parseMaybe :: (SExprA -> SExprAParser a) -> SExprA -> SExprAParser (Maybe a)
parseMaybe f s = case s of
  WFSAtom (AtomId "Nothing")   -> return Nothing
  WFSList [(WFSAtom (AtomId "Just")), k] -> do
    r <- f k
    return $ Just r
  _ -> unexpectedForm "parseMaybe" s

parseList :: (SExprA -> SExprAParser a) -> SExprA -> SExprAParser [a]
parseList f l = nameArgs l >>= \case
  ("list", elts) -> mapM f elts
  _              -> unexpectedForm "parseList" l

parseId :: SExprA -> SExprAParser Syn.Identifier
parseId = \case
  WFSAtom (AtomId i) -> return i
  k                  -> unexpectedForm "parseId" k

parseNatLit :: SExprA -> SExprAParser Integer
parseNatLit = \case
  WFSAtom (AtomInt n) -> return n
  k                   -> unexpectedForm "parseNatLit" k

parseHexLit :: SExprA -> SExprAParser Integer
parseHexLit s = do
  s' <- parseStringLit s
  case s' of
    k | Text.take 2 k == "0x" ->
      let digits = Text.drop 2 k
      in case readHex (unpack digits) of
        [(i, "")] -> return i
        _         -> unexpectedForm "parseHexLit" s
    _ -> unexpectedForm "parseHexLit" s

parseBinLit :: SExprA -> SExprAParser Syn.BitVector
parseBinLit = \case
  WFSAtom (AtomBin bin) -> return bin
  k                     -> unexpectedForm "parseBinLit" k

parseMaskLit :: SExprA -> SExprAParser Syn.Mask
parseMaskLit = \case
  WFSAtom (AtomMask mask) -> return mask
  WFSAtom (AtomBin  bin)  -> return (binToMask <$> bin)
  k                       -> unexpectedForm "parseMaskLit" k
  where
    binToMask s = if s then Syn.MaskBitSet else Syn.MaskBitUnset

parseStringLit :: SExprA -> SExprAParser Text
parseStringLit = \case
  WFSAtom (AtomString str) -> return str
  k                        -> unexpectedForm "parseStringLit" k

parseBoolLit :: SExprA -> SExprAParser Bool
parseBoolLit = \case
  WFSAtom (AtomId "True") -> return True
  WFSAtom (AtomId "False") -> return False
  k                    -> unexpectedForm "parseBoolLit" k

parseRealLit :: SExprA -> SExprAParser (Integer, Integer)
parseRealLit = \case
  WFSAtom (AtomReal wh fr) -> return (wh, fr)
  k                        -> unexpectedForm "parseRealLit" k

listMaybeToList :: Maybe [a] -> [a]
listMaybeToList = \case
  Nothing -> []
  Just as -> as

-- DRIVER -----------------------------------------------------------

parseSExprA :: Text -> Either Text SExprA
parseSExprA t =
  case decodeOne sexprParser t of
    Left err -> Left $ pack err
    Right r -> Right r

parseAslDefs :: Text -> Either Text [Syn.Definition]
parseAslDefs t = do
  defs <- parseSExprA t
  runExcept (parseDefs defs)

parseAslInsts :: Text -> Either Text [Syn.Instruction]
parseAslInsts t = do
  insts <- parseSExprA t
  runExcept (parseInsts insts)

parseAslRegs :: Text -> Either Text [Syn.RegisterDefinition]
parseAslRegs t = do
  regs <- parseSExprA t
  runExcept (parseRegs regs)

parseAslDefsFile :: FilePath -> IO (Either Text [Syn.Definition])
parseAslDefsFile f = do
  t <- pack <$> readFile f
  return $ parseAslDefs t

parseAslInstsFile :: FilePath -> IO (Either Text [Syn.Instruction])
parseAslInstsFile f = do
  t <- pack <$> readFile f
  return $ parseAslInsts t

parseAslRegsFile :: FilePath -> IO (Either Text [Syn.RegisterDefinition])
parseAslRegsFile f = do
  t <- pack <$> readFile f
  return $ parseAslRegs t
