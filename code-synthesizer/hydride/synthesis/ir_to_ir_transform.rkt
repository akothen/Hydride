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
(require hydride/ir/hydride/sub_expr)
(require hydride/ir/hydride/extract)
(require hydride/ir/hydride/binder)


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
(require hydride/ir/hvx/extract)
(require hydride/ir/hvx/sub_expr)

(require hydride/halide)
;(require hydride/synthesis/llvm_codegen)


(provide (all-defined-out))



(define inst-combine-cache (make-hash))


;; Wrapper to invoke rewrite-ir method

(define (inst-combine spec-expr optimize? symbolic? solver input-sizes input-precs 
                                target-language cost-model-type input-hash-name output-hash-name 
                                in-cache-hash-name out-cache-hash-name depth)

  (define language-type
    (cond
      [(equal? target-language "hvx")
       'hvx
       ]
      [(equal? target-language "x86")
       'x86
       ]
      )
    )

  (define sanatized-expr (sanatize-reg-types spec-expr language-type))
  (displayln "Expression sanatized")
  (println sanatized-expr)

  (define input-hash 
    (cond
      [(not (equal? input-hash-name ""))
       (define hash-path (string-append input-hash-name ".rkt"))
       (define loaded-hash (import-synth-map hash-path input-hash-name))
       (hash-copy loaded-hash)
      ]
      [else
        (make-hash)
      ]
    )
  )

  (define cache-hash
    (cond
      [(not (equal? in-cache-hash-name ""))
       (define hash-path (string-append in-cache-hash-name ".rkt"))
       (define loaded-hash (import-synth-map hash-path in-cache-hash-name))
       (hash-copy loaded-hash)
       ]
      [else
        (make-hash)
      ]
    )
  )


  (define cache-hit? (hash-has-key? cache-hash sanatized-expr))

  (cond
    [(not cache-hit?)
     (hash-set! cache-hash sanatized-expr sanatized-expr)
    ]
  )

  (cond
    [(not (equal? out-cache-hash-name ""))
      (define output-hash-path (string-append "/tmp/" out-cache-hash-name ".rkt"))
      (save-synth-map output-hash-path out-cache-hash-name cache-hash)
    ]
  )

  (define hash-hit #f)

  (define-values (solved? simplified-expr elapsed-time) 
    (cond
      [(hash-has-key? input-hash sanatized-expr)
        (debug-log "Hash hit!")
        (set! hash-hit #t)
        (values #t (hash-ref input-hash sanatized-expr) 0)
      ]
      [else
        (cond
          [cache-hit?
            (debug-log "Cache Hash hit!")
            (error "Failed to synthesize expression on time (timeout)")
            (values #t sanatized-expr 0)
          ]
          [else
            (rewrite-ir sanatized-expr depth (+ depth 1) optimize? symbolic? solver input-sizes input-precs 1 language-type language-type cost-model-type)
          ]
        )
      ]
    )
  )

  (cond
    [(and solved? (not hash-hit))
     (hash-set! input-hash sanatized-expr simplified-expr)
    ]
  )

  (debug-log (format "Inst combine transformation required ~a seconds" elapsed-time))


  (cond
    [(not (equal? output-hash-name ""))
      (define output-hash-path (string-append "/tmp/" output-hash-name ".rkt"))
      (save-synth-map output-hash-path output-hash-name input-hash)
    ]
  )

  (cond
    [solved?
      (debug-log "Possibly simplified expression!")
      (pretty-print simplified-expr)
      simplified-expr

      ]
    [else
      (debug-log "Unable to simplify further: returning original expression")
      sanatized-expr
      ]
    )
  )

;; The synthesizer represents the index of the register
;; as a bitvector instead of an integer. For synthesis,
;; if the input expression contains integer indices for
;; the registers, we simply translate them to bitvectors.
;; e.g. (reg 0) :-> (reg (bv 0 8))
(define (sanatize-reg-types spec-expr target)
  (define visitor-fn
    (cond
      [(equal? target 'x86)
       hydride:visitor
      ]
      [(equal? target 'hvx)
       hvx:visitor
      ]
    )
  )

  (define (sanatize-fn e)
    (destruct e
      [(reg i)
        (cond 
          [(integer? i)
          (reg (bv i 8))
          ]
          [else
            e
            ]
          )
      ]
      [_
        e
      ]
    )
  )

  (visitor-fn spec-expr sanatize-fn)
  )


(define (rewrite-ir spec-expr  starting-depth depth-limit  optimize? symbolic? solver input-sizes input-precs scale-factor src-language target-language cost-model-type)
  (debug-log (format "Invoked step-wise-synthesis!\n"))

  (define step-limit 5)

  (define solved? #f)

  (define-values 
    (src-interpreter src-cost-fn src-visitor src-length-fn src-prec-fn src-get-ops)
    (cond
      [(equal? src-language 'x86)
       (values hydride:interpret hydride:cost hydride:visitor hydride:get-length hydride:get-prec hydride:get-bv-ops)
       ]

      [(and (equal? src-language 'hvx) (equal? cost-model-type 'instcombine))
       (values hvx:interpret hvx-instcombine:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? src-language 'hvx)
       (values hvx:interpret hvx:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? src-language 'halide)
       (define (halide-cost-fn e) 1)
       (define (halide-length-fn e env) (halide:vec-size e))
       (define (halide-prec-fn e env) (halide:vec-precision e))
       (values halide:interpret-hydride halide-cost-fn halide:visit halide-length-fn halide-prec-fn halide:get-bv-ops)
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
      [(and (equal? target-language 'hvx) (equal? cost-model-type 'instcombine))
       (values hvx:interpret hvx-instcombine:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? target-language 'hvx)
       (set-target-hvx)
       (values hvx:interpret hvx:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? target-language 'halide)
       (set-target-halide)
       (define (halide-cost-fn e) 1)
       (define (halide-length-fn e env) (halide:vec-size e))
       (define (halide-prec-fn e env) (halide:vec-precision e))
       (values halide:interpret-hydride halide-cost-fn halide:visit halide-length-fn halide-prec-fn halide:get-bv-ops)
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
             4
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
                    ;; Reset context for next synthesis
                    (set-optimize-bound-found #f)
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
                                           (cond
                                             [equal? target 'halide
                                                     (define-values (inter-grammar inter-interpreter inter-cost-model)
                                                                    (get-expr-grammar-step-hydride spec-expr base_name src-get-ops src-visitor src-length-fn src-prec-fn input-precs input-sizes (list) expr-VF t d scale-factor))
                                                     (values inter-grammar target-interpreter target-cost-fn )
                                                     ]
                                             [else
                                               (get-expr-grammar-step-hydride spec-expr base_name src-get-ops src-visitor src-length-fn src-prec-fn input-precs input-sizes (list) expr-VF t d scale-factor)
                                               ]
                                             )
                                          )

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
                      ) 
                    ) ; (thread thunk
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

  ;; Reset context for next synthesis
  (set-optimize-bound-found #f)

  (debug-log "Stepwise synthesis completed!")


  (if (not solved?)
    (begin
      (debug-log "Synthesis failed!")
      (values #f sol (- end-time start-time))
      )
    (values solved? sol (- end-time start-time))
    )
  )


(define (rewrite-ir-signed spec-expr  starting-depth depth-limit  optimize? symbolic? solver input-sizes input-precs input-signedness scale-factor src-language target-language cost-model-type)
  (debug-log (format "Invoked step-wise-synthesis!\n"))

  (define step-limit 5)

  (define solved? #f)

  (define-values 
    (src-interpreter src-cost-fn src-visitor src-length-fn src-prec-fn src-get-ops)
    (cond
      [(equal? src-language 'x86)
       (values hydride:interpret hydride:cost hydride:visitor hydride:get-length hydride:get-prec hydride:get-bv-ops)
       ]

      [(and (equal? src-language 'hvx) (equal? cost-model-type 'instcombine))
       (values hvx:interpret hvx-instcombine:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? src-language 'hvx)
       (values hvx:interpret hvx:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? src-language 'halide)
       (define (halide-cost-fn e) 1)
       (define (halide-length-fn e env) (halide:vec-size e))
       (define (halide-prec-fn e env) (halide:vec-precision e))
       (values halide:interpret-with-env halide-cost-fn halide:visit halide-length-fn halide-prec-fn halide:get-bv-ops)
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
      [(and (equal? target-language 'hvx) (equal? cost-model-type 'instcombine))
       (values hvx:interpret hvx-instcombine:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? target-language 'hvx)
       (set-target-hvx)
       (values hvx:interpret hvx:cost hvx:visitor hvx:get-length hvx:get-prec hvx:get-bv-ops)
       ]
      [(equal? target-language 'halide)
       (set-target-halide)
       (define (halide-cost-fn e) 1)
       (define (halide-length-fn e env) (halide:vec-size e))
       (define (halide-prec-fn e env) (halide:vec-precision e))
       (define (halide-interpreter-fn e env)
         (define result (halide:assemble-bitvector (halide:interpret-env e env) (halide:vec-len e)))
         result
         )
       (values halide-interpreter-fn halide-cost-fn halide:visit halide-length-fn halide-prec-fn halide:get-bv-ops)
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
                    ;; Reset context for next synthesis
                    (set-optimize-bound-found #f)
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
                                           (cond
                                             [equal? target 'halide
                                                     (define-values (inter-grammar inter-interpreter inter-cost-model)
                                                                    (get-expr-grammar-step-hydride spec-expr base_name src-get-ops src-visitor src-length-fn src-prec-fn input-precs input-sizes input-signedness expr-VF t d scale-factor))
                                                     (values inter-grammar target-interpreter inter-cost-model )
                                                     ]
                                             [else
                                               (get-expr-grammar-step-hydride spec-expr base_name src-get-ops src-visitor src-length-fn src-prec-fn input-precs input-sizes input-signedness expr-VF t d scale-factor)
                                               ]
                                             )
                                          )

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
                      ) 
                    ) ; (thread thunk
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

  ;; Reset context for next synthesis
  (set-optimize-bound-found #f)

  (debug-log "Stepwise synthesis completed!")


  (if (not solved?)
    (begin
      (debug-log "Synthesis failed!")
      (values #f sol (- end-time start-time))
      )
    (values solved? sol (- end-time start-time))
    )
  )

;; High level wrapper to invoke inst-combine on input hydride expression
(define (inst-combine-hydride-expr hydride-expr window-depth target type-info)
  (debug-log "inst-combine-hydride-expr")


  ;; type-info needed to identify the precisions and the vector lengths of (reg _)
  ;; type-info is a vector of 2-vectors, of the first element of the two vectors
  ;; is the precision and the second in the total size

  (define-values 
    (extract-expr sub-expr get-length get-prec bind-expr-fn cost-fn)
    (cond
      [(equal? target "hvx")
       (values hvx:extract-expr  hvx:get-sub-exprs hvx:get-length hvx:get-prec hvx:bind-expr hvx:cost)
       ]
      [(equal? target "x86")
       (values hydride:extract-expr  hydride:get-sub-exprs hydride:get-length hydride:get-prec bind-expr hydride:cost)
       ]
      [else
        (error "Unsupported target for inst-combine-hydride-expr " target)
        ]
      )
    )

  (debug-log "here")

  ;; Extract list of expression at a given depth away

  (define (multi-level-sub-expr input-expr depth)
    (cond
      [(equal? depth 1)
       (define sub (sub-expr input-expr))
       sub
       ]
      [else
        (define sub-exprs (sub-expr input-expr))
        (define nested-sub-exprs (for/list ([se sub-exprs])  (multi-level-sub-expr se (- depth 1)) ))
        (apply append nested-sub-exprs)
        ]
      )
    )

  (define leaves (multi-level-sub-expr hydride-expr window-depth))

  (displayln "Current Hydride-expr")
  (println hydride-expr)
  (displayln "Leaves")
  (displayln leaves)

  (define precs 
    (for/list ([leaf leaves])
      (destruct leaf
        [(reg id)  ;; Get precision from type-info 
          (define type-details (vector-ref type-info (bitvector->integer id)))
          (vector-ref type-details 0)
          ] 
        [_ (get-prec leaf (vector))]
      )
    )
  )

  (define sizes 
    (for/list ([leaf leaves])
      (destruct leaf
        [(reg id)  ;; Get size from type-info 
          (define type-details (vector-ref type-info (bitvector->integer id)))
          (vector-ref type-details 1)
        ] 
        [_ (get-length leaf (vector))]
      )
    )
  )


  (displayln "Precs")
  (println precs)

  (displayln "sizes")
  (println sizes)

  (displayln "Extracted Expression")
  (define-values  (current-expr num-consumed) (extract-expr hydride-expr 0 window-depth))
  (displayln current-expr)

  (cond 
    [(hash-has-key? inst-combine-cache current-expr)
     (displayln (format "cache hit for ~a" current-expr))
     (define simplified-current-expr (hash-ref inst-combine-cache current-expr))
     (define simplified-leaves (for/list ([leaf leaves]) (inst-combine-hydride-expr leaf window-depth target type-info)))
     (define disjoint-simplified (bind-expr-fn simplified-current-expr (list->vector simplified-leaves)))
      disjoint-simplified
    ]
    [else
      (destruct hydride-expr
        [(reg id) 
          hydride-expr
          ]
        [_
          (define start-time (current-seconds))
          (define simplified-current-expr (inst-combine current-expr #t #f 'z3 sizes precs target 'regular "" "" "" "" 2))
          (define end-time (current-seconds))
          (define elapsed-time (- end-time start-time))
          (displayln (format "Inst Combine Query Elapsed ~a seconds" elapsed-time))
          (hash-set! inst-combine-cache current-expr simplified-current-expr)
          (define simplified-leaves (for/list ([leaf leaves]) (inst-combine-hydride-expr leaf window-depth target type-info)))
          (define disjoint-simplified (bind-expr simplified-current-expr (list->vector simplified-leaves)))
          (cond
            [(< (cost-fn simplified-current-expr) (cost-fn current-expr))
              ;; If current query was simplified, it may be possible to simply the leaves 
              ;; with the new expression. Test by running again.
              (displayln "Current query simplified, re-run inst combine on new expression")
              (inst-combine-hydride-expr hydride-expr window-depth target type-info)
              ]
            [else
              disjoint-simplified
              ]
            )
          ]
        )
      ]
    )
  )

