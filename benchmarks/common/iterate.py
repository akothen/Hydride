# python3 iterate.py desc.json <spec_name> <arg1_size> <arg2_size> ...
import subprocess as sb
import time
import sys
import json
import os
import itertools

def clean_up():
    clean_up_script = os.path.dirname(os.path.abspath(__file__))+"/clean.sh"
    sb.call("bash "+clean_up_script, shell = True)


def get_init_cex_val(size):

    hex_vals = [str(a) for a in range(10)]
    hex_vals += ["a","b","c","d","e","f"]
    val="#x"
    for i in range(0,size//4):
        val+= hex_vals[i % 16]

    return val



def get_cex_defs(cex_ls, arg_sizes, output_shape):
    strs = []
    args_ls = []
    envs_ls = []

    for c_idx,cex in enumerate(cex_ls):
        args = []
        for a_idx, size in enumerate(arg_sizes):
            cex_id = "v{}_{}".format(a_idx, c_idx)
            cex_def = "(define {} (bv {} {}))".format(cex_id, cex[a_idx], size)
            args.append(cex_id)
            strs.append(cex_def)

        idx_i_val = 0
        idx_j_val = 0


        args_str = " ".join(args )+" "

        env_index_space = []
        for idx_i_val in range(0, output_shape[0]):
            i_space = []
            for idx_j_val in range(0, output_shape[1]):
                ij_str = " ".join([" ",str(idx_i_val), str(idx_j_val)])
                env_id = "env_{}_i{}_j{}".format(c_idx, idx_i_val, idx_j_val)
                env_def = "(define {} (vector {}))".format(env_id, args_str+ij_str)
                strs.append(env_def)
                i_space.append(env_id)
            env_index_space.append(i_space)


        envs_ls.append(env_index_space)
        args_ls.append(args_str)


    return ("\n".join(strs), envs_ls, args_ls)

def get_synth_asserts(invoke_str, envs, args, output_shape):
    strs = []

    if len(output_shape) == 1:
        output_shape.append(1) # Two dimensional tensor with one dimension being 1

    var_list = []
    for idx,env_space in enumerate(envs): # For each counter example instance

        for i in range(0, output_shape[0]):
            for j in range(0, output_shape[1]):
                invoke_cmd = invoke_str.format(args[idx])
                if i*output_shape[1]+j % 3 == 0:
                    pass
                    # continue
                str_ = "(assert (equal? (interpret sketch-grammar {}) (index-into-mat {} {} {} 8 {} {}) ))".format(envs[idx][i][j],invoke_cmd, output_shape[0],output_shape[1], i,j)

                strs.append(str_)


    return  "\n".join(strs)


def gen_synth_file(iter_num, dsl_common_str , cex_ls, arg_sizes_ls, invoke_str,  do_optimize = False, additional_constraints = [], output_shape = []):
    synth_file_name = "synth_iter_"+str(iter_num)+".rkt"


    synth_file_str = dsl_common_str
    with open(synth_file_name, "w+") as SynthFile:

        (cex_defs, envs, args)  = get_cex_defs(cex_ls, arg_sizes_ls, output_shape)

        synth_file_str += "\n" + cex_defs


        synth_assert_calls = get_synth_asserts(invoke_str, envs, args, output_shape)

        synth_assert_calls += "\n".join(["\n"]+additional_constraints)

        flattened_envs = []
        for i in range(len(envs)):
            flattened_envs += list(itertools.chain( *(envs[i]) ))

        forall_ls = "(list {} {})".format(" ".join(args), " ".join(flattened_envs))

        synth_str = ""#"(clear-vc!)\n"



        if do_optimize:
            synth_str = "(define sol \n \
                            (optimize \n\
                            #:minimize (list (cost sketch-grammar))\n \
                            #:guarantee \n\
                            (begin\n \
                            "+synth_assert_calls+"\n \
                            )))"
        else:
            synth_str = "(define sol \n \
                            (synthesize \n\
                            #:forall "+forall_ls +"\n \
                            #:guarantee \n\
                            (begin\n \
                            "+synth_assert_calls+"\n \
                            )))"

        synth_file_str += "\n" + synth_str

        synth_file_str += "\n" +"(assert (sat? sol)\"Unsatisfiable\")"


        synth_file_str += "\n" +"""
        (define synth_res (evaluate sketch-grammar sol))
        (pretty-print synth_res)
        (display "synth cost: ")
        (println (cost synth_res))

        ;(println (get-structure-list synth_res))
        (displayln "Does Solution have a symmetric structure?")
        (println (has-symmetric-structure synth_res))

        (with-output-to-file "./body_{}.txt" (lambda() (print-prog synth_res)))
        """.format(iter_num)

        SynthFile.write(synth_file_str)

    return synth_file_name











def gen_verify_file(iter_num, dsl_common_str, arg_sizes_ls, invoke_str, output_shape):
    verify_file_name = "verify_iter_"+str(iter_num)+".rkt"
    verify_file_str = dsl_common_str

    body_str = ""
    with open("body_{}.txt".format(iter_num), "r") as DefFile:
        body_str = DefFile.read()

    with open(verify_file_name, "w+") as VerifyFile:
        verify_file_str += "\n" + "(clear-vc!)"
        formal_args = ["arg"+str(i) for i in range(0,len(arg_sizes_ls))]

        fn_str = "(define (synth_check "+" ".join(formal_args)+" idx-i idx-j "+")\n"+body_str+"\n)"

        verify_file_str += "\n" + fn_str
        sym_def_str = ""
        sym_args = []
        for idx, arg_size in enumerate(arg_sizes_ls):
            sym_id = "sym_arg"+str(idx)
            sym_args.append(sym_id)

            sym_def_str += "\n"+"(define-symbolic {} (bitvector {}))".format(sym_id, arg_size)

        verify_file_str += sym_def_str

        invoke_spec = invoke_str.format(" ".join(sym_args))

        spec_res_def = "(define spec-res {})".format(invoke_spec)


        verify_file_str += "\n" + spec_res_def

        verify_index_space = []

        for i in range(0, output_shape[0]):
            for j in range(0, output_shape[1]):

                invoke_check = "(synth_check {} {} {})".format(" ".join(sym_args), i , j)
                verify_i_j = "(assert (equal? {} (index-into-mat {} {} {} 8 {} {})))\n".format(invoke_check, "spec-res", output_shape[0], output_shape[1],i,j)
                verify_index_space.append(verify_i_j)


        #verify_cmd = "(define cex (verify (assert (equal? {} (index-into-mat {} 4 4 8 0 0)))))\n".format(invoke_check, spec_res_def)

        verify_cmd = "(define cex (verify (begin {}) ))".format("\n".join(verify_index_space))

        verify_file_str += "\n" + verify_cmd

        verify_file_str += "\n" + "(assert (sat? cex) \"Verification Passed!\")"

        for idx, sym_arg in enumerate(sym_args):
            def_cex_i = "(define cex_v{} (evaluate {} cex))".format(idx, sym_arg)
            display_cex_i = "(display \"cex_v{} \")".format(idx) + "\n" + "(displayln cex_v{})".format(idx)
            verify_file_str += "\n" + def_cex_i + "\n" + display_cex_i

        VerifyFile.write(verify_file_str)

    return verify_file_name















def print_benchmark_desc(desc):
    print("=" * 50)

    print(" "* 15, "Iterative Synthesis")

    print("=" * 50)

    print("Benchmark:\t", desc['SPEC_NAME'])
    print("Argument Sizes (bits):\t\t", desc['ARG_SIZES'])
    print("Solver:\t\t\t\t", desc['SOLVER'])

    if desc['BITWIDTH'] != -1 :
        print("Integer Bitwidth:\t\t", desc['BITWIDTH'])

    print("Cost Optimizations:\t\t", desc['DO_OPTIMIZE'] )

    print("[Additional Constraint] Symmetric:\t", desc['SYMMETRY'])

    if desc['COST_BOUND'] != -1:
        print("[Additional Constraint] Cost Upper Bound :\t", desc['COST_BOUND'])

    print("=" * 50)










if __name__ == "__main__":
    desc = {}
    with open(sys.argv[1],"r") as DescriptionFile:
        desc = json.load(DescriptionFile)
        print_benchmark_desc(desc)

    SPEC_NAME = desc['SPEC_NAME']
    ARG_SIZES = desc['ARG_SIZES']
    INVOKE_STR = desc['SPEC_INVOKE_STR']

    SOLVER = desc["SOLVER"]
    Bitwidth = desc["BITWIDTH"]
    DO_OPTIMIZE = desc["DO_OPTIMIZE"]
    SPEC_IMPL = desc["SPEC_IMPL"]
    GRAMMAR_IMPL = desc["GRAMMAR_IMPL"]
    SYMMETRY = desc['SYMMETRY']
    COST_BOUND = desc['COST_BOUND']
    OUTPUT_SHAPE = desc['OUTPUT_SHAPE']
    dsl_common_str = ""

    with open(os.path.dirname(os.path.abspath(__file__))+"/dsl_common_extended.rkt","r") as DSLFile:
        dsl_common_str = DSLFile.read()

        solver_str = ""
        bitwidth_str = ""

        if SOLVER == "Z3":
            pass
        elif SOLVER == "Boolector":
            solver_str = "(current-solver (boolector))"
            assert (Bitwidth != -1), "Boolector solver does not support infinite precision integers"
            assert (DO_OPTIMIZE != 1), "Boolector solver does not support optimization"
            bitwidth_str = "(current-bitwidth {})".format(Bitwidth)
        else:
            assert False, "Unrecognized solver"

        solver_info = solver_str +"\n"+bitwidth_str+"\n"
        dsl_common_str = dsl_common_str.format(solver_info, " ".join([ str(a) for a in ARG_SIZES+[0,0]]))

    with open(SPEC_IMPL, "r") as SpecImplFile:
        dsl_common_str += "\n" + SpecImplFile.read() + "\n"

    with open(GRAMMAR_IMPL, "r") as GrammarImplFile:
        dsl_common_str += "\n" + GrammarImplFile.read() + "\n"


    init_cex =  [get_init_cex_val(i) for i in ARG_SIZES] #[-1 for i in ARG_SIZES]

    cex = [init_cex]


    # Adding additional constraints
    additional_constraints = []

    if SYMMETRY == 1:
        symmetry_ctr = "(assert (has-symmetric-structure sketch-grammar))"
        additional_constraints.append(symmetry_ctr)


    if COST_BOUND != -1:
        cost_ctr = "(assert (< (cost sketch-grammar) {} ))".format(COST_BOUND)
        additional_constraints.append(cost_ctr)




    clean_up()

    start_time = time.time()
    for i in range(0,100):
        print("Iteration "+str(i+1))
        synth_file_name = gen_synth_file(i+1, dsl_common_str, cex, ARG_SIZES, INVOKE_STR, do_optimize = (DO_OPTIMIZE == 1), additional_constraints = additional_constraints, output_shape = OUTPUT_SHAPE)

        synth_log_name = "synth_{}.log".format(i+1)

        synth_start = time.time()
        try:
            with open(synth_log_name, "w+") as SynthLog:
                sb.call("racket "+synth_file_name, shell =True, stdout=SynthLog)
        except:
            print("Synthesis failed ... perhaps unsatisfiable")
            break

        synth_end = time.time()
        synth_elapsed = synth_end - synth_start
        with open(synth_log_name, "r") as SynthLog:
            for line in SynthLog:
                if line.startswith("synth cost:"):
                    cost = line.split("synth cost:")[1].strip()
                    print("Total Cost of Synthesized Solution: {}".format(cost))

        print("Synthesis step took {} seconds".format(synth_elapsed))



        verify_log_name = "verify_{}.log".format(i+1)

        verify_file_name = gen_verify_file(i+1, dsl_common_str, ARG_SIZES, INVOKE_STR, OUTPUT_SHAPE)
        verify_start = time.time()
        try:
            with open(verify_log_name, "w+") as VerifyLog:
                sb.call("racket "+verify_file_name, shell =True, stdout=VerifyLog)
        except:
            print("Verifcation failed ... perhaps completed!")
            break


        verify_end = time.time()

        verify_elapsed = verify_end - verify_start

        print("Verification step took {} seconds".format(verify_elapsed))
        with open(verify_log_name, "r") as VerifyLog:
            new_cex = []
            for line in VerifyLog:
                if line.startswith("cex_v"):
                    new_cex.append(line.split(" ")[2])

            if len(new_cex) == 0:
                print("Synthesis completed succesfully")
                break
            cex.append(new_cex)
        print("="*50,"\n")


    end_time = time.time()
    elapsed_time = end_time-start_time

    print("Synthesis took {} seconds".format(elapsed_time))


