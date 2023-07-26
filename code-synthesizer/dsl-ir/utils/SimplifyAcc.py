from common.Types import *



class SimplifyAcc:

    def __init__(self):
        return


    def get_matching_context(self, dsl_list, acc_ctx):

        for dsl_inst  in dsl_list:

            for ctx in dsl_inst.contexts:

                if ctx.name == acc_ctx.name:
                    continue

                if ctx.name == acc_ctx.name.replace("_acc", ""):
                    return (dsl_inst, ctx)

                if ctx.name == acc_ctx.name.replace("_sacc", ""):
                    return (dsl_inst, ctx)

        return None

    def emit_rewrite(self, acc_inst ,acc_ctx, match_inst, match_ctx, struct_definer):

        clause = []

        clause.append("(" + acc_inst.name +"_dsl")


        def get_arg(i, inst):
            sample_ctx = inst.get_sample_context()
            return sample_ctx.context_args[i]

        acc_operand = None

        operand_1 = None
        operand_2 = None

        bv_regs = 0

        const_bvs = []
        for idx, arg in enumerate(acc_ctx.context_args):
            if isinstance(arg, BitVector):

                if bv_regs == 0:

                    acc_operand = arg
                    clause.append("(lit vacc)")
                    #clause.append(get_arg(idx, acc_inst).name)
                elif bv_regs == 1:
                    operand_1 = arg
                    clause.append(get_arg(idx, acc_inst).name)
                elif bv_regs == 2:
                    operand_2 = arg
                    clause.append(get_arg(idx, acc_inst).name)
                else:
                    print(acc_ctx.name)
                    assert False, "Shouldn't hit this case for binary acc ops"
                bv_regs += 1
            elif isinstance(arg, ConstBitVector):
                const_bvs.append( (idx, arg.value, arg.size))
                clause.append("(lit v_const_{})".format(idx))
            else:
                clause.append(str(arg.value))


        clause.append(")\n")

        assert operand_1 != None, "Acc inst {} must have operand 1".format(acc_ctx.name)
        assert operand_2 != None, "Acc inst {} must have operand 2".format(acc_ctx.name)



        need_condition = True

        acc_zero_cond = "(equal? (bitvector->integer vacc) 0)"
        condition = "(and {} {})".format(acc_zero_cond ," ".join(["(equal? v_const_{} (bv {} (bitvector {})))".format(idx, val, size) for (idx,val,size) in const_bvs]))

        if need_condition:
            clause.append("(cond \n")
            clause.append("["+condition+"\n")





        clause.append("(displayln \"Rewriting {} -> {} ...\")\n".format(acc_ctx.name, match_ctx.name))
        clause.append("(" + match_inst.name +"_dsl")

        bv_regs = 0
        for idx, arg in enumerate(match_ctx.context_args):
            if isinstance(arg, BitVector):
                if bv_regs == 0:
                    clause.append(operand_1.name)
                elif bv_regs == 1:
                    operand_1 = arg
                    clause.append(operand_2.name)
                else:
                    print(match_ctx.name)
                    assert False, "Shouldn't hit this case for binary acc ops"

                bv_regs += 1
            elif isinstance(arg, ConstBitVector):
                clause.append(arg.get_dsl_value())
            else:
                clause.append(str(arg.value))

        clause.append(")\n")

        if need_condition:
            clause.append("]\n")
            clause.append("[else ele]\n")
            clause.append(")\n")

        comment = "; {} -> {} \n".format(acc_ctx.name, match_ctx.name)
        return comment + "[{}]".format(" ".join(clause))


    def emit_simplify(self, dsl_list, struct_definer, cost_name = "hydride:cost", use_label = True):

        for acc_inst in dsl_list:
            if "acc" not in acc_inst.name:
                continue

            for acc_ctx in acc_inst.contexts:
                if "acc" not in acc_ctx.name:
                    continue

                matching_ctx = self.get_matching_context(dsl_list, acc_ctx)

                if matching_ctx == None:
                    continue

                match_inst = matching_ctx[0]
                match_ctx = matching_ctx[1]


                rewrite = self.emit_rewrite(acc_inst, acc_ctx, match_inst, match_ctx, struct_definer)
                print(rewrite)







