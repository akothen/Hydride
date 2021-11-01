#lang rosette
(require rosette/lib/synthax)
        (require rosette/lib/angelic)
        (require racket/pretty)
(custodian-limit-memory (current-custodian) (* 10000 1024 1024))
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
(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range 4))])  (apply concat  (for/list ([j (reverse (range 4))])  (apply bvadd (for/list ([k (reverse (range 4))])  (define idx_left (+ (* i 4) k)) (define idx_right (+ (* k 4) j))(define value1 (ext-bv arg1 idx_left 8)) (define value2 (ext-bv arg2 idx_right 8))  (bvmul value1 value2)  )  )  )  )  )  ) );; DSL Specification
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
 
;; Grammar Definition
;; Grammar Definition
(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr)))
       ;;(apply concat (list (expr) (expr) (expr) (expr)))
       ;;(concat (top) (top))
)]

[expr (choose
	arg0
	arg1
	(no-op (expr))
	(bv 0 (bitvector 32))
	(bv 0 (bitvector 128))
	;;(concat (expr) (expr))
    ;;(apply concat (list  (expr) (expr) (expr) (expr) (expr) (expr) ))
    ;;(apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
	(dsl_inst_0 (expr) (expr) (expr) 1 4 8 8)
	(ext-matrix-row (expr) 4 4 0 8)
	(ext-matrix-row (expr) 4 4 1 8)
	(ext-matrix-row (expr) 4 4 2 8)
	(ext-matrix-row (expr) 4 4 3 8)
	(ext-matrix-col (expr) 4 4 0 8)
	(ext-matrix-col (expr) 4 4 1 8)
	(ext-matrix-col (expr) 4 4 2 8)
	(ext-matrix-col (expr) 4 4 3 8)
    )]
)




(define (synth_grammar arg1 arg2)
                    (gen-grammar arg1 arg2 #:depth 3))
(define cex_set0_arg0 (bv #x11111111111111111111111111111111 128))
(define cex_set0_arg1 (bv #x22222222222222222222222222222222 128))

(define sol
(synthesize
#:forall (list cex_set0_arg0 cex_set0_arg1)
#:guarantee (assert (and (assert 
 (equal? (synth_grammar cex_set0_arg0 cex_set0_arg1) (tensor-matmul cex_set0_arg0 cex_set0_arg1)))))
))
(assert (sat? sol) "Unsatisfiable")

(define gen_impl (generate-forms sol))

(with-output-to-file "./tmp/check_0.txt" (lambda () (print-forms sol)))
