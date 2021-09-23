(define (tensor-matmul arg1 arg2 length1 common_dim width2 precision)
  (apply
   concat
   (for/list ([i (range length1)])
     (apply
      concat
      (for/list ([j (range width2)])
        (define size1 (* length1 common_dim))
        (define size2 (* width2 common_dim))
        (apply
         bvadd
         (for/list ([k (range common_dim)])
          (define idx_left (- (- size1 1)(+ (* i length1) k)))
          (define idx_right (- (- size2 1)(+ (* k common_dim) j)))
          (define value1 (ext-bv arg1 idx_left precision))
          (define value2 (ext-bv arg2 idx_right precision))
          (bvmul value1 value2)
         )
        )
       )
      )
     )
    )
   )
   
   
(define (vector-mac dst a b len precision)
 (begin
  (assert (bv? dst))
  (assert (bv? a))
  (assert (bv? b))
  (apply
   concat
   (for/list ([j (range len)])
     (define tmp
       (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision)))
     (bvadd (ext-bv dst (- (- len 1) j) precision) tmp)
    )
   )
  )
)
