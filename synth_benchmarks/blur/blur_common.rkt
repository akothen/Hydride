#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(current-solver (boolector))
(current-bitwidth 32)


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

(define (tensor-conv2D img filt imgR imgC filtR filtC prec) 
  (define i_bound (+ (- imgR filtR) 1))
  (define j_bound (+ (- imgC filtC) 1))
  (define numFilt (* filtR filtC))
  (define img_size (* imgR imgC prec))
  (apply concat
    (for/list ([i (range i_bound)])
              (apply concat
                (for/list ([j (range j_bound)])
                          (define offset (+ (* i imgC ) j))
                          (define imgSlice (apply
                                            concat
                                            (for/list ([s  (range filtR)])
                                                      (vector-load img img_size (+ (* s imgC) offset) filtC prec)
                                                      )
                                            ))
                          ;(displayln "Slice")
                          ;(display "(")
                          ;(display i)
                          ;(display ", ")
                          ;(display j)
                          ;(displayln ")")
                          ;(print-mat imgSlice filtR filtC prec)
                          (apply bvadd
                            (for/list ([k (reverse (range numFilt))])
                                      (bvmul 
                                        (ext-bv imgSlice k prec)
                                        (ext-bv filt k prec)
                                        )

                                      )
                            )
                          )
                )
              )
    )
  )



;; Box blur: Takes the slice and calculates the average of the slice
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
                          (define imgSlice (apply
                                            concat
                                            (for/list ([s  (range blurR)])
                                                      (vector-load img img_size (+ (* s imgC) offset) blurC prec)
                                                      )
                                            ))
                          ;(displayln "Slice")
                          ;(display "(")
                          ;(display i)
                          ;(display ", ")
                          ;(display j)
                          ;(displayln ")")
                          ;(print-mat imgSlice filtR filtC prec)
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


(define cost-vec-mul 10)
(define cost-vec-div 15)
(define cost-vec-mac 12)
(define cost-vec-add 5)
(define cost-vec-concat 5)
(define cost-dot-prod 5)
(define cost-vec-reduction 3)
(define cost-vec-load 5)
(define cost-vec-strided-gather 10)
(define cost-nop 1)
(define cost-vec-shuffle-special 2)
(define cost-vec-shuffle-ext-special 2)
(define cost-vec-shuffle-rotate 2)

; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct lit (val)  #:transparent )
(struct vec-concat (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16) #:transparent) 
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
            ;[(vec-mac v1 v2 v3 len prec)
            ; (+ cost-vec-mac (cost v1) (cost v2) (cost v3))
            ; ]
            [(vec-add v1 v2 len prec)
             (+ cost-vec-add (cost v1) (cost v2))
             ]
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
             (+ cost-vec-concat   (cost v1) (cost v2) (cost v3)
                (cost v4) (cost v5) (cost v6)
                (cost v7 ) (cost v8) (cost v9)
                (cost v10 ) (cost v11) (cost v12)
                (cost v13 ) (cost v14) (cost v15)
                (cost v16)
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





;(println "Struct def")
;(pretty-print  struct-sketch-special)



(define (get-length val)
  (destruct val
            [(reg id) (list-ref (list 288) id)]
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
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16) (* 16 8)]
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
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
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
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16)
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
             (vec-add v1 v2 len prec)
             (displayln "(vector-add ")
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
             (vec-shuffle-rotate v1 num_rot prec)
             (displayln "(vector-shuffle-lrotate")
             (print-prog v1)
             (println num_rot)
             (println prec)
             (displayln ")")
             ]
            ))

(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-load (reg 0) 288 0 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 6 6 8)  ; Row 1
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 12 6 8) ; Row 2
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 18 6 8) ; Row 3
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 24 6 8) ; Row 4
     ]
    [else
     (vec-load (reg 0) 288 30 6 8) ; Row 5
     ]
    )
  )

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    ;[(choose* #t #f)
    ; (vec-shuffle-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   4 8
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   2 8
    ;   )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 0 3
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 1 3
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 2 3
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 3 3
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 4 3
       )]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (shufl vars #:depth (- k 1))
       1 8
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (shufl vars #:depth (- k 1))
       2 8
       )
     ]
    [(choose* #t #f)
     (vec-add  (shufl vars #:depth (- k 1))  (shufl vars #:depth (- k 1))
                         6 8 
                         )]
    [else
      (mem vars #:depth k)]

    )
  )


(define (expr vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    ;[(choose* #t #f)
    ; (dot-prod (lit (bv 0 (bitvector 8)))
    ;           (shufl vars #:depth (- k 1))
    ;           (shufl vars #:depth (- k 1))
    ;           1 9 8 8
    ;           )]
    [(choose* #t #f)
     (vec-reduction (shufl vars #:depth (- k 1)) 6 8
                    )]
    [(choose* #t #f)
     (nop (expr vars #:depth (- k 1))
          )]
    [else
      (lit (bv 0 (bitvector 8)))
      ]
    )
  )

;; Define arbritray nesting of grammars.
;; Top-grammar invokes grammar with depth k-1
;; 
(define (top-grammar vars #:depth k)
  (assert (> k 0))
  (vec-div 
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


    (expr vars #:depth (- k 1)) 
    (expr vars #:depth (- k 1)) 
    (expr vars #:depth (- k 1)) 
    (expr vars #:depth (- k 1)) 
    )

  (lit (concat 
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))

         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))


         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))


         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         
         
         ))

  16 8
  )
)

; Get a sketch of depth 5.
(define sketch-grammar (top-grammar (list (reg 0)) #:depth 5))


(println "Starting")





(define image (apply concat 
                     (list 
                       (bv 7 (bitvector 8))
                       (bv 4 (bitvector 8))
                       (bv 0 (bitvector 8))
                       (bv 1 (bitvector 8))
                       (bv 4 (bitvector 8))
                       (bv 0 (bitvector 8))



                       (bv 5 (bitvector 8))
                       (bv 6 (bitvector 8))
                       (bv 2 (bitvector 8))
                       (bv 2 (bitvector 8))
                       (bv 3 (bitvector 8))
                       (bv 2 (bitvector 8))


                       (bv 6 (bitvector 8))
                       (bv 10 (bitvector 8))
                       (bv 7 (bitvector 8))
                       (bv 8 (bitvector 8))
                       (bv 2 (bitvector 8))
                       (bv 9 (bitvector 8))


                       (bv 1 (bitvector 8))
                       (bv 4 (bitvector 8))
                       (bv 2 (bitvector 8))
                       (bv 0 (bitvector 8))
                       (bv 1 (bitvector 8))
                       (bv 17 (bitvector 8))


                       (bv 6 (bitvector 8))
                       (bv 10 (bitvector 8))
                       (bv 7 (bitvector 8))
                       (bv 8 (bitvector 8))
                       (bv 2 (bitvector 8))
                       (bv 9 (bitvector 8))



                       (bv 4 (bitvector 8))
                       (bv 0 (bitvector 8))
                       (bv 5 (bitvector 8))
                       (bv 6 (bitvector 8))
                       (bv 2 (bitvector 8))
                       (bv 2 (bitvector 8))
                       
                       )

  )
  )

;(displayln "Image")
;(print-mat image 6 6 8)



;(define blurred (blur image 6 6 3 3 8))
;(print-mat blurred 4 4 8)


(define test_env (vector image))

;(define test-env (vector image kernel))


;(define output (tensor-conv2D image kernel 4 4 2 2 8))
;(displayln "Convolution Output")
;(print-mat output 3 3 8)




;(define alt_output (interpret alt-tensor-conv-dsl test-env))
;(displayln "Alt Convolution Output (DSL)")
;(print-mat alt_output 3 3 8)


(define cex_arg0 (bv -1 (bitvector 288)))


(define env (vector cex_arg0))





(define row_1 (vec-load (reg 0) 288 0 6 8))
(define row_2 (vec-load (reg 0) 288 6 6 8))
(define row_3 (vec-load (reg 0) 288 12 6 8))
(define row_4 (vec-load (reg 0) 288 18 6 8))
(define row_5 (vec-load (reg 0) 288 24 6 8))
(define row_6 (vec-load (reg 0) 288 30 6 8))

(define v1-v2-add (vec-add row_1 row_2 6 8))
(define v2-v3-add (vec-add row_2 row_3 6 8))
(define v3-v4-add (vec-add row_3 row_4 6 8))
(define v4-v5-add (vec-add row_4 row_5 6 8))
(define v5-v6-add (vec-add row_5 row_6 6 8))

; Defining entries

;(displayln "Row 1 entries")
(define e_1_1 (vec-reduction (vec-shuffle-ext-special v1-v2-add row_3 6 8 0 3) 6 8))
(define e_1_2 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v1-v2-add 1 8) (vec-shuffle-rotate row_3 1 8) 6 8 0 3) 6 8))
(define e_1_3 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v1-v2-add 2 8) (vec-shuffle-rotate row_3 2 8) 6 8 0 3) 6 8))
(define e_1_4 (vec-reduction (vec-shuffle-ext-special v1-v2-add row_3 6 8 3 3) 6 8))


;(displayln "Row 2 entries")
(define e_2_1 (vec-reduction (vec-shuffle-ext-special v2-v3-add row_4 6 8 0 3) 6 8))
(define e_2_2 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v2-v3-add 1 8) (vec-shuffle-rotate row_4 1 8) 6 8 0 3) 6 8))
(define e_2_3 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v2-v3-add 2 8) (vec-shuffle-rotate row_4 2 8) 6 8 0 3) 6 8))
(define e_2_4 (vec-reduction (vec-shuffle-ext-special v2-v3-add row_4 6 8 3 3) 6 8))



;(displayln "Row 3 entries")
(define e_3_1 (vec-reduction (vec-shuffle-ext-special v3-v4-add row_5 6 8 0 3) 6 8))
(define e_3_2 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v3-v4-add 1 8) (vec-shuffle-rotate row_5 1 8) 6 8 0 3) 6 8))
(define e_3_3 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v3-v4-add 2 8) (vec-shuffle-rotate row_5 2 8) 6 8 0 3) 6 8))
(define e_3_4 (vec-reduction (vec-shuffle-ext-special v3-v4-add row_5 6 8 3 3) 6 8))


;(displayln "Row 4 entries")
(define e_4_1 (vec-reduction (vec-shuffle-ext-special v4-v5-add row_6 6 8 0 3) 6 8))
(define e_4_2 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v4-v5-add 1 8) (vec-shuffle-rotate row_6 1 8) 6 8 0 3) 6 8))
(define e_4_3 (vec-reduction (vec-shuffle-ext-special (vec-shuffle-rotate v4-v5-add 2 8) (vec-shuffle-rotate row_6 2 8) 6 8 0 3) 6 8))
(define e_4_4 (vec-reduction (vec-shuffle-ext-special v4-v5-add row_6 6 8 3 3) 6 8))


;(println (interpret e_1_1 test_env))
;(println (interpret e_1_2 test_env))
;(println (interpret e_1_3 test_env))
;(println (interpret e_1_4 test_env))
;(println (interpret e_2_1 test_env))
;(println (interpret e_2_2 test_env))
;(println (interpret e_2_3 test_env))
;(println (interpret e_2_4 test_env))


;(println (interpret e_3_1 test_env))
;(println (interpret e_3_2 test_env))
;(println (interpret e_3_3 test_env))
;(println (interpret e_3_4 test_env))


;(println (interpret e_4_1 test_env))
;(println (interpret e_4_2 test_env))
;(println (interpret e_4_3 test_env))
;(println (interpret e_4_4 test_env))

;(displayln "Joined entries")
(define joined (vec-concat 
                 e_1_1 e_1_2 e_1_3 e_1_4
                 e_2_1 e_2_2 e_2_3 e_2_4
                 e_3_1 e_3_2 e_3_3 e_3_4
                 e_4_1 e_4_2 e_4_3 e_4_4
                 ))

;(define temp (interpret joined test_env))
;(println temp)


(define nines
           (lit (concat 
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))

         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))


         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))


         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         (bv 9 (bitvector 8))
         
         ))
           )

;(displayln "Nines length")
;(println (get-length nines))



;(displayln "Blur entries")
(define dsl-blur 
  (vec-div joined nines
           16 8
           ))

(define (manual arg0)
(vector-div 
 (concat 
  (dsl_inst_1 
   (vector-shuffle-ext-special 
    (vector-add 
     (vector-load 
      arg0
      288
      0
      6
      8
     )
     (vector-load 
      arg0
      288
      6
      6
      8
     )
     6
     8
    )
    (vector-load 
     arg0
     288
     12
     6
     8
    )
    6
    8
    0
    3
    )
    6
    8
    )
    (dsl_inst_1 
     (vector-shuffle-ext-special 
      (vector-shuffle-lrotate
       (vector-add 
        (vector-load 
         arg0
         288
         0
         6
         8
        )
        (vector-load 
         arg0
         288
         6
         6
         8
        )
        6
        8
       )
       1
       8
      )
      (vector-shuffle-lrotate
       (vector-load 
        arg0
        288
        12
        6
        8
       )
       1
       8
      )
      6
      8
      0
      3
      )
      6
      8
      )
      (dsl_inst_1 
       (vector-shuffle-ext-special 
        (vector-shuffle-lrotate
         (vector-add 
          (vector-load 
           arg0
           288
           0
           6
           8
          )
          (vector-load 
           arg0
           288
           6
           6
           8
          )
          6
          8
         )
         2
         8
        )
        (vector-shuffle-lrotate
         (vector-load 
          arg0
          288
          12
          6
          8
         )
         2
         8
        )
        6
        8
        0
        3
        )
        6
        8
        )
        (dsl_inst_1 
         (vector-shuffle-ext-special 
          (vector-add 
           (vector-load 
            arg0
            288
            0
            6
            8
           )
           (vector-load 
            arg0
            288
            6
            6
            8
           )
           6
           8
          )
          (vector-load 
           arg0
           288
           12
           6
           8
          )
          6
          8
          3
          3
          )
          6
          8
          )
          (dsl_inst_1 
           (vector-shuffle-ext-special 
            (vector-add 
             (vector-load 
              arg0
              288
              6
              6
              8
             )
             (vector-load 
              arg0
              288
              12
              6
              8
             )
             6
             8
            )
            (vector-load 
             arg0
             288
             18
             6
             8
            )
            6
            8
            0
            3
            )
            6
            8
            )
            (dsl_inst_1 
             (vector-shuffle-ext-special 
              (vector-shuffle-lrotate
               (vector-add 
                (vector-load 
                 arg0
                 288
                 6
                 6
                 8
                )
                (vector-load 
                 arg0
                 288
                 12
                 6
                 8
                )
                6
                8
               )
               1
               8
              )
              (vector-shuffle-lrotate
               (vector-load 
                arg0
                288
                18
                6
                8
               )
               1
               8
              )
              6
              8
              0
              3
              )
              6
              8
              )
              (dsl_inst_1 
               (vector-shuffle-ext-special 
                (vector-shuffle-lrotate
                 (vector-add 
                  (vector-load 
                   arg0
                   288
                   6
                   6
                   8
                  )
                  (vector-load 
                   arg0
                   288
                   12
                   6
                   8
                  )
                  6
                  8
                 )
                 2
                 8
                )
                (vector-shuffle-lrotate
                 (vector-load 
                  arg0
                  288
                  18
                  6
                  8
                 )
                 2
                 8
                )
                6
                8
                0
                3
                )
                6
                8
                )
                (dsl_inst_1 
                 (vector-shuffle-ext-special 
                  (vector-add 
                   (vector-load 
                    arg0
                    288
                    6
                    6
                    8
                   )
                   (vector-load 
                    arg0
                    288
                    12
                    6
                    8
                   )
                   6
                   8
                  )
                  (vector-load 
                   arg0
                   288
                   18
                   6
                   8
                  )
                  6
                  8
                  3
                  3
                  )
                  6
                  8
                  )
                  (dsl_inst_1 
                   (vector-shuffle-ext-special 
                    (vector-add 
                     (vector-load 
                      arg0
                      288
                      12
                      6
                      8
                     )
                     (vector-load 
                      arg0
                      288
                      18
                      6
                      8
                     )
                     6
                     8
                    )
                    (vector-load 
                     arg0
                     288
                     24
                     6
                     8
                    )
                    6
                    8
                    0
                    3
                    )
                    6
                    8
                    )
                    (dsl_inst_1 
                     (vector-shuffle-ext-special 
                      (vector-shuffle-lrotate
                       (vector-add 
                        (vector-load 
                         arg0
                         288
                         12
                         6
                         8
                        )
                        (vector-load 
                         arg0
                         288
                         18
                         6
                         8
                        )
                        6
                        8
                       )
                       1
                       8
                      )
                      (vector-shuffle-lrotate
                       (vector-load 
                        arg0
                        288
                        24
                        6
                        8
                       )
                       1
                       8
                      )
                      6
                      8
                      0
                      3
                      )
                      6
                      8
                      )
                      (dsl_inst_1 
                       (vector-shuffle-ext-special 
                        (vector-shuffle-lrotate
                         (vector-add 
                          (vector-load 
                           arg0
                           288
                           12
                           6
                           8
                          )
                          (vector-load 
                           arg0
                           288
                           18
                           6
                           8
                          )
                          6
                          8
                         )
                         2
                         8
                        )
                        (vector-shuffle-lrotate
                         (vector-load 
                          arg0
                          288
                          24
                          6
                          8
                         )
                         2
                         8
                        )
                        6
                        8
                        0
                        3
                        )
                        6
                        8
                        )
                        (dsl_inst_1 
                         (vector-shuffle-ext-special 
                          (vector-add 
                           (vector-load 
                            arg0
                            288
                            12
                            6
                            8
                           )
                           (vector-load 
                            arg0
                            288
                            18
                            6
                            8
                           )
                           6
                           8
                          )
                          (vector-load 
                           arg0
                           288
                           24
                           6
                           8
                          )
                          6
                          8
                          3
                          3
                          )
                          6
                          8
                          )
                          (dsl_inst_1 
                           (vector-shuffle-ext-special 
                            (vector-add 
                             (vector-load 
                              arg0
                              288
                              18
                              6
                              8
                             )
                             (vector-load 
                              arg0
                              288
                              24
                              6
                              8
                             )
                             6
                             8
                            )
                            (vector-load 
                             arg0
                             288
                             30
                             6
                             8
                            )
                            6
                            8
                            0
                            3
                            )
                            6
                            8
                            )
                            (dsl_inst_1 
                             (vector-shuffle-ext-special 
                              (vector-shuffle-lrotate
                               (vector-add 
                                (vector-load 
                                 arg0
                                 288
                                 18
                                 6
                                 8
                                )
                                (vector-load 
                                 arg0
                                 288
                                 24
                                 6
                                 8
                                )
                                6
                                8
                               )
                               1
                               8
                              )
                              (vector-shuffle-lrotate
                               (vector-load 
                                arg0
                                288
                                30
                                6
                                8
                               )
                               1
                               8
                              )
                              6
                              8
                              0
                              3
                              )
                              6
                              8
                              )
                              (dsl_inst_1 
                               (vector-shuffle-ext-special 
                                (vector-shuffle-lrotate
                                 (vector-add 
                                  (vector-load 
                                   arg0
                                   288
                                   18
                                   6
                                   8
                                  )
                                  (vector-load 
                                   arg0
                                   288
                                   24
                                   6
                                   8
                                  )
                                  6
                                  8
                                 )
                                 2
                                 8
                                )
                                (vector-shuffle-lrotate
                                 (vector-load 
                                  arg0
                                  288
                                  30
                                  6
                                  8
                                 )
                                 2
                                 8
                                )
                                6
                                8
                                0
                                3
                                )
                                6
                                8
                                )
                                (dsl_inst_1 
                                 (vector-shuffle-ext-special 
                                  (vector-add 
                                   (vector-load 
                                    arg0
                                    288
                                    18
                                    6
                                    8
                                   )
                                   (vector-load 
                                    arg0
                                    288
                                    24
                                    6
                                    8
                                   )
                                   6
                                   8
                                  )
                                  (vector-load 
                                   arg0
                                   288
                                   30
                                   6
                                   8
                                  )
                                  6
                                  8
                                  3
                                  3
                                  )
                                  6
                                  8
                                  )
    )
(bv #x09090909090909090909090909090909 128)
    16
    8
    )
)


(define fail (bv #x6c0061285658a200fd68176f1042c29ec35cf40db162bfb6ecfb0223df9db212bae30540 288))

;(define orig_out (blur fail 6 6 3 3 8))
;(define manual_out (manual fail))


;(print-mat orig_out 4 4 8)
;(print-mat manual_out 4 4 8)

;(define dsl-blurred (interpret dsl-blur test_env))
;(println "DSL Blur:")
;(print-mat dsl-blurred 4 4 8)

;(clear-vc!)
;(displayln "Verification!")
;(define-symbolic sym2_arg0 (bitvector 288))

;(define cex2 (time
;               (verify
;(assert (equal? (blur sym2_arg0  6 6 3 3 8)   (manual sym2_arg0)
;  )
;))))

;(assert (sat? cex2) "Verified")
;(println cex2)

;(define v1 (evaluate sym2_arg0 cex2))

;(display "v1 ")
;(displayln v1)

