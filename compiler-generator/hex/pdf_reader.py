import tabula

pdf = open("hexagon_v65.pdf", 'rb')

dfs = tabula.read_pdf(pdf, lattice=True, pages=list(range(161, 222)))
# dfs = tabula.read_pdf(pdf, lattice=True, pages=224)


insts = []

for df in dfs:
    # Only string columns matter to us
    if df.iloc[:, 0].dtype == "object":
        # only instructions contain an equal in every column, some instructions operate in place, those have Vx or Vy
        indices = df.iloc[:, 0].str.contains("=|Vy|Vx") 
        if  False not in indices.values:
            insts.append(df)

inst_dict = {}

for inst_df in insts:
    inst_df = inst_df.dropna(axis=0, how="all").dropna(axis=1)
    if len(inst_df.columns) != 2:
        continue
    # print(inst_df)
    if not inst_df.empty:
        print(inst_df)
        inst_dict.update(dict(zip(inst_df.iloc[:, 0].str.replace("\r", "\n"), inst_df.iloc[:, 1].str.replace("\r", "\n"))))

import json
print(len(inst_dict))
json.dump(inst_dict, open("hexagon_sema.json", "w") )