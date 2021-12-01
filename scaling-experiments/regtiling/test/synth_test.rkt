#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)


(custodian-limit-memory (current-custodian) (* 10000 1024 1024))

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
  ;(assert (equal? (bvlength mem) mem_size))
  (define total_num_elems (/ mem_size type_size))
  (define result
  (ext-bv mem (- (- total_num_elems  1) index) type_size))
  ;(assert (equal? (bvlength result) type_size))
  result
)

;; Bitvector vector "load" instruction
(define (vector-load mem mem_size start num_elems type_size)
  ;(assert (equal? (bvlength mem) mem_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ i start) type_size))
    ))
  ;(assert (equal? (bvlength result) (* num_elems type_size)))
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
  ;(assert (equal? (bvlength v1) (* num_elems type_size)))
  ;(assert (equal? (bvlength v2) (* num_elems type_size)))
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
  ;(assert (equal? (bvlength result) (* 2 (* num_elems type_size))))
  result
)

;; Specialized shuffle and extract
(define (vector-shuffle-ext-special v1 v2 num_elems type_size start num_lump)
  ;(assert (equal? (bvlength v1) (* num_elems type_size)))
  ;(assert (equal? (bvlength v2) (* num_elems type_size)))
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
  ;(assert (equal? (bvlength result) (* (* 2 num_lump) type_size)))
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
  ;(assert (equal? (bvlength vreg-acc) (* conc_i_bound conc_out_precision))) 
  ;(assert (equal? (bvlength vreg1) (* (* conc_i_bound conc_j_bound) conc_in_precision)))
  ;(assert (equal? (bvlength vreg2) (* (* conc_i_bound conc_j_bound) conc_in_precision))) 
  (define result 
  (apply
   concat 
   (for/list ([i (reverse (range conc_i_bound))])
     (define sum 
       (apply 
        bvadd
        (for/list ([j (reverse (range conc_j_bound))]) 
          (bvmul (sign-ext-bv vreg1 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision) (sign-ext-bv vreg2 (+ j (* i conc_j_bound)) conc_in_precision conc_out_precision)))))
      (bvadd (ext-bv vreg-acc i conc_out_precision) sum)))
  )
  ;(assert (equal? (bvlength result) (* conc_i_bound conc_out_precision))) 
  result
 )



(define (dsl_inst_1 vreg conc_i_bound conc_precision) 
  ;(assert (equal? (bvlength vreg) (* conc_i_bound conc_precision))) 
  (define result
    (apply
     bvadd
     (for/list ([i (reverse (range conc_i_bound))])
       (ext-bv vreg i conc_precision)))) 
  ;(assert (equal? (bvlength result) conc_precision)) 
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
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 16)) row0 col0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 16)) row0 col1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 16)) row0 col2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 16)) row0 col3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 16)) row0 col4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 16)) row0 col5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 16)) row1 col0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 16)) row1 col1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 16)) row1 col2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 16)) row1 col3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 16)) row1 col4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 16)) row1 col5 2 2 8 8))
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
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl5 2 2 8 8))
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
  (define shufl_top0 (vector-shuffle-special row10 row11 6 8))
  (define shufl_top1 (vector-shuffle-special row12 row13 6 8))
  (define shufl0 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 0 2))
  (define shufl1 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 2 2))
  (define shufl2 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 4 2))
  (define shufl3 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 6 2))
  (define shufl4 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 8 2))
  (define shufl5 (vector-shuffle-ext-special shufl_top0 shufl_top1 12 8 10 2))
  (define int_res00 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl0 2 2 8 8))
  (define int_res01 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl1 2 2 8 8))
  (define int_res02 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl2 2 2 8 8))
  (define int_res03 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl3 2 2 8 8))
  (define int_res04 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl4 2 2 8 8))
  (define int_res05 (dsl_inst_0 (bv 0 (bitvector 16)) row0 shufl5 2 2 8 8))
  (define int_res10 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl0 2 2 8 8))
  (define int_res11 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl1 2 2 8 8))
  (define int_res12 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl2 2 2 8 8))
  (define int_res13 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl3 2 2 8 8))
  (define int_res14 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl4 2 2 8 8))
  (define int_res15 (dsl_inst_0 (bv 0 (bitvector 16)) row1 shufl5 2 2 8 8))
  (define result
  (concat (dsl_inst_1 int_res00 2 8) (dsl_inst_1 int_res01 2 8) (dsl_inst_1 int_res02 2 8)
          (dsl_inst_1 int_res03 2 8) (dsl_inst_1 int_res04 2 8) (dsl_inst_1 int_res05 2 8)
          (dsl_inst_1 int_res10 2 8) (dsl_inst_1 int_res11 2 8) (dsl_inst_1 int_res12 2 8)
          (dsl_inst_1 int_res13 2 8) (dsl_inst_1 int_res14 2 8) (dsl_inst_1 int_res15 2 8))
    )
  result
 )




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
        (dsl_inst_0 (bv 0 (bitvector 16)) (mem) (shufl) 2 2 8 8)
        (dsl_inst_1 (expr) 2 8)
        (no-op (expr))
    )]
)



; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct lit (val)  #:transparent )
(struct vec-concat (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12) #:transparent)
(struct dot-prod ([vacc #:mutable] [v1 #:mutable] [v2 #:mutable] i j IP OP) #:transparent )
(struct vec-reduction ([v1 #:mutable] len prec) #:transparent )
(struct vec-load ([v1 #:mutable] vsize start num prec) #:transparent )
(struct vec-shuffle-special ([v1 #:mutable] [v2 #:mutable] len prec)  #:transparent )
(struct vec-shuffle-ext-special ([v1 #:mutable] [v2 #:mutable] len prec index lump)  #:transparent )
(struct nop (v1) #:transparent)



  (define row0 (vec-load (reg 0) 64 0 4 8))
  (define row1 (vec-load (reg 0) 64 4 4 8))
  (define row10 (vec-load (reg 1) 192 0 6 8))
  (define row11 (vec-load (reg 1) 192 6 6 8))
  (define row12 (vec-load (reg 1) 192 12 6 8))
  (define row13 (vec-load (reg 1) 192 18 6 8))
  (define shufl_top0 (vec-shuffle-special row10 row11 6 8))
  (define shufl_top1 (vec-shuffle-special row12 row13 6 8))
  (define shufl0 (vec-shuffle-ext-special shufl_top0 shufl_top1 12 8 0 2))
  (define shufl1 (vec-shuffle-ext-special shufl_top0 shufl_top1 12 8 2 2))
  (define shufl2 (vec-shuffle-ext-special shufl_top0 shufl_top1 12 8 4 2))
  (define shufl3 (vec-shuffle-ext-special shufl_top0 shufl_top1 12 8 6 2))
  (define shufl4 (vec-shuffle-ext-special shufl_top0 shufl_top1 12 8 8 2))
  (define shufl5 (vec-shuffle-ext-special shufl_top0 shufl_top1 12 8 10 2))
  (define int_res00 (dot-prod (lit (bv 0 (bitvector 16))) row0 shufl0 2 2 8 8))
  (define int_res01 (dot-prod (lit (bv 0 (bitvector 16))) row0 shufl1 2 2 8 8))
  (define int_res02 (dot-prod (lit (bv 0 (bitvector 16))) row0 shufl2 2 2 8 8))
  (define int_res03 (dot-prod (lit (bv 0 (bitvector 16))) row0 shufl3 2 2 8 8))
  (define int_res04 (dot-prod (lit (bv 0 (bitvector 16))) row0 shufl4 2 2 8 8))
  (define int_res05 (dot-prod (lit (bv 0 (bitvector 16))) row0 shufl5 2 2 8 8))
  (define int_res10 (dot-prod (lit (bv 0 (bitvector 16))) row1 shufl0 2 2 8 8))
  (define int_res11 (dot-prod (lit (bv 0 (bitvector 16))) row1 shufl1 2 2 8 8))
  (define int_res12 (dot-prod (lit (bv 0 (bitvector 16))) row1 shufl2 2 2 8 8))
  (define int_res13 (dot-prod (lit (bv 0 (bitvector 16))) row1 shufl3 2 2 8 8))
  (define int_res14 (dot-prod (lit (bv 0 (bitvector 16))) row1 shufl4 2 2 8 8))
  (define int_res15 (dot-prod (lit (bv 0 (bitvector 16))) row1 shufl5 2 2 8 8))
  (define result
  (vec-concat (vec-reduction int_res00 2 8) (vec-reduction int_res01 2 8) (vec-reduction int_res02 2 8)
          (vec-reduction int_res03 2 8) (vec-reduction int_res04 2 8) (vec-reduction int_res05 2 8)
          (vec-reduction int_res10 2 8) (vec-reduction int_res11 2 8) (vec-reduction int_res12 2 8)
          (vec-reduction int_res13 2 8) (vec-reduction int_res14 2 8) (vec-reduction int_res15 2 8))
    )

;; Function using shuffle instructions
(define struct-sketch-special 
  result
 )


(println "Struct def")
(pretty-print  struct-sketch-special)



(define (get-length val)
  (destruct val
            [(reg id) (list-ref (list 64 192) id)]
            [(lit val) (bvlength val)]
            ;[(vec-mul v1 v2 len prec) (* len prec)]
            ;[(vec-add v1 v2 len prec) (* len prec)]
            ;[(vec-mac v1 v2 v3 len prec) (* len prec)]
            [(dot-prod vacc v1 v2 i j IP OP) (* i j IP)]
            [(vec-reduction v1 len prec) (* len prec)]
            [(vec-load v1 vsize start num prec) (* num prec)]
            ;[(vec-strided-gather v1 vsize start stride num prec) (* num prec)]
            [(nop v1) (get-length v1)]
            [(vec-shuffle-special v1 v2 len prec) (* 2 len prec)]
            [(vec-shuffle-ext-special v1 v2 len prec index lump) (* 2 lump prec)]
            [_ -1]
            )
  )


(define (reg-idx val)
  (destruct val 
            [(reg id) id]
            [_ -1]
            ))


; Prog is an expression in the above AST.
; env is a vector of values; register
; identifiers must be in the range 0 ... |env| - 1.
(define (interpret prog env)
  (destruct prog
            [(reg id) (vector-ref env id)]
            [(nop v1) (interpret v1 env)]
            [(lit val) val]
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
                (concat (interpret v1 env) (interpret v2 env) (interpret v3 env)
                        (interpret v4 env) (interpret v5 env) (interpret v6 env)
                        (interpret v7 env) (interpret v8 env) (interpret v9 env)
                        (interpret v10 env) (interpret v11 env) (interpret v12 env)
                        )
             ]
            [(dot-prod vacc v1 v2 i j IP OP)
             (assert (equal? (get-length vacc) (* i OP) ))
             (assert (equal? (get-length v1) (* i j IP) ))
             (assert (equal? (get-length v2) (* i j IP) ))

             (dsl_inst_0 (interpret vacc env) (interpret v1 env) (interpret v2 env) i j IP OP)
             ]
            [(vec-reduction v1 len prec)
             (dsl_inst_1 (interpret v1 env) len prec)
             ]
            [
             (vec-load v1 vsize start num prec)
             (assert (equal? (get-length v1) vsize))
             (vector-load (interpret v1 env) vsize start num prec)
             ]
             [
             (vec-shuffle-special v1 v2 len prec)
             (assert (equal? (get-length v1) (get-length v2)))
             (vector-shuffle-special (interpret v1 env) (interpret v2 env) len prec)
             ]
             [
             (vec-shuffle-ext-special v1 v2 len prec index lump)
             (assert (equal? (get-length v1) (get-length v2)))
             (vector-shuffle-ext-special (interpret v1 env) (interpret v2 env) len prec index lump)
             ]
            ))


(define (mem vars #:depth k)
  (assert (> k 0))
    (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
       (vec-load (mem vars #:depth (- k 1)) 64 0 4 8)
    ]
    [(choose* #t #f)
       (vec-load (mem vars #:depth (- k 1)) 64 4 4 8)
    ]
    [(choose* #t #f)
       (vec-load (mem vars #:depth (- k 1)) 192 0 6 8)
    ]
    [(choose* #t #f)
       (vec-load (mem vars #:depth (- k 1)) 192 6 6 8)
    ]
    [(choose* #t #f)
       (vec-load (mem vars #:depth (- k 1)) 192 12 6 8)
    ]
    [else
       (vec-load (mem vars #:depth (- k 1)) 192 18 6 8)
    ]
  )
)

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-shuffle-special
                    (mem vars #:depth (- k 1))
                    (mem vars #:depth (- k 1))
                    6 8
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 0 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 2 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 4 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 6 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 8 2
    )]
    [else
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 10 2
    )]
   )
  )


(define (expr vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (dot-prod (expr vars #:depth (- k 1))
                 (mem vars #:depth (- k 1))
                 (shufl vars #:depth (- k 1))
                 2 2 8 8
    )]
    [(choose* #t #f)
     (vec-reduction (expr vars #:depth (- k 1)) 2 8
    )]
    [(choose* #t #f)
     (nop (expr vars #:depth (- k 1))
    )]
    [else
      (lit (bv 0 (bitvector 16)))
    ]
   )
  )

;; Define arbritray nesting of grammars.
;; Top-grammar invokes grammar with depth k-1
;; 
(define (top-grammar vars #:depth k)
  (assert (> k 0))
     (vec-concat 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 

       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 

       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
    )
    
  )

; Get a sketch of depth 5.
(define sketch-grammar (top-grammar (list (reg 0) (reg 1)) #:depth 5))

;(define (synth_grammar arg1 arg2)
;                    (gen-grammar arg1 arg2 #:depth 6))

;(define-symbolic sym_arg0 (bitvector 64))
;(define-symbolic sym_arg1 (bitvector 192))

(pretty-print "VERIFY----")
;(verify
;  (assert (equal? (tensor-matmul sym_arg0 sym_arg1)  (sketch-special sym_arg0 sym_arg1))))


(define-symbolic sym2_arg0 (bitvector 64))
(define-symbolic sym2_arg1 (bitvector 192))

(define cex_arg0 (bv #x1111111111111111 64))
(define cex_arg1 (bv #x222222222222222222222222222222222222222222222222 192))


(define env (vector cex_arg0 cex_arg1))

(println "Verify on concrete output")
(println (tensor-matmul cex_arg0 cex_arg1))

(println (interpret struct-sketch-special env))



(define sym_env (vector sym2_arg0 sym2_arg1))



(pretty-print "VERIFY 2 ----")
(define cex
(verify
  (assert (equal? (tensor-matmul sym2_arg0 sym2_arg1)  
                  (interpret struct-sketch-special sym_env)))
  )
)






(pretty-print "SYNTHESIZE----")
(define sol
(synthesize
  #:forall (list  env)
  #:guarantee (assert (equal? (interpret sketch-grammar env) (tensor-matmul cex_arg0 cex_arg1)))
))

(assert (sat? sol) "Unsatisfiable")

(define synth_res (evaluate sketch-grammar sol))
(pretty-print synth_res)
;(println (cost synth_res))

