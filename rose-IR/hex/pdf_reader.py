import tabula

pdf = open("hexagon_v65.pdf", 'rb')
dfs = tabula.read_pdf(pdf, lattice=True, pages=list(range(161, 182)))

insts = []

for df in dfs:
    # Only string columns matter to us
    if df.iloc[:, 0].dtype == "object":
        # only instructions contain an equal in every column
        indices = df.iloc[:, 0].str.contains("=")
        if  False not in indices.values:
            insts.append(df)

inst_dict = {}

for inst_df in insts:
    inst_df = inst_df.dropna(axis=0, how="all").dropna(axis=1)
    # print(inst_df)
    if not inst_df.empty:
        print(inst_df)
        inst_dict.update(dict(zip(inst_df.iloc[:, 0], inst_df.iloc[:, 1].str.replace("\r", "\n"))))

import json
json.dump(inst_dict, open("hexagon_sema.json", "w") )