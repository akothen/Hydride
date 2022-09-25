#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/ir/hydride/interpreter)
(require hydride/ir/hydride/binder)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/synth_main)
(require hydride/synthesis/python)
(require hydride/halide)
(require hydride/cpp)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)
(require hydride/ir/hydride/printer)
(require hydride/ir/halide/utils)

(provide (all-defined-out))


;; Defines the utilitie to perform synthesis on Halide IR expressions


(define (create-n-reg n)
  (for/list ([i (range n)])
            (reg i)
            )
  )


(define (dump-synth-res-with-typeinfo sol id-map)

  (define (print-helper k v)
    (display "; (reg ")
    (display (~s v))
    (display ") ")
    (displayln (halide:print-buffer-type-info k))
    v
    )
  (define printed-map (hash-map id-map print-helper))
  (displayln (hydride-printer sol))

  )


(define (synthesize-halide-expr halide-expr id-map expr-depth VF)
  (debug-log id-map)
  (define synthesized-sol (synthesize-halide-expr-step halide-expr expr-depth VF id-map))
  (displayln "========================================")
  (displayln "Original Halide Expression:")
  (pretty-print halide-expr)
  (displayln "Synthesis completed:")
  ;;(pretty-print synthesized-sol)
  (pretty-print id-map)
  (displayln "========================================")
  synthesized-sol


  )

(define synth-log (make-hash))

(define (synthesize-halide-expr-step halide-expr expr-depth VF id-map)



  (debug-log "=======================================")
  (define leaves (halide:get-sub-exprs halide-expr (+ expr-depth 1)))
  (debug-log "leaves")
  (debug-log leaves)
  (define leaves-sizes (halide:get-expr-bv-sizes leaves))
  (define leaves-elemT (halide:get-expr-elemT leaves))
  (define sym-bvs (create-concrete-bvs leaves-sizes))


  ;(clear-vc!)
  ;(clear-terms!)

  (define dummy-args (halide:create-buffers leaves sym-bvs))
  (debug-log "dummy-args")
  (debug-log dummy-args)


  (define synthesized-sol 
    (destruct halide-expr
              [(buffer data elem buffsize)
               (debug-log "Leaf buffer:")
               (debug-log halide-expr)
               (reg (hash-ref! id-map halide-expr -1)) ;; have a map to use accurate reg number
               ]
              [_ 
                (begin

                  (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr dummy-args expr-depth))
                  (debug-log "HERE")

                  (define base_name (string-append "base_" (~s (random 10000))))

                  (clear-vc!)
                  (clear-terms!)
                  (collect-garbage)

                  (define grammar (get-expr-grammar expr-extract leaves base_name VF))
                  (debug-log "Grammar:")
                  ;(debug-log grammar)

                  (define regs (create-n-reg (length leaves)))
                  (debug-log regs)
                  (define (grammar-fn i)
                    (clear-vc!)
                    (clear-terms!)
                    (define use-simple-grammar #t)
                    (if use-simple-grammar
                      (grammar i)
                      (grammar regs #:depth i)
                      )
                    )

                  (define (invoke-spec env)
                    (define synth-buffers (halide:create-buffers leaves env))
                    (define-values (_expr-extract _num-used) (halide:bind-expr-args halide-expr synth-buffers expr-depth))


                    (define _result (halide:assemble-bitvector (halide:interpret _expr-extract) VF))
                    ;;(define _result (cpp:eval ((halide:interpret _expr-extract) (- VF 1))))
                    _result
                    )


                  ;; Calculate result for last most lane
                  (define (invoke-spec-lane env)
                    (define synth-buffers (halide:create-buffers leaves env))
                    (define-values (_expr-extract _num-used) (halide:bind-expr-args halide-expr synth-buffers expr-depth))
                    (define _result (cpp:eval ((halide:interpret _expr-extract) (- VF 2))))
                    _result
                    )


                  (define depth-limit 6)
                  (define optimize? #f)
                  (define symbolic? #t)
                  (define cost-bound 50)
                  (define solver 'boolector)

                  ;(clear-vc!)
                  ;(clear-terms!)
                  (displayln "Synthesizing sub-expression")
                  (pretty-print expr-extract)

                  (define hashed-expr (halide:hash-expr expr-extract))

                  (displayln "Hashed expression")
                  (println hashed-expr)
                  (debug-log "Leaves are bitvectors of sizes:")
                  (debug-log leaves-sizes)
                  (define-values 
                    (satisfiable? materialize elap)
                    (if (hash-has-key? synth-log hashed-expr)
                      (begin 
                        (debug-log "Equivalent expression synthesized before, returned stored solution")
                        (define memo-result (hash-ref synth-log hashed-expr))
                        (values (vector-ref memo-result 0)  (vector-ref memo-result 1) (vector-ref memo-result 2))
                        )
                      (begin
                        (define test-start (current-seconds))
                        (debug-log "Beginning Synthesis")

                        (define-values (sat? mat el) 
                                       (synthesize-sol-with-depth (+ -1 expr-depth) depth-limit invoke-spec invoke-spec-lane grammar-fn leaves-sizes optimize? cost symbolic? cost-bound solver) 
                                       )

                        (define test-end (current-seconds))

                        (debug-log "Test elapsed time: ")
                        (debug-log (- test-end test-start))

                        (hash-set! synth-log hashed-expr (vector sat? mat el) )



                        (debug-log "Synthesis step completed!")
                        (values sat? mat el)
                        )
                      )
                    )

                  (if satisfiable? 
                    (begin
                      (displayln "Solution")
                      (pretty-print materialize)
                      )
                    (debug-log "Unsatisfiable")
                    )


                  (define synthesized-leaves 

                    (for/list  ([leaf leaves])
                               (synthesize-halide-expr-step leaf expr-depth VF id-map)
                               )
                    ;)
                    )
                  (debug-log "Synthesized-leaves")
                  (debug-log synthesized-leaves)
                  (bind-expr materialize (list->vector synthesized-leaves))
                  )]
              )
    )


  (debug-log "========================================")
  (debug-log "Original Halide Sub-Expression:")
  (debug-log halide-expr)
  (debug-log  "Sub-expression Synthesis completed:")
  (debug-log synthesized-sol)
  (debug-log "========================================")
  synthesized-sol
  )
