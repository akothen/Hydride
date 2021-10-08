import argparse
from tensor_dsl import dsl as dsl_dict
from dsl_class import *
from utils import *
from gen_dsl import DSLGen
from iterative_synth import ConcreteIterativeSynth
import json




def get_arg_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("-v","--verbose", help = "Print debug messages during execution",
                        action = "store_true", default = False)
    parser.add_argument("reference", type=str , help = "Path to the file for the reference implementation dictionary")
    parser.add_argument("--utils", type=str, help = "Path to the racket file which contains definitions of\
                            helper functions used (default = racket_utils.rkt)",default = "racket_utils.rkt")
    parser.add_argument("--depth", type=int, help = "The depth of the grammar tree considered during synthesis (default =  1)", default = 1)
    parser.add_argument("--iterations", type = int, help = "Maximum number of iterations to use during iterative synthesis (default = 3)", default = 3)

    parser.add_argument("--scheme", type = str, help = "The heurstic to use identify dsl instruction usage in the synthesis grammar (default = \"bvops\")",
                        choices = ["bvops", "arg_superset"], default = "bvops")

    return parser



if __name__ == "__main__":
    p = get_arg_parser()
    args = p.parse_args()

    DSLDefs = read_dsl_dictionary(dsl_dict)
    print("**** Parsed DSL Definitions ... ")

    user_data = {}

    with open(args.reference, "r") as UserFile:
        user_data = json.loads(UserFile.read())

    args_info = get_spec_args_from_user_dictionary(user_data)


    if args.verbose:
        for ref, dsl_list in args_info.items():
            print(ref,":")
            [print(inst) for inst in dsl_list]


    for user_func in args_info:
        print("="*8," Processing",user_func,"="*8,"\n")

        func_arg_desc = args_info[user_func]
        bitwidth = func_arg_desc[0].total_bits

        DSLGenerator = DSLGen(func_arg_desc, [], bitwidth, DSLDefs, verbose = args.verbose,
                              spec_sema = user_data[user_func]['semantics'], inclusion_scheme = args.scheme)

        print("**** Created DSL Grammar Generator for ",user_func)
        grammar_name = "synth_grammar"
        grammar_tree_name = "gen-grammar"
        grammar_tree = DSLGenerator.generate()



        grammar_depth_def = get_grammar_depth_str(grammar_name, grammar_tree_name, func_arg_desc, args.depth)

        grammar_def = grammar_tree + "\n" + grammar_depth_def

        if args.verbose:
            print("Grammar Definition:")
            print(grammar_def)

        print("**** Grammar Generation Complete ... ")



        Synth = ConcreteIterativeSynth(func_arg_desc, spec_name = user_func,
                               verify_name = "test_"+user_func+"_impl",
                               grammar_name = grammar_name,
                               grammar_def = grammar_def,
                               spec_semantics = user_data[user_func]['semantics'],
                               dsl_desc = DSLDefs,
                               utility_file = args.utils,
                               use_zero_init = True)


        Synth.iterate(max_iterations = args.iterations)





