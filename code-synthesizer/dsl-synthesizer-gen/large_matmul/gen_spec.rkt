
{
    "tensor-matmul": {
        "semantics":"(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range   2))])  (apply concat  (for/list ([j (reverse (range 2))])  (apply bvadd (for/list ([k (reverse (range 4))])  (define idx_left (+ (* i 4) k)) (define idx_right (+ (* k 2) j))(define value1 (ext-bv arg1 idx_left 8)) (define value2 (ext-bv arg2 idx_right 8))  (bvmul value1 value2)  )  )  )  )  )  ) )",
"args" : ["arg1", "arg2"],
        "arg_types": ["BitVectorConst", "BitVectorConst"],
        "input_length": [64, 64],
        "output_precision": [8]
    }
}