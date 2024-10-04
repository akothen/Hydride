from emit_file_header import *
import sys
import time
import subprocess as sb
from common.DSLParser import parse_dict
from x86SemanticsAllArgs import semantcs
from ARMSemantics import semantcs as arm_semantics
from AIEngineSema import ai_sema as aie_semantics
from repairs_sema import repair_semantics
from common.PredefinedDSL import *
from common.StructDef import StructDef
from interpreter.InterpreterDef import InterpreterDef
from utils.CostDef import CostDef
from utils.ContainsDef import ContainsDef
from utils.GetLengthDef import GetLengthDef
from utils.GetOutPrecDef import GetOutPrecDef
from utils.IRPrinter import IRPrinter
from utils.BindDef import BindDef
from utils.GetBVOps import GetBVOps
from Specification import Specification, parse_spec
from utils.VisitorDef import VisitorDef
from utils.ScaleDef import ScaleDef
from utils.GetTargetSpecificNames import GetTargetNames
from utils.GetSubExpressions import GetSubExpressions
from utils.ExtractExprDepth import ExtractExprDepth
from utils.GetVariants import GetVariants


from hexsemantics_new import semantics as hvx_semantics
from BitSIMDsema import bitsimd_sema

# from HexSemanticsAllArgs import  hvx_semantics

from synthesizer.Synthesizer import Synthesizer
from utils.ConstFold import ConstFold

dsl_list = []

TARGET = 'bitsimd'
scd = None
cost_name = ""
interpret_name = ""
scale_name = ""
const_fold_name = ""
visitor_name = ""
get_len_name = ""
get_prec_name = ""
printer_name = ""
get_ops_name = ""
bind_name = ""
get_target_op_name = ""
subexpr_name = ""
extract_names = ""
variant_names = ""
contains_name = ""


if TARGET == 'x86':
    dsl_list = parse_dict(semantcs, keep_duplicate=True)
    scd = ScaleDef(base_vect_size=None)
    cost_name = "hydride:cost"
    interpret_name = "hydride:interpret"
    scale_name = "hydride:scale-expr"
    const_fold_name = "hydride:const-fold"
    visitor_name = "hydride:visitor"
    get_len_name = "hydride:get-length"
    get_prec_name = "hydride:get-prec"
    printer_name = "hydride:hydride-printer"
    get_ops_name = "hydride:get-bv-ops"
    bind_name = "bind-expr"
    get_target_op_name = "hydride:get-target-name"
    subexpr_name = "hydride:get-sub-exprs"
    extract_names = "hydride:extract-expr"
    variant_names = "hydride:get-variants"
    contains_name = "hydride:contains"
elif TARGET == 'hvx':
    dsl_list = parse_dict(hvx_semantics, keep_duplicate=True)
    scd = ScaleDef(base_vect_size=1024)
    cost_name = "hvx:cost"
    cost_name = "hvx:cost"
    interpret_name = "hvx:interpret"
    scale_name = "hvx:scale-expr"
    const_fold_name = "hvx:const-fold"
    visitor_name = "hvx:visitor"
    get_len_name = "hvx:get-length"
    get_prec_name = "hvx:get-prec"
    printer_name = "hvx:hydride-printer"
    get_ops_name = "hvx:get-bv-ops"
    bind_name = "hvx:bind-expr"
    get_target_op_name = "hvx:get-target-name"
    subexpr_name = "hvx:get-sub-exprs"
    extract_names = "hvx:extract-expr"
    variant_names = "hvx:get-variants"
    contains_name = "hvx:contains"
elif TARGET == 'arm':
    dsl_list = parse_dict(arm_semantics, keep_duplicate=True)
    scd = ScaleDef(base_vect_size=None)
    cost_name = "arm:cost"
    cost_name = "arm:cost"
    interpret_name = "arm:interpret"
    scale_name = "arm:scale-expr"
    const_fold_name = "arm:const-fold"
    visitor_name = "arm:visitor"
    get_len_name = "arm:get-length"
    get_prec_name = "arm:get-prec"
    printer_name = "arm:hydride-printer"
    get_ops_name = "arm:get-bv-ops"
    bind_name = "arm:bind-expr"
    get_target_op_name = "arm:get-target-name"
    subexpr_name = "arm:get-sub-exprs"
    extract_names = "arm:extract-expr"
    variant_names = "arm:get-variants"
    contains_name = "arm:contains"
elif TARGET == 'aie':
    dsl_list = parse_dict(aie_semantics, keep_duplicate=True)
    scd = ScaleDef(base_vect_size=None)
    cost_name = "aie:cost"
    cost_name = "aie:cost"
    interpret_name = "aie:interpret"
    scale_name = "aie:scale-expr"
    const_fold_name = "aie:const-fold"
    visitor_name = "aie:visitor"
    get_len_name = "aie:get-length"
    get_prec_name = "aie:get-prec"
    printer_name = "aie:hydride-printer"
    get_ops_name = "aie:get-bv-ops"
    bind_name = "aie:bind-expr"
    get_target_op_name = "aie:get-target-name"
    subexpr_name = "aie:get-sub-exprs"
    extract_names = "aie:extract-expr"
    variant_names = "aie:get-variants"
    contains_name = "aie:contains"
elif TARGET == 'bitsimd':
    dsl_list = parse_dict(bitsimd_sema, keep_duplicate=True)
    scd = ScaleDef(base_vect_size=None)
    cost_name = "bitsimd:cost"
    cost_name = "bitsimd:cost"
    interpret_name = "bitsimd:interpret"
    scale_name = "bitsimd:scale-expr"
    const_fold_name = "bitsimd:const-fold"
    visitor_name = "bitsimd:visitor"
    get_len_name = "bitsimd:get-length"
    get_prec_name = "bitsimd:get-prec"
    printer_name = "bitsimd:hydride-printer"
    get_ops_name = "bitsimd:get-bv-ops"
    bind_name = "bitsimd:bind-expr"
    get_target_op_name = "bitsimd:get-target-name"
    subexpr_name = "bitsimd:get-sub-exprs"
    extract_names = "bitsimd:extract-expr"
    variant_names = "bitsimd:get-variants"
    contains_name = "bitsimd:contains"
elif TARGET == 'repair':
    dsl_list = parse_dict(repair_semantics, keep_duplicate=True)
    scd = ScaleDef(base_vect_size=None)
    cost_name = "repair:cost"
    interpret_name = "repair:interpret"
    scale_name = "repair:scale-expr"
    const_fold_name = "repair:const-fold"
    visitor_name = "repair:visitor"
    get_len_name = "repair:get-length"
    get_prec_name = "repair:get-prec"
    printer_name = "repair:hydride-printer"
    get_ops_name = "repair:get-bv-ops"
    bind_name = "repair:bind-expr"
    get_target_op_name = "repair:get-target-name"
    subexpr_name = "repair:get-sub-exprs"
    extract_names = "repair:extract-expr"
    variant_names = "repair:get-variants"
    contains_name = "repair:contains"



print("Number of Target Agnostic DSL Instructions:\t", len(dsl_list))
print("Number of Target Specific Instructions:\t",
      sum([len(inst.contexts) for inst in dsl_list]))

sys.exit(0)
sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
con_d = ContainsDef()
# sp = parse_spec(specification)
gl = GetLengthDef(get_len_name=get_len_name)
gp = GetOutPrecDef(get_prec_name=get_prec_name)
ip = IRPrinter(printer_name=printer_name)
bd = BindDef(bind_name=bind_name)
vd = VisitorDef()
gbo = GetBVOps(get_ops_name=get_ops_name)
gtn = GetTargetNames(get_target_name=get_target_op_name)
gse = GetSubExpressions(get_sub_name=subexpr_name)
eo = ExtractExprDepth(extract_name=extract_names)
gv = GetVariants(get_variant_name=variant_names)


cf = ConstFold()


def genGenRkt():
    with open("gen.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")

        write_to_file(hydride_header)

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " DSL Semantics"+'\n'
        prefix += ";; "+"="*80 + "\n"

        write_to_file(prefix)

        for dsl_inst in dsl_list:
            write_to_file(dsl_inst.get_semantics())

        sufix = "\n;; "+"="*80 + "\n"
        write_to_file(sufix)

        write_to_file(sd.emit_struct_defs(dsl_list))

        write_to_file(cd.emit_cost_model(dsl_list, sd, cost_name=cost_name))

        write_to_file(idd.emit_interpreter(
            dsl_list, sd, add_assertions=False, interpret_name=interpret_name))

        write_to_file(gl.emit_get_length(dsl_list, sd))

        write_to_file(gp.emit_get_prec(dsl_list, sd))

        write_to_file(ip.emit_dsl_printer(dsl_list, sd, prog_name="prog"))

        write_to_file(bd.emit_binder(dsl_list, sd))

        write_to_file(scd.emit_scale(dsl_list, sd, scale_name=scale_name))

        write_to_file(cf.emit_const_fold(
            dsl_list, sd, const_fold_name=const_fold_name, interpret_name=interpret_name))

        write_to_file(vd.emit_visitor(dsl_list, sd, visitor_name=visitor_name))

        write_to_file(gbo.emit_get_bv_ops(dsl_list, sd))

        write_to_file(gtn.emit_get_names(dsl_list, sd))
        write_to_file(gse.emit_get_subexpr(dsl_list, sd))
        write_to_file(eo.emit_extract(dsl_list, sd))

        write_to_file(gv.emit_get_names(dsl_list, sd))


hydride_header = """;#============================== Hydride File =================================
;#
;# Part of the Hydride Compiler Infrastructure.
;# <Placeholder for license information>
;#
;#=============================================================================
;#
;# Do NOT modify this file. It is automatically generated.
;#
;#=============================================================================
"""


if __name__ == "__main__":
    with open("binder.rkt", "w+")as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(binder_header.format(target=TARGET))
        write_to_file(bd.emit_binder(dsl_list, sd))
    with open("const_fold.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(const_fold_header.format(target=TARGET))
        write_to_file(cf.emit_const_fold(
            dsl_list, sd, const_fold_name=const_fold_name, interpret_name=interpret_name))
    with open("cost_model.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(cost_model_header.format(target=TARGET))
        write_to_file(cd.emit_cost_model(dsl_list, sd, cost_name=cost_name))
    with open("definition.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(definition_header.format(target=TARGET))
        QUQ = sd.emit_struct_defs(dsl_list).split("\n")
        if TARGET != "x86":
            QUQ = QUQ[:3]+QUQ[24:]
        write_to_file("\n".join(QUQ))
    with open("get_name.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(get_name_header.format(target=TARGET))
        write_to_file(gtn.emit_get_names(dsl_list, sd))
    with open("get_ops.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(get_ops_header.format(target=TARGET))
        write_to_file(gbo.emit_get_bv_ops(dsl_list, sd))
    with open("interpreter.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(interpreter_header.format(target=TARGET))
        write_to_file(idd.emit_interpreter(
            dsl_list, sd, add_assertions=False, interpret_name=interpret_name))
    with open("length.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(length_header.format(target=TARGET))
        write_to_file(gl.emit_get_length(dsl_list, sd))
    with open("prec.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(prec_header.format(target=TARGET))
        write_to_file(gp.emit_get_prec(dsl_list, sd))
    with open("printer.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(printer_header.format(target=TARGET))
        write_to_file(ip.emit_dsl_printer(dsl_list, sd, prog_name="prog").replace(
            "get-length", get_len_name).replace("get-prec", get_prec_name))
    with open("scale.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(scale_header.format(target=TARGET))
        write_to_file(scd.emit_scale(dsl_list, sd, scale_name=scale_name))
    with open("semantics.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(semantics_header.format(target=TARGET))
        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " DSL Semantics"+'\n'
        prefix += ";; "+"="*80 + "\n"

        write_to_file(prefix)

        for dsl_inst in dsl_list:
            write_to_file(dsl_inst.get_semantics())

        sufix = "\n;; "+"="*80 + "\n"
        write_to_file(sufix)
    with open("visitor.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(visitor_header.format(target=TARGET))
        write_to_file(vd.emit_visitor(dsl_list, sd, visitor_name=visitor_name))
    with open("extract.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(extract_header.format(target=TARGET))
        write_to_file(eo.emit_extract(dsl_list, sd))
    with open("sub_expr.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(subexpr_header.format(target=TARGET))
        write_to_file(gse.emit_get_subexpr(dsl_list, sd))
    with open("get_variants.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(variant_header.format(target=TARGET))
        write_to_file(gv.emit_get_names(dsl_list, sd))

    with open("contains.rkt", "w+") as RacketFile:
        def write_to_file(line):
            RacketFile.write(line + "\n")
        write_to_file(hydride_header)
        write_to_file(con_d.emit_contains(dsl_list, sd, contains_name = contains_name, interpreter_name = interpret_name))
    # TODO
