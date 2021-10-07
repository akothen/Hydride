import argparse
from tensor_dsl import dsl as dsl_dict
from dsl_class import *
from utils import *
from gen_dsl import DSLGen
import json



def get_arg_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("-v","--verbose", help = "Print debug messages during execution",
                        action = "store_true")
    parser.add_argument("reference", type=str , help = "Path to the file for the reference implementation dictionary")
    parser.add_argument("--utils", type=str, help = "Path to the racket file which contains definitions of\
                            helper functions used",default = "racket_utils.rkt")

    return parser



if __name__ == "__main__":
    p = get_arg_parser()
    args = p.parse_args()

    DSLDefs = read_dsl_dictionary(dsl_dict)

    #for d in DSLDefs:
    #    print(d.str())

    user_data = {}

    with open(args.reference, "r") as UserFile:
        user_data = json.loads(UserFile.read())

    args_info = get_spec_args_from_user_dictionary(user_data)

    print(args_info)


    for user_func in args_info:
        print("==== Processing",user_func,"====")

        func_arg_desc = args_info[user_func]
        bitwidth = func_arg_desc[0].total_bits

        DSLGenerator = DSLGen(func_arg_desc, [], bitwidth, DSLDefs)

        DSLGenerator.generate()





