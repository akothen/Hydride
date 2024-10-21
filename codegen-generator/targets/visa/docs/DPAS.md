<!---======================= begin_copyright_notice ============================

Copyright (C) 2020-2022 Intel Corporation

SPDX-License-Identifier: MIT

============================= end_copyright_notice ==========================-->

## Opcode

  DPAS = 0x83

## Format

| | | | | | | |
| --- | --- | --- | --- | --- | --- | --- |
| 0x83(DPAS) | Exec_size | Dst | Src0 | Src1 | Src2 | W |
|            | A         | SD  | RC   |      |      |   |


## Semantics


```
// Modified heavily to make it consistent with VISARoseCompiler

if (Src1Precision == 16) {
  OPS_PER_CHAN = 2;
} else if (Src1Precision == 8 || Src2Precision == 8) {
  OPS_PER_CHAN = 4;
} else {
  OPS_PER_CHAN = 8;
}

SRC1_OPERANDS_PER_CHAN = 32 / (OPS_PER_CHAN * Src1Precision);

k = 0;
for (r = 0; r < RC; ++r)
{
  temp = src0.R[r];
  for ( i = 0; i < exec_size; ++i )
  { // for each channel
    for (d = 0; d < SD; ++d )
    {
      temp.DW[i] = temp.DW[i] + vnnidot(OPS_PER_CHAN, src2.R[r].DW[d], src1.R[d].DW[i]);
    }
  }
  dst.R[r] = temp;
}

```

## Description





    Integer DPAS is a element wise multiply add and accumulate operation of multiple elements
    in a systolic pipeline with low precision (<= 8 bits) inputs. Src1 is also refered to
    as Weights, and Src2 as Activation. Src1 and Src2's element types are defined by
    Precision W and A, respectively. Src1 is divided into elements along each 32-bit SIMD channel.

    Float DPAS is the same, except its elements are always 16 bits. So each 32-bit channel has
    exactly two elements. And element type is either half float (hf) or bfloat16 (bf).


    The operand precision refers to a type of elements that make up an operand, and generally,
    it is no larger than 8 bits in size (subbyte type) for integer, 16 bits for both bf and hf,
    Currently, the precision is used only in DPAS instruction. And the operand that a precision applies
    to must be of either D or UD type. The following table lists all possible precisions and their text
    and binary formats:

    .. table:: The following table lists all operand precisions:
      :align: center

      +-------------------+-------------+--------+--------+
      | Operand Precision |  Range      | Binary | Text   |
      |                   |             | Format | Format |
      +-------------------+-------------+--------+--------+
      | unused            |             | 0000b  |        |
      +-------------------+-------------+--------+--------+
      | Unsigned 1-bit    | [0, 1]      | 0001b  | u1     |
      +-------------------+-------------+--------+--------+
      | Signed 1-bit      | [-1, 0]     | 0010b  | s1     |
      +-------------------+-------------+--------+--------+
      | Unsigned 2-bits   | [0, 3]      | 0011b  | u2     |
      +-------------------+-------------+--------+--------+
      | Signed 2-bits     | [-2, 1]     | 0100b  | s2     |
      +-------------------+-------------+--------+--------+
      | Unsigned 4-bits   | [0, 15]     | 0101b  | u4     |
      +-------------------+-------------+--------+--------+
      | Signed 4-bits     | [-8, 7]     | 0110b  | s4     |
      +-------------------+-------------+--------+--------+
      | Unsigned 8-bits   | [0, 255]    | 0111b  | u8     |
      +-------------------+-------------+--------+--------+
      | Signed 8-bits     | [-128, 127] | 1000b  | s8     |
      +-------------------+-------------+--------+--------+
      | bfloat            | bfloat16    | 1001b  | bf     |
      +-------------------+-------------+--------+--------+
      | half              | fp16        | 1010b  | hf     |
      +-------------------+-------------+--------+--------+
      | tf32              | tf32        | 1100b  | tf32   |
      +-------------------+-------------+--------+--------+


    The bfloat16 is a 16-bit float type (E8M7, aka truncated IEEE 754 single-precision 32-bit float,
    1-bit sign, 8-bit exponent, 7-bit mantissa). and fp16 is the IEEE 754 half.



    The TF32 is 19-bit tensor float type (E8M10), which has 1-bit sign, 8-bit exponent, and 10-bit mantissa.


    For integer type, the precision of the sources can vary per src1 and src2. For float type, src1
    and src2 must be the same precision (either bf or hf, not mixed). For df type, dst/src0/src1/srcs must
    have same df precision.

    The dst and src0 take a regular integer type (e.g. D or UD) or float type which is 32 bits in size,
    Src0 is used as an accumulator to add operands to. The SD parameter is the systolic depth of the operation,
    meaning we perform a sequence of these operations advancing over successive inputs. The output of each stage
    is a dword (integer or float) or df which is the accumulated input to the next systolic stage. The first stage
    accumulation input is defined via Src0. The last stage accumulated output is written to Dst.

    Not all combinations of operand types are allowed. The following table gives all the legal combinations.
    Note that particular platform might have additional restriction and this spec will follow that
    additional restriction.

    .. table:: All legal combinations of types and precisions.
      :align: center

      +--------+---------+-----------+----------+
      | Dst    |  Src0   | Src1      | Src2     |
      |        |         | Precision | Preision |
      +--------+---------+-----------+----------+
      | UD, D  |  UD,D   | int       | int      |
      +--------+---------+-----------+----------+
      | F, BF  |  F, BF  | BF        | BF       |
      +--------+---------+-----------+----------+
      | F, HF  |  F, HF  | HF        | HF       |
      +--------+---------+-----------+----------+
      | F      |  F      | TF32      | TF32     |
      +--------+---------+-----------+----------+
      | F      |  F      | BF8, HF8  | BF8, HF8 |
      +--------+---------+-----------+----------+


    SD can be encoded as 1, 2, 4, and 8. XEHP+ only supports a systolic depth of 8.



- **Exec_size(ub):** Execution size

  - Bit[2..0]: size of the region for source and destination operands

    - {XEHP}0b011:  8 elements
    - {PVC}0b100:  16 elements
  - Bit[7..4]: execution mask (explicit control over the enabled channels)

    - 0b0000:  M1
    - 0b0001:  M2
    - 0b0010:  M3
    - 0b0011:  M4
    - 0b0100:  M5
    - 0b0101:  M6
    - 0b0110:  M7
    - 0b0111:  M8
    - 0b1000:  M1_NM
    - 0b1001:  M2_NM
    - 0b1010:  M3_NM
    - 0b1011:  M4_NM
    - 0b1100:  M5_NM
    - 0b1101:  M6_NM
    - 0b1110:  M7_NM
    - 0b1111:  M8_NM

- **Dst(raw_operand):** The destination operand.. Must have type D,UD,F,BF,HF,DF


- **Src0(raw_operand):** The source 0 operand. It could be a null operand, meaning it is zero.. Must have type D,UD,F,BF,HF,DF


- **Src1(raw_operand):** The field **W** further defines its element precision. Must have type D,UD,DF


- **Src2(vec_operand):** The field **A** defines its  element precision. Must have type D,UD,DF. Operand class: general


- **W(ub):** The precision of Src1, shown in the table above


- **A(ub):** The precision of Src2, shown in the table above


- **SD(ub):** Systolic depth


- **RC(ub):** Repeat Count


#### Properties
- **Supported Types:** D,F,UD
- **Source Modifier:** false




## Text
```




      DPAS.W.A.SD.RC    (<exec_size>) <dst> <src0> <src1> <src2>
```
## Notes





```

      - **Register region:** No
      - **Alignment:** Dst, Src0, and Src1 are GRF aligned; for interger or float(bf, hf) DPAS, Src2 is
        (SD/(32/(Src2PrecisionInBits * OPS_PER_CHAN))) DWORD aligned. That is, for SD=8 and OPS_PER_CHAN=4,
        src2 would be 8 DWORD aligned for s8/u8 precision; 4 DWORD aligned for s4/u4; and 2 DWORD aligned
        for s2/u2.

      Src2 type should be consistent with Src1's, that is, if Src1 is an integer type, Src2 must be an integer
      type; if Src1 is bf, Src2 must be bf; if Src1 is hf, Src2 must be hf too.
      Here are some examples:

      -  DPAS.u4.s8.8.8  (Exec_size) <dst> <src0> <src1> <src2>   // int DPAS with u4 for src1 and s8 for src1
      -  DPAS.bf.bf.8.8  (Exec_size) <dst> <src0> <src1> <src2>   // float DPAS with bfloat as element type
      -  DPAS.hf.hf.8.8  (Exec_size) <dst> <src0> <src1> <src2>   // float DPAS with half as element type

      Also note that Src2 Should be uniform, meaning the entire Src2 is used by every simd lanes.

      Exec_size is 16 for PVC and 8 otherwise for int or float DPAS.

```

