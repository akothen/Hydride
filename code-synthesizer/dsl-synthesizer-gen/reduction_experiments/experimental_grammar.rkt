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


;; An example of a masked vector "load" instruction
(define (masked-vector-load mem mem_size start num_elems type_size mask mask_size mask_type_size)
  (define total_num_mask_elems (/ mask_size mask_type_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (if (equal? (ext-bv mask (- (- total_num_mask_elems 1) i) mask_type_size) (bv 0 mask_type_size))
          (bv 0 type_size)          
          (scalar-load mem mem_size (+ i start) type_size))
    )))
  result
)

;; Example of vector shuffle
(define (vector-shuffle v1 v2 num_elems type_size mask mask_num_elems mask_type_size)
  (define result
   (apply
    concat
    (for/list ([i (reverse (range mask_num_elems))])
      (define index (bitvector->natural (ext-bv mask i mask_type_size)))
      ;;(pretty-print (ext-bv mask i mask_type_size))
      ;;(pretty-print index)
      (if (< index num_elems)
          (ext-bv v1 (- (- num_elems  1) index) type_size)
          (ext-bv v2 (- (- num_elems  1) (- index num_elems)) type_size))
      )))
  result
)

;; Specialized (mask-less) shuffle 
(define (vector-shuffle-special v1 v2 num_elems type_size)
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
  result
)

;; Specialized (mask-less) shuffle and extract
(define (vector-shuffle-ext-special v1 v2 num_elems type_size start num_lump)
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
  result
)

;; Bitvector to vector
(define (bv-to-vector v num_elems type_size)
  (define result (make-vector num_elems))
  (for/list ([i (reverse (range num_elems))])
    (define tmp (bitvector->integer (ext-bv v i type_size)))
    (vector-set! result (- (- num_elems 1) i) tmp)
    )
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
  result
)

;; Specialized shuffle version 2
(define (vector-shuffle-special-cast v1 v2 num_elems type_size)
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
  result
)


;; Specialized (mask-less) shuffle and extract version 2
(define (vector-shuffle-ext-special-cast v1 v2 num_elems type_size start num_lump)
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
  result
)

;; Implementation of a simple custom concat operation
(define (vector-shufl-concat v1 v2 num_elems type_size)
 (define old_size (* num_elems type_size))
 (define result_size (* 2 old_size))
 (define new-v1 (zero-extend v1 (bitvector result_size)))
 (define new-v2 (zero-extend v2 (bitvector result_size)))
 (define result (bvor (bvshl new-v1 (bv old_size result_size)) new-v2))
 result
)


;; Interleave-low instruction
(define (vector-interleave-low v1 v2 num_elems type_size num_lanes)
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
    result
)


;; Interleave-high instruction
(define (vector-interleave-high v1 v2 num_elems type_size num_lanes)
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
    result
)

;; masked-blend instuction
(define (vector-masked-blend v1 v2 num_elems type_size mask mask_type_size)
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
  result
)


;; Subtensor extraction based on number of subtensors to skip (starting from top-left corner)
(define (sub-tensor-ext tensor tensor_size rows cols sub_rows sub_cols type_size idx)
  (define subtensor_size (* (* sub_rows sub_cols) type_size))
  (define subtensors_per_row (/ cols sub_cols)) ; 2
  (define skip_subs (* (quotient idx subtensors_per_row) subtensors_per_row)) 
  (define subrow_offset (remainder idx subtensors_per_row)) ;; 1
  (define row_size (* cols type_size))
  (define sub_row_size (* sub_cols type_size))
  (define subtensor_start (+ (* subrow_offset sub_row_size) (* skip_subs subtensor_size)))
  (define start_idx (/ subtensor_start type_size))
  (apply concat (for/list ([i (range sub_rows)])
                          (vector-load tensor tensor_size (+ start_idx (* i cols)) sub_cols type_size)
                          
                          ))
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
 (define (max-pool mat)   (define mat-size (* (* 4 4) 8))   (define submat-size (* (* 2 2) 8))   (define num_submat (quotient mat-size submat-size))   (apply concat (for/list ([i (range num_submat)])                           (define submat (sub-tensor-ext mat mat-size 4 4 2 2 8 i))                            (apply bvadd                                  (for/list ([j (reverse (range (* 2 2)))])                                            (ext-bv submat j 8)                                            )                                  )                           )) );; DSL Specification
                       (define (vector-mac v1 v2 v3 num_elems type_size) 
                       (define result 
                        (apply   
                         concat 
                         (for/list ([i (reverse (range num_elems))]) 
                            (define tmp 
                              (bvmul (ext-bv v2 i type_size) (ext-bv v3 i type_size))) 
                           (bvadd (ext-bv v1 i type_size) tmp) 
                           ))) 
                       result 
                     ) 
                   
                       (define (vector-add a b len precision) 
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
                       result 
                       ) 
                  
                       (define (vector-sub a b len precision) 
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
                       result 
                       ) 
                   
                       (define (vector-mul a b len precision) 
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
                       result 
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
 
 (define (vector-reduce-add vec vec_size stride window_len num_elems type_size)
   (apply concat (for/list ([i  (range num_elems)]) 
                           (define offset (* i stride)) 
                           (define slice (vector-load vec vec_size offset window_len type_size))
                           (apply bvadd 
                                  (for/list ([j (reverse (range window_len))]) 
                                            (ext-bv slice j type_size)
                                            )
                                 )
                           )
          )
   )
 
 (define (vector-reduce-smax vec vec_size stride window_len num_elems type_size)
   (apply concat (for/list ([i  (range num_elems)]) 
                           (define offset (* i stride)) 
                           (define slice (vector-load vec vec_size offset window_len type_size))
                           (apply bvsmax 
                                  (for/list ([j (reverse (range window_len))]) 
                                            (ext-bv slice j type_size)
                                            )
                                 )
                           )
          )
   )
 
 (define (vector-reduce-mul vec vec_size stride window_len num_elems type_size)
   (apply concat (for/list ([i  (range num_elems)]) 
                           (define offset (* i stride)) 
                           (define slice (vector-load vec vec_size offset window_len type_size))
                           (apply bvmul 
                                  (for/list ([j (reverse (range window_len))]) 
                                            (ext-bv slice j type_size)
                                            )
                                 )
                           )
          )
   )
 
;; Grammar Definition
;; Grammar Definition
(define-cost-grammar (gen-grammar arg0)



[expr (choose-cost
	arg0
	(no-op (expr))
	(bv 0 (bitvector 8))
    (vector-reduce-mul (re_order) 128 4 4 4 8)
    (vector-reduce-smax (re_order) 128 4 4 4 8)
    (vector-reduce-add (re_order) 128 4 4 4 8)
    )]


[re_order (choose-cost
            (apply concat (list (sub_tensor)  (sub_tensor)  
                                (sub_tensor)  (sub_tensor)  
                                )))]

[sub_tensor (choose-cost 
               (sub-tensor-ext arg0 128 4 4 2 2 8 0)
               (sub-tensor-ext arg0 128 4 4 2 2 8 1)
               (sub-tensor-ext arg0 128 4 4 2 2 8 2)
               (sub-tensor-ext arg0 128 4 4 2 2 8 3)
              )]


)




(define (synth_grammar mat)
                    (gen-grammar mat #:cost 2))

(define cex_set0_arg0 (bv #x00000000000000000000000000000000 128))
(define cex_set1_arg0 (bv #x8ffdcc00000000009c00fefe000001ff 128))

(define sol
(synthesize
#:forall (list cex_set0_arg0 cex_set1_arg0)
#:guarantee (assert (and (assert 
 (equal? (synth_grammar cex_set0_arg0) (max-pool cex_set0_arg0)))
(assert 
 (equal? (synth_grammar cex_set1_arg0) (max-pool cex_set1_arg0)))))
))
(assert (sat? sol) "Unsatisfiable")

(define gen_impl (generate-forms sol))

(with-output-to-file "./tmp/check_1.txt" (lambda () (print-forms sol)))
