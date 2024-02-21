import sys
from ARMSemanticGen import SemaGenerator
from ARMTypes import expand_instr, extract_assignment_from_name, ReservedImmTypes, PointerType, ReservedVecTypes
from ARMIntrinsicClassify import toI
from ARMMeta import *


def GenerateCTest(AllSema):
    CannotVerify = []
    para_set = set()
    skip_list = notSSA+UIP+op_mismatch+not_compiled_in_gcc+semantics_changed+[
        'and', 'bsl', 'bic', 'eor', 'orr', 'orn',  # Extract can't handle
        'addv', 'paddd'  # Transformation can't handle them
    ]
    str_list = [
        """#include "utils.h"

int main()
{
    printf("#lang rosette\\n(require \\"compiled.rkt\\")\\n");
        """
    ]
    for i, v in AllSema.items():
        try:
            assert not any(j in i for j in skip_list)
            for expand_name in expand_instr(toI[i]):
                basename, assignment = extract_assignment_from_name(
                    expand_name)
                tps = [vv.type for vv in v.params]
                if any(t in PointerType for t in tps):
                    assert False
                para_key = tuple(
                    'V' if t in ReservedVecTypes else 'I' for t in tps)
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
                # print(
                #     f'{funcname}({basename}, {", ".join(parastr)}, {v.rettype}, {i})')
                str_list.append(
                    f'{funcname}({basename}, {", ".join(parastr)}, {v.rettype}, {i})')
        except AssertionError:
            CannotVerify.append(i)
    str_list.append("""    printf("(displayln \\"All tests passed\\")\\n");
    return 0;
}
""")
    print("Cannot verify", CannotVerify, file=sys.stderr)
    return str_list


if __name__ == "__main__":
    AllSema = SemaGenerator(deserialize=True).getResult()
    str_list = GenerateCTest(AllSema)
    str = '\n'.join(str_list)
    print("Writing to rosette_test/ARMTest.cpp...")
    with open("rosette_test/ARMTest.cpp", "w") as f:
        f.write(str)
