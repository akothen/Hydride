import sys
import time
import json
import subprocess as sb
from common.DSLParser import parse_dict
#from LatestSemantics import semantcs
from  x86SemanticsAllArgs import semantcs

from common.PredefinedDSL import *
from common.StructDef import StructDef

from hexsemantics_new import semantics as hex_new_sema
from hexsema_v2 import hexsema_v2 as hex_old_sema

from utils.TranslateHashVersion import TranslateHashVersion


hex_new_unscaled = parse_dict(hex_new_sema)
hex_old_unscaled = parse_dict(hex_old_sema)

hex_new = []
hex_old = []

for dsl_inst in hex_new_unscaled:
    break
    if dsl_inst.supports_scaling():
        dsl_inst.scale_contexts(1, base_vector_size = 1024)
        hex_new.append(dsl_inst)

for dsl_inst in hex_old_unscaled:
    break
    if dsl_inst.supports_scaling():
        dsl_inst.scale_contexts(1, base_vector_size = 1024)
        hex_old.append(dsl_inst)

hex_new = hex_new_unscaled
hex_old = hex_old_unscaled

thv = TranslateHashVersion(input_dsl = hex_old, output_dsl = hex_new)


TARGET= 'hvx'

sd = StructDef()
print(thv.emit_translate_hash(hex_old ,sd))



