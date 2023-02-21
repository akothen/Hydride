import sys
import time
import subprocess as sb
from common.DSLParser import parse_dict
from x86SemanticsAllArgs import semantcs
from common.PredefinedDSL import *
from common.StructDef import StructDef
from interpreter.InterpreterDef import InterpreterDef
from utils.CostDef import CostDef
from utils.GetLengthDef import GetLengthDef
from utils.GetOutPrecDef import GetOutPrecDef
from utils.IRPrinter import IRPrinter
from utils.BindDef import BindDef
from utils.GetBVOps import GetBVOps
from Specification import Specification, parse_spec
from utils.VisitorDef import VisitorDef
from utils.ScaleDef import ScaleDef
from utils.GetTargetSpecificNames import GetTargetNames


from hexsemantics_new import semantics as hvx_semantics

#from HexSemanticsAllArgs import  hvx_semantics

from synthesizer.Synthesizer import Synthesizer
from utils.ConstFold import ConstFold

dsl_list = []

TARGET = 'hvx'
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


if TARGET == 'x86':
    dsl_list = parse_dict(semantcs, keep_duplicate = True)
    scd = ScaleDef(base_vect_size = None)
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
else:
    dsl_list = parse_dict(hvx_semantics, keep_duplicate = True)
    scd = ScaleDef(base_vect_size = 1024)
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



print("Number of Target Agnostic DSL Instructions:\t",len(dsl_list))
print("Number of Target Specific Instructions:\t",sum([len(inst.contexts) for inst in dsl_list]))


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
#sp = parse_spec(specification)
gl = GetLengthDef(get_len_name = get_len_name)
gp = GetOutPrecDef(get_prec_name = get_prec_name)
ip = IRPrinter(printer_name = printer_name)
bd = BindDef(bind_name = bind_name)
vd = VisitorDef()
gbo = GetBVOps(get_ops_name = get_ops_name)
gtn = GetTargetNames(get_target_name = get_target_op_name)


cf = ConstFold()


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



with open("gen.rkt","w+") as RacketFile:
    def write_to_file(line):
        RacketFile.write(line + "\n")


    write_to_file(hydride_header)


    prefix = ";; "+"="*80 + "\n"
    prefix += ";; "+" "*30 +" DSL Semantics"+'\n'
    prefix += ";; "+"="*80 + "\n"

    write_to_file(prefix)

    for dsl_inst in dsl_list:
        write_to_file(dsl_inst.get_semantics())

    sufix = "\n;; "+"="*80 + "\n"
    write_to_file(sufix)

    write_to_file(sd.emit_struct_defs(dsl_list))


    write_to_file(cd.emit_cost_model(dsl_list, sd, cost_name = cost_name))

    write_to_file(idd.emit_interpreter(dsl_list, sd, add_assertions = False, interpret_name = interpret_name))

    write_to_file(gl.emit_get_length(dsl_list, sd))

    write_to_file(gp.emit_get_prec(dsl_list, sd))

    write_to_file(ip.emit_dsl_printer(dsl_list, sd, prog_name = "prog"))

    write_to_file(bd.emit_binder(dsl_list ,sd))

    write_to_file(scd.emit_scale(dsl_list, sd, scale_name = scale_name))

    write_to_file(cf.emit_const_fold(dsl_list, sd, const_fold_name = const_fold_name, interpret_name = interpret_name))

    write_to_file(vd.emit_visitor(dsl_list, sd, visitor_name = visitor_name))

    write_to_file(gbo.emit_get_bv_ops(dsl_list, sd))

    write_to_file(gtn.emit_get_names(dsl_list, sd))






