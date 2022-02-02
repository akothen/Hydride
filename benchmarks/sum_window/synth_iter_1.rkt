#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)


(current-solver (boolector))
(current-bitwidth 16)



(custodian-limit-memory (current-custodian) (* 16000 1024 1024))

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


(define (vector-div a b len precision) 
  (apply 
    concat 
    (for/list ([j (range len)]) 
              (define tmp 
                (bvsdiv (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
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

(define (vector-shuffle-lrotate v1 num_rot prec)
  (rotate-left (* prec num_rot) v1)
  )


(define (swizzle idx group_size dis_size rot_factor)
  (define (rotate rot_fact n i)
      ;; Note that Rosette's notation of indexing bitvectors is from right to left
     (modulo (- i rot_fact) n)
  )
  (define (displace dis_factor n i)
       (modulo (+ (* i dis_factor) (floor (/ i (/ n (gcd dis_factor n))))) n)
  )
  (define (group gs group_idx i)
      (+ (* (floor (/ i gs)) gs) group_idx)
  )
  (define result (group group_size (rotate rot_factor group_size (displace dis_size group_size (modulo idx group_size))) idx))

  result
 )


;; General version of swizzle with single input vector
(define (vector-single-input-swizzle v num_elems type_size group_size dis_size rot_factor)
(define result
       (apply
        concat
        (for/list ([i (reverse (range num_elems))])
          (define swizzled-index (swizzle (- (- num_elems 1) i) group_size dis_size rot_factor))
          (ext-bv v (- (- num_elems 1) swizzled-index) type_size)
         )
        )
    )
    result
)


;; General version of swizzle with two input vectors
(define (vector-two-input-swizzle v1 v2 num_elems type_size lane_offset lane_size group_size dis_size rot_factor)
  (define high_lane_offset (+ group_size lane_offset))
  (define result
    (apply
     concat
     (for/list ([i (range 0 num_elems lane_size)])
        (apply
          concat
          (for/list ([j (range lane_offset (* 2 high_lane_offset))])
            (define raw-index (- j lane_offset))
            (define swizzled-index (swizzle raw-index (* 2 group_size) dis_size rot_factor))
            (if (< swizzled-index group_size)
             (begin
              (define adjusted-swizzled-index (- (- num_elems  1) (+ i lane_offset swizzled-index)))
              (ext-bv v1 adjusted-swizzled-index type_size)
             )
             (begin
              (define adjusted-swizzled-index (- (- num_elems  1) (- (+ i lane_offset swizzled-index) group_size)))
              (ext-bv v2 adjusted-swizzled-index type_size)
             )
            )
          )
        )
      )
     )
    )
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







;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= row_idx 0))
  (assume (< row_idx rows))
  (ext-bv mat row_idx row_size)
  )

(define (print-vector vec len precision)
  (for/list ( [i (reverse (range len))] )
            (define ith_val (ext-bv vec i precision))
            (print (bitvector->integer ith_val))
            (display " ")
            )
  (displayln "")
  )

(define (print-mat mat rows cols precision)
  (for/list ( [i (reverse (range rows))] )
            (define row (ext-matrix-row mat rows cols i precision))
            (print-vector row cols precision)
            )
  mat
  )


(define (index-into-mat mat rows cols precision i j)
  (define row_offsets (* i cols))
  (define total_offset (+ row_offsets j))
  (define total_size (* rows cols))
  (define offset_from_right (- (- total_size 1) total_offset))
  (ext-bv mat offset_from_right precision)
  )


(define cost-vec-mul 10)
(define cost-vec-mac 12)
(define cost-vec-add 5)
(define cost-vec-div 15)
(define cost-vec-concat-9 5)
(define cost-vec-concat-12 5)
(define cost-vec-concat-16 5)
(define cost-dot-prod 5)
(define cost-vec-reduction 3)
(define cost-vec-load 5)
(define cost-vec-strided-gather 10)
(define cost-nop 1)
(define cost-vec-shuffle-special 2)
(define cost-vec-shuffle-ext-special 2)
(define cost-vec-shuffle-rotate 2)
(define cost-swizzle-single 2)
(define cost-swizzle-double 2)

;; Giving each DSL operation a unique identifier
(define id-reg 0)
(define id-lit 1)
(define id-vec-concat-9 2)
(define id-vec-concat-12 2)
(define id-vec-concat-16 2)
(define id-dot-prod 3)
(define id-vec-mul 4)
(define id-vec-add 5)
(define id-vec-reduction 6)
(define id-vec-load 7)
(define id-vec-shuffle-rotate 8)
(define id-vec-shuffle-special 9)
(define id-vec-shuffle-ext-special 10)
(define id-vec-strided-gather 11)
(define id-no-op 12)
(define id-vec-div 13)
(define id-swizzle-single 14)
(define id-swizzle-double 15)
(define id-idx-i 16)
(define id-idx-j 17)
(define id-idx-add 18)
(define id-idx-mul 19)


; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct idx-i (id)   #:transparent #:mutable)
(struct idx-j (id)   #:transparent #:mutable)
(struct idx-add ([i1 #:mutable] [i2 #:mutable] ) #:transparent )
(struct idx-mul ([i1 #:mutable] [i2 #:mutable] ) #:transparent )
(struct lit (val)  #:transparent )
(struct vec-concat-9 (v1 v2 v3 v4 v5 v6 v7 v8 v9) #:transparent)
(struct vec-concat-12 (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 ) #:transparent) 
(struct vec-concat-16 (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16) #:transparent) 
(struct dot-prod ([vacc #:mutable] [v1 #:mutable] [v2 #:mutable] i j IP OP) #:transparent )
(struct vec-mul ([v1 #:mutable] [v2 #:mutable] len prec) #:transparent )
(struct vec-div ([v1 #:mutable] [v2 #:mutable] len prec) #:transparent )
(struct vec-add ([v1 #:mutable] [v2 #:mutable] len prec) #:transparent )
(struct vec-reduction ([v1 #:mutable] len prec) #:transparent )
(struct vec-load ([v1 #:mutable] vsize start num prec) #:transparent )
(struct vec-shuffle-rotate ([v1 #:mutable] num_rot prec) #:transparent )
(struct vec-shuffle-special ([v1 #:mutable] [v2 #:mutable] len prec)  #:transparent )
(struct vec-shuffle-ext-special ([v1 #:mutable] [v2 #:mutable] len prec index lump)  #:transparent )
(struct vec-shuffle-swizzle-single ([v1 #:mutable]  len prec  group_size dis_size rot_factor)  #:transparent )
(struct vec-shuffle-swizzle-double ([v1 #:mutable] [v2 #:mutable] len prec lane_offset lane_size group_size fan_size rot_factor)  #:transparent )
(struct vec-strided-gather ([v1 #:mutable] vsize start stride num prec) #:transparent )
(struct nop (v1) #:transparent)


(define (get-id val)
  (destruct val
            [(reg id) id-reg]
            [(idx-i id) id-idx-i]
            [(idx-j id) id-idx-j]
            [(idx-add i1 i2) id-idx-add]
            [(idx-mul i1 i2) id-idx-mul]
            [(lit val) id-lit]
            [(vec-mul v1 v2 len prec) id-vec-mul]
            [(vec-add v1 v2 len prec) id-vec-add]
            [(vec-div v1 v2 len prec) id-vec-div]
            [(dot-prod vacc v1 v2 i j IP OP) id-dot-prod]
            [(vec-reduction v1 len prec) id-vec-reduction]
            [(vec-load v1 vsize start num prec) id-vec-load]
            [(vec-strided-gather v1 vsize start stride num prec) id-vec-strided-gather]
            [(nop v1) id-no-op]
            [(vec-shuffle-special v1 v2 len prec) id-vec-shuffle-special]
            [(vec-shuffle-ext-special v1 v2 len prec index lump) id-vec-shuffle-ext-special]
            [(vec-shuffle-rotate v1 num_rot prec) id-vec-shuffle-rotate]
            [
            (vec-shuffle-swizzle-single v1   len prec  group_size dis_size rot_factor)
               id-swizzle-single
             ]
            [
            (vec-shuffle-swizzle-double v1 v2   len prec lane_offset lane_size  group_size fan_size rot_factor)
               id-swizzle-double
             ]
            [_ -1]
            )
  )


;; Flatten expression as a list of ids
;; where each node is traversed left to
;; right
(define (get-structure-list expr)
  (destruct expr
            [(idx-i id) (list id-idx-i)]
            [(idx-j id) (list id-idx-j)]
            [(idx-add i1 i2) (append id-idx-add (get-structure-list i1) (get-structure-list i2))]
            [(idx-mul i1 i2) (append id-idx-mul (get-structure-list i1) (get-structure-list i2))]
            [(lit _) (list id-lit)]
            [(reg _) (list id-reg)]
            [(vec-mul v1 v2 len prec)
             (append (list id-vec-mul) (get-structure-list v1) (get-structure-list v2))
             ]
            [(vec-div v1 v2 len prec)
             (append (list id-vec-div) (get-structure-list v1) (get-structure-list v2))
             ]
            [(vec-add v1 v2 len prec)
             (append (list id-vec-add) (get-structure-list v1) (get-structure-list v2))
             ]
            [(vec-concat-9 v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (append (list id-vec-concat-9) 
                     (get-structure-list v1) (get-structure-list v2)
                     (get-structure-list v3) (get-structure-list v4)
                     (get-structure-list v5) (get-structure-list v6)
                     (get-structure-list v7) (get-structure-list v8)
                     (get-structure-list v9)
                     )
             ]
            [(vec-concat-12 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (append (list id-vec-concat-12) 
                     (get-structure-list v1) (get-structure-list v2)
                     (get-structure-list v3) (get-structure-list v4)
                     (get-structure-list v5) (get-structure-list v6)
                     (get-structure-list v7) (get-structure-list v8)
                     (get-structure-list v9) (get-structure-list v10)
                     (get-structure-list v11) (get-structure-list v12)
                     )
             ]
            [(vec-concat-16 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (append (list id-vec-concat-16) 
                     (get-structure-list v1) (get-structure-list v2)
                     (get-structure-list v3) (get-structure-list v4)
                     (get-structure-list v5) (get-structure-list v6)
                     (get-structure-list v7) (get-structure-list v8)
                     (get-structure-list v9) (get-structure-list v10)
                     (get-structure-list v11) (get-structure-list v12)
                     (get-structure-list v13) (get-structure-list v14)
                     (get-structure-list v15) (get-structure-list v16)
                     )
             ]
            [(dot-prod vacc v1 v2 i j IP OP)
             (append (list id-dot-prod) (get-structure-list v1) (get-structure-list v2))
             ]
            [(vec-reduction v1 len prec)
             (append (list id-vec-reduction) (get-structure-list v1) )
             ]
            [(vec-load v1 vsize start num prec)
             (append (list id-vec-load) (get-structure-list v1) )
             ]
            [(vec-strided-gather v1 vsize start stride num prec)
             (append (list id-vec-strided-gather) (get-structure-list v1) )
             ]
            [(nop v1) 
             (append (list id-no-op) (get-structure-list v1) )
             ]
            [(vec-shuffle-special v1 v2 len prec)
             (append (list id-vec-shuffle-special) (get-structure-list v1) (get-structure-list v2) )
             ]
            [(vec-shuffle-ext-special v1 v2 len prec index lump)
             (append (list id-vec-shuffle-ext-special) (get-structure-list v1) (get-structure-list v2) )
             ]
            [(vec-shuffle-rotate v1 num_rot prec)
             (append (list id-vec-shuffle-rotate) (get-structure-list v1)  )
            ]
            [
            (vec-shuffle-swizzle-single v1   len prec  group_size dis_size rot_factor)
               (append (list id-swizzle-single) (get-structure-list v1)) 
             ]
            [
            (vec-shuffle-swizzle-double v1 v2   len prec lane_offset lane_size  group_size fan_size rot_factor)
               (append (list id-swizzle-double) (get-structure-list v1) (get-structure-list v2)) 
             ]
            [_ -1]
            ))


(define (has-symmetric-structure expr)
  (destruct expr
            [(vec-concat-9 v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (and 
               (eq? (get-structure-list v1) (get-structure-list v2))
               (eq? (get-structure-list v2) (get-structure-list v3))
               (eq? (get-structure-list v3) (get-structure-list v4))
               (eq? (get-structure-list v4) (get-structure-list v5))
               (eq? (get-structure-list v5) (get-structure-list v6))
               (eq? (get-structure-list v6) (get-structure-list v7))
               (eq? (get-structure-list v7) (get-structure-list v8))
               (eq? (get-structure-list v8) (get-structure-list v9))
                  )
             ]
            [(vec-concat-12 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 )
             (and 
               (eq? (get-structure-list v1) (get-structure-list v2))
               (eq? (get-structure-list v2) (get-structure-list v3))
               (eq? (get-structure-list v3) (get-structure-list v4))
               (eq? (get-structure-list v4) (get-structure-list v5))
               (eq? (get-structure-list v5) (get-structure-list v6))
               (eq? (get-structure-list v6) (get-structure-list v7))
               (eq? (get-structure-list v7) (get-structure-list v8))
               (eq? (get-structure-list v8) (get-structure-list v9))
               (eq? (get-structure-list v9) (get-structure-list v10))
               (eq? (get-structure-list v10) (get-structure-list v11))
               (eq? (get-structure-list v11) (get-structure-list v12))
                  )
             ]
            [(vec-concat-16 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (and 
               (eq? (get-structure-list v1) (get-structure-list v2))
               (eq? (get-structure-list v2) (get-structure-list v3))
               (eq? (get-structure-list v3) (get-structure-list v4))
               (eq? (get-structure-list v4) (get-structure-list v5))
               (eq? (get-structure-list v5) (get-structure-list v6))
               (eq? (get-structure-list v6) (get-structure-list v7))
               (eq? (get-structure-list v7) (get-structure-list v8))
               (eq? (get-structure-list v8) (get-structure-list v9))
               (eq? (get-structure-list v9) (get-structure-list v10))
               (eq? (get-structure-list v10) (get-structure-list v11))
               (eq? (get-structure-list v11) (get-structure-list v12))
               (eq? (get-structure-list v12) (get-structure-list v13))
               (eq? (get-structure-list v13) (get-structure-list v14))
               (eq? (get-structure-list v14) (get-structure-list v15))
               (eq? (get-structure-list v15) (get-structure-list v16))
                  )
             ]

            [_ #f]
            )
  )



;(println "Struct def")
;(pretty-print  struct-sketch-special)

(define register_len_list (list 288 0 0))


(define (get-length val)
  (destruct val
            [(idx-i id) 0] ; Should throw an error as this shouldn't be invoked
            [(idx-j id) 0]
            [(idx-add i1 i2) 0]
            [(idx-mul i1 i2) 0]
            [(reg id) (list-ref register_len_list id)]
            [(lit val) (bvlength val)]
            [(vec-mul v1 v2 len prec) (* len prec)]
            [(vec-div v1 v2 len prec) (* len prec)]
            [(vec-add v1 v2 len prec) (* len prec)]
            ;[(vec-mac v1 v2 v3 len prec) (* len prec)]
            [(dot-prod vacc v1 v2 i j IP OP) (* i OP)]
            [(vec-reduction v1 len prec) prec]
            [(vec-load v1 vsize start num prec) (* num prec)]
            [(vec-strided-gather v1 vsize start stride num prec) (* num prec)]
            [(nop v1) (get-length v1)]
            [(vec-shuffle-special v1 v2 len prec) (* 2 len prec)]
            [(vec-shuffle-ext-special v1 v2 len prec index lump) (* 2 lump prec)]
            [(vec-shuffle-rotate v1 num_rot prec) (get-length v1)]
            [(vec-concat-9 v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (+    
                (get-length v1) (get-length v2) (get-length v3)
                (get-length v4) (get-length v5) (get-length v6)
                (get-length v7 ) (get-length v8) (get-length v9)
                )
             ]
            [(vec-concat-12 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (+    
                (get-length v1) (get-length v2) (get-length v3)
                (get-length v4) (get-length v5) (get-length v6)
                (get-length v7 ) (get-length v8) (get-length v9)
                (get-length v10 ) (get-length v11) (get-length v12)
                )
             ]
            [(vec-concat-16 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (+    
                (get-length v1) (get-length v2) (get-length v3)
                (get-length v4) (get-length v5) (get-length v6)
                (get-length v7 ) (get-length v8) (get-length v9)
                (get-length v10 ) (get-length v11) (get-length v12)
                (get-length v13 ) (get-length v14) (get-length v15)
                (get-length v16 )
                )
             ]
            [
            (vec-shuffle-swizzle-single v1   len prec  group_size dis_size rot_factor)
            (* len prec)
             ]
            [
            (vec-shuffle-swizzle-double v1 v2   len prec lane_offset lane_size  group_size fan_size rot_factor)
                ;(* len prec 2) ;; FIXME, size can vary for the same len and prec depending on other params
                (cond 
                  [(eq? group_size 3)
                    48]
                  [else
                    96]
                  )]
            [_ -1]
            )
  )



(define (cost expr)
  (destruct expr
            [(idx-i _) 1]
            [(idx-j _) 1]
            [(idx-add i1 i2) (+ 1 (cost i1) (cost i2))]
            [(lit _) 3]
            [(reg _) 5]
            [(vec-mul v1 v2 len prec)
             (+ cost-vec-mul (cost v1) (cost v2))
             ]
            [(vec-div v1 v2 len prec)
             (+ cost-vec-div (cost v1) (cost v2))
             ]
            [(vec-add v1 v2 len prec)
             (+ cost-vec-add (cost v1) (cost v2))
             ]
            [(vec-concat-9 v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (+ cost-vec-concat-9   (cost v1) (cost v2) (cost v3)
                (cost v4) (cost v5) (cost v6)
                (cost v7 ) (cost v8) (cost v9)
                )
             ]
            [(vec-concat-12 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (+ cost-vec-concat-12   
                (cost v1) (cost v2) (cost v3)
                (cost v4) (cost v5) (cost v6)
                (cost v7 ) (cost v8) (cost v9)
                (cost v10 ) (cost v11) (cost v12)
                )
             ]
            [(vec-concat-16 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (+ cost-vec-concat-16   
                (cost v1) (cost v2) (cost v3)
                (cost v4) (cost v5) (cost v6)
                (cost v7 ) (cost v8) (cost v9)
                (cost v10 ) (cost v11) (cost v12)
                (cost v13 ) (cost v14) (cost v15)
                (cost v16 )
                )
             ]
            [(dot-prod vacc v1 v2 i j IP OP)
             (+ cost-dot-prod (cost v1) (cost v2))
             ]
            [(vec-reduction v1 len prec)
             (+ cost-vec-reduction (cost v1))
             ]
            [(vec-load v1 vsize start num prec)
             (+ cost-vec-load (cost v1))
             ]
            [(vec-strided-gather v1 vsize start stride num prec)
             (+ cost-vec-strided-gather (cost v1))
             ]
            [(nop v1) 
             (+ cost-nop (cost v1))]
            [(vec-shuffle-special v1 v2 len prec)
             (+ cost-vec-shuffle-special (cost v1) (cost v2))
             ]
            [(vec-shuffle-ext-special v1 v2 len prec index lump)
             (+ cost-vec-shuffle-ext-special (cost v1) (cost v2))
             ]
            [(vec-shuffle-rotate v1 num_rot prec)
            (+ cost-vec-shuffle-rotate (cost v1))
            ]
            [
            (vec-shuffle-swizzle-single v1   len prec  group_size dis_size rot_factor)
             (+ cost-swizzle-single (cost v1))
             ]
            [
            (vec-shuffle-swizzle-double v1 v2   len prec lane_offset lane_size  group_size fan_size rot_factor)
              (+ cost-swizzle-double (cost v1) (cost v2))
             ]
            [_ 0]
            ))



(define (reg-idx val)
  (destruct val 
            [(reg id) id]
            [_ -1]
            ))

(define num-args (length register_len_list))
(define idx-i-vector-ref (- num-args 2))
(define idx-j-vector-ref (- num-args 1))

; Prog is an expression in the above AST.
; env is a vector of values; register
; identifiers must be in the range 0 ... |env| - 1.
(define (interpret prog env)
  (destruct prog
            [(idx-i id) (vector-ref env idx-i-vector-ref)]
            [(idx-j id) (vector-ref env idx-j-vector-ref)]
            [(idx-add i1 i2) (+ (interpret i1 env) (interpret i2 env))]
            [(idx-mul i1 i2) (* (interpret i1 env) (interpret i2 env))]
            [(reg id) (vector-ref env id)]
            [(nop v1) (interpret v1 env)]
            [(lit val) val]
            [(vec-concat-9 v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (concat (interpret v1 env) (interpret v2 env) (interpret v3 env)
                     (interpret v4 env) (interpret v5 env) (interpret v6 env)
                     (interpret v7 env) (interpret v8 env) (interpret v9 env)
                     )
             ]
            [(vec-concat-12 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (concat (interpret v1 env) (interpret v2 env) (interpret v3 env)
                     (interpret v4 env) (interpret v5 env) (interpret v6 env)
                     (interpret v7 env) (interpret v8 env) (interpret v9 env)
                     (interpret v10 env) (interpret v11 env) (interpret v12 env)
                     )
             ]
            [(vec-concat-16 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (concat (interpret v1 env) (interpret v2 env) (interpret v3 env)
                     (interpret v4 env) (interpret v5 env) (interpret v6 env)
                     (interpret v7 env) (interpret v8 env) (interpret v9 env)
                     (interpret v10 env) (interpret v11 env) (interpret v12 env)
                     (interpret v13 env) (interpret v14 env) (interpret v15 env)
                     (interpret v16 env)
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
             (vector-load (interpret v1 env) vsize (interpret start env) num prec)
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
            [(vec-mul v1 v2 len prec)
             (assert (equal? (get-length v1) (get-length v2)))
             (assert (equal? (get-length v1) (* len prec)))
             (vector-mul (interpret v1 env) (interpret v2 env) len prec)
             ]
            [(vec-div v1 v2 len prec)
             (assert (equal? (get-length v1) (get-length v2)))
             (assert (equal? (get-length v1) (* len prec)))
             (vector-div (interpret v1 env) (interpret v2 env) len prec)
             ]
            [(vec-add v1 v2 len prec)
             (assert (equal? (get-length v1) (get-length v2)))
             (assert (equal? (get-length v1) (* len prec)))
             (vector-add (interpret v1 env) (interpret v2 env) len prec)
             ]

            [
             (vec-strided-gather v1 vsize start stride num prec)

             (assert (equal? (get-length v1) vsize))
             (strided-gather (interpret v1 env) vsize start stride num prec)
             ]
            [
             (vec-shuffle-rotate v1 num_rot prec)
             (vector-shuffle-lrotate (interpret v1 env) (interpret num_rot env) prec)
             ]
            [
            (vec-shuffle-swizzle-single v1   len prec  group_size dis_size rot_factor)
            (vector-single-input-swizzle (interpret v1 env) len prec group_size dis_size rot_factor)
             ]
            [
            (vec-shuffle-swizzle-double v1 v2   len prec lane_offset lane_size  group_size fan_size rot_factor)
             (assert (equal? (get-length v1) (get-length v2)))
            (vector-two-input-swizzle (interpret v1 env) (interpret v2 env) len prec lane_offset lane_size group_size fan_size rot_factor)
             ]
            [v v]
            ))


(define (print-prog prog )
  (destruct prog

            [(idx-i id) 
             (display id)
             (displayln " ; idx-i")
             ]
            [(idx-j id) 
             (display id)
             (displayln " ; idx-j")
             ]
            [
             (idx-add i1 i2)
             (display "(+")
             (displayln " ; idx-add")
             (print-prog i1)
             (print-prog i2)
             (displayln ")")
             ]
            [
             (idx-mul i1 i2)
             (display "(*")
             (displayln " ; idx-mul")
             (print-prog i1)
             (print-prog i2)
             (displayln ")")
             ]
            [(reg id) 
             (display "arg")
             (println id)]
            [(nop v1) (print-prog v1)]
            [(lit val) (println val)]
            [(vec-concat-9 v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (displayln "(concat ")
             (print-prog v1) (print-prog v2) (print-prog v3)
             (print-prog v4) (print-prog v5) (print-prog v6)
             (print-prog v7) (print-prog v8) (print-prog v9)
             (displayln ")")
             ]
            [(vec-concat-12 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (displayln "(concat ")
             (print-prog v1) (print-prog v2) (print-prog v3)
             (print-prog v4) (print-prog v5) (print-prog v6)
             (print-prog v7) (print-prog v8) (print-prog v9)
             (print-prog v10) (print-prog v11) (print-prog v12)
             (displayln ")")
             ]
            [(vec-concat-16 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (displayln "(concat ")
             (print-prog v1) (print-prog v2) (print-prog v3)
             (print-prog v4) (print-prog v5) (print-prog v6)
             (print-prog v7) (print-prog v8) (print-prog v9)
             (print-prog v10) (print-prog v11) (print-prog v12)
             (print-prog v13) (print-prog v14) (print-prog v15)
             (print-prog v16)
             (displayln ")")
             ]
            [(dot-prod vacc v1 v2 i j IP OP)

             (displayln "(dsl_inst_0 ")
             (print-prog vacc) (print-prog v1) (print-prog v2)
             (println i) (println j) (println IP) (println OP)
             (displayln ")")
             ]
            [(vec-reduction v1 len prec)
             (displayln "(dsl_inst_1 ")
             (print-prog v1)
             (println len)
             (println prec)
             (displayln ")")
             ]
            [
             (vec-load v1 vsize start num prec)
             (displayln "(vector-load ")
             (print-prog v1)
             (println vsize) (print-prog start) (println num) (println prec) 
             (displayln ")")
             ]
            [
             (vec-shuffle-special v1 v2 len prec)
             (displayln "(vector-shuffle-special ")
             (print-prog v1) (print-prog v2)
             (println len)
             (println prec)
             (displayln ")")
             ]
            [
             (vec-shuffle-ext-special v1 v2 len prec index lump)
             (assert (equal? (get-length v1) (get-length v2)))
             ;;(assert (equal? (get-length v1)  (* len prec) ))

             (displayln "(vector-shuffle-ext-special ")
             (print-prog v1) (print-prog v2)
             (println len)
             (println prec)
             (println index)
             (println lump)
             (displayln ")")
             ]

            [
             (vec-strided-gather v1  vsize start stride num prec)
             ;;(assert (equal? (get-length v1)  (* len prec) ))

             (displayln "(strided-gather ")
             (print-prog v1) 
             (println vsize)
             (println start)
             (println stride)
             (println num)
             (println prec )
             (displayln ")")
             ]
            [
             (vec-mul v1 v2 len prec)
             (displayln "(vector-mul ")
             (print-prog v1)
             (print-prog v2)
             (println len)
             (println prec)
             (displayln ")")
             ]
            [
             (vec-div v1 v2 len prec)
             (displayln "(vector-div ")
             (print-prog v1)
             (print-prog v2)
             (println len)
             (println prec)
             (displayln ")")
             ]
            [
             (vec-add v1 v2 len prec)
             (displayln "(vector-add ")
             (print-prog v1)
             (print-prog v2)
             (println len)
             (println prec)
             (displayln ")")
             ]
            [
             (vec-shuffle-rotate v1 num_rot prec)
             (displayln "(vector-shuffle-lrotate")
             (print-prog v1)
             (print-prog num_rot)
             (println prec)
             (displayln ")")
             ]
            [
            (vec-shuffle-swizzle-single v1   len prec  group_size dis_size rot_factor)
            (displayln "(vector-single-input-swizzle ")
            (print-prog v1)
            (println len)
            (println prec)
            (println group_size)
            (println dis_size)
            (println rot_factor)
            (displayln ")")
             ]
            [
            (vec-shuffle-swizzle-double v1 v2   len prec lane_offset lane_size  group_size fan_size rot_factor)

            (displayln "(vector-two-input-swizzle ")
            (print-prog v1)
            (print-prog v2)
            (println len)
            (println prec)
            (println lane_offset)
            (println lane_size)
            (println group_size)
            (println fan_size)
            (println rot_factor)
            (displayln ")")
             ]
            [v (println v)]
            ))



(define image (apply concat (for/list ([k (range 36)])
                                      (bv (+ k 1) (bitvector 8))
                        )))


(define (check a)
  (println (interpret a (vector image)))
  )


;; Box blur: Takes the slice and calculates the average of the slice
(define (box-blur img imgR imgC blurR blurC prec) 
  (define i_bound (+ (- imgR blurR) 1))
  (define j_bound (+ (- imgC blurC) 1))
  (define numBlur (* blurR blurC))
  (define img_size (* imgR imgC prec))
  (apply concat
         (for/list ([i (range i_bound)])
                   (apply concat
                          (for/list ([j (range j_bound)])
                                    (define offset (+ (* i imgC ) j))
                                    (define imgSlice (apply
                                                       concat
                                                       (for/list ([s  (range blurR)])
                                                                 (vector-load img img_size (+ (* s imgC) offset) blurC prec)
                                                                 )
                                                       ))
                                    (bvsdiv
                                      (apply bvadd
                                             (for/list ([k (reverse (range numBlur))])
                                                       (ext-bv imgSlice k prec)
                                                       )
                                             )
                                      (bv numBlur (bitvector prec))
                                      )
                                    )
                          )
                   )
         )
  )


;; Blur used by Halide
(define (sum img imgR imgC blurR blurC prec) 
  (define i_bound (+ (- imgR blurR) 1))
  (define j_bound (+ (- imgC blurC) 1))
  (define numBlur (* blurR blurC))
  (define img_size (* imgR imgC prec))
  (apply concat
         (for/list ([i (range i_bound)])
                   (apply concat
                          (for/list ([j (range j_bound)])
                                    (define offset (+ (* i imgC ) j))
                                    (define reduced-vertical-slice  ; tensor of shape (1, blurR)
                                      (apply
                                        concat
                                        (for/list ([s  (range blurR)])
                                                  (define horizontal-slice (vector-load img img_size (+ (* s imgC) offset) blurC prec))
                                                    (apply bvadd 
                                                           (for/list ([t (reverse (range blurC))])
                                                                     (ext-bv horizontal-slice t prec)
                                                                     )
                                                           ) 


                                                  )
                                        )
                                      )

                                    ;; Now reduce vertical slice and take vertical average
                                      (apply bvadd
                                             (for/list ([k (reverse (range blurR))])
                                                       (ext-bv reduced-vertical-slice k prec)
                                                       )
                                             )
                                    )
                          )
                   )
         )
  )


;; Blur used by Halide
(define (blur img imgR imgC blurR blurC prec) 
  (define i_bound (+ (- imgR blurR) 1))
  (define j_bound (+ (- imgC blurC) 1))
  (define numBlur (* blurR blurC))
  (define img_size (* imgR imgC prec))
  (apply concat
         (for/list ([i (range i_bound)])
                   (apply concat
                          (for/list ([j (range j_bound)])
                                    (define offset (+ (* i imgC ) j))
                                    (define reduced-vertical-slice  ; tensor of shape (1, blurR)
                                      (apply
                                        concat
                                        (for/list ([s  (range blurR)])
                                                  (define horizontal-slice (vector-load img img_size (+ (* s imgC) offset) blurC prec))
                                                  (bvsdiv
                                                    (apply bvadd 
                                                           (for/list ([t (reverse (range blurC))])
                                                                     (ext-bv horizontal-slice t prec)
                                                                     )
                                                           ) 
                                                    (bv blurC (bitvector prec))
                                                    )


                                                  )
                                        )
                                      )

                                    ;; Now reduce vertical slice and take vertical average
                                    (bvsdiv
                                      (apply bvadd
                                             (for/list ([k (reverse (range blurR))])
                                                       (ext-bv reduced-vertical-slice k prec)
                                                       )
                                             )
                                      (bv blurR (bitvector prec))
                                      )
                                    )
                          )
                   )
         )
  )







(define one 
  (apply concat (for/list ([i (range 12)])
                          (bv 1 (bitvector 8))
                          )

         )
  )



(define (idx-exprs vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (idx-i 0)
     ]
    [(choose* #t #f)
     (idx-j 0)
     ]
    [(choose* #t #f)
     (idx-add 
       (idx-i 0)
       1
       )
     ]
    [(choose* #t #f)
     (idx-add 
       (idx-i 0)
       2
       )
     ]

    [(choose* #t #f)
     (idx-mul 
     (idx-add 
       (idx-i 0)
       2
       ) 6 )
     ]

    [(choose* #t #f)
     (idx-mul 
     (idx-add 
       (idx-i 0)
       1
       ) 6 )
     ]

    [(choose* #t #f)
     (idx-mul 
     (idx-add 
       (idx-i 0)
       0
       ) 6 )
     ]
    ;[(choose* #t #f)
    ; (idx-add 
    ;   (idx-exprs vars #:depth (- k 1))
    ;   2
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (idx-mul 
    ;   (idx-exprs vars #:depth (- k 1))
    ;   6
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (nop  
    ;   (idx-exprs vars #:depth (- k 1))
    ;   )
    ; ]
    [else
      0 
      ]
    )
  )

(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]

    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 0) 6)
               6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 
               ;(idx-exprs vars #:depth 2) 
               (idx-mul (idx-add (idx-i 0) 1) 6)
               6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 2) 6)
               6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 3) 6)
               6 8)  ; Row 0
     ]

    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 4) 6)
               6 8)  ; Row 0
     ]
    [else
      (lit (bv 0 (bitvector 48)))
      ]
    )
  )

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-shuffle-swizzle-double
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 0 6 3 1 0
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-swizzle-double
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 0 6 6 1 0
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       (idx-j 0)
       8
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       (idx-add (idx-j 0) 1)
       8
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       (idx-add (idx-j 0) 2)
       8
       )
     ]
    ;[
    ; (choose* #t #f)
    ; (dot-prod
    ;   ;(shufl vars #:depth (- k 1))
    ;   (lit (bv 0 (bitvector 32)))
    ;   (shufl vars #:depth (- k 1))
    ;   (lit one)
    ;   ;(shufl vars #:depth (- k 1))
    ;   4 3 8 8 
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (vec-div  (shufl vars #:depth (- k 1))  
    ;           (lit (concat 
    ;                  (bv 3 (bitvector 8))
    ;                  (bv 3 (bitvector 8))
    ;                  (bv 3 (bitvector 8))
    ;                  (bv 3 (bitvector 8))
    ;                  ))
    ;           4 8 
    ;           )]

    ;[(choose* #t #f)
    ; (vec-div  (shufl vars #:depth (- k 1))  
    ;           (lit  
    ;             (bv 3 (bitvector 8))
    ;             )
    ;           1 8 
    ;           )]
    ;[(choose* #t #f)
    ; (lit one) ; 16 length vector of 1's
    ; ]
    ;[(choose* #t #f)
    ; (lit (bv 0 (bitvector 32)))
    ; ]
    ;[(choose* #t #f)
    ; (vec-reduction (shufl vars #:depth (- k 1)) 6 8
    ;                )]
    [(choose* #t #f)
     (vec-reduction (shufl vars #:depth (- k 1)) 12 8
                    )]
    [(choose* #t #f)
     (nop (shufl vars #:depth (- k 1))
          )]
    [else
      (mem vars #:depth k)]

    )
  )


;(define (expr vars #:depth k)
;  (assert (> k 0))
;  (cond
;    [(choose* #t #f)
;     (apply choose* vars)]
;    ;[(choose* #t #f)
;    ; (dot-prod (lit (bv 0 (bitvector 8)))
;    ;           (shufl vars #:depth (- k 1))
;    ;           (shufl vars #:depth (- k 1))
;    ;           1 9 8 8
;    ;           )]
;    ;[(choose* #t #f)
;    ; (vec-reduction (shufl vars #:depth (- k 1)) 4 8
;    ;                )]
;    [(choose* #t #f)
;     (nop (expr vars #:depth (- k 1))
;          )]
;    [else
;     (shufl vars #:depth k)
;          ]
;    )
;  )


; Get a sketch of depth 5.
(define sketch-grammar (shufl (list (reg 0) (idx-i 0) (idx-j 0)) #:depth 4))








(define row-i (vec-load (reg 0) 288  (idx-mul (idx-add (idx-i 0) 0) 6)  6 8  ))
(define row-ip1 (vec-load (reg 0) 288 (idx-mul (idx-add (idx-i 0) 1) 6) 6 8  ))
(define row-ip2 (vec-load (reg 0) 288 (idx-mul (idx-add (idx-i 0) 2) 6) 6  8  ))

(define row_0 (vec-shuffle-rotate row-i (idx-j 0) 8))
(define row_1 (vec-shuffle-rotate row-ip1 (idx-j 0) 8))
(define row_2 (vec-shuffle-rotate row-ip2 (idx-j 0) 8))



(define left-concat (vec-shuffle-swizzle-double
                      row_0
                      row_1
                      6 8 0 6 3 1 0
                      ))
(define right-concat (vec-shuffle-swizzle-double
                       row_2
                       (lit (bv 0 (bitvector 48)))
                       6 8 0 6 3 1 0
                       ))
(define slice (vec-shuffle-swizzle-double
                left-concat right-concat
                6 8 0 6 6 1 0
                ))
(define reduction (vec-reduction slice 12 8))

(define  (test val i j)
  (interpret reduction (vector val i j))
  )


(displayln "Spec On Image:")
(print-mat (sum image 6 6 3 3 8 ) 4 4 8)


(displayln "DSL on Image [0,0]:")
(println (bitvector->integer (test image 0 0 )))


(displayln "DSL on Image [1,1]:")
(println (bitvector->integer (test image 1 1 )))


(displayln "DSL on Image [2,2]:")
(println (bitvector->integer (test image 2 2 )))


(define v0_0 (bv #x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef01234567 288))
(define env_0 (vector v0_0   0 0))
(define sol 
                             (synthesize 
                            #:forall (list v0_0  env_0)
                             #:guarantee 
                            (begin
                             (assert (equal? (interpret sketch-grammar env_0) (index-into-mat (sum v0_0  6 6 3 3 8) 4 4 8 0 0) ))

                             )))
(assert (sat? sol)"Unsatisfiable")

        (define synth_res (evaluate sketch-grammar sol))
        (pretty-print synth_res)
        (display "synth cost: ")
        (println (cost synth_res))

        ;(println (get-structure-list synth_res))
        (displayln "Does Solution have a symmetric structure?")
        (println (has-symmetric-structure synth_res))

        (with-output-to-file "./body_1.txt" (lambda() (print-prog synth_res)))
        