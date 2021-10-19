
# Left Matrix Shape are first two, Right Matrix Shape are last 2
TENSOR_SHAPE = (2,4,2)

TENSOR_PREC = 8

LEFT_TENSOR_SIZE =  TENSOR_SHAPE[0] * TENSOR_SHAPE[1] * TENSOR_PREC
RIGHT_TENSOR_SIZE =  TENSOR_SHAPE[1] * TENSOR_SHAPE[2] * TENSOR_PREC


with open("gen_grammar.rkt","w+") as WriteFile:
    comb_vector = ""
    comb_stride = ""


    bv_str = "(bv 0 (bitvector {}))\n".format(TENSOR_SHAPE[1] * TENSOR_PREC)
    dsl_inst_str = "(dsl_inst_0 (bv 0 (bitvector {})) (expr) (expr) 1 {} {} {})\n".format(TENSOR_SHAPE[1] * TENSOR_PREC, TENSOR_SHAPE[1], TENSOR_PREC, TENSOR_PREC)

    apply_concat_str = "(apply concat (list "+ ("(expr) "* (TENSOR_SHAPE[0] * TENSOR_SHAPE[2])) +"))"
    top_str = "[top (choose {} )]\n".format(apply_concat_str)
    for i in range(TENSOR_SHAPE[0]):
        vector_string = "(vector-load (expr) {}  {}  {}  {})\n".format(LEFT_TENSOR_SIZE,i*TENSOR_SHAPE[1], TENSOR_SHAPE[1], TENSOR_PREC)
        comb_vector += vector_string



    for i in range(TENSOR_SHAPE[2]):
        stride_string = "(strided-gather (expr) {} {} {} {} {})\n".format(RIGHT_TENSOR_SIZE, i, TENSOR_SHAPE[2], TENSOR_SHAPE[1], TENSOR_PREC)
        comb_stride += stride_string

    expr_stmt = ["arg0", "arg1", "(no-op (expr))", bv_str, dsl_inst_str ,comb_stride, comb_vector ]

    expr_str = "[expr (choose "+("\n".join(expr_stmt)) +" )]"

    def_grammar_str = "(define-grammar (gen-grammar arg0 arg1)\n"+top_str+"\n"+expr_str+"\n)"
    WriteFile.write(def_grammar_str)

spec_str = """
{
    "tensor-matmul": {
        "semantics":"(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range   """ +str(TENSOR_SHAPE[0])+ """))])  (apply concat  (for/list ([j (reverse (range """+str(TENSOR_SHAPE[2])+"""))])  (apply bvadd (for/list ([k (reverse (range """+str(TENSOR_SHAPE[1])+"""))])  (define idx_left (+ (* i """+str(TENSOR_SHAPE[1])+""") k)) (define idx_right (+ (* k """+str(TENSOR_SHAPE[2])+""") j))(define value1 (ext-bv arg1 idx_left """+str(TENSOR_PREC)+""")) (define value2 (ext-bv arg2 idx_right """+str(TENSOR_PREC)+"""))  (bvmul value1 value2)  )  )  )  )  )  ) )",
"args" : ["arg1", "arg2"],
        "arg_types": ["BitVectorConst", "BitVectorConst"],
        "input_length": ["""+str(LEFT_TENSOR_SIZE)+""", """+str(RIGHT_TENSOR_SIZE)+"""],
        "output_precision": ["""+str(TENSOR_PREC)+"""]
    }
}"""

with open("gen_spec.rkt","w+") as WriteFile:

    WriteFile.write(spec_str)

