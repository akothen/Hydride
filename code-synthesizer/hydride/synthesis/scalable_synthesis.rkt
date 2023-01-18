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
(require hydride/utils/target)
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
(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/printer)
(require hydride/ir/hydride/scale)


(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/cost_model)
(require hydride/ir/hvx/const_fold)
(require hydride/ir/hvx/printer)
(require hydride/ir/hvx/binder)
(require hydride/ir/hvx/scale)



(provide (all-defined-out))




;; Defines the utilities to perform synthesis on Halide IR expressions







(define (scale-down-synthesis halide-expr expr-depth VF id-map solver opt? sym? scale-factor synth-log)

  (define actual-expr-depth 
    (cond
      [(ramp? halide-expr) 
       ;; Immediate expression is ramp, we can use the provided depth
       expr-depth
       ]
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



  ;; Dummy args contains the scaled down arguments for the expression to be
  ;; synthesized
  (define (map-functor ele)
    (halide:scale-down-expr ele scale-factor)
    )
  (define scaled-leaves (map map-functor leaves))
  (define scaled-leaves-sizes (halide:get-expr-bv-sizes scaled-leaves))
  (define scaled-leaves-elemT (halide:get-expr-elemT scaled-leaves))
  (define scaled-bvs (create-concrete-bvs scaled-leaves-sizes)) ;; Can this be concrete

  (define dummy-args (halide:create-buffers scaled-leaves scaled-bvs))



  (define synthesized-sol 
    (destruct halide-expr
              [(buffer data elem buffsize)
               (debug-log "Leaf buffer:")
               (debug-log halide-expr)
               (reg (hash-ref! id-map halide-expr -1)) ;; have a map to use accurate reg number
               ]
              [_ 
                (begin

                  (define-values (expr-extract num-used) (halide:bind-expr-args (halide:scale-down-expr halide-expr scale-factor) dummy-args actual-expr-depth))

                  (debug-log expr-extract)

                  ;; The extracted sub-expression is to be treated
                  ;; as synthesis of some un-seen new expression
                  ;; and so we must create a new id-map for the registers to bind to

                  (define recalculate-args (halide:create-buffers leaves sym-bvs))
                  (define sub-id-map (make-hash))
                  (for/list ([i (range (vector-length recalculate-args))])
                            (define dummy-buf (vector-ref recalculate-args i))
                            (hash-set! sub-id-map dummy-buf (bv i (bitvector 8)) )
                            )



                  (define expr-VF (halide:vec-len expr-extract))

                  (debug-log (format "Vectorization factor for sub expression ~a\n" expr-VF))


                  (define (invoke-spec env-full)
                    (printf "invoke-spec with env: ~a\n" env-full)
                    (define synth-buffers-full (halide:create-buffers scaled-leaves env-full))
                    (println scaled-leaves)


                    (halide:assume-buffers-signedness synth-buffers-full)


                    (define-values (_expr-extract-full _num-used) (halide:bind-expr-args (halide:scale-down-expr halide-expr scale-factor) synth-buffers-full actual-expr-depth))
                    (displayln "Scaled expression:")
                    (println _expr-extract-full)


                    (define _result_full (halide:assemble-bitvector (halide:interpret _expr-extract-full) expr-VF))
                    (displayln "Spec result")
                    (println _result_full)
                    _result_full
                    )


                  ;; Calculate result for last most lane
                  (define (invoke-spec-lane lane-idx env-lane)
                    (printf "invoke-spec-lane with env: ~a\n" env-lane)
                    (define synth-buffers-lane (halide:create-buffers scaled-leaves env-lane))

                    (halide:assume-buffers-signedness synth-buffers-lane)
                    


                    (define-values (_expr-extract _num-used) (halide:bind-expr-args (halide:scale-down-expr halide-expr scale-factor) synth-buffers-lane actual-expr-depth))
                    (define output-idx (- expr-VF 1 lane-idx))
                    (define _result_lane (cpp:eval ((halide:interpret _expr-extract) output-idx)))
                    _result_lane
                    )


                  (define depth-limit 
                    (cond
                      [(equal? target 'hvx)
                       5
                       ]
                      [(equal? target 'x86)
                       5
                       ]
                      )

                    )
                  (define optimize? opt?)
                  (define symbolic? sym?)

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




                        (define test-start (current-seconds))



                        (define cost-bound 
                          (cond 
                            [else 30]
                            )
                          )


                        (displayln "Hashed expression")
                        (println hashed-expr)


                        (define-values (sat? mat el)
                                       (step-wise-synthesis expr-extract scaled-leaves 
                                                            (max (+ -1 actual-expr-depth) 1)
                                                            depth-limit invoke-spec invoke-spec-lane optimize? symbolic? solver
                                                            
                                                            )
                                       
                                       )

                        (define test-end (current-seconds))

                        (debug-log "Test elapsed time: ")
                        (debug-log (- test-end test-start))

                        (debug-log hashed-expr)
                        (debug-log (vector sat? mat el))

                        ;; Only memoize succesful entries
                        (cond 
                          [sat? 
                            (hash-set! synth-log hashed-expr (vector sat? mat (- test-end test-start)) )]
                          )


                        (define result
                          (cond
                            [sat? 
                              (vector sat? mat (- test-end test-start))]
                            [else
                              (vector #f '() 0)
                              ]
                            )
                          )



                        (debug-log "Synthesis step completed!")
                        (values (vector-ref result 0 ) (vector-ref result 1) (vector-ref result 2) )
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
                      (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr recalculate-args actual-expr-depth))
                      (define expr-VF (halide:vec-len expr-extract))

                      (if (eq? actual-expr-depth 1)
                        (begin
                          (debug-log "Error unable to synthesize expression even with depth 1")
                          (exit)
                          )
                        '()
                        )
                      (define recalculate (scale-down-synthesis expr-extract (max 1 (- actual-expr-depth 1))  VF sub-id-map solver opt? sym? 
                                                                scale-factor ; scale-factor = 1, since we've already scaled down the expression
                                                                synth-log))
                      (debug-log "Smaller window synthesis returned:")
                      (debug-log recalculate)
                      (set! satisfiable? #t)
                      (set! materialize recalculate)

                      (hash-set! synth-log hashed-expr (vector satisfiable? materialize 0))
                      )
                    )

                  (println materialize)

                  (displayln "Cost")


                  (define cost-functor
                    (cond
                      [(equal? target 'hvx)
                       hvx:cost
                       ]
                      [(equal? target 'x86)
                       hydride:cost
                       ]
                      )
                    )
                  (println (cost-functor materialize))

                  ;; Now that we've synthesized the sub-expression
                  ;; we can clear the symbolic heap
                  (clear-terms!)
                  (collect-garbage)
                  ;(debug-log "Collected Garbage!")


                  (define synthesized-leaves 

                    (for/list  ([leaf leaves])
                               (scale-down-synthesis leaf expr-depth VF id-map solver opt? sym? scale-factor synth-log)
                               )
                    ;)
                    )
                  (debug-log "Synthesized-leaves")
                  (debug-log synthesized-leaves)

                  (define bind-functor
                    (cond
                      [(equal? target 'hvx)
                       hvx:bind-expr
                       ]
                      [(equal? target 'x86)
                       bind-expr
                       ]
                      )
                    )

                  (define upscaled-mat 
                    (cond 
                      [(equal? scale-factor 1)
                       materialize
                       ]
                      [(equal? target 'hvx) 
                        (hvx:scale-expr materialize scale-factor)
                        ]
                      [(equal? target 'x86) 
                        (hydride:scale-expr materialize scale-factor)
                        ]
                      )
                    )

                  (bind-functor upscaled-mat (list->vector synthesized-leaves))
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





;; Perform iterative synthesis by partitioning relavent operations
;; into buckets and sampling operations from buckets in the grammar. 
(define (step-wise-synthesis spec-expr leaves  starting-depth depth-limit invoke-spec invoke-spec-lane optimize? symbolic? solver)
  (debug-log (format "Invoked step-wise-synthesis!\n"))

  (define step-limit 5)

  (define solved? #f)
  (define expr-VF (halide:vec-len spec-expr))
  (define leaves-sizes (halide:get-expr-bv-sizes leaves))
  (define cost-bound 30)

  (define sol '())


  ;(set! starting-depth 4)
  ;(set! depth-limit 4)

  (define start-time (current-seconds))
  (define solutions 

    ;; Traversal order first searchs the breadth of grammars
    ;; at the depth d before incrementing d.
    (for/list ([d (range starting-depth depth-limit)])

              (debug-log (format "=====================\nSTARTING SYNTHESIS FOR DEPTH ~a\n=====================\n" d))
              (define steps-per-depth
                (cond
                  [(<= d 3) step-limit]
                  [(equal? d 4) 
                   ;(* 1 step-limit)
                   64 
                   ]
                  [else
                    64
                    ]
                  )
                
                )

              (define NUM_THREADS 
                (cond 
                  [(<= d 2) 1]
                  [else
                    1
                    ]
                  )
                )

              (for/list ([s (range 0 steps-per-depth NUM_THREADS)])

                        (cond 
                          [solved? 
                            ;; Already solved, no need to launch parallel threads
                            ;; avoid overheads
                            '()
                            ]
                          [else

                        (define step-low s)
                        (define step-high (min (+ step-low NUM_THREADS) steps-per-depth))

                        ;; If even one of the threads finds a valid solution,
                        ;; we can kill all other threads. Use THREADS-REF variable
                        ;; to 'hack' circular definition.
                        (define THREADS-REF '())
                        (define (kill-other-threads exclude-idx)
                            (debug-log (format "Killing all other threads except ~a!, num threads currently executing: ~a\n" exclude-idx (length THREADS-REF)))
                            (for/list ([t-idx (range (length THREADS-REF))])
                                      (define actual-thread-idx (+ step-low t-idx))
                                      (cond
                                        [(equal? actual-thread-idx exclude-idx)
                                         '()
                                         ]
                                        [else
                                          (debug-log (format "Killing thread at relative index ~a\n" t-idx))
                                          (kill-thread (list-ref THREADS-REF t-idx))
                                          ]
                                        )
                                      )
                          )

                        (define thds  
                              (for/list ([t (range step-low step-high )])
                                (parameterize 
                                  ([current-solver (if (equal? solver 'z3) (z3) (boolector))] 
                                   [current-bitwidth 16]
                                   )
                                      (thread (thunk
                                        (clear-vc!)
                                        (clear-terms!)
                                        (collect-garbage)

                                        ;; if solution already found in previous
                                        ;; iteration, do nothing.

                                        (cond
                                          [(not solved?)
                                           (define base_name (string-append "base_" (~s (random 10000)) "_s" (~s t) "_d" (~s d)))
                                           ;; get-grammar step-i, depth d
                                           ;; get-interpreter step-i, depth d
                                           ;; get-cost-model step-i, depth d
                                           (define-values (grammar interpreter cost-model) 
                                                          (get-expr-grammar-step spec-expr leaves base_name expr-VF t d))

                                        (define (grammar-fn i)
                                            (grammar i)
                                          )

                                         (debug-log (format "Specification: ~a\n" spec-expr ))

                                           ;; perform synthesis
                                           (define-values (sat? mat el) 
                                                          (synthesize-sol-with-depth 
                                                            d 
                                                            d invoke-spec invoke-spec-lane grammar-fn leaves-sizes 
                                                            optimize? interpreter cost-model  symbolic? cost-bound solver) 
                                                          )
                                           ;; if sat set solution? to be true
                                           (if sat?
                                             (begin
                                               (set! solved? #t)
                                               (set! sol mat)
                                               ;(kill-other-threads t)
                                               )
                                             '()
                                             )
                                           ]
                                          )
                                        ) ) ; (thread thunk
                                    ) ;; paramterize
                                
                            ) ;; threads list
                        ) ;; thds

                        (set! THREADS-REF thds)

                        (debug-log (format "Waiting on parallel threads range ~a to ~a for synthesis depth ~a \n" step-low step-high d))
                        (for/list ([thd thds])
                                  (thread-wait thd)
                                  )

                            ]
                          )


                    ) 
              )
    )


  (define end-time (current-seconds))

  (debug-log "Stepwise synthesis completed!")

  (if (not solved?)
    (begin
      (debug-log "Synthesis failed!")
      (values #f sol (- end-time start-time))
      )
    (values solved? sol (- end-time start-time))
    )
  )
