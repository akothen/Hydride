# intr.json
{"name": "vadd_s8", "return_type": {"return_base_type": "int", "element_bit_size": "8", "value": "int8x8_t"}, "arguments": ["int8x8_t a", "int8x8_t b"], "results": [{"Vd.8B": "result"}], "Arguments_Preparation": {"a": {"register": "Vn.8B"}, "b": {"register": "Vm.8B"}}, "Operation": "NeonOperationId_00001", "instruction_group": "Vector arithmetic|Add|Addition", "base_instruction": ["ADD"], "operands": "Vd.8B,Vn.8B,Vm.8B"}

# encodingmap.json
"ABS_asimdmisc_R": "aarch64_vector_arithmetic_unary_diff_neg_int_simd"

# ARMIntrinsicClassify.py genthree()

## IntrinsicsFlags <= intr.json
vadd_s8 Flag(pair=False, sat=False, round=False, base='add', s2u=False, narrow='', q=False, x='', high='', lane='', n=False, result='', type='s8')

## Intrinsics2Encodings <= intr.json, IntrinsicsFlags, judge from base_instruction and Flag
vadd_s8 aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_simd

## Intrinsics2Fields <= intr.json, IntrinsicsFlags, Intrinsics2Encodings, generate possible op code for each intrinsic
vadd_s8 {'Q': '0', 'U': '0', 'size': '00', 'Rm': 'xxxxx', 'opcode': '10000', 'Rn': 'xxxxx', 'Rd': 'xxxxx', 'constraint_ne': []}

# ARMSemanticGen.py <= intr.json, (parser, arm_instrs.sexpr)

## getResult
vmovq_n_s32 ARMSema(intrin='vmovq_n_s32', inst='DUP', params=[Parameter(name='value', type='int32_t', is_signed=True, is_imm=False, is_mask=False)], spec=[VarDeclInit(VarsDecl([Var(element, 0)], ('bits', Var(esize, 1)), 2), ArrayIndex(Var(X, 3), [Var(n, 4)], 5), 6), VarsDecl([Var(result, 7)], ('bits', Var(datasize, 8)), 9), For(Var(e, 10), Number(0), BinaryExpr(-, Var(elements, 11), Number(1), 12), [Update(ArrayIndex(Var(Elem, 13), [Var(result, 14), Var(e, 15), Var(esize, 16)], 17), Var(element, 18))], 1, 19), Update(ArrayIndex(Var(V, 20), [Var(d, 21)], 22), Var(result, 23))], rettype='int32x4_t', ret_is_signed=True, inst_form='DUP Vd.4S,rn', extensions=None, imm_width=None, xed=None, elem_type=None, preparation={'d': 'returnVal', 'n': 'value'}, resolving={'size': 2, 'esize': 32, 'datasize': 128, 'elements': 4})

## ARMAST.py
```python
InstrDesc = namedtuple(
    "InstrDesc", ["name", "return_type", "arguments", "results",
                  "Arguments_Preparation", "Operation", "base_instruction", "operands", "instruction_group"]
)
```
DecodeContext => ASTShrink_ => parse_instr_attr(instr: InstrDesc)

## ARMRoseLang.py
SemaGenerator => CompileSemantics ==> GenerateRosetteForFunction

## ARMRoseCompiler.py

