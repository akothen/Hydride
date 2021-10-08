from dsl_class import *




def read_dsl_dictionary(dsl_dict):
    DSLInstList = []
    for inst_name, inst_def in dsl_dict.items():
        args = [arg.strip()  for arg in inst_def['args'].split(",")]
        regs = [arg.strip()  for arg in inst_def['reg'].split(",")]
        size_name = inst_def['size']
        precision_name = inst_def['in_precision']

        DSLArgList = []
        for arg in args:
            if arg in regs:
                regArg = DSLArg(arg, ArgType.BitVectorSymbolic)
                DSLArgList.append(regArg)
            elif arg == size_name:
                lengthArg = DSLArg(arg, ArgType.LengthConst)
                DSLArgList.append(lengthArg)
            elif arg == precision_name:
                precisionArg = DSLArg(arg, ArgType.PrecisionConst )
                DSLArgList.append(precisionArg)

        Inst = DSLInst(inst_name, DSLArgList, semantics = inst_def['semantics'])
        DSLInstList.append(Inst)
    return DSLInstList


def get_spec_args_from_user_dictionary(user_dict):
    args_info = {}
    for ref, ref_obj in user_dict.items():
        func_info = {}
        num_symbolic = 0
        num_concrete = 0
        user_args = []
        for idx, arg in enumerate(ref_obj['args']):
            if ref_obj['arg_types'][idx] == "BitVectorSymbolic":
                num_symbolic += 1
                arg_desc = DSLArg(arg, ArgType.BitVectorSymbolic, total_bits = ref_obj['input_precision'][idx])
                user_args.append(arg_desc)
            elif ref_obj['arg_types'][idx] == "BitVectorConst":
                num_concrete += 1
                """ Rely on concrete value initilization scheme to
                give an initial value against this symbolic bv """
                arg_desc = DSLArg(arg, ArgType.BitVectorConst, total_bits = ref_obj['input_precision'][idx])
                user_args.append(arg_desc)
            else:
                assert False, ("Unsupported user argument type:\t"+ref_obj['arg_types'][idx])
        func_info['arg_info'] = user_args

        if num_symbolic > 0 and num_concrete > 0:
            func_info['synth_type'] = "concolic"
        elif num_symbolic > 0:
            func_info['synth_type'] = "symbolic"
        elif num_concrete > 0:
            func_info['synth_type'] = "concrete"
        else:
            assert False, "No argument types provided!"

        args_info[ref] = func_info

    return args_info


def get_grammar_depth_str(grammar_name ,grammar_tree_name, arg_list, depth):
    arg_str = " ".join([arg.name for arg in arg_list])
    grammar_str = "(define ("+grammar_name+" "+arg_str+")\n\
                    ("+grammar_tree_name+" "+arg_str +" #:depth "+str(depth)+"))"

    return grammar_str





