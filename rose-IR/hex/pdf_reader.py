import tabula

pdf = open("hexagon_v66.pdf", 'rb')

# dfs = tabula.read_pdf(pdf, lattice=True, pages=list(range(161, 222)))
dfs = tabula.read_pdf(pdf, lattice=True, pages=list(range(40, 89)))
# dfs = tabula.read_pdf(pdf, lattice=True, pages=74)


insts = []

for df in dfs:
    # Only string columns matter to us
    if df.iloc[:, 0].dtype == "object":
        # only instructions contain an equal in every column, some instructions operate in place, those have Vx or Vy
        indices = df.iloc[:, 0].str.contains("=|Vy|Vx") 
        if  False not in indices.values:
            insts.append(df)

inst_dict = {}

import re

def filter_optional(intrinsic, pseudocode):
    if "[!]" in intrinsic:
        return [(intrinsic.replace("[!]", ""), pseudocode.replace("[!]", "")), (intrinsic.replace("[!]", "!"), pseudocode.replace("[!]", "!"))]

    if "[:sat]" in intrinsic:
        p = re.compile("(sat\d+)")
        sat_type = p.search(pseudocode).group(1)
        return [(intrinsic.replace("[:sat]", ""), pseudocode.replace("[" + sat_type + "]", "")), 
            (intrinsic.replace("[:sat]", ":sat"), pseudocode.replace("[" + sat_type + "]", sat_type))]

    if "[:rnd]" in intrinsic: # rounding adds a +1 to the pseudocode 
        return [(intrinsic.replace("[:rnd]", ""), pseudocode.replace("+1", "")), (intrinsic.replace("[:rnd]", ":rnd"), pseudocode)]

    if "[&|]" in intrinsic:
        return [(intrinsic.replace("[&|]", "&"), pseudocode.replace("[&|]", "&").replace("[|&]", "&")), 
        (intrinsic.replace("[&|]", "|"), pseudocode.replace("[&|]", "|").replace("[|&]", "|"))]

    if "[+-]" in intrinsic:
        return [(intrinsic.replace("[+-]", "+"), pseudocode.replace("[+-]", "+")), (intrinsic.replace("[+-]", "-"), pseudocode.replace("[+-]", "-"))]
    return [(intrinsic, pseudocode)]

def filter_optionals(intrinsic, pseudocode):
    inst_dict = {}
    vals = filter_optional(intrinsic, pseudocode)
    for val in vals:
        updated = filter_optional(val[0], val[1])
        if len(updated) == 1:
            inst_dict[updated[0][0]] = updated[0][1]
        else:
            vals.extend(updated)
    return inst_dict


for inst_df in insts:
    inst_df = inst_df.dropna(axis=0, how="all").dropna(axis=1)
    if len(inst_df.columns) != 2:
        continue
    # print(inst_df)
    if not inst_df.empty:
        # print(inst_df)
        for inst in inst_df.iterrows():
            intrinsic = inst[1][0].replace("\r", "")
            pseudocode = inst[1][1].replace("\r", "")
            print(intrinsic)
            inst_dict.update(filter_optionals(intrinsic, pseudocode))
        # inst_dict.update(dict(zip(inst_df.iloc[:, 0].str.replace("\r", "\n"), inst_df.iloc[:, 1].str.replace("\r", "\n"))))
print(len(inst_dict))
from pprint import pformat
with open("insts.py", "w") as f:
    f.write("insts = " + pformat(inst_dict))