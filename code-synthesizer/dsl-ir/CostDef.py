from Instructions import DSLInstruction
from Types import *

DEFAULT_COST = 1
IDX_I_COST = 1
IDX_J_COST = 1
REG_COST = 1
LIT_COST = 1
NOP_COST = 1


class CostDef:

    def __init__(self):
        return


    def emit_default_def(self):
        defaults = []



        defaults.append("[(idx-i id) {}]".format(IDX_I_COST))
        defaults.append("[(idx-j id) {}]".format(IDX_J_COST))
        defaults.append("[(reg id) {}]".format(REG_COST))
        defaults.append("[(lit v) {} ]".format(LIT_COST))
        defaults.append("[(nop v1) (+ {} (cost v1))]".format(NOP_COST))

        defaults.append("[(dim-x id) {}]".format(DEFAULT_COST))
        defaults.append("[(dim-y id) {}]".format(DEFAULT_COST))


        defaults.append("[(idx-add i1 i2) (+ {} (cost i1) (cost i2))]".format(DEFAULT_COST))
        defaults.append("[(idx-mul i1 i2) (+ {} (cost i1) (cost i2))]".format(DEFAULT_COST))
        defaults.append("[(vector-choose_dsl n ) n]")

        return ["\t{}".format(d) for d in defaults]

    def emit_dsl_cost_def(self, dsl_inst, struct_definer):


        dsl_cost = dsl_inst.get_cost()

        if dsl_cost == None or dsl_cost == "":
            dsl_cost = DEFAULT_COST

        cost_label = "cost_{}".format(dsl_inst.get_dsl_name())

        def_cost = "(define {} {})".format(cost_label, dsl_cost)


        sample_ctx = dsl_inst.get_sample_context()

        sub_cost = []
        for idx,arg in enumerate(sample_ctx.context_args):
            if idx % 3 == 0 and idx != 0:
                sub_cost.append("\n\t\t")


            if isinstance(arg, BitVector):
                sub_cost.append("(cost  {})".format(arg.name))


        cost_clause = "(+ {} {})".format(cost_label, " ".join(sub_cost))

        cost_cmd_list = [struct_definer.emit_dsl_struct_use(dsl_inst)] + [cost_clause]


        cost_cmd = "\t[ {}\n\t]".format("\n\t\t".join(cost_cmd_list))

        return (def_cost , cost_cmd)



    def emit_fallback_def(self):
        return "\t[_ {}]".format(DEFAULT_COST)

    def emit_cost_model(self, dsl_list, struct_definer):
        default_costs = self.emit_default_def()


        dsl_costs = [self.emit_dsl_cost_def(dsl_inst, struct_definer) for dsl_inst in dsl_list ]

        cost_defs = [dsl_cost[0] for dsl_cost in dsl_costs] +["\n"]

        cost_clauses = default_costs + [dsl_cost[1] for dsl_cost in dsl_costs] + [self.emit_fallback_def()]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Cost Model"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        cost_model = "\n".join(cost_defs)
        cost_model += "(define (cost prog)\n (destruct prog\n{}\n )\n)".format("\n".join(cost_clauses))
        return prefix + cost_model + sufix




