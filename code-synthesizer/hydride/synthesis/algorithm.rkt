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
(require hydride/synthesis/lower_swizzle)

(require hydride/halide)
(require hydride/cpp)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)
(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/printer)


(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/cost_model)
(require hydride/ir/hvx/const_fold)
(require hydride/ir/hvx/printer)
(require hydride/ir/hvx/binder)
(require hydride/ir/hvx/scale)


(require hydride/ir/arm/definition)
(require hydride/ir/arm/cost_model)
(require hydride/ir/arm/const_fold)
(require hydride/ir/arm/printer)
(require hydride/ir/arm/binder)
(require hydride/ir/arm/scale)


(require hydride/synthesis/scalable_synthesis)

(provide (all-defined-out))




;; Defines the utilities to perform synthesis on Halide IR expressions

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


  (define printer-functor
    (cond
      [(equal? target 'hvx)
       hvx:hydride-printer
       ]
      [(equal? target 'arm)
       arm:hydride-printer
       ]
      [(equal? target 'x86)
       hydride:hydride-printer
       ]
      )
    )

  (displayln sol)
  (displayln (printer-functor sol))

  )


(define (synthesize-halide-expr halide-expr id-map expr-depth VF solver opt? sym? prev-hash-file prev-hash-name arch)
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

  (cond
    [(equal? arch "x86" )
     (set-target-x86)
     ]

    [(equal? arch "hvx" )
     (set-target-hvx)
     ]

    [(equal? arch "arm" )
     (set-target-arm)
     ]
    )

  (cond
    [(equal? solver 'boolector)
     (current-solver (boolector))
     ]

    [(equal? solver 'z3)
     (current-solver (z3))
     ]
    )

  (printf "Number of instructions: ~a\n" (halide:count-number-instructions halide-expr))

  ;(define synthesized-sol (synthesize-halide-expr-step halide-expr expr-depth VF id-map solver opt? sym?))
  (define scale-factor
    (cond
      [(equal? arch "x86" )
       4
       ]

      [(equal? arch "hvx" )
       32
       ]

      [(equal? arch "arm" )
       2 ;4
       ]
      )
    )
  (define synthesized-sol (scale-down-synthesis halide-expr expr-depth VF id-map solver opt? sym? scale-factor synth-log))
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

  (define const-fold-functor
    (cond
      [(equal? target 'hvx)
       hvx:const-fold
       ]
      [(equal? target 'arm)
       arm:const-fold
       ]
      [(equal? target 'x86)
       hydride:const-fold
       ]
      )
    )


  (define cost-functor
    (cond
      [(equal? target 'hvx)
       hvx:cost
       ]
      [(equal? target 'arm)
       arm:cost
       ]
      [(equal? target 'x86)
       hydride:cost
       ]
      )
    )

  (define folded (const-fold-functor synthesized-sol))

  ;; Lower target agnostic specialized shuffles to sequences
  ;; of target specific shuffle operations.
  (define swizzle-start (current-seconds))
  (define legalized-shuffles-expr (legalize-expr-swizzles folded solver  synth-log cost-functor #t #f))
  (define swizzle-end (current-seconds))
  (debug-log (format "Lowering swizzles took ~a seconds" (- swizzle-end swizzle-start)))
  (pretty-print id-map)
  (displayln "========================================")
  ;; Apply constant folding again after lowering swizzles
  ;; as additional simplfication oppurtunities may have resulted
  (const-fold-functor legalized-shuffles-expr)
  )


(define (synthesize-halide-expr-step halide-expr expr-depth VF id-map solver opt? sym?)


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


                 ;; The extracted sub-expression is to be treated
                 ;; as synthesis of some un-seen new expression
                 ;; and so we must create a new id-map for the registers to bind to
                 (define sub-id-map (make-hash))
                 (for/list ([i (range (vector-length dummy-args))])
                   (define dummy-buf (vector-ref dummy-args i))
                   (hash-set! sub-id-map dummy-buf (bv i (bitvector 8)) )

                   )



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

                 (define depth-limit
                   (cond
                     [(equal? target 'hvx)
                      5
                      ]
                     [(equal? target 'x86)
                      3
                      ]
                     [(equal? target 'arm)
                      3
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


                         ;; First synthesize the expression with depth 1 to get an estimate
                         ;; of the cost upper bound. We want to provide synthesis at larger
                         ;; depths a bound on cost so it may exit early if the solution
                         ;; can't be optimized further than with depth 1.


                         (define mat1
                           (if (eq? expr-depth 1)
                               '()
                               '();(synthesize-halide-expr-step expr-extract 1 VF sub-id-map solver)
                               )
                           )

                         (define sat?1 (not (equal? mat1 '())))


                         (define-values (grammar interpreter cost-model)
                           (get-expr-grammar expr-extract leaves base_name expr-VF));;VF))
                         (debug-log "Grammar:")
                         (debug-log grammar)

                         (debug-log "Interpreter:")
                         (debug-log interpreter)


                         (debug-log "Cost-Model:")
                         (debug-log cost-model)


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



                         (define cost-bound
                           (cond
                             [sat?1
                              (debug-log "Found tighter cost bound at depth 1, use that")
                              (cost-model mat1)
                              ]
                             [else 30]

                             )
                           )


                         (displayln "Hashed expression")
                         (println hashed-expr)

                         ;(define-values (sat? mat el)
                         ;(synthesize-sol-with-depth
                         ; (max (+ -1 actual-expr-depth) 1)
                         ; depth-limit invoke-spec invoke-spec-lane grammar-fn leaves-sizes
                         ; optimize? interpreter cost-model  symbolic? cost-bound solver)
                         ;)

                         (define-values (sat? mat el)
                           (step-wise-synthesis expr-extract leaves
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
                           [(and (not sat?) sat?1)
                            (hash-set! synth-log hashed-expr (vector sat?1 mat1 (- test-end test-start)) )
                            ]
                           )

                         (displayln "Here")

                         (define result
                           (cond
                             [sat?
                              (vector sat? mat (- test-end test-start))]
                             [(and (not sat?) sat?1)
                              (vector sat?1 mat1 (- test-end test-start))
                              ]
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
                       (define-values (expr-extract num-used) (halide:bind-expr-args halide-expr dummy-args actual-expr-depth))
                       (define expr-VF (halide:vec-len expr-extract))

                       (if (eq? actual-expr-depth 1)
                           (begin
                             (debug-log "Error unable to synthesize expression even with depth 1")
                             (exit)
                             )
                           '()
                           )
                       (define recalculate (synthesize-halide-expr-step expr-extract (max 1 (- actual-expr-depth 1))  VF sub-id-map solver opt? sym?))
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
                     [(equal? target 'arm)
                      arm:cost
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


                 (define synthesized-leaves

                   (for/list  ([leaf leaves])
                     (synthesize-halide-expr-step leaf expr-depth VF id-map solver opt? sym?)
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
                     [(equal? target 'arm)
                      arm:bind-expr
                      ]
                     [(equal? target 'x86)
                      bind-expr
                      ]
                     )
                   )

                 (bind-functor materialize (list->vector synthesized-leaves))
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

