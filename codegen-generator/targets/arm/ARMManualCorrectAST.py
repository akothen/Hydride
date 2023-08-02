from ARMAST import *
qrdmulh_common= """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 2)) if rounding else 0);
            integer element1;
            integer element2;
            integer product;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = (((element1) * element2) + round_const);
                Elem[result,e,esize] = (SignedSatQ((product), 2*esize) >> (esize-1))[0~(esize-1)];
            }
            V[d] = result;
        }"""
qrdmuh_n_common="""        {
            bits(datasize) operand1 = V[n];
            bits(idxdsize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 2)) if round else 0);
            integer element1;
            integer element2;
            integer product;
            boolean sat;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = (((element1) * element2) + round_const);
                Elem[result,e,esize] = (SignedSatQ((product), 2*esize) >> (esize-1))[0~(esize-1)];
            }
            V[d] = result;
        }"""
negabssat_common="""        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            integer element2;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                if neg then
                {
                    element2 = (- element);
                }
                else
                {
                    element2 = Abs(element);
                }
                Elem[result,e,esize] = SignedSatQ(element2, esize);
            }
            V[d] = result;
        }"""
negabs_common="""        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            integer element2;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                if neg then
                {
                    element2 = (- element);
                }
                else
                {
                    element2 = Abs(element);
                }
                Elem[result,e,esize] = element2[0~(esize - 1)];
            }
            V[d] = result;
        }"""
ManualAST = {
    "aarch64_vector_arithmetic_binary_uniform_diff": {
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
            boolean accumulate = (ac == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(datasize) result2;
            integer element1;
            integer element2;
            bits(esize) absdiff;
            result = (V[d] if accumulate else Zeros());
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                absdiff = Abs((element1 - element2))[0~(esize - 1)];
                Elem[result2,e,esize] = (Elem[result,e,esize] + absdiff);
            }
            V[d] = result2;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_diff": {
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean accumulate = (op == '0');
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) result;
            bits((2 * datasize)) result2;
            integer element1;
            integer element2;
            bits((2 * esize)) absdiff;
            result = (V[d] if accumulate else Zeros());
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                absdiff = Abs((element1 - element2))[0~((2 * esize) - 1)];
                Elem[result2,e,(2 * esize)] = (Elem[result,e,(2 * esize)] + absdiff);
            }
            V[d] = result2;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_mul_int_dotp": {
        "decode": """        {
            if (! HaveDOTPExt()) then
            {
                UNDEFINED
            }
            if (size != '10') then
            {
                UNDEFINED
            }
            boolean signed = (U == '0');
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(datasize) result2;
            result = V[d];
            for e = 0 to (elements - 1)
            {
                integer zero, res0, res1, res2, res3;
                integer element10, element20, element11, element21, element12, element22, element13, element23;
                if signed then
                {
                    element10 = SInt(Elem[operand1,((4 * e) + 0),(esize DIV 4)]);
                    element20 = SInt(Elem[operand2,((4 * e) + 0),(esize DIV 4)]);
                    res0 = element10*element20;
                    element11 = SInt(Elem[operand1,((4 * e) + 1),(esize DIV 4)]);
                    element21 = SInt(Elem[operand2,((4 * e) + 1),(esize DIV 4)]);
                    res1 = element11*element21;
                    element12 = SInt(Elem[operand1,((4 * e) + 2),(esize DIV 4)]);
                    element22 = SInt(Elem[operand2,((4 * e) + 2),(esize DIV 4)]);
                    res2 = element12*element22;
                    element13 = SInt(Elem[operand1,((4 * e) + 3),(esize DIV 4)]);
                    element23 = SInt(Elem[operand2,((4 * e) + 3),(esize DIV 4)]);
                    res3 = element13*element23;
                    zero = Elem[result,e,esize];
                }
                else
                {
                    element10 = UInt(Elem[operand1,((4 * e) + 0),(esize DIV 4)]);
                    element20 = UInt(Elem[operand2,((4 * e) + 0),(esize DIV 4)]);
                    res0 = element10*element20;
                    element11 = UInt(Elem[operand1,((4 * e) + 1),(esize DIV 4)]);
                    element21 = UInt(Elem[operand2,((4 * e) + 1),(esize DIV 4)]);
                    res1 = element11*element21;
                    element12 = UInt(Elem[operand1,((4 * e) + 2),(esize DIV 4)]);
                    element22 = UInt(Elem[operand2,((4 * e) + 2),(esize DIV 4)]);
                    res2 = element12*element22;
                    element13 = UInt(Elem[operand1,((4 * e) + 3),(esize DIV 4)]);
                    element23 = UInt(Elem[operand2,((4 * e) + 3),(esize DIV 4)]);
                    res3 = element13*element23;
                    zero = Elem[result,e,esize];
                }
                Elem[result2,e,esize] = (zero + res0 + res1 + res2 + res3);
            }
            V[d] = result2;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_dotp": {
        "decode": """        {
            if (! HaveDOTPExt()) then
            {
                UNDEFINED
            }
            if (size != '10') then
            {
                UNDEFINED
            }
            boolean signed = (U == '0');
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt((M : Rm));
            integer index = UInt((H : L));
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(128) operand2 = V[m];
            bits(datasize) result = V[d];
            for e = 0 to (elements - 1)
            {
                integer zero, res0, res1, res2, res3;
                integer element10, element20, element11, element21, element12, element22, element13, element23;
                if signed then
                {
                    element10 = SInt(Elem[operand1,((4 * e) + 0),(esize DIV 4)]);
                    element20 = SInt(Elem[operand2,((4 * index) + 0),(esize DIV 4)]);
                    res0 = element10*element20;
                    element11 = SInt(Elem[operand1,((4 * e) + 1),(esize DIV 4)]);
                    element21 = SInt(Elem[operand2,((4 * index) + 1),(esize DIV 4)]);
                    res1 = element11*element21;
                    element12 = SInt(Elem[operand1,((4 * e) + 2),(esize DIV 4)]);
                    element22 = SInt(Elem[operand2,((4 * index) + 2),(esize DIV 4)]);
                    res2 = element12*element22;
                    element13 = SInt(Elem[operand1,((4 * e) + 3),(esize DIV 4)]);
                    element23 = SInt(Elem[operand2,((4 * index) + 3),(esize DIV 4)]);
                    res3 = element13*element23;
                    zero = Elem[result,e,esize];
                }
                else
                {
                    element10 = UInt(Elem[operand1,((4 * e) + 0),(esize DIV 4)]);
                    element20 = UInt(Elem[operand2,((4 * index) + 0),(esize DIV 4)]);
                    res0 = element10*element20;
                    element11 = UInt(Elem[operand1,((4 * e) + 1),(esize DIV 4)]);
                    element21 = UInt(Elem[operand2,((4 * index) + 1),(esize DIV 4)]);
                    res1 = element11*element21;
                    element12 = UInt(Elem[operand1,((4 * e) + 2),(esize DIV 4)]);
                    element22 = UInt(Elem[operand2,((4 * index) + 2),(esize DIV 4)]);
                    res2 = element12*element22;
                    element13 = UInt(Elem[operand1,((4 * e) + 3),(esize DIV 4)]);
                    element23 = UInt(Elem[operand2,((4 * index) + 3),(esize DIV 4)]);
                    res3 = element13*element23;
                    zero = Elem[result,e,esize];
                }
                Elem[result2,e,esize] = (zero + res0 + res1 + res2 + res3);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_reduce_add_simd": {  # No other ways to match vaddv_s32 to any encoding
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            ReduceOp op = ReduceOp_ADD;
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            V[d] = Reduce(op, operand, esize);
        }""",
    },
    "aarch64_vector_arithmetic_unary_add_pairwise": {
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV (2 * esize));
            boolean acc = (op == '1');
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            bits(datasize) result2;
            bits((2 * esize)) sum;
            integer op1;
            integer op2;
            result = (V[d] if acc else Zeros());
            for e = 0 to (elements - 1)
            {
                op1 = Int(Elem[operand,((2 * e) + 0),esize], unsigned);
                op2 = Int(Elem[operand,((2 * e) + 1),esize], unsigned);
                sum = (op1 + op2)[0~((2 * esize) - 1)];
                Elem[result2,e,(2 * esize)] = (Elem[result,e,(2 * esize)] + sum);
            }
            V[d] = result2;
        }""",
    },
    "combine_handcrafted": {
        "decode": """
        """,
        "execute": """{
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            V[d] = operand2[0~(datasize-1)]:operand1[0~(datasize-1)];
        }"""
    },
    "get_handcrafted": {
        "decode": """
        """,
        "execute": """{
            bits(2*datasize) operand = V[n];
            if part then {
                V[d] = operand[(datasize)~((2 * datasize) - 1)];
            }
            else {
                V[d] = operand[0~(datasize - 1)];
            }
        }"""
    },
    # "pad_l_handcrafted": {
    #     "decode": """
    #     """,
    #     "execute": """{
    #         bits(datasize) operand = V[n];
    #         bits(datasize) result;
    #         bits(datasize) result2;

    #         bits(2*esize) sum;
    #         integer op1;
    #         integer op2;

    #         if acc then result = V[d];
    #         for e = 0 to elements-1
    #             op1 = Int(Elem[operand, 2*e+0, esize], unsigned);
    #             op2 = Int(Elem[operand, 2*e+1, esize], unsigned);
    #             sum = (op1 + op2)[0~(2*esize-1)];
    #             if acc then
    #                 Elem[result2, e, 2*esize] = Elem[result, e, 2*esize] + sum;
    #             else
    #                 Elem[result2, e, 2*esize] = sum;

    #         V[d] = result2;
    #     }"""
    # }
    "aarch64_vector_arithmetic_binary_uniform_mul_int_doubling_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size == '11') || (size == '00')) then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean rounding = (U == '1');
        }""",
        "execute": qrdmulh_common,
    },
    "aarch64_vector_arithmetic_binary_uniform_mul_int_doubling_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size == '11') || (size == '00')) then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean rounding = (U == '1');
        }""",
        "execute":qrdmulh_common,
    },
    "aarch64_vector_arithmetic_binary_element_mul_high_sisd":{
        "decode": """        {
            integer idxdsize = (128 if (H == '1') else 64);
            integer index;
            bit Rmhi;
            case size of
            {
                when '01' of
                {
                    index = UInt(((H : L) : M));
                    Rmhi = '0';
                }
                when '10' of
                {
                    index = UInt((H : L));
                    Rmhi = M;
                }
                otherwise
                {
                    UNDEFINED
                }
            }
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt((Rmhi : Rm));
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean round = (op == '1');
        }""",
        "execute": qrdmuh_n_common,
    },
    "aarch64_vector_arithmetic_binary_element_mul_high_simd":{
        "decode": """        {
            integer idxdsize = (128 if (H == '1') else 64);
            integer index;
            bit Rmhi;
            case size of
            {
                when '01' of
                {
                    index = UInt(((H : L) : M));
                    Rmhi = '0';
                }
                when '10' of
                {
                    index = UInt((H : L));
                    Rmhi = M;
                }
                otherwise
                {
                    UNDEFINED
                }
            }
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt((Rmhi : Rm));
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean round = (op == '1');
        }""",
        "execute": qrdmuh_n_common,
    },
    "aarch64_vector_arithmetic_unary_diff_neg_int_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size != '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean neg = (U == '1');
        }""",
        "execute": negabs_common,
    },
    "aarch64_vector_arithmetic_unary_diff_neg_int_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean neg = (U == '1');
        }""",
        "execute": negabs_common,
    },
    "aarch64_vector_arithmetic_unary_diff_neg_sat_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean neg = (U == '1');
        }""",
        "execute": negabssat_common,
    },
    "aarch64_vector_arithmetic_unary_diff_neg_sat_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean neg = (U == '1');
        }""",
        "execute": negabssat_common
    },"aarch64_vector_arithmetic_binary_disparate_add_sub_narrow":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean sub_op = (o1 == '1');
            boolean round = (U == '1');
        }""",
        "execute": """        {
            bits((2 * datasize)) operand1 = V[n];
            bits((2 * datasize)) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 1)) if round else 0);
            bits((2 * esize)) element1;
            bits((2 * esize)) element2;
            bits((2 * esize)) sum;
            bits((2 * esize)) sum2;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,(2 * esize)];
                element2 = Elem[operand2,e,(2 * esize)];
                if sub_op then
                {
                    sum = (element1 - element2);
                }
                else
                {
                    sum = (element1 + element2);
                }
                sum2 = (sum + round_const);
                Elem[result,e,esize] = sum2[esize~((2 * esize) - 1)];
            }
            Vpart[d,part] = result;
        }""",
    },
    
}

