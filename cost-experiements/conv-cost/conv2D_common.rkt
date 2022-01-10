#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

; (current-solver (boolector))
;(current-bitwidth 32)


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


(define cost-vec-mul 10)
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

; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct lit (val)  #:transparent )
(struct vec-concat (v1 v2 v3 v4 v5 v6 v7 v8 v9) #:transparent)
(struct dot-prod ([vacc #:mutable] [v1 #:mutable] [v2 #:mutable] i j IP OP) #:transparent )
(struct vec-mul ([v1 #:mutable] [v2 #:mutable] len prec) #:transparent )
(struct vec-add ([v1 #:mutable] [v2 #:mutable] len prec) #:transparent )
(struct vec-reduction ([v1 #:mutable] len prec) #:transparent )
(struct vec-load ([v1 #:mutable] vsize start num prec) #:transparent )
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
            ;[(vec-mac v1 v2 v3 len prec)
            ; (+ cost-vec-mac (cost v1) (cost v2) (cost v3))
            ; ]
            [(vec-add v1 v2 len prec)
             (+ cost-vec-add (cost v1) (cost v2))
             ]
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (+ cost-vec-concat   (cost v1) (cost v2) (cost v3)
                (cost v4) (cost v5) (cost v6)
                (cost v7 ) (cost v8) (cost v9)
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
            ))





;(println "Struct def")
;(pretty-print  struct-sketch-special)



(define (get-length val)
  (destruct val
            [(reg id) (list-ref (list 128 32) id)]
            [(lit val) (bvlength val)]
            [(vec-mul v1 v2 len prec) (* len prec)]
            [(vec-add v1 v2 len prec) (* len prec)]
            ;[(vec-mac v1 v2 v3 len prec) (* len prec)]
            [(dot-prod vacc v1 v2 i j IP OP) (* i OP)]
            [(vec-reduction v1 len prec) prec]
            [(vec-load v1 vsize start num prec) (* num prec)]
            [(vec-strided-gather v1 vsize start stride num prec) (* num prec)]
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
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (concat (interpret v1 env) (interpret v2 env) (interpret v3 env)
                     (interpret v4 env) (interpret v5 env) (interpret v6 env)
                     (interpret v7 env) (interpret v8 env) (interpret v9 env)
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
            ))


(define (print-prog prog )
  (destruct prog
            [(reg id) 
             (display "arg")
             (println id)]
            [(nop v1) (print-prog v1)]
            [(lit val) (println val)]
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9)
             (displayln "(concat ")
             (print-prog v1) (print-prog v2) (print-prog v3)
             (print-prog v4) (print-prog v5) (print-prog v6)
             (print-prog v7) (print-prog v8) (print-prog v9)
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
            ))

(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 0 4 8)
     ;(vec-load (reg 0) 128 0 4 8)
     (vec-load (apply choose* vars) 128 0 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 4 4 8)
     ;(vec-load (reg 0) 128 4 4 8)
     (vec-load (apply choose* vars) 128 4 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 8 4 8)
     ;(vec-load (reg 0) 128 8 4 8)
     (vec-load (apply choose* vars) 128 8 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 12 4 8)
     ;(vec-load (reg 0) 128 12 4 8)
     (vec-load (apply choose* vars) 128 12 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 32 0 2 8)
     ;(vec-load (reg 1) 32 0 2 8)
     (vec-load (apply choose* vars) 32 0 2 8)
     ]
    [else
      ;(vec-load (mem vars #:depth (- k 1)) 32 2 2 8)
      ;(vec-load (reg 1) 32 2 2 8)
      (vec-load (apply choose* vars) 32 2 2 8)
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
    ;   (mem vars #:depth (- k 1))
    ;   (mem vars #:depth (- k 1))
    ;   4 8
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-special
    ;   (mem vars #:depth (- k 1))
    ;   (mem vars #:depth (- k 1))
    ;   2 8
    ;   )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (mem vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       4 8 0 2
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (mem vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       4 8 1 2
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (mem vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       4 8 2 2
       )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   8 8 0 4
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
   ;    8 8 4 4
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   8 8 6 2
    ;   )]
    ;[(choose* #t #f)
    ; (define left_operand (shufl vars #:depth (- k 1) ) )
    ; ;(assert (equal? (get-length left_operand) (* 4 8)))
    ; (vec-strided-gather left_operand 
    ;                     128 0 4 4 8
    ;                     )]
    ;[(choose* #t  #f)
    ; (define left_operand (shufl vars #:depth (- k 1) ) )
    ; ;(assert (equal? (get-length left_operand) (* 4 8)))
    ; (vec-strided-gather left_operand 
    ;                     128 1 4 4 8
    ;                     )]

    ;[(choose* #t #f)
    ; (define left_operand (shufl vars #:depth (- k 1) ) )
    ; (vec-strided-gather left_operand 
    ;                     128 2 4 4 8
    ;                     )]
    ;[(choose* #t #f)
    ; (define left_operand (shufl vars #:depth (- k 1) ) )
    ; ;(assert (equal? (get-length left_operand) (* 4 8)))
    ; (vec-strided-gather left_operand 
    ;                     128 3 4 4 8
    ;                     )]
    ;[(choose* #t #f)
    ; (define left_operand (shufl vars #:depth (- k 1) ) )
    ; ;(assert (equal? (get-length left_operand) (* 4 8)))
    ; (vec-strided-gather left_operand 
    ;                     32 0 2 2 8
    ;                     )]
    ;[(choose* #t #f)
    ; (define left_operand (shufl vars #:depth (- k 1) ) )
    ; ;(assert (equal? (get-length left_operand) (* 4 8)))
    ; (vec-strided-gather left_operand 
    ;                     32 1 2 2 8
    ;                     )]
    [else ;(choose* #t #f)
     (vec-mul  (shufl vars #:depth (- k 1))  (shufl vars #:depth (- k 1))
                         4 8 
                         )]
    ;[else
    ;  (mem vars #:depth k)]

    )
  )


(define (expr vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    ;[(choose* #t #f)
    ; (dot-prod (expr vars #:depth (- k 1))
    ;           (mem vars #:depth (- k 1))
    ;           (shufl vars #:depth (- k 1))
    ;           2 2 8 8
    ;           )]
    ;[(choose* #t #f)
    ; (vec-reduction (expr vars #:depth (- k 1)) 4 8
    ;                )]
    [(choose* #t #f)
     (vec-reduction (shufl vars #:depth (- k 1)) 4 8
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
    )

  )

; Get a sketch of depth 5.
(define sketch-grammar (top-grammar (list (reg 0) (reg 1)) #:depth 5))


(define (alt-tensor-conv img filt)
  (define row_1 (vector-load img 128 0 4 8))
  (define row_2 (vector-load img 128 4 4 8))
  (define row_3 (vector-load img 128 8 4 8))
  (define row_4 (vector-load img 128 12 4 8))

  (define slice_1 (vector-shuffle-ext-special row_1 row_2 4 8 0 2))
  (define slice_2 (vector-shuffle-ext-special row_1 row_2 4 8 1 2))
  (define slice_3 (vector-shuffle-ext-special row_1 row_2 4 8 2 2))
  
  
  (define slice_4 (vector-shuffle-ext-special row_2 row_3 4 8 0 2))
  (define slice_5 (vector-shuffle-ext-special row_2 row_3 4 8 1 2))
  (define slice_6 (vector-shuffle-ext-special row_2 row_3 4 8 2 2))
  
  
  (define slice_7 (vector-shuffle-ext-special row_3 row_4 4 8 0 2))
  (define slice_8 (vector-shuffle-ext-special row_3 row_4 4 8 1 2))
  (define slice_9 (vector-shuffle-ext-special row_3 row_4 4 8 2 2))


  (define prod_1 (vector-mul slice_1 filt 4 8))
  (define prod_2 (vector-mul slice_2 filt 4 8))
  (define prod_3 (vector-mul slice_3 filt 4 8))

  (define prod_4 (vector-mul slice_4 filt 4 8))
  (define prod_5 (vector-mul slice_5 filt 4 8))
  (define prod_6 (vector-mul slice_6 filt 4 8))

  (define prod_7 (vector-mul slice_7 filt 4 8))
  (define prod_8 (vector-mul slice_8 filt 4 8))
  (define prod_9 (vector-mul slice_9 filt 4 8))


  (define result (concat
                   (dsl_inst_1 prod_1 4 8)
                   (dsl_inst_1 prod_2 4 8)
                   (dsl_inst_1 prod_3 4 8)


                   (dsl_inst_1 prod_4 4 8)
                   (dsl_inst_1 prod_5 4 8)
                   (dsl_inst_1 prod_6 4 8)

                   (dsl_inst_1 prod_7 4 8)
                   (dsl_inst_1 prod_8 4 8)
                   (dsl_inst_1 prod_9 4 8)
                   ))
  result

  )



  (define row_1 (vec-load (reg 0) 128 0 4 8))
  (define row_2 (vec-load (reg 0) 128 4 4 8))
  (define row_3 (vec-load (reg 0) 128 8 4 8))
  (define row_4 (vec-load (reg 0) 128 12 4 8))

  (define slice_1 (vec-shuffle-ext-special row_1 row_2 4 8 0 2))
  (define slice_2 (vec-shuffle-ext-special row_1 row_2 4 8 1 2))
  (define slice_3 (vec-shuffle-ext-special row_1 row_2 4 8 2 2))
  
  
  (define slice_4 (vec-shuffle-ext-special row_2 row_3 4 8 0 2))
  (define slice_5 (vec-shuffle-ext-special row_2 row_3 4 8 1 2))
  (define slice_6 (vec-shuffle-ext-special row_2 row_3 4 8 2 2))
  
  
  (define slice_7 (vec-shuffle-ext-special row_3 row_4 4 8 0 2))
  (define slice_8 (vec-shuffle-ext-special row_3 row_4 4 8 1 2))
  (define slice_9 (vec-shuffle-ext-special row_3 row_4 4 8 2 2))


  (define prod_1 (vec-mul slice_1 (reg 1) 4 8))
  (define prod_2 (vec-mul slice_2 (reg 1) 4 8))
  (define prod_3 (vec-mul slice_3 (reg 1) 4 8))

  (define prod_4 (vec-mul slice_4 (reg 1) 4 8))
  (define prod_5 (vec-mul slice_5 (reg 1) 4 8))
  (define prod_6 (vec-mul slice_6 (reg 1) 4 8))

  (define prod_7 (vec-mul slice_7 (reg 1) 4 8))
  (define prod_8 (vec-mul slice_8 (reg 1) 4 8))
  (define prod_9 (vec-mul slice_9 (reg 1) 4 8))



(define alt-tensor-conv-dsl
   (vec-concat
                   (vec-reduction prod_1 4 8)
                   (vec-reduction prod_2 4 8)
                   (vec-reduction prod_3 4 8)


                   (vec-reduction prod_4 4 8)
                   (vec-reduction prod_5 4 8)
                   (vec-reduction prod_6 4 8)

                   (vec-reduction prod_7 4 8)
                   (vec-reduction prod_8 4 8)
                   (vec-reduction prod_9 4 8)
                   ))

(println "Starting")





(define image (apply concat 
                (for/list ([i (range (* 4 4))]) 
                          (bv (+ i 1) (bitvector 8))
                         )
                )
  )

;(displayln "Image")
;(print-mat image 4 4 8)


(define kernel (apply concat 
                (for/list ([i (range (* 2 2))]) 
                          (bv i (bitvector 8))
                          )
                )
  )

(define test-env (vector image kernel))

(displayln "Kernel")
(print-mat kernel 2 2 8)

(define output (tensor-conv2D image kernel 4 4 2 2 8))
(displayln "Convolution Output")
(print-mat output 3 3 8)


;(define alt_output (alt-tensor-conv image kernel))
;(displayln "Alt Convolution Output")
;(print-mat alt_output 3 3 8)


(define alt_output (interpret alt-tensor-conv-dsl test-env))
(displayln "Alt Convolution Output (DSL)")
(print-mat alt_output 3 3 8)


(define cex_arg0 (bv -1 (bitvector 128)))
(define cex_arg1 (bv -1 (bitvector 32)))


(define env (vector cex_arg0 cex_arg1))





;(define-symbolic sym2_arg0 (bitvector 128))
;(define-symbolic sym2_arg1 (bitvector 32))

;(clear-vc!)
;(define senv (vector sym2_arg0 sym2_arg1))

;(define cex2 (time
;               (verify
;  (assert (equal? (interpret alt-tensor-conv-dsl senv);(tensor-conv2D sym2_arg0 sym2_arg1 4 4 2 2 8)  
;                  (alt-tensor-conv sym2_arg0 sym2_arg1)))
;  )
;))

;(assert (sat? cex2) "Verified")
;(println cex2)

;(define v1 (evaluate sym2_arg0 cex2))
;(define v2 (evaluate sym2_arg1 cex2))

;(display "v1 ")
;(displayln v1)


;(display "v2 ")
;(displayln v2)
