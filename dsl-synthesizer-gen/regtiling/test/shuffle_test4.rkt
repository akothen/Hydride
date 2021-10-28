#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)

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
      (if (< index num_elems)
          (ext-bv v1 (- (- num_elems  1) index) type_size)
          (ext-bv v2 (- (- num_elems  1) (- index num_elems)) type_size))
      )))
  result
)

;; Specialized shuffle
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

;; Specialized shuffle and extract
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


;; Code equivalent to matmul
(define (spec arg0 arg1)
  (define row0 (vector-load arg0 64 0 4 8))
  (define row1 (vector-load arg0 64 4 4 8))
  (define col0 (strided-gather arg1 192 0 6 4 8))
  (define col1 (strided-gather arg1 192 1 6 4 8))
  (define col2 (strided-gather arg1 192 2 6 4 8))
  (define col3 (strided-gather arg1 192 3 6 4 8))
  (define col4 (strided-gather arg1 192 4 6 4 8))
  (define col5 (strided-gather arg1 192 5 6 4 8))
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 32)) row0 col0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 32)) row0 col1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 32)) row0 col2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 32)) row0 col3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 32)) row0 col4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 32)) row0 col5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 32)) row1 col0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 32)) row1 col1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 32)) row1 col2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 32)) row1 col3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 32)) row1 col4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 32)) row1 col5 2 2 8 8))
  (define result
  (concat (dsl_inst_1 int_res00 2 8) (dsl_inst_1 int_res01 2 8) (dsl_inst_1 int_res02 2 8)
          (dsl_inst_1 int_res03 2 8) (dsl_inst_1 int_res04 2 8) (dsl_inst_1 int_res05 2 8)
          (dsl_inst_1 int_res10 2 8) (dsl_inst_1 int_res11 2 8) (dsl_inst_1 int_res12 2 8)
          (dsl_inst_1 int_res13 2 8) (dsl_inst_1 int_res14 2 8) (dsl_inst_1 int_res15 2 8))
    )
  result
 )


;; Matmul spec
(define (tensor-matmul arg1 arg2)
  (apply
   concat
   (for/list ([i (reverse (range 2))])
     (apply
      concat
      (for/list ([j (reverse (range 6))])
        (apply
         bvadd
         (for/list ([k (reverse (range 4))])
           (define idx_left (+ (* i 4) k))
           (define idx_right (+ (* k 6) j))
           (define value1 (ext-bv arg1 idx_left 8))
           (define value2 (ext-bv arg2 idx_right 8))
           (bvmul value1 value2)))))))
)


;; Function using shuffle instructions
(define (sketch arg0 arg1)
  (define row0 (vector-load arg0 64 0 4 8))
  (define row1 (vector-load arg0 64 4 4 8))
  (define row10 (vector-load arg1 192 0 6 8))
  (define row11 (vector-load arg1 192 6 6 8))
  (define row12 (vector-load arg1 192 12 6 8))
  (define row13 (vector-load arg1 192 18 6 8))
  (define shufl_top0 (vector-shuffle row10 row11 6 8 (bv #x0006010702080309040a050b 96) 12 8))
  (define shufl_top1 (vector-shuffle row12 row13 6 8 (bv #x0006010702080309040a050b 96) 12 8))
  (define shufl0 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x00010c0d 32) 4 8))
  (define shufl1 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x02030e0f 32) 4 8))
  (define shufl2 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x04051011 32) 4 8))
  (define shufl3 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x06071213 32) 4 8))
  (define shufl4 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x08091415 32) 4 8))
  (define shufl5 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x0a0b1617 32) 4 8))
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl5 2 2 8 8))
  (define result
  (concat (dsl_inst_1 int_res00 2 8) (dsl_inst_1 int_res01 2 8) (dsl_inst_1 int_res02 2 8)
          (dsl_inst_1 int_res03 2 8) (dsl_inst_1 int_res04 2 8) (dsl_inst_1 int_res05 2 8)
          (dsl_inst_1 int_res10 2 8) (dsl_inst_1 int_res11 2 8) (dsl_inst_1 int_res12 2 8)
          (dsl_inst_1 int_res13 2 8) (dsl_inst_1 int_res14 2 8) (dsl_inst_1 int_res15 2 8))
    )
  result
 )


;; Function using shuffle instructions
(define (sketch-special arg0 arg1)
  (define row0 (vector-load arg0 64 0 4 8))
  (define row1 (vector-load arg0 64 4 4 8))
  (define row10 (vector-load arg1 192 0 6 8))
  (define row11 (vector-load arg1 192 6 6 8))
  (define row12 (vector-load arg1 192 12 6 8))
  (define row13 (vector-load arg1 192 18 6 8))
  ;;(define shufl_top0 (vector-shuffle row10 row11 6 8 (bv #x0006010702080309040a050b 96) 12 8))
  (define shufl_top0 (vector-shuffle-special row10 row11 6 8))
  ;;(define shufl_top1 (vector-shuffle row12 row13 6 8 (bv #x0006010702080309040a050b 96) 12 8))
  (define shufl_top1 (vector-shuffle-special row12 row13 6 8))
  ;;(define shufl0 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x00010c0d 32) 4 8))
  (define shufl0 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 0 2))
  ;;(define shufl1 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x02030e0f 32) 4 8))
  (define shufl1 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 2 2))
  ;;(define shufl2 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x04051011 32) 4 8))
  (define shufl2 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 4 2))
  ;;(define shufl3 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x06071213 32) 4 8))
  (define shufl3 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 6 2))
  ;;(define shufl4 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x08091415 32) 4 8))
  (define shufl4 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 8 2))
  ;;(define shufl5 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x0a0b1617 32) 4 8))
  (define shufl5 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 10 2))
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl5 2 2 8 8))
  (define result
  (concat (dsl_inst_1 int_res00 2 8) (dsl_inst_1 int_res01 2 8) (dsl_inst_1 int_res02 2 8)
          (dsl_inst_1 int_res03 2 8) (dsl_inst_1 int_res04 2 8) (dsl_inst_1 int_res05 2 8)
          (dsl_inst_1 int_res10 2 8) (dsl_inst_1 int_res11 2 8) (dsl_inst_1 int_res12 2 8)
          (dsl_inst_1 int_res13 2 8) (dsl_inst_1 int_res14 2 8) (dsl_inst_1 int_res15 2 8))
    )
  result
 )


;; Function using shuffle instructions
(define (sketch-special-cast arg0 arg1)
  (define row0 (vector-load arg0 64 0 4 8))
  (define row1 (vector-load arg0 64 4 4 8))
  (define row10 (vector-load arg1 192 0 6 8))
  (define row11 (vector-load arg1 192 6 6 8))
  (define row12 (vector-load arg1 192 12 6 8))
  (define row13 (vector-load arg1 192 18 6 8))
  ;;(define shufl_top0 (vector-shuffle row10 row11 6 8 (bv #x0006010702080309040a050b 96) 12 8))
  (define shufl_top0 (vector-shuffle-special-cast row10 row11 6 8))
  ;;(define shufl_top1 (vector-shuffle row12 row13 6 8 (bv #x0006010702080309040a050b 96) 12 8))
  (define shufl_top1 (vector-shuffle-special-cast row12 row13 6 8))
  ;;(define shufl0 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x00010c0d 32) 4 8))
  (define shufl0 (vector-shuffle-ext-special-cast shufl_top0 shufl_top1 12 8 0 2))
  ;;(define shufl1 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x02030e0f 32) 4 8))
  (define shufl1 (vector-shuffle-ext-special-cast shufl_top0 shufl_top1 12 8 2 2))
  ;;(define shufl2 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x04051011 32) 4 8))
  (define shufl2 (vector-shuffle-ext-special-cast shufl_top0 shufl_top1 12 8 4 2))
  ;;(define shufl3 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x06071213 32) 4 8))
  (define shufl3 (vector-shuffle-ext-special-cast shufl_top0 shufl_top1 12 8 6 2))
  ;;(define shufl4 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x08091415 32) 4 8))
  (define shufl4 (vector-shuffle-ext-special-cast shufl_top0 shufl_top1 12 8 8 2))
  ;;(define shufl5 (vector-shuffle shufl_top0 shufl_top1 12 8 (bv #x0a0b1617 32) 4 8))
  (define shufl5 (vector-shuffle-ext-special-cast shufl_top0 shufl_top1 12 8 10 2))
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 32)) row0 shufl5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 32)) row1 shufl5 2 2 8 8))
  (define result
  (concat (dsl_inst_1 int_res00 2 8) (dsl_inst_1 int_res01 2 8) (dsl_inst_1 int_res02 2 8)
          (dsl_inst_1 int_res03 2 8) (dsl_inst_1 int_res04 2 8) (dsl_inst_1 int_res05 2 8)
          (dsl_inst_1 int_res10 2 8) (dsl_inst_1 int_res11 2 8) (dsl_inst_1 int_res12 2 8)
          (dsl_inst_1 int_res13 2 8) (dsl_inst_1 int_res14 2 8) (dsl_inst_1 int_res15 2 8))
    )
  result
 )

(define-symbolic sym_arg0 (bitvector 64))
(define-symbolic sym_arg1 (bitvector 192))

(verify
  (assert (equal? (tensor-matmul sym_arg0 sym_arg1)  (sketch-special-cast sym_arg0 sym_arg1))))
