#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(custodian-limit-memory (current-custodian) (* 8000 1024 1024))
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
(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range 2))])  (apply concat  (for/list ([j (reverse (range 2))])  (apply bvadd (for/list ([k (reverse (range 2))])  (define idx_left (+ (* i 2) k)) (define idx_right (+ (* k 2) j))(define value1 (ext-bv arg1 idx_left 8)) (define value2 (ext-bv arg2 idx_right 8))  (bvmul value1 value2)  )  )  )  )  )  ) );; DSL Specification
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




;; Same computation as gen_impl
;; However loop body is re-rolled
(define (rolled_impl arg1 arg2 arg1_size arg2_size ibound jbound reduction_len prec)
  (apply concat 
         (for/list ([i (range ibound)])
            (apply concat
            (for/list ([j (range jbound)])

             (dsl_inst_0
              (bv 0 (bitvector (* reduction_len prec))) (vector-load arg1 arg1_size (* i reduction_len) reduction_len prec) 
              
              (vector-shuffle-ext-special
                (choose
                  (vector-shuffle-special
                    (vector-load arg2 arg2_size 2 reduction_len prec)
                    (vector-load arg2 arg2_size 2 reduction_len prec)
                    jbound prec))

                (choose
                  (vector-shuffle-special
                    (vector-load arg2 arg2_size 0 reduction_len prec)
                    (vector-load arg2 arg2_size 2 reduction_len prec)
                    jbound prec))
                (* reduction_len jbound) prec (* j jbound) reduction_len)
              1 reduction_len prec prec)           
            )
            
        )
    )
)
)

(define (gen_impl arg1 arg2)

  (choose
    (apply
      concat
      (list

        (dsl_inst_0

          (bv 0 (bitvector 32))

          (vector-load arg1 32 0 2 8)

          (vector-shuffle-ext-special

            (choose

              (vector-shuffle-special

                (vector-load arg2 32 2 2 8)

                (vector-load arg2 32 2 2 8)

                2

                8))

            (choose

              (vector-shuffle-special

                (vector-load arg2 32 0 2 8)

                (vector-load arg2 32 2 2 8)

                2

                8))

            4

            8

            0

            2)

          1

          2

          8

          8)

        (no-op

          (dsl_inst_0

            (bv 0 (bitvector 32))

            (vector-load arg1 32 0 2 8)

            (vector-shuffle-ext-special

              (choose

                (vector-shuffle-special

                  (vector-load arg2 32 2 2 8)

                  (vector-load arg2 32 2 2 8)

                  2

                  8))

              (choose

                (vector-shuffle-special

                  (vector-load arg2 32 0 2 8)

                  (vector-load arg2 32 2 2 8)

                  2

                  8))

              4

              8

              2

              2)

            1

            2

            8

            8))

        (dsl_inst_0

          (bv 0 (bitvector 32))

          (vector-load arg1 32 2 2 8)

          (vector-shuffle-ext-special

            (choose

              (vector-shuffle-special

                (vector-load arg2 32 2 2 8)

                (vector-load arg2 32 2 2 8)

                2

                8))

            (choose

              (vector-shuffle-special

                (vector-load arg2 32 0 2 8)

                (vector-load arg2 32 2 2 8)

                2

                8))

            4

            8

            0

            2)

          1

          2

          8

          8)

        (no-op

          (dsl_inst_0

            (bv 0 (bitvector 32))

            (vector-load arg1 32 2 2 8)

            (vector-shuffle-ext-special

              (choose

                (vector-shuffle-special

                  (vector-load arg2 32 2 2 8)

                  (vector-load arg2 32 2 2 8)

                  2

                  8))

              (choose

                (vector-shuffle-special

                  (vector-load arg2 32 0 2 8)

                  (vector-load arg2 32 2 2 8)

                  2

                  8))

              4

              8

              2

              2)

            1

            2

            8

            8))))))

(define-symbolic _arg0 (bitvector 32))
(define-symbolic _arg1 (bitvector 32))
(define (test_tensor-matmul_impl impl ref)
  (verify 
    (assert (equal?
              (impl _arg0 _arg1 32 32 2 2 2 8) 
              (ref _arg0 _arg1)))))



(define cex (test_tensor-matmul_impl rolled_impl tensor-matmul))
(assert (sat? cex) "Rolled Definition is equivalent to unrolled!")
(define cex_arg0 (evaluate _arg0 cex))
(define cex_arg1 (evaluate _arg1 cex))
(println "Rolled Definition not equivalent!")


(println "InputA:")
(print-mat cex_arg0 2 2 8)


(println "InputB:")
(print-mat cex_arg1 2 2 8)


(define gen_res (gen_impl cex_arg0 cex_arg1))
(define rolled_res (rolled_impl cex_arg0 cex_arg1 32 32 2 2 2 8))


(println "gen_impl_res::")
(print-mat gen_res 2 2 8)


(println "rolled_impl_res::")
(print-mat rolled_res 2 2 8)

