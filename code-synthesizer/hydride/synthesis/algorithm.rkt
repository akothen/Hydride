#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
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
(require hydride/synthesis/lower_swizzle)

(require hydride/halide)
(require hydride/cpp)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)
(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/printer)

(provide (all-defined-out))


;; Defines the utilitie to perform synthesis on Halide IR expressions

(define synth-log (make-hash))

(define (create-n-reg n)
  (for/list ([i (range n)])
            (reg i )
            )
  )


(define (dump-synth-res-with-typeinfo sol id-map)

  (define (print-helper k v)
    (display "; (reg ")
    (display (~s  v))
    (display ") ")
    (displayln (halide:print-buffer-type-info k))
    v
    )
  (define printed-map (hash-map id-map print-helper))
  (displayln (hydride-printer sol))

  )


(define (synthesize-halide-expr halide-expr id-map expr-depth VF solver prev-hash-file prev-hash-name)
  (debug-log id-map)
  (if (equal? prev-hash-file "")
    '()
    (begin
      (debug-log "Found previous hash!\n")
      (define prev-hash (import-synth-map prev-hash-file prev-hash-name))
      (set! synth-log prev-hash)
      (debug-log synth-log)

      )

    )

  (define synthesized-sol (synthesize-halide-expr-step halide-expr expr-depth VF id-map solver))
  (displayln "========================================")
  (displayln "Original Halide Expression:")
  (pretty-print halide-expr)
  (displayln "Synthesis completed:")

  ;; Synthesis completed with Hydride Target Agnostic 
  ;; Operations, check if further simplification can 
  ;; be performed. E.g. if the bitvector operands of
  ;; any operation are all literals then that operation
  ;; can instead be replaced with it's result. Traverse
  ;; bottom up and incrementally simplify operations.
  (define folded (hydride:const-fold synthesized-sol))

  ;; Lower target agnostic specialized shuffles to sequences
  ;; of target specific shuffle operations.
  (define legalized-shuffles-expr (legalize-expr-swizzles folded solver hydride:cost #t #f))
  (pretty-print id-map)
  (displayln "========================================")
  legalized-shuffles-expr
  )


(define (synthesize-halide-expr-step halide-expr expr-depth VF id-map solver)



  (debug-log "=======================================")
  (define leaves (halide:get-sub-exprs halide-expr (+ expr-depth 1)))
  (printf "leaves: ~a\n" leaves)
  (define leaves-sizes (halide:get-expr-bv-sizes leaves))
  (define leaves-elemT (halide:get-expr-elemT leaves))
  (define sym-bvs (create-symbolic-bvs leaves-sizes))

  (println "here")





  ;(clear-vc!)
  ;(clear-terms!)

  (define dummy-args (halide:create-buffers leaves sym-bvs))



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

                  (debug-log expr-extract)
                  (define base_name (string-append "base_" (~s (random 10000))))



                  (define expr-VF (halide:vec-len expr-extract))

                  (debug-log (format "Vectorization factor for sub expression ~a\n" expr-VF))


                  (define (invoke-spec env-full)
                    (printf "invoke-spec with env: ~a\n" env-full)
                    (define synth-buffers-full (halide:create-buffers leaves env-full))




                    (define-values (_expr-extract-full _num-used) (halide:bind-expr-args halide-expr synth-buffers-full expr-depth))

                    (println _expr-extract-full)


                    (define _result_full (halide:assemble-bitvector (halide:interpret _expr-extract-full) expr-VF))
                    (displayln "Spec result")
                    (println _result_full)
                    _result_full
                    )


                  ;; Calculate result for last most lane
                  (define (invoke-spec-lane lane-idx env-lane)
                    (printf "invoke-spec-lane with env: ~a\n" env-lane)
                    (define synth-buffers-lane (halide:create-buffers leaves env-lane))
                    (define-values (_expr-extract _num-used) (halide:bind-expr-args halide-expr synth-buffers-lane expr-depth))
                    (define output-idx (- expr-VF 1 lane-idx))
                    (define _result_lane (cpp:eval ((halide:interpret _expr-extract) output-idx)))
                    _result_lane
                    )


                  (define depth-limit 5)
                  (define optimize? #t)
                  (define symbolic? #f)
                  (define cost-bound 40)

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


                        (define grammar (get-expr-grammar expr-extract leaves base_name expr-VF));;VF))
                        (debug-log "Grammar:")
                        (debug-log grammar)


                        (define regs (create-n-reg (length leaves)))
                        (debug-log regs)
                        (define (grammar-fn i)
                          (define use-simple-grammar #t)
                          (if use-simple-grammar
                            (grammar i)
                            (grammar regs #:depth i)
                            )
                          )
                        (define test-start (current-seconds))
                        (debug-log "Beginning Synthesis")

                        (define-values (sat? mat el) 
                                       (synthesize-sol-with-depth (max (+ -1 expr-depth) 1) depth-limit invoke-spec invoke-spec-lane grammar-fn leaves-sizes optimize? hydride:cost symbolic? cost-bound solver) 
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

                  (println materialize)

                  (displayln "Cost")
                  (println (hydride:cost materialize))


                  (define synthesized-leaves 

                    (for/list  ([leaf leaves])
                               (synthesize-halide-expr-step leaf expr-depth VF id-map solver)
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
