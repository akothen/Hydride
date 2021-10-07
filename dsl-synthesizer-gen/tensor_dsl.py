

dsl = {
  "vector-mac" : {
    "name" : "vector-mac",
    "args" : "dst, a, b, len, precision",
    "reg" : "dst, a, b",
    "size" : "len",
    "in_precision" : "precision",
    "out_precision" : "precision",
    "semantics" : "   \
                    (define (vector-mac dst a b len precision) \n \
                      (begin  \n \
                      (assert (bv? dst))  \n \
                      (assert (bv? a))  \n \
                      (assert (bv? b))  \n \
                      (apply  \n \
                      concat  \n \
                      (for/list ([j (range len)])  \n \
                        (define tmp  \n \
                          (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \n \
                        (bvadd (ext-bv dst (- (- len 1) j) precision) tmp) \n \
                        ) \n \
                      ) \n \
                      ) \n \
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
                      (apply \n \
                      concat \n \
                      (for/list ([j (range len)]) \n \
                        (define tmp \n \
                          (bvadd (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \n \
                        tmp \n \
                        ) \n \
                      ) \n \
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
                      (apply \n \
                      concat \n \
                      (for/list ([j (range len)]) \n \
                        (define tmp \n \
                          (bvsub (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \n \
                        tmp \n \
                        ) \n \
                      ) \n \
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
                      (apply \n \
                      concat \n \
                      (for/list ([j (range len)]) \n \
                        (define tmp \n \
                          (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \n \
                        tmp \n \
                        ) \n \
                      ) \n \
                      ) \n \
                  ",
  },
}
