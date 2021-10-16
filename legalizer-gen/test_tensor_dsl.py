

dsl = {
"dsl_inst_0" : {

      "name" : "dsl_inst_0",
      "args" : "vreg,conc_i_bound,conc_precision",
      "reg"  : "vreg",
      "size" : "conc_i_bound",
      "in_precision" : "conc_precision",
      "out_precision" : "conc_precision",
      "semantics" : "{ \
(define (dsl_inst_0 vreg conc_i_bound conc_precision) \n \
(define result \n \
(apply \n \
bvadd \n \
(for/list ([i (reverse (range conc_i_bound))]) \n \
(ext-bv vreg i conc_precision)))) \n \
result) \n \
}", 
  },}