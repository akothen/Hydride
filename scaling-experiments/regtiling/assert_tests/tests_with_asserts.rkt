#lang rosette
(require rosette/lib/synthax)
        (require rosette/lib/angelic)
        (require racket/pretty)
(custodian-limit-memory (current-custodian) (* 16000 1024 1024))
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
  (assert (equal? (bvlength mem) mem_size))
  (define total_num_elems (/ mem_size type_size))
  (define result 
  (ext-bv mem (- (- total_num_elems  1) index) type_size))
  (assert (equal? (bvlength result) type_size))
  result
)

;; Bitvector vector "load" instruction
(define (vector-load mem mem_size start num_elems type_size)
  (assert (equal? (bvlength mem) mem_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ i start) type_size))
    ))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Bitvector vector "gather" instruction
(define (strided-gather mem mem_size start stride num_elems type_size)
  (assert (equal? (bvlength mem) mem_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ (* i stride) start) type_size))
    ))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)


;; An example of a masked vector "load" instruction
(define (masked-vector-load mem mem_size start type_size mask num_elems mask_type_size)
  (assert (equal? (bvlength mem) mem_size))
  (assert (equal? (bvlength mask) (* num_elems mask_type_size)))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (if (equal? (ext-bv mask (- (- num_elems 1) i) mask_type_size) (bv 0 mask_type_size))
          (bv 0 type_size)          
          (scalar-load mem mem_size (+ i start) type_size))
    )))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Example of vector shuffle
(define (vector-shuffle v1 v2 num_elems type_size mask mask_num_elems mask_type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (assert (equal? (bvlength mask) (* mask_num_elems mask_type_size)))
  (define result
   (apply
    concat
    (for/list ([i (reverse (range mask_num_elems))])
      (define index (bitvector->natural (ext-bv mask i mask_type_size)))
      (if (< index num_elems)
          (ext-bv v1 (- (- num_elems  1) index) type_size)
          (ext-bv v2 (- (- num_elems  1) (- index num_elems)) type_size))
      )))
  (assert (equal? (bvlength result) (* mask_num_elems type_size)))
  result
)

;; Specialized (mask-less) shuffle 
(define (vector-shuffle-special v1 v2 num_elems type_size)
  ;;(assert (equal? (bvlength v1) (bvlength v2)))
  ;;(assert (equal? (bvlength v1) (* num_elems type_size)))
  (define result
   (apply
    concat
    (for/list ([i (reverse (range num_elems))])
       (concat
          (ext-bv v1 i type_size)
          (ext-bv v2 i type_size)
          )
        )
      ))
  ;;(assert (equal? (bvlength result) (* 2 (bvlength v1))))
  result
)

;; Specialized (mask-less) shuffle and extract
(define (vector-shuffle-ext-special v1 v2 num_elems type_size start num_lump)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define result
    (concat 
    (apply
     concat
     (for/list ([i (range num_lump)])
          (ext-bv v1 (- (- num_elems  1) (+ i start)) type_size))
     )
     (apply
     concat
     (for/list ([i (range num_lump)])
          (ext-bv v2 (- (- num_elems  1) (+ i start)) type_size))
      )
     )
    )
  (assert (equal? (bvlength result) (* (* 2 num_lump) type_size)))
  result
)

;; Bitvector to vector
(define (bv-to-vector v num_elems type_size)
  (assert (equal? (bvlength v) (* num_elems type_size)))
  (define result (make-vector num_elems))
  (for/list ([i (reverse (range num_elems))])
    (define tmp (bitvector->integer (ext-bv v i type_size)))
    (vector-set! result (- (- num_elems 1) i) tmp)
    )
  (assert (equal? (vector-length result) num_elems))
  result
)

;; vector to bitvector
(define (vector-to-bv v type_size)
  (define num_elems (vector-length v))
  (define result
    (apply
     concat
      (for/list ([i (range num_elems)])
        (integer->bitvector (vector-ref v i) (bitvector type_size))
        )
      )
    )
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Perform shuffle on vector
(define (vector-shuffle-special-internal v1 v2)
  (assert (equal? (vector-length v1) (vector-length v2)))
  (define num_elems (+ (vector-length v1) (vector-length v2)))
  (define result (make-vector num_elems))
  (for/list ([i (range (vector-length v1))])
    (define tmp1 (vector-ref v1 i))
    (define tmp2 (vector-ref v2 i))
    (vector-set! result (* 2 i) tmp1)
    (vector-set! result (+ (* 2 i) 1) tmp2)
  )
  (assert (equal? (vector-length result) (* 2 (vector-length v1))))
  result
)

;; Specialized shuffle version 2
(define (vector-shuffle-special-cast v1 v2 num_elems type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define vect1 (bv-to-vector v1 num_elems type_size))
  (define vect2 (bv-to-vector v2 num_elems type_size))
  (define res-vect (vector-shuffle-special-internal vect1 vect2))
  (define result (vector-to-bv res-vect type_size))
  result
)


;; Perform shuffle-ext on vectors
(define (vector-shuffle-ext-special-internal v1 v2 start num_lump)
  (assert (equal? (vector-length v1) (vector-length v2)))
  (define result (make-vector (* 2 num_lump)))
  (for/list ([i (range num_lump)])
    (define tmp (vector-ref v1 (+ start i)))
    (vector-set! result i tmp)
  )
  (for/list ([i (range num_lump)])
    (define tmp (vector-ref v2 (+ start i)))
    (vector-set! result (+ num_lump i) tmp)
  )
  (assert (equal? (vector-length result) (* 2 num_lump)))
  result
)


;; Specialized (mask-less) shuffle and extract version 2
(define (vector-shuffle-ext-special-cast v1 v2 num_elems type_size start num_lump)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define vect1 (bv-to-vector v1 num_elems type_size))
  (define vect2 (bv-to-vector v2 num_elems type_size))
  (define res-vect (vector-shuffle-ext-special-internal vect1 vect2 start num_lump))
  (define result (vector-to-bv res-vect type_size))
  result
)


;; An example of vector broadcast
(define (vector-broadcast val num_elems type_size)
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (ext-bv val 0 type_size)
    )))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Implementation of a simple custom concat operation
(define (vector-shufl-concat v1 v2 num_elems type_size)
 (assert (equal? (bvlength v1) (bvlength v2)))
 (assert (equal? (bvlength v1) (* num_elems type_size)))
 (define old_size (* num_elems type_size))
 (define result_size (* 2 old_size))
 (define new-v1 (zero-extend v1 (bitvector result_size)))
 (define new-v2 (zero-extend v2 (bitvector result_size)))
 (define result (bvor (bvshl new-v1 (bv old_size result_size)) new-v2))
 (assert (equal? (bvlength result) ( * 2 (bvlength v1))))
 result
)


;; Interleave-low instruction
(define (vector-interleave-low v1 v2 num_elems type_size num_lanes)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define num_lanes_elems (/ num_elems num_lanes))
  (define low (/ num_lanes_elems 2))
  (define high num_lanes_elems)
  (define result
    (apply
     concat
     (for/list ([i (reverse (range num_lanes))])
       (apply
        concat
        (for/list ([j (reverse (range low high))])
          (concat (ext-bv v1 (+ j (* i num_lanes_elems)) type_size) (ext-bv v2 (+ j (* i num_lanes_elems)) type_size))
         )
        )
       )
     )
    )
  (assert (equal? (bvlength result) (bvlength v1)))
  result
)


;; Interleave-high instruction
(define (vector-interleave-high v1 v2 num_elems type_size num_lanes)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define num_lanes_elems (/ num_elems num_lanes))
  (define low 0)
  (define high (/ num_lanes_elems 2))
  (define result
    (apply
     concat
     (for/list ([i (reverse (range num_lanes))])
       (apply
        concat
        (for/list ([j (reverse (range low high))])
          (concat (ext-bv v1 (+ j (* i num_lanes_elems)) type_size) (ext-bv v2 (+ j (* i num_lanes_elems)) type_size))
         )
        )
       )
     )
    )
  (assert (equal? (bvlength result) (bvlength v1)))
  result
)

;; masked-blend instuction
(define (vector-masked-blend v1 v2 num_elems type_size mask mask_type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (assert (equal? (bvlength mask) (* num_elems mask_type_size)))
  (define result
    (apply 
    concat
    (for/list ([i (reverse (range num_elems))])
      (pretty-print (ext-bv mask i mask_type_size))
      (if (equal? (ext-bv mask i mask_type_size) (bv 0 mask_type_size))
      (ext-bv v1 i type_size)
      (ext-bv v2 i type_size)
     )
    )
    )
  )
  (assert (equal? (bvlength result) (bvlength v1)))
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
                       (define (vector-mac v1 v2 v3 num_elems type_size) 
                     ;;(assert (equal? (bvlength v1) (* num_elems type_size))) 
                     ;;(assert (equal? (bvlength v2) (* num_elems type_size))) 
                     ;;(assert (equal? (bvlength v3) (* num_elems type_size))) 
                       (define result 
                        (apply   
                         concat 
                         (for/list ([i (reverse (range num_elems))]) 
                            (define tmp 
                              (bvmul (ext-bv v2 i type_size) (ext-bv v3 i type_size))) 
                           (bvadd (ext-bv v1 i type_size) tmp) 
                           ))) 
                       ;;(assert (equal? (bvlength result) (* num_elems type_size))) 
                       result 
                     ) 
                   
                       (define (vector-add a b len precision) 
                     ;;(assert (equal? (bvlength a) (* len precision))) 
                     ;;(assert (equal? (bvlength b) (* len precision))) 
                     (define result 
                       (apply 
                       concat 
                       (for/list ([j (reverse (range len))]) 
                         (define tmp 
                           (bvadd (ext-bv a j precision) (ext-bv b j precision))) 
                         tmp 
                         ) 
                       ) 
                       ) 
                       ;;(assert (equal? (bvlength result) (* len precision))) 
                       result 
                       ) 
                  
                       (define (vector-sub a b len precision) 
                     ;;(assert (equal? (bvlength a) (* len precision))) 
                     ;;(assert (equal? (bvlength b) (* len precision))) 
                      (define result 
                       (apply 
                       concat 
                       (for/list ([j (reverse (range len))]) 
                         (define tmp 
                           (bvsub (ext-bv a j precision) (ext-bv b j precision))) 
                         tmp 
                         ) 
                       ) 
                       ) 
                       ;;(assert (equal? (bvlength result) (* len precision))) 
                       result 
                       ) 
                   
                       (define (vector-mul a b len precision) 
                       ;;(assert (equal? (bvlength a) (* len precision))) 
                       ;;(assert (equal? (bvlength b) (* len precision))) 
                       (define result 
                       (apply 
                       concat 
                       (for/list ([j (reverse (range len))]) 
                         (define tmp 
                           (bvmul (ext-bv a j precision) (ext-bv b j precision))) 
                         tmp 
                         ) 
                       ) 
                       ) 
                       ;;(assert (equal? (bvlength result) (* len precision))) 
                       result 
                       ) 
                   
 (define (dsl_inst_0 vreg-acc vreg1 vreg2 conc_i_bound conc_j_bound conc_in_precision conc_out_precision) 
 ;;(assert (equal? (bvlength vreg-acc) (* conc_i_bound conc_out_precision))) 
 ;;(assert (equal? (bvlength vreg1) (* (* conc_i_bound conc_j_bound) conc_in_precision))) 
 ;;(assert (equal? (bvlength vreg2) (* (* conc_i_bound conc_j_bound) conc_in_precision))) 
 (define result 
 (apply 
 concat 
 (for/list ([i (reverse (range conc_i_bound))]) 
 (define sum 
 (apply 
 bvadd 
 (for/list ([j (reverse (range conc_j_bound))]) 
 (bvmul (sign-ext-bv vreg1 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision) (sign-ext-bv vreg2 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision))))) 
 (bvadd (ext-bv vreg-acc i conc_out_precision) sum)))) 
 (assert (equal? (bvlength result) (* conc_i_bound conc_out_precision))) 
 result) 
 
 (define (dsl_inst_1 vreg conc_i_bound conc_precision) 
 (assert (equal? (bvlength vreg) (* conc_i_bound conc_precision))) 
 (define result 
 (apply 
 bvadd 
 (for/list ([i (reverse (range conc_i_bound))]) 
 (ext-bv vreg i conc_precision)))) 
 (assert (equal? (bvlength result) conc_precision)) 
 result) 
 
;; Grammar Definition
;; Grammar Definition

(define-grammar (gen-grammar arg0 arg1)
[top (choose
       (apply concat (list (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) (expr) ))
)]


[mem (choose
        (vector-load arg0 64 0 4 8)
        (vector-load arg0 64 4 4 8)
        (vector-load arg1 192 0 6 8)
        (vector-load arg1 192 6 6 8)
        (vector-load arg1 192 12 6 8)
        (vector-load arg1 192 18 6 8)
)]

;;[shufl (choose
;;         (vector-shuffle-special (mem) (mem) 6 8)
;;)]

[shufl (choose
        (no-op (shufl))
        (vector-shuffle-special (mem) (mem) 6 8)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 0 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 2 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 4 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 6 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 8 2)
        (vector-shuffle-ext-special (shufl) (shufl) 12 8 10 2)
)]

[expr (choose
        (dsl_inst_0 (bv 0 (bitvector 32)) (mem) (shufl) 2 2 8 8)
        (dsl_inst_1 (expr) 2 8)
        (no-op (expr))
    )]
)

(define (synth_grammar arg1 arg2)
                    (gen-grammar arg1 arg2 #:depth 5))
(define cex_set0_arg0 (bv #x1111111111111111 64))
(define cex_set0_arg1 (bv #x222222222222222222222222222222222222222222222222 192))

(define sol
(synthesize
#:forall (list cex_set0_arg0 cex_set0_arg1)
#:guarantee (assert (and (assert 
 (equal? (synth_grammar cex_set0_arg0 cex_set0_arg1) (tensor-matmul cex_set0_arg0 cex_set0_arg1)))))
))
(assert (sat? sol) "Unsatisfiable")

(define gen_impl (generate-forms sol))

(with-output-to-file "./tmp/check_0.txt" (lambda () (print-forms sol)))
