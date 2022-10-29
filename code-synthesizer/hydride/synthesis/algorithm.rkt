#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/utils/misc)
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
            (reg (bv i 4))
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
      (set! synth-log (hash-copy prev-hash))
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


  (define actual-expr-depth 
    (cond
      [(halide:contains-complex-op-in-subexpr halide-expr expr-depth)
       (debug-log (format "Contains complex operation, hence decrement depth from ~a to ~a\n" expr-depth (max 1 (- expr-depth 1))))
       (max 1 (- expr-depth 1))
       ]
      [else
        expr-depth
        ]
      )

    )

  (debug-log "=======================================")
  (define leaves (halide:get-sub-exprs halide-expr (+ actual-expr-depth 1)))
  (define leaves-sizes (halide:get-expr-bv-sizes leaves))
  (define leaves-elemT (halide:get-expr-elemT leaves))
  (define sym-bvs (create-concrete-bvs leaves-sizes)) ;; Can this be concrete






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

                  (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr dummy-args actual-expr-depth))

                  (debug-log expr-extract)
                  (define base_name (string-append "base_" (~s (random 10000))))



                  (define expr-VF (halide:vec-len expr-extract))

                  (debug-log (format "Vectorization factor for sub expression ~a\n" expr-VF))


                  (define (invoke-spec env-full)
                    (printf "invoke-spec with env: ~a\n" env-full)
                    (define synth-buffers-full (halide:create-buffers leaves env-full))




                    (define-values (_expr-extract-full _num-used) (halide:bind-expr-args halide-expr synth-buffers-full actual-expr-depth))

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
                    (define-values (_expr-extract _num-used) (halide:bind-expr-args halide-expr synth-buffers-lane actual-expr-depth))
                    (define output-idx (- expr-VF 1 lane-idx))
                    (define _result_lane (cpp:eval ((halide:interpret _expr-extract) output-idx)))
                    _result_lane
                    )


                  (define depth-limit 4)
                  (define optimize? #t)
                  (define symbolic? #f)
                  (define cost-bound 40)

                  (displayln (format "Synthesizing sub-expression using expression-depth ~a \n" actual-expr-depth))
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
                                       (synthesize-sol-with-depth (max (+ -1 actual-expr-depth) 1) depth-limit invoke-spec invoke-spec-lane grammar-fn leaves-sizes optimize? hydride:cost symbolic? cost-bound solver) 
                                       )

                        (define test-end (current-seconds))

                        (debug-log "Test elapsed time: ")
                        (debug-log (- test-end test-start))

                        (debug-log hashed-expr)
                        (debug-log (vector sat? mat el))

                        ;; Only memoize succesful entries
                        (if sat? 
                            (hash-set! synth-log hashed-expr (vector sat? mat el) )
                            '()
                          )

                        



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
                    (begin
                      (debug-log "Unsatisfiable, try smaller window within given sub-expression")
                      (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr dummy-args actual-expr-depth))
                      (define expr-VF (halide:vec-len expr-extract))

                      ;; The extracted sub-expression is to be treated
                      ;; as synthesis of some un-seen new expression
                      ;; and so we must create a new id-map for the registers to bind to
                      (define sub-id-map (make-hash))
                      (for/list ([i (range (vector-length dummy-args))])
                                (define dummy-buf (vector-ref dummy-args i))
                                (hash-set! sub-id-map dummy-buf (bv i (bitvector 8)) )

                                )
                      (if (eq? actual-expr-depth 1)
                        (begin
                          (debug-log "Error unable to synthesize expression even with depth 1")
                          (exit)
                          )
                        '()
                        )
                      (define recalculate (synthesize-halide-expr-step expr-extract (max 1 (- actual-expr-depth 1))  VF sub-id-map solver))
                      (debug-log "Smaller window synthesis returned:")
                      (debug-log recalculate)
                      (set! satisfiable? #t)
                      (set! materialize recalculate)

                      (hash-set! synth-log hashed-expr (vector satisfiable? materialize 0))
                      )
                    )

                  (println materialize)

                  (displayln "Cost")
                  (println (hydride:cost materialize))

                  ;; Now that we've synthesized the sub-expression
                  ;; we can clear the symbolic heap
                  (clear-terms!)
                  (collect-garbage)


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
