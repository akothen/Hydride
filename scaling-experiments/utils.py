from dsl_class import *




def read_dsl_dictionary(dsl_dict):
    DSLInstList = []
    for inst_name, inst_def in dsl_dict.items():
        args = [arg.strip()  for arg in inst_def['args'].split(",")]
        regs = [arg.strip()  for arg in inst_def['reg'].split(",")]
        size_name_list = inst_def['size'].split(",")
        in_precision_name = inst_def['in_precision']

        out_precision_name = inst_def['out_precision']



        DSLArgList = []
        for arg in args:
            if arg in regs:
                regArg = DSLArg(arg, ArgType.BitVectorSymbolic)
                DSLArgList.append(regArg)
            elif arg in size_name_list:
                lengthArg = DSLArg(arg, ArgType.LengthConst)
                DSLArgList.append(lengthArg)
            elif arg == in_precision_name:
                precisionArg = DSLArg(arg, ArgType.PrecisionConst, is_in_precision = True )
                DSLArgList.append(precisionArg)
            elif arg == out_precision_name:
                precisionArg = DSLArg(arg, ArgType.PrecisionConst, is_in_precision = False )
                DSLArgList.append(precisionArg)
            else:
                """ We assume the value to be of integer type """
                intArg = DSLArg(arg, ArgType.IntSymbolic)
                DSLArgList.append(intArg)

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
                arg_desc = DSLArg(arg, ArgType.BitVectorSymbolic, total_bits = ref_obj['input_length'][idx])
                user_args.append(arg_desc)
            elif ref_obj['arg_types'][idx] == "BitVectorConst":
                num_concrete += 1
                """ Rely on concrete value initilization scheme to
                give an initial value against this symbolic bv """
                arg_desc = DSLArg(arg, ArgType.BitVectorConst, total_bits = ref_obj['input_length'][idx])
                user_args.append(arg_desc)
            else:
                assert False, ("Unsupported user argument type:\t"+ref_obj['arg_types'][idx])
        func_info['arg_info'] = user_args

        out_prec_list =  ref_obj['output_precision']

        assert len(out_prec_list) != 0, "Output precision must be specified for reference implementation"

        user_out_args_list = []
        for prec in out_prec_list:
            out_arg = DSLArg("out", ArgType.PrecisionConst, precision_value = int(prec))
            user_out_args_list.append(out_arg)

        func_info['out_desc'] = user_out_args_list

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





