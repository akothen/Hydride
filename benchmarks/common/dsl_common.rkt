#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)


{}


(custodian-limit-memory (current-custodian) (* 12000 1024 1024))

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

; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
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
(struct vec-strided-gather ([v1 #:mutable] vsize start stride num prec) #:transparent )
(struct nop (v1) #:transparent)


(define (get-id val)
  (destruct val
            [(reg id) id-reg]
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
            [_ -1]
            )
  )


;; Flatten expression as a list of ids
;; where each node is traversed left to
;; right
(define (get-structure-list expr)
  (destruct expr
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



(define (get-length val)
  (destruct val
            [(reg id) (list-ref (list {}) id)]
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

            [_ -1]
            )
  )



(define (cost expr)
  (destruct expr
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
            ))



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
             (vector-shuffle-lrotate (interpret v1 env) num_rot prec)
             ]
            ))


(define (print-prog prog )
  (destruct prog
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
             (println vsize) (println start) (println num) (println prec) 
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
             (println num_rot)
             (println prec)
             (displayln ")")
             ]
            ))
