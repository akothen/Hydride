


spec = {
  "tensor-matmul" : {
    "name" : "tensor-matmul",
    "args" : "arg1, arg2, length1, common_dim, width2, precision",
    "semantics" : "{   \
                (define (tensor-matmul arg1 arg2 length1 common_dim width2 precision) \
                  (apply \
                  concat \
                  (for/list ([i (range length1)])  \
                    (apply concat  \
                      (for/list ([j (range width2)])  \
                        (define size1 (* length1 common_dim))  \
                        (define size2 (* width2 common_dim))  \
                        (apply bvadd (for/list ([k (range common_dim)])  \
                          (define idx_left (- (- size1 1)(+ (* i common_dim) k)))  \
                          (define idx_right (- (- size2 1)(+ (* k width2) j)))  \
                          (define value1 (ext-bv arg1 idx_left precision)) \
                          (define value2 (ext-bv arg2 idx_right precision))  \
                          (bvmul value1 value2)  \
                        )  \
                          )  \
                      )  \
                      )  \
                      )  \
                    ) \
                  ) \
              }",
  },

  "tensor-relu" : {
    "name" : "tensor-relu",
    "args" : "arg, length, width, precision",
    "semantics" : "{  \
            (define (tensor-relu arg length width precision)  \
              (apply   \
              concat   \
              (for/list ([i (range length)])  \
                (apply  \
                  concat  \
                  (for/list ([j (range width)])  \
                    (define size (* length width))  \
                    (define idx (- (- size 1)(+ (* i length) j)))  \
                    (define value (ext-bv arg idx precision)) \
                    (define max (bvmax value (bv 0 (bitvector precision)))) \
                    max \
                    ) \
                  ) \
                ) \
              ) \
              ) \
            }",
  },
}