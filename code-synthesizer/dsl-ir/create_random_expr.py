import sys
import time
import subprocess as sb


from common.DSLParser import parse_dict
from x86SemanticsAllArgs import semantcs
from common.PredefinedDSL import *
from common.StructDef import StructDef
from hexsemantics_new import semantics as hvx_semantics
from utils.GenerateRandomExpr import create_random_expression


dsl_list = []

TARGET = 'hvx'

if TARGET == 'x86':
    dsl_list = parse_dict(semantcs, keep_duplicate = True)
elif TARGET == 'hvx':
    dsl_list = parse_dict(hvx_semantics, keep_duplicate = True)





(expression, discard) = create_random_expression(dsl_list, depth = 5, required_output_precision = 32, required_output_size = 1024)

expression.print_context_expr()

print(expression.get_expr_type_info())
