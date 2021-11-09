#lang rosette

(require rosette/lib/destruct
         rosette/lib/angelic)

(require rosette/lib/synthax)
(require racket/pretty)
(custodian-limit-memory (current-custodian) (* 6000 1024 1024))
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
    (assert (equal? (bvlength dst) (* len precision)))
    (assert (equal? (bvlength a) (* len precision)))
    (assert (equal? (bvlength b) (* len precision)))
    (define result
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
  (assert (bv? result)) 
  (assert (equal? (bvlength result) (* len precision)))
  result 
)

(define (vector-add a b len precision)
  (assert (bv? a))
  (assert (bv? b))
  (assert (equal? (bvlength a) (* len precision)))
  (assert (equal? (bvlength b) (* len precision)))
  (define result
  (apply 
    concat 
    (for/list ([j (range len)]) 
              (define tmp 
                (bvadd (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
              tmp 
              ) 
    )
  )
  (assert (bv? result)) 
  (assert (equal? (bvlength result) (* len precision)))
  result
)

(define (vector-mul a b len precision)
  (assert (bv? a))
  (assert (bv? b))
  (assert (equal? (bvlength a) (* len precision)))
  (assert (equal? (bvlength b) (* len precision)))
  (define result
  (apply 
    concat 
    (for/list ([j (range len)]) 
              (define tmp 
                (bvmul (ext-bv a (- (- len 1) j) precision) (ext-bv b (- (- len 1) j) precision))) 
              tmp 
              ) 
    ) 
  )
  (assert (bv? result)) 
  (assert (equal? (bvlength result) (* len precision)))
  result
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


; Because we'll be using regs to index into a
; vector, it is best to make them mutable 
; so they get merged into a union rather than field-wise.
(struct reg (id)   #:transparent #:mutable)
(struct lit (val)  #:transparent)
(struct vec-mul (v1 v2 len prec) #:transparent)
(struct vec-add (v1 v2 len prec) #:transparent)
(struct vec-mac (v1 v2 v3 len prec) #:transparent)
(struct vec-concat (v1 v2) #:transparent)

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
            [(vec-concat v1 v2)
                (concat (interpret v1 env) (interpret v2 env))
             ]
            [wild wild]
            ))




(define (grammar vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (define-symbolic* val int128?)
     (lit val)]
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-concat 
       (grammar vars #:depth (- k 1)) 
       (grammar vars #:depth (- k 1)) 
    )]
    [(choose* #t #f)
     (vec-add (grammar vars #:depth (- k 1)) 
              (grammar vars #:depth (- k 1)) 
              4 32
              )]
    [(choose* #t #f)
     (vec-mul (grammar vars #:depth (- k 1)) 
              (grammar vars #:depth (- k 1)) 
              4 32
              )]

    [(choose* #t #f)
     (vec-mac (grammar vars #:depth (- k 1)) 
              (grammar vars #:depth (- k 1)) 
              (grammar vars #:depth (- k 1)) 
              4 32
              )]
    [(choose* #t #f)
     (no-op (grammar vars #:depth (- k 1)))]
    [else
      (lit (int128 0))
      ]
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
             (+ 10 (cost v1) (cost v2) (cost v3))
             ]
            [(vec-add v1 v2 len prec)
             (+ 10 (cost v1) (cost v2))
             ]
            [(vec-concat v1 v2)
             (+ 5 (cost v1) (cost v2))
             ]
            ))

(define-symbolic x y z int128?)

(define env (vector x y z ))

; Get a sketch of depth 3.
(define sketch (grammar (list (reg 0) (reg 1) (reg 2)) #:depth 3))

(define (spec a b c len prec)
  (concat
    (vector-mul a b len prec)
    (vector-add a c len prec)
    )
  )





(define sol
  (synthesize
    #:forall env
    #:guarantee
    (begin
      (assert
        (equal?
          (interpret sketch env)
          (spec x y z 4 32)
          ))

      ;(assert (< (cost sketch) 48))  ; Uncomment this line to generate implementation which doesnt use mac
      )
    )
)

(define gen (evaluate sketch sol))
(println gen)
(println (cost gen))
