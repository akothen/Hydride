import json

data = {}
with open("base.spec","r") as BaseFile:
    data = json.loads(BaseFile.read())

data = data['compute1']
print(data)

ArgVariant = [0,1]
ArgVariantName = ["BitVectorSymbolic", "BitVectorConst"]


for arg1 in ArgVariant:
    for arg2 in ArgVariant:
        for arg3 in ArgVariant:
            fname = "concolic_"+str(arg1)+str(arg2)+str(arg3)+".spec"

            if arg1 == 0 and arg2 == 0 and arg3 == 0:
                continue

            dict_copy = {"semantics": data['semantics'],
                         "args": data["args"],
                         "input_precision": data['input_precision']}
            dict_copy['arg_types'] = [ArgVariantName[arg1], ArgVariantName[arg2],
                                 ArgVariantName[arg3]]

            final_data = {'compute1': dict_copy}
            with open(fname,"w+") as WriteFile:
                WriteFile.write(json.dumps(final_data))






