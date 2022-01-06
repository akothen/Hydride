#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

; (current-solver (boolector))
;(current-bitwidth 32)


(custodian-limit-memory (current-custodian) (* 6000 1024 1024))

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
(struct vec-concat (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12) #:transparent)
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
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (+ cost-vec-concat   (cost v1) (cost v2) (cost v3)
                (cost v4) (cost v5) (cost v6)
                (cost v7 ) (cost v8) (cost v9)
                (cost v10) (cost v11) (cost v12)
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
            [(reg id) (list-ref (list 64 192) id)]
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
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
             (displayln "(concat ")
             (print-prog v1) (print-prog v2) (print-prog v3)
             (print-prog v4) (print-prog v5) (print-prog v6)
             (print-prog v7) (print-prog v8) (print-prog v9)
             (print-prog v10) (print-prog v11) (print-prog v12)
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
    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
                         192 0 6 4 8
                         )]
    [(choose* #t  #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
                         192 1 6 4 8
                         )]

    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     (vec-strided-gather left_operand 
                         192 2 6 4 8
                         )]
    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
                         192 3 6 4 8
                         )]

    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
                         192 4 6 4 8
                         )]

    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
                         192 5 6 4 8
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


(define cex_arg0 (bv #x1111111111111111 64))
(define cex_arg1 (bv #x222222222222222222222222222222222222222222222222 192))


(define env (vector cex_arg0 cex_arg1))

(println "Starting")





(define image (apply concat 
                (for/list ([i (range (* 4 4))]) 
                          (bv (+ i 1) (bitvector 8))
                          )
                )
  )

(displayln "Image")
(print-mat image 4 4 8)


(define kernel (apply concat 
                (for/list ([i (range (* 2 2))]) 
                          (bv 1 (bitvector 8))
                          )
                )
  )

(displayln "Kernel")
(print-mat kernel 2 2 8)

(define output (tensor-conv2D image kernel 4 4 2 2 8))
(displayln "Convolution Output")
(print-mat output 3 3 8)
