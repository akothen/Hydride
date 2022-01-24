# python3 iterate.py desc.json <spec_name> <arg1_size> <arg2_size> ...
import subprocess as sb
import time
import sys
import json
import os


def get_cex_defs(cex_ls, arg_sizes):
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
        env_id = "env_{}".format(c_idx)
        args_str = " ".join(args)+" "
        env_def = "(define {} (vector {}))".format(env_id, args_str)
        strs.append(env_def)
        envs_ls.append(env_id)
        args_ls.append(args_str)


    return ("\n".join(strs), envs_ls, args_ls)

def get_synth_asserts(invoke_str, envs, args):
    strs = []

    var_list = []
    for idx,env in enumerate(envs):
        invoke_cmd = invoke_str.format(args[idx])
        str_ = "(assert (equal? (interpret sketch-grammar {}) {} ))".format(envs[idx],invoke_cmd)

        strs.append(str_)
    return  "\n".join(strs)


def gen_synth_file(iter_num, dsl_common_str , cex_ls, arg_sizes_ls, invoke_str,  do_optimize = False):
    synth_file_name = "synth_iter_"+str(iter_num)+".rkt"


    synth_file_str = dsl_common_str
    with open(synth_file_name, "w+") as SynthFile:

        (cex_defs, envs, args)  = get_cex_defs(cex_ls, arg_sizes_ls)

        synth_file_str += "\n" + cex_defs


        synth_assert_calls = get_synth_asserts(invoke_str, envs, args)

        forall_ls = "(list {} {})".format(" ".join(args), " ".join(envs))

        synth_str = ""



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











def gen_verify_file(iter_num, dsl_common_str, arg_sizes_ls, invoke_str):
    verify_file_name = "verify_iter_"+str(iter_num)+".rkt"
    verify_file_str = dsl_common_str

    body_str = ""
    with open("body_{}.txt".format(iter_num), "r") as DefFile:
        body_str = DefFile.read()

    with open(verify_file_name, "w+") as VerifyFile:
        verify_file_str += "\n" + "(clear-vc!)"
        formal_args = ["arg"+str(i) for i in range(0,len(arg_sizes_ls))]

        fn_str = "(define (synth_check "+" ".join(formal_args)+")\n"+body_str+"\n)"

        verify_file_str += "\n" + fn_str
        sym_def_str = ""
        sym_args = []
        for idx, arg_size in enumerate(arg_sizes_ls):
            sym_id = "sym_arg"+str(idx)
            sym_args.append(sym_id)

            sym_def_str += "\n"+"(define-symbolic {} (bitvector {}))".format(sym_id, arg_size)

        verify_file_str += sym_def_str

        invoke_check = "(synth_check {})".format(" ".join(sym_args))
        invoke_spec = invoke_str.format(" ".join(sym_args))

        verify_cmd = "(define cex (verify (assert (equal? {} {}))))\n".format(invoke_check, invoke_spec)

        verify_file_str += "\n" + verify_cmd

        verify_file_str += "\n" + "(assert (sat? cex) \"Verification Passed!\")"

        for idx, sym_arg in enumerate(sym_args):
            def_cex_i = "(define cex_v{} (evaluate {} cex))".format(idx, sym_arg)
            display_cex_i = "(display \"cex_v{} \")".format(idx) + "\n" + "(displayln cex_v{})".format(idx)
            verify_file_str += "\n" + def_cex_i + "\n" + display_cex_i

        VerifyFile.write(verify_file_str)

    return verify_file_name


























if __name__ == "__main__":
    desc = {}
    with open(sys.argv[1],"r") as DescriptionFile:
        desc = json.load(DescriptionFile)
    SPEC_NAME = desc['SPEC_NAME']
    ARG_SIZES = desc['ARG_SIZES']
    INVOKE_STR = desc['SPEC_INVOKE_STR']

    SOLVER = desc["SOLVER"]
    Bitwidth = desc["BITWIDTH"]
    DO_OPTIMIZE = desc["DO_OPTIMIZE"]
    SPEC_IMPL = desc["SPEC_IMPL"]
    GRAMMAR_IMPL = desc["GRAMMAR_IMPL"]
    dsl_common_str = ""

    with open(os.path.dirname(os.path.abspath(__file__))+"/dsl_common.rkt","r") as DSLFile:
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
        dsl_common_str = dsl_common_str.format(solver_info, " ".join([ str(a) for a in ARG_SIZES]))

    with open(SPEC_IMPL, "r") as SpecImplFile:
        dsl_common_str += "\n" + SpecImplFile.read() + "\n"

    with open(GRAMMAR_IMPL, "r") as GrammarImplFile:
        dsl_common_str += "\n" + GrammarImplFile.read() + "\n"


    init_cex = [-1 for i in ARG_SIZES]

    cex = [init_cex]

    start_time = time.time()
    for i in range(0,100):
        print("Iteration "+str(i+1))
        synth_file_name = gen_synth_file(i+1, dsl_common_str, cex, ARG_SIZES, INVOKE_STR, do_optimize = (DO_OPTIMIZE == 1))

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

        verify_file_name = gen_verify_file(i+1, dsl_common_str, ARG_SIZES, INVOKE_STR)
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


    end_time = time.time()
    elapsed_time = end_time-start_time

    print("Synthesis took {} seconds".format(elapsed_time))


