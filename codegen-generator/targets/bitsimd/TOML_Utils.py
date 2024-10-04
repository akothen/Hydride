import toml
from DRAM_Rosette_Emitter import *


def read_inst_desc_from_toml(fpath):
    with open(fpath, "r") as TOMLFile:
        return toml.loads(TOMLFile.read())


def get_inst_templates(toml_obj):
    inst_names = [key for key in toml_obj if key != "title"]

    pairs = []

    for key in inst_names:
        ctxs = []

        for ctx_name in toml_obj[key]:
            toml_obj[key][ctx_name]['name'] = key + "_" + ctx_name
            ctxs.append(toml_obj[key][ctx_name])

        pair = (key, ctxs)
        pairs.append(pair)

    return pairs




