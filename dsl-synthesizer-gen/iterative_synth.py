import os
import time
import glob
from dsl_class import ArgType, DSLArg, DSLInst
import subprocess as sb


def pprint(s):
    print("="*5,s,"="*5)

class IterativeSynth:
    def __init__(self, input_args, grammar_name = "synth_grammar", spec_name = "spec", spec_semantics = None, grammar_def = None,
            verify_name = "verify_impl", dsl_desc = None, utility_file = None, use_zero_init = True):
        self.input_args = input_args
        self.spec_name = spec_name
        self.verify_name = verify_name
        self.use_zero_init = use_zero_init
        self.concrete_inputs = [self.get_initial_cex(input_args)]
        self.grammar_name = grammar_name
        self.solution_name = "sol"
        self.grammar_def = grammar_def
        self.spec_semantics = spec_semantics
        self.dsl_desc = dsl_desc
        self.utility_file = utility_file
        self.gen_impl_name = "gen_impl"
        self.gen_impl_prefix = "check"
        self.racket_binary = os.getenv("RACKET_BINARY","racket")
        self.work_dir = "./tmp"

        if not os.path.exists(self.work_dir):
            os.makedirs(self.work_dir)
        files = glob.glob(self.work_dir + '/*')
        for f in files:
            os.remove(f)




    def generate_verification_func(self, args, verify_name, iteration_number):
        symbolic_defs = []
        argument_names = []

        for idx, arg in enumerate(args):

            if arg.arg_ty == ArgType.BitVectorSymbolic or arg.arg_ty == ArgType.BitVectorConst:
                symbolic_def = "(define-symbolic "+"_arg"+str(idx)+" (bitvector "+str(arg.total_bits)+"))"
                symbolic_defs.append(symbolic_def)
                argument_names.append("_arg"+str(idx))
            else:
                assert False, "Unsupported type"


        symbolic_block = "\n".join(symbolic_defs)

        arg_string = " ".join(argument_names)

        definition_block = "(define (" + verify_name + " impl ref)\n \
        \t(verify \n \
        \t\t(assert (equal?\n \
        "+ "\t\t\t(impl " + arg_string +") "+"\n \
        \t\t\t(ref "+ arg_string+")" + "))))"


        print_forms_block = "(with-output-to-file \""+self.work_dir+"/"+"cex_"+str(iteration_number)+".txt\" " + "(lambda () "+"(print (" + verify_name + " " + self.spec_name + " " + self.gen_impl_name +"))))"

        verification_str = symbolic_block + "\n" + definition_block + "\n" + print_forms_block

        return verification_str


    """ Given a description of the argument types, generate
    concrete values for initial testing"""
    def get_initial_cex(self, args):
        concrete_inputs = []

        for idx, arg in enumerate(args):

            val = idx + 1
            if self.use_zero_init:
                val = 0

            if arg.arg_ty == ArgType.BitVectorSymbolic:
                total_hex_values = arg.total_bits // 4
                hex_value = "#x"+(str(val % 10 )*(total_hex_values-1))+str(val % 10)
                concrete_inputs.append(DSLArg("BVArg", ArgType.BitVectorConst ,
                    total_bits = arg.total_bits, concrete_value = hex_value))
            elif arg.arg_ty == ArgType.BitVectorConst:
                """ Use the user provided concrete value """
                concrete_inputs.append(arg)
            else:
                assert False, "Unsupported type for get_initial_cex"

        return concrete_inputs


    def generate_counter_examples(self):
        cex_names_list = []
        cex_definition_list = []

        for idx_cex_set, cex_set in enumerate(self.concrete_inputs):
            cex_names = []
            for idx_into_cex, cex_value in enumerate(cex_set):
                cex_name = "cex_set"+str(idx_cex_set)+"_arg"+str(idx_into_cex)

                cex_def = "(define "+cex_name+" "
                if cex_value.arg_ty == ArgType.BitVectorConst:
                    cex_def += "(bv "+cex_value.concrete_value+" "+str(cex_value.total_bits)+ ")"
                else:
                    assert False, "Unsupported concrete input case"

                cex_def += ")"

                cex_names.append(cex_name)
                cex_definition_list.append(cex_def)

            cex_names_list.append(cex_names)

        return (cex_names_list, cex_definition_list)

    def generate_synth_query(self, grammar_name, spec_name , cex_names_list,
            iteration_number):

        def generate_assert(args):
            arg_str = " ".join(args)
            assert_str = "(assert \n (equal? "+"("+grammar_name+" "+arg_str+") " +"(" + spec_name +" "+arg_str+")))"
            return assert_str

        assert_list = []

        for_all_str = "#:forall (list"
        for cex_names in cex_names_list:
            assert_list.append(generate_assert(cex_names))
            for_all_str += " " + " ".join(cex_names)

        for_all_str += ")"

        guarantee_str = "#:guarantee (assert (and "+"\n".join(assert_list)+"))"



        synth_str = "(define "+ self.solution_name +"\n(synthesize\n"+for_all_str+"\n"+guarantee_str +"\n))"

        satisfiable_str = "(assert (sat? "+self.solution_name + ") \"Unsatisfiable\")"

        generate_forms_str = "(define "+self.gen_impl_name+ " (generate-forms "+self.solution_name+"))"

        print_forms_str = "(with-output-to-file \""+self.work_dir+"/"+self.gen_impl_prefix+"_"+str(iteration_number)+".txt\" "+"(lambda () (print-forms "+self.solution_name+")))"

        synth_str += "\n" +"\n\n".join([satisfiable_str,generate_forms_str,print_forms_str])

        return synth_str




    def generate_synth_racket_file(self, blocks):

        racket_str = "#lang rosette\n"

        racket_str += "(require rosette/lib/synthax)\n\
        (require rosette/lib/angelic)\n\
        (require racket/pretty)\n"

        racket_str += "(custodian-limit-memory (current-custodian) (* 8000 1024 1024))" +"\n"

        if self.utility_file != None:
            with open(self.utility_file, "r") as UtilFile:
                racket_str += "".join([line for line in UtilFile])+"\n"


        if self.spec_semantics != None:
            racket_str += ";; Reference Specification\n"
            racket_str += self.spec_semantics



        if self.dsl_desc != None:
            racket_str += ";; DSL Specification\n"
            for inst in self.dsl_desc:
                racket_str += inst.semantics + "\n"

        if self.grammar_def != None:
            racket_str += ";; Grammar Definition\n"
            racket_str += self.grammar_def + "\n"

        racket_str += "\n\n".join(blocks) +"\n"

        return racket_str



    def generate_verification_racket_file(self, impl_def, iteration_number ,verification_block):

        racket_str = "#lang rosette\n"

        racket_str += "(require rosette/lib/synthax)\n\
        (require rosette/lib/angelic)\n\
        (require racket/pretty)\n"


        racket_str += "(custodian-limit-memory (current-custodian) (* 8000 1024 1024))" +"\n"


        if self.utility_file != None:
            with open(self.utility_file, "r") as UtilFile:
                racket_str += "".join([line for line in UtilFile])+"\n"

        if self.spec_semantics != None:
            racket_str += ";; Reference Specification\n"
            racket_str += self.spec_semantics


        if self.dsl_desc != None:
            racket_str += ";; DSL Specification\n"
            for inst in self.dsl_desc:
                racket_str += inst.semantics + "\n"




        racket_str += impl_def +"\n"

        racket_str += verification_block


        return racket_str


    def read_cex_file(self, cex_file):

        concrete_cex = []
        with open(cex_file,"r") as CexFile:
            data = CexFile.read().replace('\n','')
            if "unsat" in data:
                return []

            data = " ".join(data.split(" ")[1:])
            data = data.split("]")
            data = data[:len(data)-1]
            data = [word.strip("[") for word in data]



            for cex in data:
                cex = cex.lstrip(" ")
                bv = cex.split(" ")[2].strip()
                width = cex.split(" ")[3].strip().strip(")")


                cex_arg = DSLArg("CexArg",ArgType.BitVectorConst,
                        total_bits = int(width), concrete_value = bv)

                concrete_cex.append(cex_arg)

        return concrete_cex



    def iterate(self, max_iterations = 3):

        i = 0

        while i < max_iterations:

            pprint("Iteration {}".format(i))
            names, defs = self.generate_counter_examples()
            cex_def_block = "\n".join(defs)

            print("Accumalated Cex's:","\n",cex_def_block)




            synth_str = self.generate_synth_query(self.grammar_name,
                    self.spec_name, names, i)


            racket_str = self.generate_synth_racket_file([cex_def_block, synth_str])

            synth_file = self.work_dir+"/"+"generated_"+str(i)+".rkt"



            with open(synth_file,"w+") as RktFile:
                RktFile.write(racket_str)


            Execute_Synthesis_CMD = " ".join([self.racket_binary, synth_file])

            print("\n"+Execute_Synthesis_CMD)
            start_synth = time.time()
            sb.call(Execute_Synthesis_CMD, shell=True)
            end_synth = time.time()

            print("Synthesis time:\t{} seconds".format(end_synth - start_synth))


            # TODO: First check if file generated

            if not os.path.exists( self.work_dir +"/"+ self.gen_impl_prefix+"_"+str(i)+".txt"):
                print("Synthesis timeout out or crashed...")
                return

            gen_def = ""
            with open(self.work_dir +"/"+ self.gen_impl_prefix+"_"+str(i)+".txt","r") as GenFile:
                include_str = False

                gen_body = []

                for line in GenFile:

                    if line.startswith('\''):
                        include_str = True

                    if include_str:
                        gen_body.append(line)

                split = "\n".join(gen_body).split(self.grammar_name)

                gen_def = split[0][1:] + self.gen_impl_name + split[1]


            verify_block = self.generate_verification_func(self.input_args, self.verify_name, i)
            print("Generated Candidate:",gen_def)

            verify_str = self.generate_verification_racket_file(gen_def, i,
                    verify_block)


            verify_file_name = self.work_dir+"/"+"verification_"+str(i)+".rkt"
            with open(verify_file_name,"w+") as VerifyFile:
                VerifyFile.write(verify_str)



            Execute_Verification_CMD = " ".join([self.racket_binary, verify_file_name])

            print(Execute_Verification_CMD)
            start_verify = time.time()
            sb.call(Execute_Verification_CMD, shell=True)
            end_verify = time.time()
            print("Verification time:\t{} seconds".format(end_verify - start_verify))

            cex_file_name = self.work_dir+"/"+"cex_"+str(i)+".txt"

            new_cex = self.read_cex_file(cex_file_name)

            """ If rosette was unable
            to generate a counter example """
            if len(new_cex) == 0:
                print("Success! Definition is verified ...")
                break
            else:
                print("Counter example found!, moving to next iteration")

            self.concrete_inputs.append(new_cex)

            i += 1










"""



_128BitArg = DSLArg("BVArg", ArgType.BitVectorSymbolic, total_bits = 128, concrete_value = "#x00000004000000030000000200000001"  )

_256BitArg = DSLArg("BVArg", ArgType.BitVectorSymbolic, total_bits = 256 )


InputArgs =  [_256BitArg] * 0 + [_128BitArg] * 3

Synth = IterativeSynth(InputArgs, spec_name = "compute" ,verify_name =
        "test-impl",
        grammar_name = "vmac_synth",
        spec_file = "../iterative_synths_experiments/example_spec.rkt",
        dsl_file = "../iterative_synths_experiments/example_dsl.rkt",
        use_zero_init= True)

Synth.iterate()



"""



