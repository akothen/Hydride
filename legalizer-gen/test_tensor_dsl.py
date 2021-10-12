

dsl = {
"dsl_inst_0" : {

      "name" : "dsl_inst_0",
      "args" : "vreg-acc,vreg1,vreg2,conc_i_bound,conc_j_bound,conc_in_precision,conc_out_precision",
      "reg"  : "vreg-acc,vreg1,vreg2",
      "size" : "conc_i_bound,conc_j_bound",
      "in_precision" : "conc_in_precision",
      "out_precision" : "conc_out_precision",
      "semantics" : "{ \
(define (dsl_inst_0 vreg-acc vreg1 vreg2 conc_i_bound conc_j_bound conc_in_precision conc_out_precision) \n \
(apply \n \
concat \n \
(for/list ([i (reverse (range conc_i_bound))]) \n \
(define sum \n \
(apply \n \
bvadd \n \
(for/list ([j (reverse (range conc_j_bound))]) \n \
(bvmul (sign-ext-bv vreg1 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision) (sign-ext-bv vreg2 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision))))) \n \
(bvadd (ext-bv vreg-acc i conc_out_precision) sum)))) \n \
}", 
  },}
