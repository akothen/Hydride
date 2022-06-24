#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)

(define-symbolic reg_1_bitvector (bitvector 512))
(define reg_1 (halide:create-buffer reg_1_bitvector 'uint8))
(define-symbolic reg_0_bitvector (bitvector 512))
(define reg_0 (halide:create-buffer reg_0_bitvector 'uint8))

(define sym_env (vector reg_1 reg_0 ))
(define-symbolic-buffer input1 uint8_t)
(define-symbolic-buffer input2 uint8_t)

(define-symbolic output.s0.y.rebased integer?)
(define-symbolic t67 integer?)
(define-symbolic t64 integer?)
(define-symbolic t44 integer?)
(define-symbolic t82 integer?)
(define-symbolic t59 integer?)
(define-symbolic t54 integer?)
(define-symbolic t49 integer?)
(define-symbolic t77 integer?)
(define-symbolic t76 integer?)
(define-symbolic t74 integer?)

(define axioms 
  (list ))

(define input1.min.0 (var-lookup 'input1.min.0 t44))
(define input1.stride.1 (var-lookup 'input1.stride.1 t49))
(define input2.min.0 (var-lookup 'input2.min.0 t54))
(define input2.stride.1 (var-lookup 'input2.stride.1 t59))
(define output.min.0 (var-lookup 'output.min.0 t64))
(define output.min.1 (var-lookup 'output.min.1 t67))
(define t34 (var-lookup 't34 t74))
(define t36 (var-lookup 't36 t76))
(define t37 (var-lookup 't37 t77))
(define t29 (var-lookup 't29 (sca-add  (sca-mul  t34  64)  output.min.0)))
(define t20 (var-lookup 't20 t82))
(define t23 (var-lookup 't23 (sca-add  output.min.1  output.s0.y.rebased)))

(define halide-expr 
  (vec-add
    reg_0
    reg_1)
  )


(define result (halide:assemble-bitvector (halide:interpret halide-expr) 64))

;; Automatic grammar generation relies on the ability to identify the bv ops used
;; in an expression.
;; This method returns the de-duplicated list of bvops used in
;; the halide expression.
(println (remove-duplicates (halide:get-bv-ops halide-expr)))


;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (add_grammar_mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f) (apply choose* vars)]
    [else
      (lit (create-symbolic-bv 256))
      ]
    )
  )

(define (add_grammar_shuffle vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      8				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      16				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      8				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      16				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      8				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      16				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      8				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      32				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Lane Size 
      16				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [else
      (add_grammar_mem vars #:depth k)
      ]
    )
  )

(define (add_grammar_operations vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f)
     (
      _m_paddw_dsl
      (add_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      (add_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
      512				;; Integer Operand 
      512				;; Lane Size 
      512				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [else
      (add_grammar_shuffle vars #:depth k)
      ]
    )
  )


;; Function to take a vector of symbolic variables and to
;;evaluate the halide expression then assemble the result 
;; and return it.

;; TODO: Write a function to automatically bind registers and creates
;; the invokation function
(define (invoke_add env)

  (define _reg_0 (halide:create-buffer (vector-ref env 0) 'uint8))
  (define _reg_1 (halide:create-buffer (vector-ref env 1) 'uint8))
  (define _halide-expr 
    (vec-add
      _reg_0
      _reg_1)
    )

  (define _result (halide:assemble-bitvector (halide:interpret _halide-expr) 64))
  _result

  )

(define spec_exprs
  (list
    invoke_add
    )
  )


(define spec_inputs_sizes 
  (list
    (list 512 512)
    )
  )

(define grammar-fns 
  (list
    (lambda (i) (add_grammar_operations (list (reg 0) (reg 1)) #:depth i  )  )
    ))

(define depth-limit 5)

(define start_time (current-seconds))

(for/list ([i (range (length spec_exprs))])
          (clear-vc!)
          (displayln "===================================")
          (display "Synthesizing Subexpression #")
          (displayln i)
          (define sub_expr (list-ref spec_exprs i))
          (define bw-list (list-ref spec_inputs_sizes i))

          (define test_grammar-fn (list-ref grammar-fns i))

          (println sub_expr)
          (println bw-list)

          (define optimize? #f)
          (define symbolic? #t)
          (define cost-bound 50)
          (define solver 'z3)

          (define test-start (current-seconds))
          (define-values (satisfiable? materialize elap) 
                         (synthesize-sol-with-depth 2 depth-limit sub_expr test_grammar-fn bw-list optimize? cost symbolic? cost-bound solver) )

          (define test-end (current-seconds))

          (printf "Test elapsed time: ~a \n" (- test-end test-start))

          (displayln "Synthesis step completed!")

          (if satisfiable? 
            (begin
              (displayln "Solution")
              (pretty-print materialize)
              )
            (displayln "Unsatisfiable")
            )


          )

(define end_time (current-seconds))
(define elapsed_time (- end_time start_time))
(printf "Total Synthesis took ~a seconds ...\n" elapsed_time )
