from Instructions import DSLInstruction



def create_dsl_inst(inst_dict, dsl_name, is_simd):

    dsl_inst = DSLInstruction(name = dsl_name ,  simd = is_simd,
                              operation = True, semantics = inst_dict['semantics'])

    return dsl_inst


def populate_dsl_inst(dsl_inst , sub_inst_dict):
    for subinst_name in sub_inst_dict:
        sub_obj = sub_inst_dict[subinst_name]
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
                             lanesize_index = sub_obj['lanesize_index'],
                             in_precision_index = sub_obj['in_precision_index'],
                             out_precision_index = sub_obj['out_precision_index'],
                             cost = sub_obj['Cost']
                             )

    return dsl_inst



def parse_dict(sem_dict):

    dsl = []

    for inst_name in sem_dict:
        x86_insts = list(sem_dict[inst_name]['x86_instructions'].keys())

        is_simd = sem_dict[inst_name]['x86_instructions'][x86_insts[0]]['SIMD'] == "True"

        dsl_inst = create_dsl_inst(sem_dict[inst_name], inst_name, is_simd)

        dsl_inst = populate_dsl_inst(dsl_inst, sem_dict[inst_name]['x86_instructions'])

        dsl.append(dsl_inst)


    return dsl






