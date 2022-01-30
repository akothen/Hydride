{
    "tensor-matmul": {
        "semantics":"(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range 2))])  (apply concat  (for/list ([j (reverse (range 6))])  (apply bvadd (for/list ([k (reverse (range 4))])  (define idx_left (+ (* i 4) k)) (define idx_right (+ (* k 6) j))(define value1 (ext-bv arg1 idx_left 32)) (define value2 (ext-bv arg2 idx_right 32))  (bvmul value1 value2)  )  )  )  )  )  ) )",
"args" : ["arg1", "arg2"],
        "arg_types": ["BitVectorConst", "BitVectorConst"],
        "input_length": [256, 768],
        "output_precision": [32]
    }
}
