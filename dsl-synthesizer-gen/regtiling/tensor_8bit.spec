{
    "tensor-matmul": {
        "semantics":"(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range 4))])  (apply concat  (for/list ([j (reverse (range 4))])  (apply bvadd (for/list ([k (reverse (range 4))])  (define idx_left (+ (* i 4) k)) (define idx_right (+ (* k 4) j))(define value1 (ext-bv arg1 idx_left 4)) (define value2 (ext-bv arg2 idx_right 4))  (bvmul value1 value2)  )  )  )  )  )  ) )",
"args" : ["arg1", "arg2"],
        "arg_types": ["BitVectorConst", "BitVectorConst"],
        "input_length": [128, 128],
        "output_precision": [8]
    }
}
