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
(require hydride/ir/hydride/binder)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/synth_main)
(require hydride/synthesis/python)
(require hydride/halide)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)


(provide (all-defined-out))


;; Defines the utilitie to perform synthesis on Halide IR expressions


(define (create-n-reg n)
  (for/list ([i (range n)])
            (reg i)
            )
  )


(define (synthesize-halide-expr halide-expr expr-depth VF)
  (define id-map (halide:get-buffer-ids halide-expr))
  (define synthesized-sol (synthesize-halide-expr-step halide-expr expr-depth VF id-map))
  (displayln "========================================")
  (displayln "Synthesis completed:")
  (pretty-print synthesized-sol)
  (displayln "========================================")
  synthesized-sol


  )

(define (synthesize-halide-expr-step halide-expr expr-depth VF id-map)



  (displayln "=======================================")
  (define leaves (halide:get-sub-exprs halide-expr (+ expr-depth 1)))
  (define leaves-sizes (halide:get-expr-bv-sizes leaves))
  (define leaves-elemT (halide:get-expr-elemT leaves))
  (define sym-bvs (create-symbolic-bvs leaves-sizes))





  (define dummy-args (halide:create-buffers leaves sym-bvs))


  (define synthesized-sol 
    (destruct halide-expr
              [(buffer data elem buffsize)
               (printf "Leaf buffer: ~a\n" halide-expr)
               (reg (hash-ref! id-map halide-expr -1)) ;; have a map to use accurate reg number
               ]
              [(x32 sca)
               (displayln "synth-base case x32 scalar")
               (define expr-sizes (halide:get-expr-bv-sizes (list halide-expr)))
               (displayln "Synthesizing sub-expression")
               (pretty-print halide-expr)
               (displayln "Leaves are bitvectors of sizes:")
               (println expr-sizes)
               ;; perform synthesis using expr sizes
               (define broadcasted-val (apply concat (for/list ([i (range 32)]) sca)))
               (lit broadcasted-val)
               ]

              [(x8 sca)
               (displayln "synth-base case x8 scalar")
               (define expr-sizes (halide:get-expr-bv-sizes (list halide-expr)))
               (displayln "Synthesizing sub-expression")
               (pretty-print halide-expr)
               (displayln "Leaves are bitvectors of sizes:")
               (println expr-sizes)
               ;; perform synthesis using expr sizes
               (define broadcasted-val (apply concat (for/list ([i (range 8)]) sca)))
               (lit broadcasted-val)
               ]
              [_ 
                (begin

                  (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr dummy-args expr-depth))

                  (define base_name (string-append "base_" (~s (random 10000))))


                  (define grammar (get-expr-grammar expr-extract leaves base_name VF))
                  (displayln "Grammar:")
                  (println grammar)

                  (define regs (create-n-reg (length leaves)))

                  (println regs)
                  (define (grammar-fn i)
                    (grammar regs #:depth i)
                    )

                  (define (invoke-spec env)
                    (define synth-buffers (halide:create-buffers leaves env))
                    (define-values (_expr-extract _num-used) (halide:bind-expr-args halide-expr synth-buffers expr-depth))

                    (define _result (halide:assemble-bitvector (halide:interpret _expr-extract) VF))
                    _result
                    )


                  (define depth-limit 5)
                  (define optimize? #t)
                  (define symbolic? #f)
                  (define cost-bound 40)
                  (define solver 'z3)

                  (clear-vc!)
                  (displayln "Synthesizing sub-expression")
                  (pretty-print expr-extract)
                  (displayln "Leaves are bitvectors of sizes:")
                  (println leaves-sizes)
                  (define test-start (current-seconds))
                  (displayln "Beginning Synthesis")
                  (define-values (satisfiable? materialize elap) 
                                 (synthesize-sol-with-depth 2 depth-limit invoke-spec grammar-fn leaves-sizes optimize? cost symbolic? cost-bound solver) )

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


                  (define synthesized-leaves 
                    (if 
                      (halide:is-broadcast expr-extract)
                      (list )

                      (for/list  ([leaf leaves])
                                 (synthesize-halide-expr-step leaf expr-depth VF id-map)
                                 )
                      )
                    )
                  (bind-expr materialize (list->vector synthesized-leaves))
                  )]
              )
    )

  (displayln "Returning Synthesized Solution:")
  (pretty-print synthesized-sol)
  synthesized-sol
  )
