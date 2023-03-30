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
