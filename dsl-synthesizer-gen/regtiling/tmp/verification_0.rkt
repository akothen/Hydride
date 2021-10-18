#lang rosette
(require rosette/lib/synthax)
        (require rosette/lib/angelic)
        (require racket/pretty)
(custodian-limit-memory (current-custodian) (* 8000 1024 1024))
(current-bitwidth 32)
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

(define (no-op a) a)

;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= row_idx 0))
  (assume (< row_idx rows))
  (ext-bv mat row_idx row_size)
)

;; Assuming row major matricies
(define (ext-matrix-col mat rows cols col_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= col_idx 0))
  (assume (< col_idx cols))
  (apply concat
  (for/list ([i (reverse (range rows))])
            (define row_start_idx (* i cols))
            (define row_col (+ row_start_idx (- (- cols 1) col_idx )))
            (ext-bv mat row_col type-size)
    )
  )
)

;; Bitvector scalar "load" instruction
(define (scalar-load mem mem_size index type_size)
  (define total_num_elems (/ mem_size type_size))
  (define result 
  (ext-bv mem (- (- total_num_elems  1) index) type_size))
  result
)

;; Bitvector vector "load" instruction
(define (vector-load mem mem_size start num_elems type_size)
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ i start) type_size))
    ))
  result
)

;; Bitvector vector "gather" instruction
(define (strided-gather mem mem_size start stride num_elems type_size)
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ (* i stride) start) type_size))
    ))
  result
)

(define (print-vector vec len precision)
  (for/list ( [i (reverse (range len))])
            (define ith_val (ext-bv vec i precision))
            (print (bitvector->integer ith_val))
            (print " ")
            )
  (println "")
  )

(define (print-mat mat rows cols precision)
  (for/list ( [i (reverse (range rows))])
            (define row (ext-matrix-row mat rows cols i precision))
            (print-vector row cols precision)
)
)

;; Reference Specification
(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range 2))])  (apply concat  (for/list ([j (reverse (range 6))])  (apply bvadd (for/list ([k (reverse (range 4))])  (define idx_left (+ (* i 4) k)) (define idx_right (+ (* k 6) j))(define value1 (ext-bv arg1 idx_left 8)) (define value2 (ext-bv arg2 idx_right 8))  (bvmul value1 value2)  )  )  )  )  )  ) );; DSL Specification
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
                   
                       (define (vector-add a b len precision) 
                       (apply 
                       concat 
                       (for/list ([j (range len)]) 
                         (define tmp 
                           (bvadd (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
                         tmp 
                         ) 
                       ) 
                       ) 
                  
                       (define (vector-sub a b len precision) 
                       (apply 
                       concat 
                       (for/list ([j (range len)]) 
                         (define tmp 
                           (bvsub (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
                         tmp 
                         ) 
                       ) 
                       ) 
                   
                       (define (vector-mul a b len precision) 
                       (apply 
                       concat 
                       (for/list ([j (range len)]) 
                         (define tmp 
                           (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
                         tmp 
                         ) 
                       ) 
                       ) 
                   
 (define (dsl_inst_0 vreg-acc vreg1 vreg2 conc_i_bound conc_j_bound conc_in_precision conc_out_precision) 
 (apply 
 concat 
 (for/list ([i (reverse (range conc_i_bound))]) 
 (define sum 
 (apply 
 bvadd 
 (for/list ([j (reverse (range conc_j_bound))]) 
 (bvmul (sign-ext-bv vreg1 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision) (sign-ext-bv vreg2 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision))))) 
 (bvadd (ext-bv vreg-acc i conc_out_precision) sum)))) 
 
 (define (dsl_inst_1 vreg conc_i_bound conc_precision) 
 (define result 
 (apply 
 bvadd 
 (for/list ([i (reverse (range conc_i_bound))]) 
 (ext-bv vreg i conc_precision)))) 
 result) 
 
(define (gen_impl arg1 arg2)

   (choose

    (apply

     concat

     (list

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (dsl_inst_0 (bv 0 (bitvector 16)) (no-op arg2) arg2 1 2 8 8)

      (dsl_inst_0 (bv 0 (bitvector 16)) arg2 arg2 1 2 8 8)

      (dsl_inst_0

       (bv 0 (bitvector 16))

       arg2

       (strided-gather arg2 192 0 6 2 8)

       1

       2

       8

       8)

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))

      (no-op

       (dsl_inst_0

        (bv 0 (bitvector 16))

        (strided-gather arg2 192 17 6 2 8)

        (strided-gather arg2 192 17 6 2 8)

        1

        2

        8

        8))))))

(define-symbolic _arg0 (bitvector 64))
(define-symbolic _arg1 (bitvector 192))
(define (test_tensor-matmul_impl impl ref)
         	(verify 
         		(assert (equal?
         			(impl _arg0 _arg1) 
         			(ref _arg0 _arg1)))))
(with-output-to-file "./tmp/cex_0.txt" (lambda () (print (test_tensor-matmul_impl tensor-matmul gen_impl))))