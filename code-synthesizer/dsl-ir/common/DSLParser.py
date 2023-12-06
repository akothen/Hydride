from common.Instructions import DSLInstruction
import json


def create_dsl_inst(inst_dict, dsl_name, is_simd):

    dsl_inst = DSLInstruction(name=dsl_name,  simd=is_simd,
                              operation=True, semantics=inst_dict['semantics'])

    return dsl_inst


def parse_cost(dsl_inst_cost, hw_name="Skylake"):
    if isinstance(dsl_inst_cost, str):
        cost_list = eval(dsl_inst_cost)
    else:
        return None

    if cost_list == None:
        return None

    if len(cost_list) == 0:
        return None

    for cost_obj in cost_list:
        if hw_name in cost_obj:
            return cost_obj[hw_name]['l']

    return None


def populate_dsl_inst(dsl_inst, sub_inst_dict, keep_duplicate=False):

    duplicate_context_names = []
    for subinst_name in sub_inst_dict:

        if keep_duplicate:
            break

        if subinst_name in duplicate_context_names:
            continue

        for other_name in sub_inst_dict:
            if subinst_name == other_name:
                continue

            subinst_args = sub_inst_dict[subinst_name]['args']
            otherinst_args = sub_inst_dict[other_name]['args']

            if subinst_args == otherinst_args:
                duplicate_context_names.append(other_name)

    if duplicate_context_names != []:
        #print("dropping Duplicate contexts:", duplicate_context_names," belonging to class", dsl_inst.name)
        pass

    for subinst_name in sub_inst_dict:

        if subinst_name in duplicate_context_names:
            continue

        sub_obj = sub_inst_dict[subinst_name]
        signedness = None
        if 'Signedness' in sub_obj:
            signedness = sub_obj['Signedness']

        # Support generation using legacy dictionaries
        if 'in_lanesize_index' not in sub_obj:
            sub_obj['in_lanesize_index'] = sub_obj['lanesize_index']

        if 'out_lanesize_index' not in sub_obj:
            sub_obj['out_lanesize_index'] = sub_obj['lanesize_index']

        if "ctx_sema" not in sub_obj:
            sub_obj['ctx_sema'] = None


        dsl_inst.add_context(name = subinst_name,
                             in_vectsize = sub_obj['in_vectsize'],
                             out_vectsize = sub_obj['out_vectsize'],
                             lane_size = sub_obj['lanesize'],
                             in_precision = sub_obj['in_precision'],
                             out_precision = sub_obj['out_precision'],
                             SIMD = sub_obj['SIMD'],
                             args = sub_obj['args'],
                             in_vectsize_index = sub_obj['in_vectsize_index'],
                             out_vectsize_index = sub_obj['out_vectsize_index'],
                             #lanesize_index = sub_obj['lanesize_index'],
                             in_precision_index = sub_obj['in_precision_index'],
                             out_precision_index = sub_obj['out_precision_index'],
                             signedness = signedness,
                             cost = parse_cost(sub_obj['Cost']),
                             in_lanesize_index = sub_obj['in_lanesize_index'],
                             out_lanesize_index = sub_obj['out_lanesize_index'],
                             ctx_sema = sub_obj['ctx_sema'] ,
                             extensions = sub_obj['Extensions']
                             )

    return dsl_inst


def parse_dict(sem_dict, keep_duplicate=False):

    dsl = []

    for inst_name in sem_dict:
        x86_insts = list(sem_dict[inst_name]['target_instructions'].keys())

        is_simd = sem_dict[inst_name]['target_instructions'][x86_insts[0]
                                                             ]['SIMD'] == "True"

        dsl_inst = create_dsl_inst(sem_dict[inst_name], inst_name, is_simd)

        dsl_inst = populate_dsl_inst(
            dsl_inst, sem_dict[inst_name]['target_instructions'], keep_duplicate=keep_duplicate)

        dsl.append(dsl_inst)

    return dsl
