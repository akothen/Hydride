

dsl = {
  "vector-mac" : {
    "name" : "vector-mac",
    "args" : "dst, a, b, len, precision",
    "semantics" : "{   \
                (define (vector-mac dst a b len precision) \
                  (begin  \
                  (assert (bv? dst))  \
                  (assert (bv? a))  \
                  (assert (bv? b))  \
                  (apply  \
                  concat  \
                  (for/list ([j (range len)])  \
                    (define tmp  \
                      (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \
                    (bvadd (ext-bv dst (- (- len 1) j) precision) tmp) \
                    ) \
                  ) \
                  ) \
                ) \
              }",
  },

  "vector-add" : {
    "name" : "vector-add",
    "args" : "a, b, len, precision",
    "semantics" : "{   \
                (define (vector-add a b len precision) \
                  (apply \
                  concat \
                  (for/list ([j (range len)]) \
                    (define tmp \
                      (bvadd (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \
                    tmp \
                    ) \
                  ) \
                  ) \
              }",
  },

  "vector-sub" : {
    "name" : "vector-sub",
    "args" : "a, b, len, precision",
    "semantics" : "{   \
                (define (vector-sub a b len precision) \
                  (apply \
                  concat \
                  (for/list ([j (range len)]) \
                    (define tmp \
                      (bvsub (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) \
                    tmp \
                    ) \
                  ) \
                  ) \
              }",
  },
}
