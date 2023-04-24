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
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/synth_main)
(require hydride/synthesis/python)

(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)
(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/scale)
(require hydride/ir/hydride/get_ops)
(require hydride/ir/hydride/visitor)
(require hydride/ir/hydride/length)
(require hydride/ir/hydride/prec)
(require hydride/ir/hydride/interpreter)


(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/cost_model)
(require hydride/ir/hvx/const_fold)
(require hydride/ir/hvx/printer)
(require hydride/ir/hvx/binder)
(require hydride/ir/hvx/scale)
(require hydride/ir/hvx/get_ops)
(require hydride/ir/hvx/length)
(require hydride/ir/hvx/prec)
(require hydride/ir/hvx/visitor)
(require hydride/ir/hvx/interpreter)

(require hydride/ir/arm/definition)
(require hydride/ir/arm/cost_model)
(require hydride/ir/arm/const_fold)
(require hydride/ir/arm/printer)
(require hydride/ir/arm/binder)
(require hydride/ir/arm/scale)
(require hydride/ir/arm/get_ops)
(require hydride/ir/arm/length)
(require hydride/ir/arm/prec)
(require hydride/ir/arm/visitor)
(require hydride/ir/arm/interpreter)



(provide (all-defined-out))





;; Wrapper to invoke rewrite-ir method

(define (inst-combine spec-expr optimize? symbolic? solver input-sizes input-precs target-language)

  (define language-type
    (cond
      [(equal? target-language "hvx")
       'hvx
       ]
      [(equal? target-language "arm")
       'arm
       ]
      [(equal? target-language "x86")
       'x86
       ]
      )
    )

  (rewrite-ir spec-expr 1 4 optimize? symbolic? solver input-sizes input-precs 1 language-type language-type )
  
  )




(define (rewrite-ir spec-expr  starting-depth depth-limit  optimize? symbolic? solver input-sizes input-precs scale-factor src-language target-language)
  (debug-log (format "Invoked step-wise-synthesis!\n"))

  (define step-limit 5)

  (define solved? #f)

  (define-values 
    (src-interpreter src-cost-fn src-visitor src-length-fn src-prec-fn src-get-ops)
    (cond
      [(equal? src-language 'x86)
       (values hydride:interpret hydride:cost hydride:visitor hydride:get-length hydride:get-prec hydride:get-bv-ops)
       ]

      [(equal? src-language 'hvx)
       (values hvx:interpret hvx:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]

      [(equal? src-language 'arm)
       (values arm:interpret arm:cost arm:visitor arm:get-length arm:get-prec arm:get-bv-ops)
       ]
      [else
        (error "Unsupported src language in rewrite-ir" src-language)
        ]
      )
    )


  (define-values 
    (target-interpreter target-cost-fn target-visitor target-length-fn target-prec-fn target-get-ops)
    (cond
      [(equal? target-language 'x86)
       (set-target-x86)
       (values hydride:interpret hydride:cost hydride:visitor hydride:get-length hydride:get-prec hydride:get-bv-ops)
       ]

      [(equal? target-language 'hvx)
       (set-target-hvx)
       (values hvx:interpret hvx:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]

      [(equal? target-language 'arm)
       (set-target-arm)
       (values arm:interpret arm:cost arm:visitor arm:get-length arm:get-prec arm:get-bv-ops)
       ]
      [else
        (error "Unsupported target language in rewrite-ir" target-language)
        ]
      )
    )


  (define spec-expr-output-size (src-length-fn spec-expr (vector)))
  (define spec-expr-output-prec (src-prec-fn spec-expr (vector)))
  (define expr-VF (/ spec-expr-output-size spec-expr-output-prec))


  (define leaves-sizes input-sizes)
  (define cost-bound 30)


  (define (invoke-spec-lane lane-idx env-lane)
    (debug-log (format "Invoked spec lane with src language ~a, env ~a and lane-idx ~a\n" src-language env-lane lane-idx))
    (define spec-result (src-interpreter spec-expr env-lane))
    (define low (* spec-expr-output-prec lane-idx))
    (define high (+ low (- spec-expr-output-prec 1)))

    (define spec-result-slice (extract high low spec-result))
    (debug-log (format "Spec produced: ~a\n" spec-result-slice))
    spec-result-slice
    )


  (define (invoke-spec env-lane)
    (debug-log (format "Invoked spec full with src language ~a, env ~a \n" src-language env-lane))
    (define spec-result (src-interpreter spec-expr env-lane))
    (debug-log (format "Spec produced: ~a\n" spec-result))
    spec-result
    )



  (define sol '())




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
                    4 ; 4
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
                                                          (get-expr-grammar-step-hydride spec-expr base_name src-get-ops src-visitor src-length-fn src-prec-fn input-precs input-sizes expr-VF t d scale-factor))

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
