#lang rosette

(require rosette/lib/destruct
         rosette/lib/angelic)

(require rosette/lib/synthax)
(require racket/pretty)
(custodian-limit-memory (current-custodian) (* 12000 1024 1024))
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



(define (vector-mac dst a b len precision) 
  (begin  
    (assert (bv? dst))  
    (assert (bv? a))  
    (assert (bv? b))  
    (apply  
      concat  
      (for/list ([j (range len)])  
                (define tmp  
                  (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
                (bvadd (ext-bv dst (- (- len 1) j) precision) tmp) 
                ) 
      ) 
    ) 
  ) 

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


; Store a into bv b at index idx
(define (vector-store a b idx precision) 
  (define len (quotient (bvlength b) precision))
  (apply 
    concat 
    (for/list ([j (range len)]) 
              (if (= j idx) a (ext-bv b (- (- len 1) j) precision))
              ) 
    ) 
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
 (bvadd (ext-bv vreg-acc i conc_out_precision) sum)))) 
 ;(assert (equal? (bvlength result) (* conc_i_bound conc_out_precision))) 
 result) 
 
 (define (dsl_inst_1 vreg conc_i_bound conc_precision) 
 ;(assert (equal? (bvlength vreg) (* conc_i_bound conc_precision))) 
 (define result 
 (apply 
 bvadd 
 (for/list ([i (reverse (range conc_i_bound))]) 
 (ext-bv vreg i conc_precision)))) 
 ;(assert (equal? (bvlength result) conc_precision)) 
 result) 


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

;; Reference Specification
(define (tensor-matmul arg1 arg2)  (apply  concat  (for/list ([i (reverse (range   2))])  (apply concat  (for/list ([j (reverse (range 6))])  (apply bvadd (for/list ([k (reverse (range 4))])  (define idx_left (+ (* i 4) k)) (define idx_right (+ (* k 6) j))(define value1 (ext-bv arg1 idx_left 8)) (define value2 (ext-bv arg2 idx_right 8))  (bvmul value1 value2)  )  )  )  )  )  ) );; DSL Specification

; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct lit (val)  #:transparent )
(struct vec-mul (v1 v2 len prec) #:transparent )
(struct vec-add (v1 v2 len prec) #:transparent )
(struct vec-mac (v1 v2 v3 len prec) #:transparent )
(struct vec-concat (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12) #:transparent)
(struct dot-prod ([vacc #:mutable] [v1 #:mutable] [v2 #:mutable] i j IP OP) #:transparent )
(struct vec-reduction ([v1 #:mutable] len prec) #:transparent )
(struct vec-load ([v1 #:mutable] vsize start num prec) #:transparent )
(struct vec-strided-gather ([v1 #:mutable] vsize start stride num prec) #:transparent )
(struct nop (v1) #:transparent)


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
            [(vec-mul v1 v2 len prec)
                (vector-mul (interpret v1 env) (interpret v2 env) len prec)
             ]
            [(vec-add v1 v2 len prec)
                (vector-add (interpret v1 env) (interpret v2 env) len prec)
             ]
            [(vec-mac v1 v2 v3 len prec)
                (vector-mac (interpret v1 env) (interpret v2 env) (interpret v3 env) len prec)
             ]
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
                (concat (interpret v1 env) (interpret v2 env) (interpret v3 env)
                        (interpret v4 env) (interpret v5 env) (interpret v6 env)
                        (interpret v7 env) (interpret v8 env) (interpret v9 env)
                        (interpret v10 env) (interpret v11 env) (interpret v12 env)
                        )
             ]
            [(dot-prod vacc v1 v2 i j IP OP)
             (dsl_inst_0 (interpret vacc env) (interpret v1 env) (interpret v2 env) i j IP OP)
             ]
            [(vec-reduction v1 len prec)
             (dsl_inst_1 (interpret v1 env) len prec)
             ]
            [
             (vec-load v1 vsize start num prec)
             (vector-load (interpret v1 env) vsize start num prec)
             ]
            [
             (vec-strided-gather v1 vsize start stride num prec)
             (strided-gather (interpret v1 env) vsize start stride num prec)
             ]
            ))




(define (grammar vars #:depth k)
  (assert (> k 0))
  (cond
    ;[(choose* #t #f)
    ; (define-symbolic* val int128?)
    ; (lit val)]
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-load (reg 0) ;(grammar vars #:depth (- k 1)) 
               64 0 4 8
              )]
    [(choose* #t #f)
     (vec-load (reg 0) ;(grammar vars #:depth (- k 1)) 
               64 4 4 8
              )]
    [(choose* #t #f)
     (vec-strided-gather (reg 1) ;(grammar vars #:depth (- k 1)) 
               192 0 6 4 8
              )]
    [(choose* #t #f)
     (vec-strided-gather (reg 1) ;(grammar vars #:depth (- k 1)) 
               192 1 6 4 8
              )]
    [(choose* #t #f)
     (vec-strided-gather (reg 1) ;(grammar vars #:depth (- k 1)) 
               192 2 6 4 8
              )]
    [(choose* #t #f)
     (vec-strided-gather (reg 1) ;(grammar vars #:depth (- k 1)) 
               192 3 6 4 8
              )]
    [(choose* #t #f)
     (vec-strided-gather (reg 1) ;(grammar vars #:depth (- k 1)) 
               192 4 6 4 8
              )]
    [(choose* #t #f)
     (vec-strided-gather (reg 1) ;(grammar vars #:depth (- k 1)) 
               192 5 6 4 8
              )]
    ;[(choose* #t #f)
    ; (nop (grammar vars #:depth (- k 1)))]
    [(choose* #t #f)
     (dot-prod (grammar vars #:depth (- k 1)) 
              (grammar vars #:depth (- k 1)) 
              (grammar vars #:depth (- k 1)) 
              1 4 8 8
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
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 

       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 

       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
    )
    
  )

(define (cost expr)
  (destruct expr
            [(lit _) 3]
            [(reg _) 5]
            [(vec-mul v1 v2 len prec)
             (+ 10 (cost v1) (cost v2))
             ]
            [(vec-mac v1 v2 v3 len prec)
             (+ 12 (cost v1) (cost v2) (cost v3))
             ]
            [(vec-add v1 v2 len prec)
             (+ 5 (cost v1) (cost v2))
             ]
            [(vec-concat v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12)
                (+ 5   (cost v1) (cost v2) (cost v3)
                        (cost v4) (cost v5) (cost v6)
                        (cost v7 ) (cost v8) (cost v9)
                        (cost v10) (cost v11) (cost v12)
                        )
             ]
            [(dot-prod vacc v1 v2 i j IP OP)
             (+ 5 (cost v1) (cost v2))
             ]
            [(vec-reduction v1 len prec)
             (+ 3 (cost v1))
             ]
            [(vec-load v1 vsize start num prec)
             (+ 5 (cost v1))
             ]
            [(vec-strided-gather v1 vsize start stride num prec)
             (+ 10 (cost v1))
             ]
            [(nop v1) 
             (+ 1 (cost v1))]
            ))

;(define-symbolic x y z int128?)

(define x1 (bv #x0000000000000000 64))
(define y1 (bv #x000000000000000000000000000000000000000000000000 192))

(define env1 (vector x1 y1))


(define x2 (bv #x777ff5a8d80f2e37 64))
(define y2 (bv #x53c0100f59df0403fe874bbc3dfcdecb60632414bffbfd52 192))

(define env2 (vector x2 y2))



(define x3 (bv #x2f229fd71075ffd9 64))
(define y3 (bv #x961b83aa3825630daf2da931c8cf2f991dca268bfba5a156 192))

(define env3 (vector x3 y3))

; Get a sketch of depth 3.
(define sketch (top-grammar (list (reg 0) (reg 1)) #:depth 3))


(define actual-out
    (vec-concat

      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (vec-strided-gather (reg 1) 192 0 6 4 8)
       (vec-load (reg 0) 64 0 4 8)
       1
       4
       8
       8)
      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (vec-load (reg 0) 64 0 4 8)
       (vec-strided-gather (reg 1) 192 1 6 4 8)
       1
       4
       8
       8)
      (dot-prod
       (nop (lit (bv 0 (bitvector 8))))
       (vec-strided-gather (reg 1) 192 2 6 4 8)
       (vec-load (reg 0) 64 0 4 8)
       1
       4
       8
       8)
      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (vec-load (reg 0) 64 0 4 8)
       (vec-strided-gather (reg 1) 192 3 6 4 8)
       1
       4
       8
       8)
      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (vec-load (reg 0) 64 0 4 8)
       (vec-strided-gather (reg 1) 192 4 6 4 8)
       1
       4
       8
       8)
      (dot-prod
       (nop (lit (bv 0 (bitvector 8))))
       (vec-strided-gather (reg 1) 192 5 6 4 8)
       (vec-load (reg 0) 64 0 4 8)
       1
       4
       8
       8)
      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (vec-strided-gather (reg 1) 192 0 6 4 8)
       (vec-load (reg 0) 64 4 4 8)
       1
       4
       8
       8)
      (dot-prod
       (nop (lit (bv 0 (bitvector 8))))
       (vec-load (reg 0) 64 4 4 8)
       (vec-strided-gather (reg 1) 192 1 6 4 8)
       1
       4
       8
       8)
      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (reg 0) 
       (vec-strided-gather (reg 1) 192 2 6 4 8)
       1
       4
       8
       8)
      (dot-prod
       (lit (bv 0 (bitvector 8)))
       (vec-strided-gather (reg 1) 192 3 6 4 8)
       (vec-load (reg 0) 64 4 4 8)
       1
       4
       8
       8)
      (dot-prod
       (nop (lit (bv 0 (bitvector 8))))
       (vec-load (reg 0) 64 4 4 8)
       (vec-strided-gather (reg 1) 192 4 6 4 8)
       1
       4
       8
       8)
      (dot-prod
       (nop (lit (bv 0 (bitvector 8))))
       (reg 0) 
       (vec-strided-gather (reg 1) 192 5 6 4 8)
       1
       4
       8
       8)
)
    )

;(println (cost actual-out))
;(println (interpret actual-out env1))

;(assert (equal?  (interpret actual-out env1) (tensor-matmul x1 y1)) "Error!")

;(println (interpret actual-out env2))
;(assert (equal?  (interpret actual-out env2) (tensor-matmul x2 y2)) "Error!")
  




(define sol
  (synthesize
    #:forall (list env1 env2 env3) 
    #:guarantee
    (begin
        (assert 
        (equal? (interpret sketch env1) (tensor-matmul  x1 y1) ))
      ;(assert (equal? (interpret sketch env1) (interpret actual-out env1)))
      (assert
        (equal? (interpret sketch env2) (tensor-matmul x2 y2)))

      (assert
        (equal? (interpret sketch env3) (tensor-matmul x3 y3)))
      ;(assert 
      ;  (= (cost sketch) 355))

      )
    )
)

(define gen (evaluate sketch sol))
(pretty-print gen)
(println gen)
(println (cost gen))