import sys
from ARMSemanticGen import SemaGenerator
from ARMTypes import extract_assignment_from_name, ReservedImmTypes, PointerType, ReservedVecTypes


def GenerateCTest(AllSema):
    CannotVerify = []
    para_set = set()
    notSSA = ['addv', 'addlv', 'maxv', 'minv', 'abd', 'rbit', 'aba', 'rev', 'ada', 'create', 'vdup_n_s64', 'vdup_n_u64', 'paddd']
    UIP = ['cls', 'clz', 'cnt', 'recpe', 'rsqrte', 'sli','sli_n','sliq_n','slid_n','shl_n','shlq_n','shld_n','sri_n','sriq_n','srid_n'] # unimplemented
    op_mismatch = ['qrdmlah', 'qrdmlsh']
    not_compiled_in_gcc = ['dot', 'eor3q', 'rax1q', 'bcaxq', 'xarq']
    for i, v in AllSema.items():
        try:
            assert not any(j in i for j in notSSA + UIP + op_mismatch + not_compiled_in_gcc)
            basename, assignment = extract_assignment_from_name(i)
            tps = [vv.type for vv in v.params]
            if any(t in PointerType for t in tps):
                assert False
            para_key = tuple('V' if t in ReservedVecTypes else 'I' for t in tps)
            para_set.add(para_key)
            const_vals = []
            if len(assignment) == 1:
                const_vals = list(assignment.values())
            elif len(assignment) == 2:
                const_vals = [assignment['lane1'], assignment['lane2']]
            assert v.rettype in ReservedVecTypes
            funcname = 'Test' + ''.join(para_key)
            parastr = []
            val_index = 0
            for t in tps:
                if t in ReservedVecTypes:
                    parastr.append(t)
                else:
                    parastr.append(str(const_vals[val_index]))
                    val_index += 1
            print(f'{funcname}({basename}, {", ".join(parastr)}, {v.rettype}, {i})')
        except AssertionError:
            CannotVerify.append(i)
    print("Cannot verify", CannotVerify, file=sys.stderr)


if __name__ == "__main__":
    AllSema = SemaGenerator(deserialize=True).getResult()
    GenerateCTest(AllSema)
