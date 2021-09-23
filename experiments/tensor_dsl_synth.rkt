#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)


;(current-bitwidth 32)

(define int512? (bitvector 512))
(define int256? (bitvector 256))
(define int128? (bitvector 128))
(define int32? (bitvector 32))
(define int8? (bitvector 8))
(define int4? (bitvector 4))

(define (int4 i)
  (bv i int4?))

(define (int8 i)
  (bv i int8?))

(define (int32 i)
  (bv i int32?))

(define (int128 i)
  (bv i int128?))

(define (int256 i)
  (bv i int256?))

(define (int512 i)
  (bv i int512?))

;; Some uility functions
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)
  
(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (no-op a)
  a)


(define (bvmax a b)
  (if (bvsle a b) b a))

(define (tensor-relu arg length width precision)
  (apply
   concat
   (for/list ([i (range length)])
     (apply
      concat
      (for/list ([j (range width)])
        (define size (* length width))
        (define idx (- (- size 1)(+ (* i length) j)))
        
        (define value (ext-bv arg idx precision))
        (define max (bvmax value (bv 0 (bitvector precision))))
        max
        )
      )
    )
   )
  )

; arg1 (length1,common-dim)
; arg2 (common_dim, width2)
(define (tensor-matmul arg1 arg2 length1 common_dim width2 precision)
  (apply
   concat
   (for/list ([i (range length1)])
     (apply concat     
      (for/list ([j (range width2)])
        (define size1 (* length1 common_dim))
        (define size2 (* width2 common_dim))
        
        (apply bvadd
               (for/list ([k (range common_dim)])
               
          (define idx_left (- (- size1 1)(+ (* i common_dim) k)))
          (define idx_right (- (- size2 1)(+ (* k width2) j)))
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



(define (matmul-ref arg1 arg2)
  (apply
   concat
   (for/list ([i (range 8)])
     (apply concat     
      (for/list ([j (range 8)])
        (define size1 (* 8 2))
        (define size2 (* 8 2))
        
        (apply bvadd
               (for/list ([k (range 2)])
               
          (define idx_left (- (- size1 1)(+ (* i 2) k)))
          (define idx_right (- (- size2 1)(+ (* k 8) j)))
          (define value1 (ext-bv arg1 idx_left 32))
          (define value2 (ext-bv arg2 idx_right 32))
          (bvmul value1 value2)
        )
           )
       )
      )
      )
    )
   )


(define (relu-ref arg)
  (apply
   concat
   (for/list ([i (range 4)])
     (apply
      concat
      (for/list ([j (range 4)])
        (define size (* 4 4))
        (define idx (- (- size 1)(+ (* i 4) j)))
        
        (define value (ext-bv arg idx 32))
        (define max (bvmax value (bv 0 (bitvector 32))))
        max
        )
      )
    )
   )
  )



(define arg1  (apply concat
              (for/list ([j (range 16)])
                 (bv j 32))
  )
)

(define arg2  (apply concat
              (for/list ([j (range 16)])
                 (bv j 32))
  )
)

(define acc  (apply concat
              (for/list ([j (range 16)])
                 (bv (- 16 j) 32))
  )
)

(define mat0 (apply concat (list (int32 1) (int32 2) (int32 3) (int32 -1) (int32 1) (int32 2) (int32 3) (int32 -1) (int32 1) (int32 2) (int32 3) (int32 -1) (int32 1) (int32 2) (int32 3) (int32 -1))))
(define mat1 (apply concat (list (int32 2) (int32 2) (int32 -2) (int32 0)(int32 2) (int32 2) (int32 -2) (int32 0) (int32 2) (int32 2) (int32 -2) (int32 0) (int32 2) (int32 2) (int32 -2) (int32 0))))


(define-grammar (tensor-grammar arg0 arg1)
[expr (choose
	arg0
        arg1
        (int512 0)
        (no-op (expr))
        (tensor-relu (expr) 4 4 32)
        (tensor-relu (expr) 8 8 8)
        (tensor-matmul (expr) (expr) 8 2 8 32)
        (tensor-matmul (expr) (expr) 2 4 2 64)
        (tensor-matmul (expr) (expr) 4 2 4 64)
        (tensor-matmul (expr) (expr) 4 8 4 16)
        )]
)

(define (tensor_synth a b)
  (tensor-grammar a b #:depth 2)
)

(assert (equal? (tensor-matmul mat0 mat1 8 2 8 32) (matmul-ref mat0 mat1)))

(define matsol 
(time
(synthesize
     #:forall (list mat0 mat1)
     #:guarantee (assert (and
                          (equal? (matmul-ref mat0 mat1) (tensor_synth mat0 mat1
                                                                    ))
                          
                                )))))


(assert (sat? matsol) "Unsatisfiable")
(print-forms matsol)

(define matmul_gen (generate-forms matsol))


(define-symbolic _left (bitvector 512))
(define-symbolic _right (bitvector 512))


(define (verify-matmul impl ref)
  (verify (assert (equal? (impl _left _right) (ref _left _right)))))

(print-forms (verify-matmul matmul_gen matmul-ref))