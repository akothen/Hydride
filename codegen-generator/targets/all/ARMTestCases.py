from asl.ARMParser import get_parser
from ARMTypes import *
from ARMAST import *

aarch64_vector_arithmetic_binary_uniform_mul_fp16_extended_sisd = """(Instruction
    aarch64_vector_arithmetic_binary_uniform_mul_fp16_extended_sisd
    (list
      (InstructionEncoding
        aarch64_vector_arithmetic_binary_uniform_mul_fp16_extended_sisd
        A64
        (list
          (InstructionField Rm 16 5)
          (InstructionField Rn 5 5)
          (InstructionField Rd 0 5))
        '01011110 010xxxxx 000111xx xxxxxxxx'
        (Just
          (ExprVarRef
            (QualifiedIdentifier Any TRUE)))
        (list)
        (Just
          (StmtBlock
            (list
              (StmtIf
                (ExprUnOp
                  "!"
                  (ExprCall
                    (QualifiedIdentifier Any HaveFP16Ext)
                    (list)))
                (StmtBlock
                  (list (StmtUndefined)))
                (list)
                Nothing)
              (StmtVarDeclInit
                (SymDecl
                  d
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rd)))))
              (StmtVarDeclInit
                (SymDecl
                  n
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rn)))))
              (StmtVarDeclInit
                (SymDecl
                  m
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rm)))))
              (StmtVarDeclInit
                (SymDecl
                  esize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprLitNat 16))
              (StmtVarDeclInit
                (SymDecl
                  datasize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprVarRef
                  (QualifiedIdentifier Any esize)))
              (StmtVarDeclInit
                (SymDecl
                  elements
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprLitNat 1))))))
      (InstructionEncoding
        aarch64_vector_arithmetic_binary_uniform_mul_fp_extended_sisd
        A64
        (list
          (InstructionField sz 22 1)
          (InstructionField Rm 16 5)
          (InstructionField Rn 5 5)
          (InstructionField Rd 0 5))
        '01011110 0x1xxxxx 110111xx xxxxxxxx'
        (Just
          (ExprVarRef
            (QualifiedIdentifier Any TRUE)))
        (list)
        (Just
          (StmtBlock
            (list
              (StmtVarDeclInit
                (SymDecl
                  d
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rd)))))
              (StmtVarDeclInit
                (SymDecl
                  n
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rn)))))
              (StmtVarDeclInit
                (SymDecl
                  m
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rm)))))
              (StmtVarDeclInit
                (SymDecl
                  esize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "<<"
                  (ExprLitNat 32)
                  (ExprCall
                    (QualifiedIdentifier Any UInt)
                    (list
                      (ExprVarRef
                        (QualifiedIdentifier Any sz))))))
              (StmtVarDeclInit
                (SymDecl
                  datasize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprVarRef
                  (QualifiedIdentifier Any esize)))
              (StmtVarDeclInit
                (SymDecl
                  elements
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprLitNat 1))))))
      (InstructionEncoding
        aarch64_vector_arithmetic_binary_uniform_mul_fp16_extended_simd
        A64
        (list
          (InstructionField Q 30 1)
          (InstructionField Rm 16 5)
          (InstructionField Rn 5 5)
          (InstructionField Rd 0 5))
        '0x001110 010xxxxx 000111xx xxxxxxxx'
        (Just
          (ExprVarRef
            (QualifiedIdentifier Any TRUE)))
        (list)
        (Just
          (StmtBlock
            (list
              (StmtIf
                (ExprUnOp
                  "!"
                  (ExprCall
                    (QualifiedIdentifier Any HaveFP16Ext)
                    (list)))
                (StmtBlock
                  (list (StmtUndefined)))
                (list)
                Nothing)
              (StmtVarDeclInit
                (SymDecl
                  d
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rd)))))
              (StmtVarDeclInit
                (SymDecl
                  n
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rn)))))
              (StmtVarDeclInit
                (SymDecl
                  m
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rm)))))
              (StmtVarDeclInit
                (SymDecl
                  esize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprLitNat 16))
              (StmtVarDeclInit
                (SymDecl
                  datasize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprIf
                  (ExprBinOp
                    "=="
                    (ExprVarRef
                      (QualifiedIdentifier Any Q))
                    (ExprLitBin '1'))
                  (ExprLitNat 128)
                  (list)
                  (ExprLitNat 64)))
              (StmtVarDeclInit
                (SymDecl
                  elements
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "DIV"
                  (ExprVarRef
                    (QualifiedIdentifier Any datasize))
                  (ExprVarRef
                    (QualifiedIdentifier Any esize))))))))
      (InstructionEncoding
        aarch64_vector_arithmetic_binary_uniform_mul_fp_extended_simd
        A64
        (list
          (InstructionField Q 30 1)
          (InstructionField sz 22 1)
          (InstructionField Rm 16 5)
          (InstructionField Rn 5 5)
          (InstructionField Rd 0 5))
        '0x001110 0x1xxxxx 110111xx xxxxxxxx'
        (Just
          (ExprVarRef
            (QualifiedIdentifier Any TRUE)))
        (list)
        (Just
          (StmtBlock
            (list
              (StmtVarDeclInit
                (SymDecl
                  d
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rd)))))
              (StmtVarDeclInit
                (SymDecl
                  n
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rn)))))
              (StmtVarDeclInit
                (SymDecl
                  m
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rm)))))
              (StmtIf
                (ExprBinOp
                  "=="
                  (ExprBinOp
                    ":"
                    (ExprVarRef
                      (QualifiedIdentifier Any sz))
                    (ExprVarRef
                      (QualifiedIdentifier Any Q)))
                  (ExprLitBin '10'))
                (StmtBlock
                  (list (StmtUndefined)))
                (list)
                Nothing)
              (StmtVarDeclInit
                (SymDecl
                  esize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "<<"
                  (ExprLitNat 32)
                  (ExprCall
                    (QualifiedIdentifier Any UInt)
                    (list
                      (ExprVarRef
                        (QualifiedIdentifier Any sz))))))
              (StmtVarDeclInit
                (SymDecl
                  datasize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprIf
                  (ExprBinOp
                    "=="
                    (ExprVarRef
                      (QualifiedIdentifier Any Q))
                    (ExprLitBin '1'))
                  (ExprLitNat 128)
                  (list)
                  (ExprLitNat 64)))
              (StmtVarDeclInit
                (SymDecl
                  elements
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "DIV"
                  (ExprVarRef
                    (QualifiedIdentifier Any datasize))
                  (ExprVarRef
                    (QualifiedIdentifier Any esize)))))))))
    Nothing
    (Just
      (StmtBlock
        (list
          (StmtCall
            (QualifiedIdentifier Any CheckFPAdvSIMDEnabled64)
            (list))
          (StmtVarDeclInit
            (SymDecl
              operand1
              (TypeFun
                bits
                (ExprVarRef
                  (QualifiedIdentifier Any datasize))))
            (ExprIndex
              (ExprVarRef
                (QualifiedIdentifier Any V))
              (list
                (SliceSingle
                  (ExprVarRef
                    (QualifiedIdentifier Any n))))))
          (StmtVarDeclInit
            (SymDecl
              operand2
              (TypeFun
                bits
                (ExprVarRef
                  (QualifiedIdentifier Any datasize))))
            (ExprIndex
              (ExprVarRef
                (QualifiedIdentifier Any V))
              (list
                (SliceSingle
                  (ExprVarRef
                    (QualifiedIdentifier Any m))))))
          (StmtVarsDecl
            (list result)
            (TypeFun
              bits
              (ExprVarRef
                (QualifiedIdentifier Any datasize))))
          (StmtVarsDecl
            (list element1)
            (TypeFun
              bits
              (ExprVarRef
                (QualifiedIdentifier Any esize))))
          (StmtVarsDecl
            (list element2)
            (TypeFun
              bits
              (ExprVarRef
                (QualifiedIdentifier Any esize))))
          (StmtFor
            e
            (ExprLitNat 0)
            to
            (ExprBinOp
              "-"
              (ExprVarRef
                (QualifiedIdentifier Any elements))
              (ExprLitNat 1))
            (StmtBlock
              (list
                (StmtAssign
                  (LValVarRef
                    (QualifiedIdentifier Any element1))
                  (ExprIndex
                    (ExprVarRef
                      (QualifiedIdentifier Any Elem))
                    (list
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any operand1)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any e)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any esize))))))
                (StmtAssign
                  (LValVarRef
                    (QualifiedIdentifier Any element2))
                  (ExprIndex
                    (ExprVarRef
                      (QualifiedIdentifier Any Elem))
                    (list
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any operand2)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any e)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any esize))))))
                (StmtAssign
                  (LValArrayIndex
                    (LValVarRef
                      (QualifiedIdentifier Any Elem))
                    (list
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any result)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any e)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any esize)))))
                  (ExprCall
                    (QualifiedIdentifier Any FPMulX)
                    (list
                      (ExprVarRef
                        (QualifiedIdentifier Any element1))
                      (ExprVarRef
                        (QualifiedIdentifier Any element2))
                      (ExprVarRef
                        (QualifiedIdentifier Any FPCR))))))))
          (StmtAssign
            (LValArrayIndex
              (LValVarRef
                (QualifiedIdentifier Any V))
              (list
                (SliceSingle
                  (ExprVarRef
                    (QualifiedIdentifier Any d)))))
            (ExprVarRef
              (QualifiedIdentifier Any result))))))
    (Conditional False))"""
aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd = """(Instruction
    aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd
    (list
      (InstructionEncoding
        aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd
        A64
        (list
          (InstructionField U 29 1)
          (InstructionField size 22 2)
          (InstructionField Rm 16 5)
          (InstructionField Rn 5 5)
          (InstructionField Rd 0 5))
        '01x11110 xx1xxxxx 100001xx xxxxxxxx'
        (Just
          (ExprVarRef
            (QualifiedIdentifier Any TRUE)))
        (list)
        (Just
          (StmtBlock
            (list
              (StmtVarDeclInit
                (SymDecl
                  d
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rd)))))
              (StmtVarDeclInit
                (SymDecl
                  n
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rn)))))
              (StmtVarDeclInit
                (SymDecl
                  m
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rm)))))
              (StmtIf
                (ExprBinOp
                  "!="
                  (ExprVarRef
                    (QualifiedIdentifier Any size))
                  (ExprLitBin '11'))
                (StmtBlock
                  (list (StmtUndefined)))
                (list)
                Nothing)
              (StmtVarDeclInit
                (SymDecl
                  esize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "<<"
                  (ExprLitNat 8)
                  (ExprCall
                    (QualifiedIdentifier Any UInt)
                    (list
                      (ExprVarRef
                        (QualifiedIdentifier Any size))))))
              (StmtVarDeclInit
                (SymDecl
                  datasize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprVarRef
                  (QualifiedIdentifier Any esize)))
              (StmtVarDeclInit
                (SymDecl
                  elements
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprLitNat 1))
              (StmtVarDeclInit
                (SymDecl
                  sub_op
                  (TypeRef
                    (QualifiedIdentifier Any boolean)))
                (ExprBinOp
                  "=="
                  (ExprVarRef
                    (QualifiedIdentifier Any U))
                  (ExprLitBin '1')))))))
      (InstructionEncoding
        aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_simd
        A64
        (list
          (InstructionField Q 30 1)
          (InstructionField U 29 1)
          (InstructionField size 22 2)
          (InstructionField Rm 16 5)
          (InstructionField Rn 5 5)
          (InstructionField Rd 0 5))
        '0xx01110 xx1xxxxx 100001xx xxxxxxxx'
        (Just
          (ExprVarRef
            (QualifiedIdentifier Any TRUE)))
        (list)
        (Just
          (StmtBlock
            (list
              (StmtVarDeclInit
                (SymDecl
                  d
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rd)))))
              (StmtVarDeclInit
                (SymDecl
                  n
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rn)))))
              (StmtVarDeclInit
                (SymDecl
                  m
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprCall
                  (QualifiedIdentifier Any UInt)
                  (list
                    (ExprVarRef
                      (QualifiedIdentifier Any Rm)))))
              (StmtIf
                (ExprBinOp
                  "=="
                  (ExprBinOp
                    ":"
                    (ExprVarRef
                      (QualifiedIdentifier Any size))
                    (ExprVarRef
                      (QualifiedIdentifier Any Q)))
                  (ExprLitBin '110'))
                (StmtBlock
                  (list (StmtUndefined)))
                (list)
                Nothing)
              (StmtVarDeclInit
                (SymDecl
                  esize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "<<"
                  (ExprLitNat 8)
                  (ExprCall
                    (QualifiedIdentifier Any UInt)
                    (list
                      (ExprVarRef
                        (QualifiedIdentifier Any size))))))
              (StmtVarDeclInit
                (SymDecl
                  datasize
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprIf
                  (ExprBinOp
                    "=="
                    (ExprVarRef
                      (QualifiedIdentifier Any Q))
                    (ExprLitBin '1'))
                  (ExprLitNat 128)
                  (list)
                  (ExprLitNat 64)))
              (StmtVarDeclInit
                (SymDecl
                  elements
                  (TypeRef
                    (QualifiedIdentifier Any integer)))
                (ExprBinOp
                  "DIV"
                  (ExprVarRef
                    (QualifiedIdentifier Any datasize))
                  (ExprVarRef
                    (QualifiedIdentifier Any esize))))
              (StmtVarDeclInit
                (SymDecl
                  sub_op
                  (TypeRef
                    (QualifiedIdentifier Any boolean)))
                (ExprBinOp
                  "=="
                  (ExprVarRef
                    (QualifiedIdentifier Any U))
                  (ExprLitBin '1'))))))))
    Nothing
    (Just
      (StmtBlock
        (list
          (StmtCall
            (QualifiedIdentifier Any CheckFPAdvSIMDEnabled64)
            (list))
          (StmtVarDeclInit
            (SymDecl
              operand1
              (TypeFun
                bits
                (ExprVarRef
                  (QualifiedIdentifier Any datasize))))
            (ExprIndex
              (ExprVarRef
                (QualifiedIdentifier Any V))
              (list
                (SliceSingle
                  (ExprVarRef
                    (QualifiedIdentifier Any n))))))
          (StmtVarDeclInit
            (SymDecl
              operand2
              (TypeFun
                bits
                (ExprVarRef
                  (QualifiedIdentifier Any datasize))))
            (ExprIndex
              (ExprVarRef
                (QualifiedIdentifier Any V))
              (list
                (SliceSingle
                  (ExprVarRef
                    (QualifiedIdentifier Any m))))))
          (StmtVarsDecl
            (list result)
            (TypeFun
              bits
              (ExprVarRef
                (QualifiedIdentifier Any datasize))))
          (StmtVarsDecl
            (list element1)
            (TypeFun
              bits
              (ExprVarRef
                (QualifiedIdentifier Any esize))))
          (StmtVarsDecl
            (list element2)
            (TypeFun
              bits
              (ExprVarRef
                (QualifiedIdentifier Any esize))))
          (StmtFor
            e
            (ExprLitNat 0)
            to
            (ExprBinOp
              "-"
              (ExprVarRef
                (QualifiedIdentifier Any elements))
              (ExprLitNat 1))
            (StmtBlock
              (list
                (StmtAssign
                  (LValVarRef
                    (QualifiedIdentifier Any element1))
                  (ExprIndex
                    (ExprVarRef
                      (QualifiedIdentifier Any Elem))
                    (list
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any operand1)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any e)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any esize))))))
                (StmtAssign
                  (LValVarRef
                    (QualifiedIdentifier Any element2))
                  (ExprIndex
                    (ExprVarRef
                      (QualifiedIdentifier Any Elem))
                    (list
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any operand2)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any e)))
                      (SliceSingle
                        (ExprVarRef
                          (QualifiedIdentifier Any esize))))))
                (StmtIf
                  (ExprVarRef
                    (QualifiedIdentifier Any sub_op))
                  (StmtBlock
                    (list
                      (StmtAssign
                        (LValArrayIndex
                          (LValVarRef
                            (QualifiedIdentifier Any Elem))
                          (list
                            (SliceSingle
                              (ExprVarRef
                                (QualifiedIdentifier Any result)))
                            (SliceSingle
                              (ExprVarRef
                                (QualifiedIdentifier Any e)))
                            (SliceSingle
                              (ExprVarRef
                                (QualifiedIdentifier Any esize)))))
                        (ExprBinOp
                          "-"
                          (ExprVarRef
                            (QualifiedIdentifier Any element1))
                          (ExprVarRef
                            (QualifiedIdentifier Any element2))))))
                  (list)
                  (Just
                    (StmtBlock
                      (list
                        (StmtAssign
                          (LValArrayIndex
                            (LValVarRef
                              (QualifiedIdentifier Any Elem))
                            (list
                              (SliceSingle
                                (ExprVarRef
                                  (QualifiedIdentifier Any result)))
                              (SliceSingle
                                (ExprVarRef
                                  (QualifiedIdentifier Any e)))
                              (SliceSingle
                                (ExprVarRef
                                  (QualifiedIdentifier Any esize)))))
                          (ExprBinOp
                            "+"
                            (ExprVarRef
                              (QualifiedIdentifier Any element1))
                            (ExprVarRef
                              (QualifiedIdentifier Any element2)))))))))))
          (StmtAssign
            (LValArrayIndex
              (LValVarRef
                (QualifiedIdentifier Any V))
              (list
                (SliceSingle
                  (ExprVarRef
                    (QualifiedIdentifier Any d)))))
            (ExprVarRef
              (QualifiedIdentifier Any result))))))
    (Conditional False))"""


def vmul_f32():
    Parser = get_parser('inst')
    encoding = Parser.parse(
        aarch64_vector_arithmetic_binary_uniform_mul_fp16_extended_sisd)
    realExe = ASTShrink_(encoding.instExecute)
    resolving = {
        "datasize": 128,
        "esize": 16,
        "elements": 8,
    }
    preparation = {
        "n": "a",
        "m": "b",
        "d": "result",
    }
    print(realExe)
    return ARMSema(
        "vmul_f32",
        "FMUL",
        [Parameter("a", "float32x2_t", True, False, False),
         Parameter("b", "float32x2_t", True, False, False)],
        realExe,
        "float32x2_t",
        True,
        "FMUL Vd.2S,Vn.2S,Vm.2S",
        None, None, None, None,
        preparation, resolving
    )


def vaddq_s16():
    Parser = get_parser('inst')
    encoding = Parser.parse(
        aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd)
    realExe = ASTShrink_(encoding.instExecute)
    resolving = {
        "datasize": 128,
        "esize": 16,
        "elements": 8,
        "sub_op": False,
    }
    preparation = {
        "n": "a",
        "m": "b",
        "d": "result",
    }
    print(realExe)
    return ARMSema(
        "vaddq_s16",
        "ADD",
        [Parameter("a", "int16x8_t", True, False, False),
         Parameter("b", "int16x8_t", True, False, False)],
        realExe,
        "int16x8_t",
        True,
        "ADD Vd.8H,Vn.8H,Vm.8H",
        None, None, None, None,
        preparation, resolving
    )


def vsubq_s16():
    Parser = get_parser('inst')
    encoding = Parser.parse(
        aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd)
    realExe = ASTShrink(encoding.instExecute)
    resolving = {
        "datasize": 128,
        "esize": 16,
        "elements": 8,
        "sub_op": True,
    }
    preparation = {
        "n": "a",
        "m": "b",
        "d": "result",
    }
    print(realExe)
    return ARMSema(
        "vsubq_s16",
        "SUB",
        [Parameter("a", "int16x8_t", True, False, False),
         Parameter("b", "int16x8_t", True, False, False)],
        realExe,
        "int16x8_t",
        True,
        "SUB Vd.8H,Vn.8H,Vm.8H",
        None, None, None, None,
        preparation, resolving
    )


def genSema(Q: int, U: bool, size: int, unsigned: bool):
    Parser = get_parser('inst')
    ResetUniqueID()
    encoding = Parser.parse(
        aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd)
    realExe = ASTShrink_(encoding.instExecute)
    esize = 8 << size
    datasize = 128 if Q else 64
    elements = datasize//esize
    sub_op = U
    add = not U
    resolving = {
        "datasize": datasize,
        "esize": esize,
        "elements": elements,
        "sub_op": sub_op,
    }
    preparation = {
        "n": "a",
        "m": "b",
        "d": "result",
    }
    itype = f"{'u'if unsigned else ''}int{esize}x{elements}_t"
    instr = "ADD" if add else "SUB"
    instrFormat = f"{instr} Vd.{elements}{'H' if esize==16 else 'B'},Vn.{elements}{'H' if esize==16 else 'B'},Vm.{elements}{'H' if esize==16 else 'B'}"
    return ARMSema(
        f"v{'add' if add else 'sub'}{'q'if Q else ''}_{'u'if unsigned else 's'}{esize}",
        instr,
        [Parameter("a", itype, not unsigned, False, False),
         Parameter("b", itype, not unsigned, False, False)],
        realExe,
        itype,
        True,
        instrFormat,
        None, None, None, None,
        preparation, resolving
    )


def getSemasofar():
    l = []
    for Q in range(2):
        for U in [True, False]:
            for size in range(4):
                for unsigned in [True, False]:
                    z = genSema(Q, U, size, unsigned)
                    print(z)
                    l.append(z)
    return l
