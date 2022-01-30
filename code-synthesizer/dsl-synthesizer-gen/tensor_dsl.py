

dsl = {
  "vector-mac" : {
    "name" : "vector-mac",
    "args" : "v1, v2, v3, num_elems, type_size",
    "reg" : "v1, v2, v3",
    "size" : "num_elems",
    "in_precision" : "type_size",
    "out_precision" : "type_size",
    "semantics" : "   \
                    (define (vector-mac v1 v2 v3 num_elems type_size) \n \
                    (assert (equal? (bvlength v1) (* num_elems type_size))) \n \
                    (assert (equal? (bvlength v2) (* num_elems type_size))) \n \
                    (assert (equal? (bvlength v3) (* num_elems type_size))) \n \
                      (define result \n \
                       (apply   \n \
                        concat \n \
                        (for/list ([i (reverse (range num_elems))]) \n \
                           (define tmp \n \
                             (bvmul (ext-bv v2 i type_size) (ext-bv v3 i type_size))) \n \
                          (bvadd (ext-bv v1 i type_size) tmp) \n \
                          ))) \n \
                      (assert (equal? (bvlength result) (* num_elems type_size))) \n \
                      result \n \
                    ) \n \
                  ",
  },

  "vector-add" : {
    "name" : "vector-add",
    "args" : "a, b, len, precision",
    "reg" : "a, b",
    "size" : "len",
    "in_precision" : "precision",
    "out_precision" : "precision",
    "semantics" : "   \
                    (define (vector-add a b len precision) \n \
                    (assert (equal? (bvlength a) (* len precision))) \n \
                    (assert (equal? (bvlength b) (* len precision))) \n \
                    (define result \n \
                      (apply \n \
                      concat \n \
                      (for/list ([j (reverse (range len))]) \n \
                        (define tmp \n \
                          (bvadd (ext-bv a j precision) (ext-bv b j precision))) \n \
                        tmp \n \
                        ) \n \
                      ) \n \
                      ) \n \
                      (assert (equal? (bvlength result) (* len precision))) \n \
                      result \n \
                      ) \n \
                 ",
  },

  "vector-sub" : {
    "name" : "vector-sub",
    "args" : "a, b, len, precision",
    "reg" : "a, b",
    "size" : "len",
    "in_precision" : "precision",
    "out_precision" : "precision",
    "semantics" : "   \
                    (define (vector-sub a b len precision) \n \
                    (assert (equal? (bvlength a) (* len precision))) \n \
                    (assert (equal? (bvlength b) (* len precision))) \n \
                     (define result \n \
                      (apply \n \
                      concat \n \
                      (for/list ([j (reverse (range len))]) \n \
                        (define tmp \n \
                          (bvsub (ext-bv a j precision) (ext-bv b j precision))) \n \
                        tmp \n \
                        ) \n \
                      ) \n \
                      ) \n \
                      (assert (equal? (bvlength result) (* len precision))) \n \
                      result \n \
                      ) \n \
                  ",
  },

  "vector-mul" : {
    "name" : "vector-mul",
    "args" : "a, b, len, precision",
    "reg" : "a, b",
    "size" : "len",
    "in_precision" : "precision",
    "out_precision" : "precision",
    "semantics" : "   \
                    (define (vector-mul a b len precision) \n \
                      (assert (equal? (bvlength a) (* len precision))) \n \
                      (assert (equal? (bvlength b) (* len precision))) \n \
                      (define result \n \
                      (apply \n \
                      concat \n \
                      (for/list ([j (reverse (range len))]) \n \
                        (define tmp \n \
                          (bvmul (ext-bv a j precision) (ext-bv b j precision))) \n \
                        tmp \n \
                        ) \n \
                      ) \n \
                      ) \n \
                      (assert (equal? (bvlength result) (* len precision))) \n \
                      result \n \
                      ) \n \
                  ",
  },

"dsl_inst_0" : {
      "name" : "dsl_inst_0",
      "args" : "vreg-acc,vreg1,vreg2,conc_i_bound,conc_j_bound,conc_in_precision,conc_out_precision",
      "reg"  : "vreg-acc,vreg1,vreg2",
      "size" : "conc_i_bound,conc_j_bound",
      "in_precision" : "conc_in_precision",
      "out_precision" : "conc_out_precision",
      "semantics" : " \
(define (dsl_inst_0 vreg-acc vreg1 vreg2 conc_i_bound conc_j_bound conc_in_precision conc_out_precision) \n \
(assert (equal? (bvlength vreg-acc) (* conc_i_bound conc_out_precision))) \n \
(assert (equal? (bvlength vreg1) (* (* conc_i_bound conc_j_bound) conc_in_precision))) \n \
(assert (equal? (bvlength vreg2) (* (* conc_i_bound conc_j_bound) conc_in_precision))) \n \
(define result \n \
(apply \n \
concat \n \
(for/list ([i (reverse (range conc_i_bound))]) \n \
(define sum \n \
(apply \n \
bvadd \n \
(for/list ([j (reverse (range conc_j_bound))]) \n \
(bvmul (sign-ext-bv vreg1 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision) (sign-ext-bv vreg2 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision))))) \n \
(bvadd (ext-bv vreg-acc i conc_out_precision) sum)))) \n \
(assert (equal? (bvlength result) (* conc_i_bound conc_out_precision))) \n \
result) \n \
",
},

"dsl_inst_1" : {
      "name" : "dsl_inst_1",
      "args" : "vreg,conc_i_bound,conc_precision",
      "reg"  : "vreg",
      "size" : "conc_i_bound",
      "in_precision" : "conc_precision",
      "out_precision" : "conc_precision",
      "semantics" : " \
(define (dsl_inst_1 vreg conc_i_bound conc_precision) \n \
(assert (equal? (bvlength vreg) (* conc_i_bound conc_precision))) \n \
(define result \n \
(apply \n \
bvadd \n \
(for/list ([i (reverse (range conc_i_bound))]) \n \
(ext-bv vreg i conc_precision)))) \n \
(assert (equal? (bvlength result) conc_precision)) \n \
result) \n \
",
  },
}
