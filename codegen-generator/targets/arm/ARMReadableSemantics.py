map2Code = {
    "aarch64_vector_arithmetic_binary_disparate_mul_dmacc_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size == '00') || (size == '11')) then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            integer part = 0;
            boolean sub_op = (o1 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) operand3 = V[d];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            integer accum;
            boolean sat1;
            boolean sat2;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                if sub_op then
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) - SInt(product));
                }
                else
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) + SInt(product));
                }
                Elem[result,e,(2 * esize)] = SignedSatQ(accum, (2 * esize));
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_mul_dmacc_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size == '00') || (size == '11')) then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean sub_op = (o1 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) operand3 = V[d];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            integer accum;
            boolean sat1;
            boolean sat2;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                if sub_op then
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) - SInt(product));
                }
                else
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) + SInt(product));
                }
                Elem[result,e,(2 * esize)] = SignedSatQ(accum, (2 * esize));
            }
            V[d] = result;
        }""",
    },
    "aarch64_memory_vector_multiple_no_wb":{
        "decode": """        {
            integer t = UInt(Rt);
            integer n = UInt(Rn);
            integer m = 0;
            boolean wback = FALSE;
            boolean tag_checked = (wback || (n != 31));
            MemOp memop = (MemOp_LOAD if (L == '1') else MemOp_STORE);
            integer datasize = (128 if (Q == '1') else 64);
            integer esize = (8 << UInt(size));
            integer elements = (datasize DIV esize);
            integer rpt;
            integer selem;
            case opcode of
            {
                when '0000' of
                {
                    rpt = 1;
                    selem = 4;
                }
                when '0010' of
                {
                    rpt = 4;
                    selem = 1;
                }
                when '0100' of
                {
                    rpt = 1;
                    selem = 3;
                }
                when '0110' of
                {
                    rpt = 3;
                    selem = 1;
                }
                when '0111' of
                {
                    rpt = 1;
                    selem = 1;
                }
                when '1000' of
                {
                    rpt = 1;
                    selem = 2;
                }
                when '1010' of
                {
                    rpt = 2;
                    selem = 1;
                }
                otherwise
                {
                    UNDEFINED
                }
            }
            if (((size : Q) == '110') && (selem != 1)) then
            {
                UNDEFINED
            }
        }""",
        "execute": """        {
            bits(64) address;
            bits(64) offs;
            bits(datasize) rval;
            integer tt;
            integer ebytes = (esize DIV 8);
            if HaveMTEExt() then
            {
            }
            if (n == 31) then
            {
                address = SP[];
            }
            else
            {
                address = X[n];
            }
            offs = Zeros();
            for r = 0 to (rpt - 1)
            {
                for e = 0 to (elements - 1)
                {
                    tt = ((t + r) MOD 32);
                    for s = 0 to (selem - 1)
                    {
                        rval = V[tt];
                        if (memop == MemOp_LOAD) then
                        {
                            Elem[rval,e,esize] = Mem[(address + offs),ebytes,AccType_VEC];
                            V[tt] = rval;
                        }
                        else
                        {
                            Mem[(address + offs),ebytes,AccType_VEC] = Elem[rval,e,esize];
                        }
                        offs = (offs + ebytes);
                        tt = ((tt + 1) MOD 32);
                    }
                }
            }
            if wback then
            {
                if (m != 31) then
                {
                    offs = X[m];
                }
                if (n == 31) then
                {
                    SP[] = (address + offs);
                }
                else
                {
                    X[n] = (address + offs);
                }
            }
        }""",
    },
    "aarch64_vector_shift_right_narrow_logical":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
            }
            if (immh[3] == '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            integer shift = ((2 * esize) - UInt((immh : immb)));
            boolean round = (op == '1');
        }""",
        "execute": """        {
            bits((datasize * 2)) operand = V[n];
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            for e = 0 to (elements - 1)
            {
                element = ((UInt(Elem[operand,e,(2 * esize)]) + round_const) >> shift);
                Elem[result,e,esize] = element[0~(esize - 1)];
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_add_sub_wide":{
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
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits((2 * datasize)) operand1 = V[n];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            integer sum;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,(2 * esize)], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                if sub_op then
                {
                    sum = (element1 - element2);
                }
                else
                {
                    sum = (element1 + element2);
                }
                Elem[result,e,(2 * esize)] = sum[0~((2 * esize) - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_max_min_single":{
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
            boolean minimum = (o1 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer maxmin;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                maxmin = (Min(element1, element2) if minimum else Max(element1, element2));
                Elem[result,e,esize] = maxmin[0~(esize - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_mul_accum":{
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
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) operand3 = V[d];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            bits((2 * esize)) accum;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                product = (element1 * element2)[0~((2 * esize) - 1)];
                if sub_op then
                {
                    accum = (Elem[operand3,e,(2 * esize)] - product);
                }
                else
                {
                    accum = (Elem[operand3,e,(2 * esize)] + product);
                }
                Elem[result,e,(2 * esize)] = accum;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_max_min_pair":{
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
            boolean minimum = (o1 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits((2 * datasize)) concat = (operand2 : operand1);
            integer element1;
            integer element2;
            integer maxmin;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[concat,(2 * e),esize], unsigned);
                element2 = Int(Elem[concat,((2 * e) + 1),esize], unsigned);
                maxmin = (Min(element1, element2) if minimum else Max(element1, element2));
                Elem[result,e,esize] = maxmin[0~(esize - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_cpy_dup_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer size = LowestSetBit(imm5);
            if (size > 3) then
            {
                UNDEFINED
            }
            integer index = UInt(imm5[(size + 1)~4]);
            integer idxdsize = (128 if (imm5[4] == '1') else 64);
            integer esize = (8 << size);
            integer datasize = esize;
            integer elements = 1;
        }""",
        "execute": """        {
            bits(idxdsize) operand = V[n];
            bits(datasize) result;
            bits(esize) element;
            element = Elem[operand,index,esize];
            for e = 0 to (elements - 1)
            {
                Elem[result,e,esize] = element;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_cpy_dup_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer size = LowestSetBit(imm5);
            if (size > 3) then
            {
                UNDEFINED
            }
            integer index = UInt(imm5[(size + 1)~4]);
            integer idxdsize = (128 if (imm5[4] == '1') else 64);
            if ((size == 3) && (Q == '0')) then
            {
                UNDEFINED
            }
            integer esize = (8 << size);
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(idxdsize) operand = V[n];
            bits(datasize) result;
            bits(esize) element;
            element = Elem[operand,index,esize];
            for e = 0 to (elements - 1)
            {
                Elem[result,e,esize] = element;
            }
            V[d] = result;
        }""",
    },
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
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 1)) if rounding else 0);
            integer element1;
            integer element2;
            integer product;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = (((2 * element1) * element2) + round_const);
                Elem[result,e,esize] = SignedSatQ((product >> esize), esize);
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 1)) if rounding else 0);
            integer element1;
            integer element2;
            integer product;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = (((2 * element1) * element2) + round_const);
                Elem[result,e,esize] = SignedSatQ((product >> esize), esize);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_add_sub_long":{
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
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            integer sum;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                if sub_op then
                {
                    sum = (element1 - element2);
                }
                else
                {
                    sum = (element1 + element2);
                }
                Elem[result,e,(2 * esize)] = sum[0~((2 * esize) - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_add_sub_narrow":{
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
                sum = (sum + round_const);
                Elem[result,e,esize] = sum[esize~((2 * esize) - 1)];
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_halving_rounding":{
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
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                Elem[result,e,esize] = ((element1 + element2) + 1)[1~esize];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_shift_right_narrow_uniform_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
                UNDEFINED
            }
            if (immh[3] == '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = esize;
            integer elements = 1;
            integer part = 0;
            integer shift = ((2 * esize) - UInt((immh : immb)));
            boolean round = (op == '1');
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits((datasize * 2)) operand = V[n];
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = ((Int(Elem[operand,e,(2 * esize)], unsigned) + round_const) >> shift);
                Elem[result,e,esize] = SatQ(element, esize, unsigned);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_shift_right_narrow_uniform_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
            }
            if (immh[3] == '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            integer shift = ((2 * esize) - UInt((immh : immb)));
            boolean round = (op == '1');
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits((datasize * 2)) operand = V[n];
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = ((Int(Elem[operand,e,(2 * esize)], unsigned) + round_const) >> shift);
                Elem[result,e,esize] = SatQ(element, esize, unsigned);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_acc_double_sisd":{
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
            integer part = 0;
            boolean sub_op = (o2 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(idxdsize) operand2 = V[m];
            bits((2 * datasize)) operand3 = V[d];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            integer accum;
            boolean sat1;
            boolean sat2;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                if sub_op then
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) - SInt(product));
                }
                else
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) + SInt(product));
                }
                Elem[result,e,(2 * esize)] = SignedSatQ(accum, (2 * esize));
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_acc_double_simd":{
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
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean sub_op = (o2 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(idxdsize) operand2 = V[m];
            bits((2 * datasize)) operand3 = V[d];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            integer accum;
            boolean sat1;
            boolean sat2;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                if sub_op then
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) - SInt(product));
                }
                else
                {
                    accum = (SInt(Elem[operand3,e,(2 * esize)]) + SInt(product));
                }
                Elem[result,e,(2 * esize)] = SignedSatQ(accum, (2 * esize));
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_acc_int":{
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
            boolean sub_op = (o2 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(idxdsize) operand2 = V[m];
            bits(datasize) operand3 = V[d];
            bits(datasize) result;
            integer element1;
            integer element2;
            bits(esize) product;
            element2 = UInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = UInt(Elem[operand1,e,esize]);
                product = (element1 * element2)[0~(esize - 1)];
                if sub_op then
                {
                    Elem[result,e,esize] = (Elem[operand3,e,esize] - product);
                }
                else
                {
                    Elem[result,e,esize] = (Elem[operand3,e,esize] + product);
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_memory_vector_single_no_wb":{
        "decode": """        {
            integer t = UInt(Rt);
            integer n = UInt(Rn);
            integer m = 0;
            boolean wback = FALSE;
            boolean tag_checked = (wback || (n != 31));
            integer scale = UInt(opcode[1~2]);
            integer selem = (UInt((opcode[0] : R)) + 1);
            boolean replicate = FALSE;
            integer index;
            case scale of
            {
                when 3 of
                {
                    if ((L == '0') || (S == '1')) then
                    {
                        UNDEFINED
                    }
                    scale = UInt(size);
                    replicate = TRUE;
                }
                when 0 of
                {
                    index = UInt(((Q : S) : size));
                }
                when 1 of
                {
                    if (size[0] == '1') then
                    {
                        UNDEFINED
                    }
                    index = UInt(((Q : S) : size[1]));
                }
                when 2 of
                {
                    if (size[1] == '1') then
                    {
                        UNDEFINED
                    }
                    if (size[0] == '0') then
                    {
                        index = UInt((Q : S));
                    }
                    else
                    {
                        if (S == '1') then
                        {
                            UNDEFINED
                        }
                        index = UInt(Q);
                        scale = 3;
                    }
                }
            }
            MemOp memop = (MemOp_LOAD if (L == '1') else MemOp_STORE);
            integer datasize = (128 if (Q == '1') else 64);
            integer esize = (8 << scale);
        }""",
        "execute": """        {
            if HaveMTEExt() then
            {
            }
            bits(64) address;
            bits(64) offs;
            bits(128) rval;
            bits(esize) element;
            integer ebytes = (esize DIV 8);
            if (n == 31) then
            {
                address = SP[];
            }
            else
            {
                address = X[n];
            }
            offs = Zeros();
            if replicate then
            {
                for s = 0 to (selem - 1)
                {
                    element = Mem[(address + offs),ebytes,AccType_VEC];
                    V[t] = Replicate(element, (datasize DIV esize));
                    offs = (offs + ebytes);
                    t = ((t + 1) MOD 32);
                }
            }
            else
            {
                for s = 0 to (selem - 1)
                {
                    rval = V[t];
                    if (memop == MemOp_LOAD) then
                    {
                        Elem[rval,index,esize] = Mem[(address + offs),ebytes,AccType_VEC];
                        V[t] = rval;
                    }
                    else
                    {
                        Mem[(address + offs),ebytes,AccType_VEC] = Elem[rval,index,esize];
                    }
                    offs = (offs + ebytes);
                    t = ((t + 1) MOD 32);
                }
            }
            if wback then
            {
                if (m != 31) then
                {
                    offs = X[m];
                }
                if (n == 31) then
                {
                    SP[] = (address + offs);
                }
                else
                {
                    X[n] = (address + offs);
                }
            }
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_diff":{
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
            integer element1;
            integer element2;
            bits(esize) absdiff;
            result = (V[d] if accumulate else Zeros());
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                absdiff = Abs((element1 - element2))[0~(esize - 1)];
                Elem[result,e,esize] = (Elem[result,e,esize] + absdiff);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_cmp_int_lessthan_sisd":{
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
            CompareOp comparison = CompareOp_LT;
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                case comparison of
                {
                    when 0 of
                    {
                        test_passed = (element > 0);
                    }
                    when 1 of
                    {
                        test_passed = (element >= 0);
                    }
                    when 2 of
                    {
                        test_passed = (element == 0);
                    }
                    when 3 of
                    {
                        test_passed = (element <= 0);
                    }
                    when 4 of
                    {
                        test_passed = (element < 0);
                    }
                }
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_cmp_int_lessthan_simd":{
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
            CompareOp comparison = CompareOp_LT;
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                case comparison of
                {
                    when 0 of
                    {
                        test_passed = (element > 0);
                    }
                    when 1 of
                    {
                        test_passed = (element >= 0);
                    }
                    when 2 of
                    {
                        test_passed = (element == 0);
                    }
                    when 3 of
                    {
                        test_passed = (element <= 0);
                    }
                    when 4 of
                    {
                        test_passed = (element < 0);
                    }
                }
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_shift_right_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh[3] != '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << 3);
            integer datasize = esize;
            integer elements = 1;
            integer shift = ((esize * 2) - UInt((immh : immb)));
            boolean unsigned = (U == '1');
            boolean round = (o1 == '1');
            boolean accumulate = (o0 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) operand2;
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            operand2 = (V[d] if accumulate else Zeros());
            for e = 0 to (elements - 1)
            {
                element = ((Int(Elem[operand,e,esize], unsigned) + round_const) >> shift);
                Elem[result,e,esize] = (Elem[operand2,e,esize] + element[0~(esize - 1)]);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_shift_right_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
            }
            if ((immh[3] : Q) == '10') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            integer shift = ((esize * 2) - UInt((immh : immb)));
            boolean unsigned = (U == '1');
            boolean round = (o1 == '1');
            boolean accumulate = (o0 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) operand2;
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            operand2 = (V[d] if accumulate else Zeros());
            for e = 0 to (elements - 1)
            {
                element = ((Int(Elem[operand,e,esize], unsigned) + round_const) >> shift);
                Elem[result,e,esize] = (Elem[operand2,e,esize] + element[0~(esize - 1)]);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_wrapping_pair":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits((2 * datasize)) concat = (operand2 : operand1);
            bits(esize) element1;
            bits(esize) element2;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[concat,(2 * e),esize];
                element2 = Elem[concat,((2 * e) + 1),esize];
                Elem[result,e,esize] = (element1 + element2);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_logical_bsl_eor":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            integer esize = 8;
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            VBitOp op;
            case opc2 of
            {
                when '00' of
                {
                    op = VBitOp_VEOR;
                }
                when '01' of
                {
                    op = VBitOp_VBSL;
                }
                when '10' of
                {
                    op = VBitOp_VBIT;
                }
                when '11' of
                {
                    op = VBitOp_VBIF;
                }
            }
        }""",
        "execute": """        {
            bits(datasize) operand1;
            bits(datasize) operand2;
            bits(datasize) operand3;
            bits(datasize) operand4 = V[n];
            case op of
            {
                when 3 of
                {
                    operand1 = V[m];
                    operand2 = Zeros();
                    operand3 = Ones();
                }
                when 2 of
                {
                    operand1 = V[m];
                    operand2 = operand1;
                    operand3 = V[d];
                }
                when 1 of
                {
                    operand1 = V[d];
                    operand2 = operand1;
                    operand3 = V[m];
                }
                when 0 of
                {
                    operand1 = V[d];
                    operand2 = operand1;
                    operand3 = NOT(V[m]);
                }
            }
            V[d] = (operand1 EOR ((operand2 EOR operand4) AND operand3));
        }""",
    },
    "aarch64_vector_arithmetic_unary_add_pairwise":{
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
            bits((2 * esize)) sum;
            integer op1;
            integer op2;
            result = (V[d] if acc else Zeros());
            for e = 0 to (elements - 1)
            {
                op1 = Int(Elem[operand,((2 * e) + 0),esize], unsigned);
                op2 = Int(Elem[operand,((2 * e) + 1),esize], unsigned);
                sum = (op1 + op2)[0~((2 * esize) - 1)];
                Elem[result,e,(2 * esize)] = (Elem[result,e,(2 * esize)] + sum);
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                if neg then
                {
                    element = (- element);
                }
                else
                {
                    element = Abs(element);
                }
                Elem[result,e,esize] = element[0~(esize - 1)];
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                if neg then
                {
                    element = (- element);
                }
                else
                {
                    element = Abs(element);
                }
                Elem[result,e,esize] = element[0~(esize - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_mul_double_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size == '00') || (size == '11')) then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            integer part = 0;
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                Elem[result,e,(2 * esize)] = product;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_mul_double_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size == '00') || (size == '11')) then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                element2 = SInt(Elem[operand2,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                Elem[result,e,(2 * esize)] = product;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_shift_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean unsigned = (U == '1');
            boolean rounding = (R == '1');
            boolean saturating = (S == '1');
            if ((S == '0') && (size != '11')) then
            {
                UNDEFINED
            }
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = 0;
            integer shift;
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                shift = SInt(Elem[operand2,e,esize]);
                if rounding then
                {
                    round_const = (1 << ((- shift) - 1));
                }
                element = ((Int(Elem[operand1,e,esize], unsigned) + round_const) << shift);
                if saturating then
                {
                    Elem[result,e,esize] = SatQ(element, esize, unsigned);
                }
                else
                {
                    Elem[result,e,esize] = element[0~(esize - 1)];
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_shift_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
            boolean rounding = (R == '1');
            boolean saturating = (S == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = 0;
            integer shift;
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                shift = SInt(Elem[operand2,e,esize]);
                if rounding then
                {
                    round_const = (1 << ((- shift) - 1));
                }
                element = ((Int(Elem[operand1,e,esize], unsigned) + round_const) << shift);
                if saturating then
                {
                    Elem[result,e,esize] = SatQ(element, esize, unsigned);
                }
                else
                {
                    Elem[result,e,esize] = element[0~(esize - 1)];
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_permute_unzip":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            integer part = UInt(op);
        }""",
        "execute": """        {
            bits(datasize) operandl = V[n];
            bits(datasize) operandh = V[m];
            bits(datasize) result;
            bits((datasize * 2)) zipped = (operandh : operandl);
            for e = 0 to (elements - 1)
            {
                Elem[result,e,esize] = Elem[zipped,((2 * e) + part),esize];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_add_saturating_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            bits(datasize) operand2 = V[d];
            integer op1;
            integer op2;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                op1 = Int(Elem[operand,e,esize], (! unsigned));
                op2 = Int(Elem[operand2,e,esize], unsigned);
                Elem[result,e,esize] = SatQ((op1 + op2), esize, unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_add_saturating_simd":{
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
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            bits(datasize) operand2 = V[d];
            integer op1;
            integer op2;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                op1 = Int(Elem[operand,e,esize], (! unsigned));
                op2 = Int(Elem[operand2,e,esize], unsigned);
                Elem[result,e,esize] = SatQ((op1 + op2), esize, unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_saturating_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer sum;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                sum = (element1 + element2);
                Elem[result,e,esize] = SatQ(sum, esize, unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_saturating_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer sum;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                sum = (element1 + element2);
                Elem[result,e,esize] = SatQ(sum, esize, unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_shift_right_narrow_nonuniform_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
                UNDEFINED
            }
            if (immh[3] == '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = esize;
            integer elements = 1;
            integer part = 0;
            integer shift = ((2 * esize) - UInt((immh : immb)));
            boolean round = (op == '1');
        }""",
        "execute": """        {
            bits((datasize * 2)) operand = V[n];
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = ((SInt(Elem[operand,e,(2 * esize)]) + round_const) >> shift);
                Elem[result,e,esize] = UnsignedSatQ(element, esize);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_shift_right_narrow_nonuniform_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
            }
            if (immh[3] == '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            integer shift = ((2 * esize) - UInt((immh : immb)));
            boolean round = (op == '1');
        }""",
        "execute": """        {
            bits((datasize * 2)) operand = V[n];
            bits(datasize) result;
            integer round_const = ((1 << (shift - 1)) if round else 0);
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = ((SInt(Elem[operand,e,(2 * esize)]) + round_const) >> shift);
                Elem[result,e,esize] = UnsignedSatQ(element, esize);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_long":{
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
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(idxdsize) operand2 = V[m];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            element2 = Int(Elem[operand2,index,esize], unsigned);
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                product = (element1 * element2)[0~((2 * esize) - 1)];
                Elem[result,e,(2 * esize)] = product;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_logical_and_orr":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            integer esize = 8;
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean invert = (size[0] == '1');
            LogicalOp op = (LogicalOp_ORR if (size[1] == '1') else LogicalOp_AND);
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            if invert then
            {
                operand2 = NOT(operand2);
            }
            case op of
            {
                when 0 of
                {
                    result = (operand1 AND operand2);
                }
                when 2 of
                {
                    result = (operand1 OR operand2);
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_sub_int":{
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
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer diff;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                diff = (element1 - element2);
                Elem[result,e,esize] = diff[1~esize];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_sub_saturating_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer diff;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                diff = (element1 - element2);
                Elem[result,e,esize] = SatQ(diff, esize, unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_sub_saturating_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer diff;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                diff = (element1 - element2);
                Elem[result,e,esize] = SatQ(diff, esize, unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_dotp":{
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
                integer res = 0;
                integer element1, element2;
                for i = 0 to 3
                {
                    if signed then
                    {
                        element1 = SInt(Elem[operand1,((4 * e) + i),(esize DIV 4)]);
                        element2 = SInt(Elem[operand2,((4 * index) + i),(esize DIV 4)]);
                    }
                    else
                    {
                        element1 = UInt(Elem[operand1,((4 * e) + i),(esize DIV 4)]);
                        element2 = UInt(Elem[operand2,((4 * index) + i),(esize DIV 4)]);
                    }
                    res = (res + (element1 * element2));
                }
                Elem[result,e,esize] = (Elem[result,e,esize] + res);
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                if neg then
                {
                    element = (- element);
                }
                else
                {
                    element = Abs(element);
                }
                Elem[result,e,esize] = SignedSatQ(element, esize);
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                if neg then
                {
                    element = (- element);
                }
                else
                {
                    element = Abs(element);
                }
                Elem[result,e,esize] = SignedSatQ(element, esize);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_cmp_bitwise_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if (size != '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean and_test = (U == '0');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(esize) element1;
            bits(esize) element2;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,esize];
                element2 = Elem[operand2,e,esize];
                if and_test then
                {
                    test_passed = (! IsZero((element1 AND element2)));
                }
                else
                {
                    test_passed = (element1 == element2);
                }
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_cmp_bitwise_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean and_test = (U == '0');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(esize) element1;
            bits(esize) element2;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,esize];
                element2 = Elem[operand2,e,esize];
                if and_test then
                {
                    test_passed = (! IsZero((element1 AND element2)));
                }
                else
                {
                    test_passed = (element1 == element2);
                }
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_reduce_add_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size != '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (esize * 2);
            integer elements = 2;
            ReduceOp op = ReduceOp_ADD;
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            V[d] = Reduce(op, operand, esize);
        }""",
    },
    "aarch64_vector_shift_left_sat_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = esize;
            integer elements = 1;
            integer shift = (UInt((immh : immb)) - esize);
            boolean src_unsigned;
            boolean dst_unsigned;
            case (op : U) of
            {
                when '00' of
                {
                    UNDEFINED
                }
                when '01' of
                {
                    src_unsigned = FALSE;
                    dst_unsigned = TRUE;
                }
                when '10' of
                {
                    src_unsigned = FALSE;
                    dst_unsigned = FALSE;
                }
                when '11' of
                {
                    src_unsigned = TRUE;
                    dst_unsigned = TRUE;
                }
            }
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = (Int(Elem[operand,e,esize], src_unsigned) << shift);
                Elem[result,e,esize] = SatQ(element, esize, dst_unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_shift_left_sat_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
            }
            if ((immh[3] : Q) == '10') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            integer shift = (UInt((immh : immb)) - esize);
            boolean src_unsigned;
            boolean dst_unsigned;
            case (op : U) of
            {
                when '00' of
                {
                    UNDEFINED
                }
                when '01' of
                {
                    src_unsigned = FALSE;
                    dst_unsigned = TRUE;
                }
                when '10' of
                {
                    src_unsigned = FALSE;
                    dst_unsigned = FALSE;
                }
                when '11' of
                {
                    src_unsigned = TRUE;
                    dst_unsigned = TRUE;
                }
            }
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = (Int(Elem[operand,e,esize], src_unsigned) << shift);
                Elem[result,e,esize] = SatQ(element, esize, dst_unsigned);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_mul_int_accum":{
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
            boolean sub_op = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) operand3 = V[d];
            bits(datasize) result;
            bits(esize) element1;
            bits(esize) element2;
            bits(esize) product;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,esize];
                element2 = Elem[operand2,e,esize];
                product = (UInt(element1) * UInt(element2))[0~(esize - 1)];
                if sub_op then
                {
                    Elem[result,e,esize] = (Elem[operand3,e,esize] - product);
                }
                else
                {
                    Elem[result,e,esize] = (Elem[operand3,e,esize] + product);
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_diff":{
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
            integer element1;
            integer element2;
            bits((2 * esize)) absdiff;
            result = (V[d] if accumulate else Zeros());
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                absdiff = Abs((element1 - element2))[0~((2 * esize) - 1)];
                Elem[result,e,(2 * esize)] = (Elem[result,e,(2 * esize)] + absdiff);
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(idxdsize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 1)) if round else 0);
            integer element1;
            integer element2;
            integer product;
            boolean sat;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = (((2 * element1) * element2) + round_const);
                Elem[result,e,esize] = SignedSatQ((product >> esize), esize);
            }
            V[d] = result;
        }""",
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
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(idxdsize) operand2 = V[m];
            bits(datasize) result;
            integer round_const = ((1 << (esize - 1)) if round else 0);
            integer element1;
            integer element2;
            integer product;
            boolean sat;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = (((2 * element1) * element2) + round_const);
                Elem[result,e,esize] = SignedSatQ((product >> esize), esize);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_permute_zip":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            integer part = UInt(op);
            integer pairs = (elements DIV 2);
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer base = (part * pairs);
            for p = 0 to (pairs - 1)
            {
                Elem[result,((2 * p) + 0),esize] = Elem[operand1,(base + p),esize];
                Elem[result,((2 * p) + 1),esize] = Elem[operand2,(base + p),esize];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_extract_nosat":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits((2 * datasize)) operand = V[n];
            bits(datasize) result;
            bits((2 * esize)) element;
            for e = 0 to (elements - 1)
            {
                element = Elem[operand,e,(2 * esize)];
                Elem[result,e,esize] = element[0~(esize - 1)];
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_disparate_mul_product":{
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
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(datasize) operand2 = Vpart[m,part];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                Elem[result,e,(2 * esize)] = (element1 * element2)[0~((2 * esize) - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_permute_transpose":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            integer part = UInt(op);
            integer pairs = (elements DIV 2);
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            for p = 0 to (pairs - 1)
            {
                Elem[result,((2 * p) + 0),esize] = Elem[operand1,((2 * p) + part),esize];
                Elem[result,((2 * p) + 1),esize] = Elem[operand2,((2 * p) + part),esize];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_mul_int_dotp":{
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
            result = V[d];
            for e = 0 to (elements - 1)
            {
                integer res = 0;
                integer element1, element2;
                for i = 0 to 3
                {
                    if signed then
                    {
                        element1 = SInt(Elem[operand1,((4 * e) + i),(esize DIV 4)]);
                        element2 = SInt(Elem[operand2,((4 * e) + i),(esize DIV 4)]);
                    }
                    else
                    {
                        element1 = UInt(Elem[operand1,((4 * e) + i),(esize DIV 4)]);
                        element2 = UInt(Elem[operand2,((4 * e) + i),(esize DIV 4)]);
                    }
                    res = (res + (element1 * element2));
                }
                Elem[result,e,esize] = (Elem[result,e,esize] + res);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if (size != '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean sub_op = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(esize) element1;
            bits(esize) element2;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,esize];
                element2 = Elem[operand2,e,esize];
                if sub_op then
                {
                    Elem[result,e,esize] = (element1 - element2);
                }
                else
                {
                    Elem[result,e,esize] = (element1 + element2);
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean sub_op = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(esize) element1;
            bits(esize) element2;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,esize];
                element2 = Elem[operand2,e,esize];
                if sub_op then
                {
                    Elem[result,e,esize] = (element1 - element2);
                }
                else
                {
                    Elem[result,e,esize] = (element1 + element2);
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_insert":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer size = LowestSetBit(imm5);
            if (size > 3) then
            {
                UNDEFINED
            }
            integer dst_index = UInt(imm5[(size + 1)~4]);
            integer src_index = UInt(imm4[size~3]);
            integer idxdsize = (128 if (imm4[3] == '1') else 64);
            integer esize = (8 << size);
        }""",
        "execute": """        {
            bits(idxdsize) operand = V[n];
            bits(128) result;
            result = V[d];
            Elem[result,dst_index,esize] = Elem[operand,src_index,esize];
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_extract_sat_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer part = 0;
            integer elements = 1;
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits((2 * datasize)) operand = V[n];
            bits(datasize) result;
            bits((2 * esize)) element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = Elem[operand,e,(2 * esize)];
                Elem[result,e,esize] = SatQ(Int(element, unsigned), esize, unsigned);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_extract_sat_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits((2 * datasize)) operand = V[n];
            bits(datasize) result;
            bits((2 * esize)) element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = Elem[operand,e,(2 * esize)];
                Elem[result,e,esize] = SatQ(Int(element, unsigned), esize, unsigned);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_double_sisd":{
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
            integer part = 0;
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(idxdsize) operand2 = V[m];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            boolean sat;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                Elem[result,e,(2 * esize)] = product;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_double_simd":{
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
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(idxdsize) operand2 = V[m];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            boolean sat;
            element2 = SInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = SInt(Elem[operand1,e,esize]);
                product = SignedSatQ(((2 * element1) * element2), (2 * esize));
                Elem[result,e,(2 * esize)] = product;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_add_halving_truncating":{
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
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            integer sum;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                sum = (element1 + element2);
                Elem[result,e,esize] = sum[1~esize];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_shift_left_long":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (immh == '0000') then
            {
            }
            if (immh[3] == '1') then
            {
                UNDEFINED
            }
            integer esize = (8 << HighestSetBit(immh));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            integer shift = (UInt((immh : immb)) - esize);
            boolean unsigned = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand = Vpart[n,part];
            bits((datasize * 2)) result;
            integer element;
            for e = 0 to (elements - 1)
            {
                element = (Int(Elem[operand,e,esize], unsigned) << shift);
                Elem[result,e,(2 * esize)] = element[0~((2 * esize) - 1)];
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_cmp_int_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if (size != '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer elements = 1;
            boolean unsigned = (U == '1');
            boolean cmp_eq = (eq == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                test_passed = ((element1 >= element2) if cmp_eq else (element1 > element2));
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_uniform_cmp_int_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((size : Q) == '110') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
            boolean cmp_eq = (eq == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                element2 = Int(Elem[operand2,e,esize], unsigned);
                test_passed = ((element1 >= element2) if cmp_eq else (element1 > element2));
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_cmp_int_bulk_sisd":{
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
            CompareOp comparison;
            case (op : U) of
            {
                when '00' of
                {
                    comparison = CompareOp_GT;
                }
                when '01' of
                {
                    comparison = CompareOp_GE;
                }
                when '10' of
                {
                    comparison = CompareOp_EQ;
                }
                when '11' of
                {
                    comparison = CompareOp_LE;
                }
            }
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                case comparison of
                {
                    when 0 of
                    {
                        test_passed = (element > 0);
                    }
                    when 1 of
                    {
                        test_passed = (element >= 0);
                    }
                    when 2 of
                    {
                        test_passed = (element == 0);
                    }
                    when 3 of
                    {
                        test_passed = (element <= 0);
                    }
                    when 4 of
                    {
                        test_passed = (element < 0);
                    }
                }
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_cmp_int_bulk_simd":{
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
            CompareOp comparison;
            case (op : U) of
            {
                when '00' of
                {
                    comparison = CompareOp_GT;
                }
                when '01' of
                {
                    comparison = CompareOp_GE;
                }
                when '10' of
                {
                    comparison = CompareOp_EQ;
                }
                when '11' of
                {
                    comparison = CompareOp_LE;
                }
            }
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            integer element;
            boolean test_passed;
            for e = 0 to (elements - 1)
            {
                element = SInt(Elem[operand,e,esize]);
                case comparison of
                {
                    when 0 of
                    {
                        test_passed = (element > 0);
                    }
                    when 1 of
                    {
                        test_passed = (element >= 0);
                    }
                    when 2 of
                    {
                        test_passed = (element == 0);
                    }
                    when 3 of
                    {
                        test_passed = (element <= 0);
                    }
                    when 4 of
                    {
                        test_passed = (element < 0);
                    }
                }
                Elem[result,e,esize] = (Ones() if test_passed else Zeros());
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_not":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer esize = 8;
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV 8);
        }""",
        "execute": """        {
            bits(datasize) operand = V[n];
            bits(datasize) result;
            bits(esize) element;
            for e = 0 to (elements - 1)
            {
                element = Elem[operand,e,esize];
                Elem[result,e,esize] = NOT(element);
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_extract_sqxtun_sisd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = esize;
            integer part = 0;
            integer elements = 1;
        }""",
        "execute": """        {
            bits((2 * datasize)) operand = V[n];
            bits(datasize) result;
            bits((2 * esize)) element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = Elem[operand,e,(2 * esize)];
                Elem[result,e,esize] = UnsignedSatQ(SInt(element), esize);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_arithmetic_unary_extract_sqxtun_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits((2 * datasize)) operand = V[n];
            bits(datasize) result;
            bits((2 * esize)) element;
            boolean sat;
            for e = 0 to (elements - 1)
            {
                element = Elem[operand,e,(2 * esize)];
                Elem[result,e,esize] = UnsignedSatQ(SInt(element), esize);
            }
            Vpart[d,part] = result;
        }""",
    },
    "aarch64_vector_transfer_vector_extract":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((Q == '0') && (imm4[3] == '1')) then
            {
                UNDEFINED
            }
            integer datasize = (128 if (Q == '1') else 64);
            integer position = (UInt(imm4) << 3);
        }""",
        "execute": """        {
            bits(datasize) hi = V[m];
            bits(datasize) lo = V[n];
            bits((datasize * 2)) concat = (hi : lo);
            V[d] = concat[position~((position + datasize) - 1)];
        }""",
    },
    "aarch64_vector_transfer_integer_dup":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer size = LowestSetBit(imm5);
            if (size > 3) then
            {
                UNDEFINED
            }
            if ((size == 3) && (Q == '0')) then
            {
                UNDEFINED
            }
            integer esize = (8 << size);
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
        }""",
        "execute": """        {
            bits(esize) element = X[n];
            bits(datasize) result;
            for e = 0 to (elements - 1)
            {
                Elem[result,e,esize] = element;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_acc_long":{
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
            integer datasize = 64;
            integer part = UInt(Q);
            integer elements = (datasize DIV esize);
            boolean unsigned = (U == '1');
            boolean sub_op = (o2 == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = Vpart[n,part];
            bits(idxdsize) operand2 = V[m];
            bits((2 * datasize)) operand3 = V[d];
            bits((2 * datasize)) result;
            integer element1;
            integer element2;
            bits((2 * esize)) product;
            element2 = Int(Elem[operand2,index,esize], unsigned);
            for e = 0 to (elements - 1)
            {
                element1 = Int(Elem[operand1,e,esize], unsigned);
                product = (element1 * element2)[0~((2 * esize) - 1)];
                if sub_op then
                {
                    Elem[result,e,(2 * esize)] = (Elem[operand3,e,(2 * esize)] - product);
                }
                else
                {
                    Elem[result,e,(2 * esize)] = (Elem[operand3,e,(2 * esize)] + product);
                }
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_reduce_add_simd":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            if ((size : Q) == '100') then
            {
                UNDEFINED
            }
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
    "aarch64_vector_arithmetic_binary_uniform_mul_int_product":{
        "decode": """        {
            integer d = UInt(Rd);
            integer n = UInt(Rn);
            integer m = UInt(Rm);
            if ((U == '1') && (size != '00')) then
            {
                UNDEFINED
            }
            if (size == '11') then
            {
                UNDEFINED
            }
            integer esize = (8 << UInt(size));
            integer datasize = (128 if (Q == '1') else 64);
            integer elements = (datasize DIV esize);
            boolean poly = (U == '1');
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(datasize) operand2 = V[m];
            bits(datasize) result;
            bits(esize) element1;
            bits(esize) element2;
            bits(esize) product;
            for e = 0 to (elements - 1)
            {
                element1 = Elem[operand1,e,esize];
                element2 = Elem[operand2,e,esize];
                if poly then
                {
                    product = PolynomialMult(element1, element2)[0~(esize - 1)];
                }
                else
                {
                    product = (UInt(element1) * UInt(element2))[0~(esize - 1)];
                }
                Elem[result,e,esize] = product;
            }
            V[d] = result;
        }""",
    },
    "aarch64_vector_arithmetic_binary_element_mul_int":{
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
        }""",
        "execute": """        {
            bits(datasize) operand1 = V[n];
            bits(idxdsize) operand2 = V[m];
            bits(datasize) result;
            integer element1;
            integer element2;
            bits(esize) product;
            element2 = UInt(Elem[operand2,index,esize]);
            for e = 0 to (elements - 1)
            {
                element1 = UInt(Elem[operand1,e,esize]);
                product = (element1 * element2)[0~(esize - 1)];
                Elem[result,e,esize] = product;
            }
            V[d] = result;
        }""",
    },
}
