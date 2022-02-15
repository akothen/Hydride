from dict.llvm_mapped import Insts


output = Insts
print("Enter class of instructions (leave empty for all):")
filt = input("> ").strip()

for key in Insts:
    if filt != "":
        if filt not in Insts[key]['hvx_intrinsic']:
            continue
    
    if isinstance(key, int):
        print(f"Intrinsic: {Insts[key]['hvx_intrinsic']}")
        print(f"Psuedocode: {Insts[key]['spec']}")
        print("Blank to skip, q to quit, otherwise enter associated LLVM intrinsic:")
        inp = input("> ").strip()
        if inp == 'q':
            break
        elif inp == '':
            continue
        else:
            inp = inp.replace("__builtin_HEXAGON", "hexagon")
            output[inp] = Insts[key]
            del output[key]

from pprint import pformat
with open("dict/llvm_mapped.py", "w") as f:
    f.write("Insts = " + pformat(output))