
from LatestSemantics import semantcs as old_dict
from FixedSemantics import semantcs as fix_sema
import json




new_dict = {}

# TEMP: pack operations currently broken in dictionary due to syntax errors

for key in old_dict:

    if key in fix_sema:
        new_dict[key] = fix_sema[key]
    else:
        new_dict[key] = old_dict[key]



for key in fix_sema:

    new_dict[key]  = fix_sema[key]




with open("merged_dict.py","w+") as Write:
    Write.write("semantcs=")
    Write.write(str(new_dict))


with open("readable_dict.py","w+") as Write:
    Write.write("semantcs=")
    Write.write(json.dumps(new_dict, indent = 4))
