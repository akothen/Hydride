#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/ir/hydride/interpreter)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/python)
(require hydride/halide)
(require hydride/ir/hydride/definition)


(provide (all-defined-out))


;; Defines the utilitie to perform synthesis on Halide IR expressions


(define (synthesize-halide-expr halide-expr expr-depth)



  (displayln "=======================================")
  (define leaves (halide:get-sub-exprs halide-expr (+ expr-depth 1)))
  (define leaves-sizes (halide:get-expr-bv-sizes leaves))
  (define sym-bvs (create-symbolic-bvs leaves-sizes))





  (define dummy-args sym-bvs);;(vector "arg1" "arg2" "arg3" "arg4" "arg5"))


  (define synthesized-sol 
    (destruct halide-expr
              [(buffer data elem buffsize)
               (printf "Leaf buffer: ~a\n" halide-expr)
               (reg 0) ;; have a map to use accurate reg number
               ]
              [(x32 sca)
               (define expr-sizes (halide:get-expr-bv-sizes (list halide-expr)))
               (displayln "Synthesizing sub-expression")
               (pretty-print halide-expr)
               (displayln "Leaves are bitvectors of sizes:")
               (println expr-sizes)
               ;; perform synthesis using expr sizes
               ]
              [_ 
                (begin

                  (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr dummy-args expr-depth))

                  (displayln "Synthesizing sub-expression")
                  (pretty-print expr-extract)
                  (displayln "Leaves are bitvectors of sizes:")
                  (println leaves-sizes)

                  (define grammar (get-expr-grammar expr-extract leaves "base"))


                  (define synthesized-leaves 
                    (if 
                      (halide:is-broadcast expr-extract)
                      (list )

                        (for/list  ([leaf leaves])
                                   (synthesize-halide-expr leaf expr-depth)
                                   )
                    )
                    )
                  halide-expr
                  )]
              )
    )

  0
  )
