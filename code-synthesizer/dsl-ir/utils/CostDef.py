from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import default_structs

DEFAULT_COST = 1#4
IDX_I_COST = 1
IDX_J_COST = 1
REG_COST = 1
LIT_COST = 1
NOP_COST = 1


class CostDef:

    def __init__(self):
        return


    def emit_default_def(self, struct_definer, cost_name = "hydride:cost", use_label = False):
        defaults = []



        defaults.append("[(reg id) 1]")
        defaults.append("[(lit v) {} ]".format(LIT_COST))

        defaults.append("[(buffer-index idx type size) idx]")


        for struct in default_structs:
            defaults.append(self.emit_dsl_cost_def(struct, struct_definer, use_label = False, cost_name = cost_name)[1])


        return ["\t{}".format(d) for d in defaults]

    def emit_dsl_cost_def(self, dsl_inst, struct_definer, use_label = True, cost_name = "hydride:cost"):


        dsl_cost = dsl_inst.get_cost()

        if dsl_cost == None or dsl_cost == "":
            dsl_cost = DEFAULT_COST

        # HVX has no latencies for operations
        # but we still want to prefer shifts over
        # multiplications/ divisions
        if "mpy" in dsl_inst.name:
            dsl_cost = DEFAULT_COST * 2

        cost_label = "cost_{}".format(dsl_inst.get_dsl_name())

        def_cost = "(define {} {})".format(cost_label, dsl_cost)


        sample_ctx = dsl_inst.get_sample_context()

        sub_cost = []
        for idx,arg in enumerate(sample_ctx.context_args):
            if idx % 3 == 0 and idx != 0:
                sub_cost.append("\n\t\t")


            if isBitVectorType(arg):
                sub_cost.append("({}  {}) ".format(cost_name , arg.name))

        cost_clause = ""

        if use_label:
            cost_clause = "(+ {} {})".format(cost_label, " ".join(sub_cost))
        else:
            def_cost = ""
            cost_clause = "(+ {} {})".format(dsl_cost, " ".join(sub_cost))


        cost_cmd_list = [struct_definer.emit_dsl_struct_use(dsl_inst)] + [cost_clause]


        cost_cmd = "\t[ {}\n\t]".format("\n\t\t".join(cost_cmd_list))

        return (def_cost , cost_cmd)



    def emit_fallback_def(self):
        return "\t[v  (error \"Unrecognized Term in cost model\" v)]"

    def emit_cost_model(self, dsl_list, struct_definer, cost_name = "hydride:cost", use_label = True):
        default_costs = self.emit_default_def(struct_definer, cost_name = cost_name)


        dsl_costs = [self.emit_dsl_cost_def(dsl_inst, struct_definer, cost_name = cost_name, use_label = use_label) for dsl_inst in dsl_list ]

        cost_defs = [dsl_cost[0] for dsl_cost in dsl_costs] +["\n"]

        cost_clauses = default_costs + [dsl_cost[1] for dsl_cost in dsl_costs] + [self.emit_fallback_def()]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Cost Model"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        cost_model = "\n".join(cost_defs)
        cost_model += "(define ({} prog)\n (destruct prog\n{}\n )\n)".format(cost_name , "\n".join( cost_clauses))
        return prefix + cost_model + sufix




