from ARMSemantics import semantcs

arm_legal_inst = []
for eqc in semantcs.values():
    for intrin in eqc["target_instructions"]:
        arm_legal_inst.append(intrin)


def ARMExemption(ctx_name, op, spec_ops):
    if any(i in ctx_name for i in ["shr", "shl", "mul", "mla", "mls"]):
        if "_s" in ctx_name and op == "zero-extend":
            return True
        if "_u" in ctx_name and op == "sign-extend":
            return True
    if "movl" in ctx_name and op in ["bvashr", "bvsub"]:
        return True
    if any(i in ctx_name for i in ["mul", "mla", "mls"]):
        if "_u32" in ctx_name or "_s32" in ctx_name:
            if op in ["zero-extend", "sign-extend"]:
                return True
    # if "rshr" in ctx_name: #rshr
    #   if op == "bvlshr":
    #     return True
    if "abd" in ctx_name and op in ["bvsub", "bvadd"]:
        return True
    if "qrdmulh" in ctx_name and op in ["bvmulnsw", "bvmulnuw"]:
        return True
    if op == "bvusat" and any(i in spec_ops for i in ["bvaddnuw", "bvsubnuw", "bvmulnuw"]):
        return True
    if op == "bvssat" and any(i in spec_ops for i in ["bvaddnsw", "bvsubnsw", "bvmulnsw"]):
        return True
    return False


def ARMSelection(ctx_name):
    if "_n_" in ctx_name:
        if not any(i in ctx_name for i in ["shr", "shl", "dup", "mov", "sra"]):
            return False
    return True
