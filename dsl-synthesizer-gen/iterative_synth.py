
from dsl_class import ArgType, DSLArg, DSLInst



class IterativeSynth:
    def __init__(self, input_args, grammar_name = "synth_grammar", spec_name = "spec", verify_name = "verify_impl"):
        self.input_args = input_args
        self.spec_name = spec_name
        self.verify_name = verify_name
        self.concrete_inputs = [self.get_initial_cex(input_args)]
        self.grammar_name = grammar_name

    def get_verification_str(self):
        return self.generate_verification_func(self.input_args, self.verify_name)

    def generate_verification_func(self, args, verify_name):
        symbolic_defs = []
        argument_names = []

        for idx, arg in enumerate(args):
            
            if arg.arg_ty == ArgType.BitVectorSymbolic:
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

        verification_str = symbolic_block + "\n" + definition_block

        return verification_str


    """ Given a description of the argument types, generate
    concrete values for initial testing"""
    def get_initial_cex(self, args):
        concrete_inputs = []
        
        for idx, arg in enumerate(args):
            
            if arg.arg_ty == ArgType.BitVectorSymbolic:
                total_hex_values = arg.total_bits // 4
                hex_value = "#x"+("0"*(total_hex_values-1))+str(idx)
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

    def generate_synth_query(self, grammar_name, spec_name , cex_names_list):

        def generate_assert(args):
            arg_str = " ".join(args)
            assert_str = "(assert \n (equal? "+"("+grammar_name+" "+arg_str+") " +"(" + spec_name +" "+arg_str+")))"
            return assert_str

        assert_list = []

        for_all_str = "#:forall ("
        for cex_names in cex_names_list:
            assert_list.append(generate_assert(cex_names))
            for_all_str += " " + " ".join(cex_names)

        for_all_str += ")"

        guarantee_str = "#:guarantee (assert (and "+"\n".join(assert_list)+"))"


        synth_str = "(define sol \n(synthesize\n"+for_all_str+"\n"+guarantee_str +"\n))"

        return synth_str







    def iterate(self):

        names, defs = self.generate_counter_examples()
        print("CEX Block")
        print(names)
        cex_def_block = "\n".join(defs)
        print(cex_def_block,"\n")


        print("Synthesize block")

        synth_str = self.generate_synth_query(self.grammar_name, self.spec_name, names)
        print(synth_str, "\n")

        verify_block = self.generate_verification_func(self.input_args, self.verify_name)
        print("Verification Block")
        print(verify_block,"\n")







_128BitArg = DSLArg("BVArg", ArgType.BitVectorSymbolic, total_bits = 128 )

_256BitArg = DSLArg("BVArg", ArgType.BitVectorSymbolic, total_bits = 256 )


InputArgs =  [_256BitArg] * 0 + [_128BitArg] * 2

Synth = IterativeSynth(InputArgs, spec_name = "compute" ,verify_name = "test-impl")

Synth.iterate()



    


