#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/sandbox)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/utils/misc)
(require hydride/ir/hydride/interpreter)

(require hydride/ir/hvx/interpreter)
(require hydride/ir/hvx/const_fold)

(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/length)
(require hydride/synthesis/symbolic_synthesis)

(require (only-in racket build-vector))
(require (only-in racket build-list))

(provide (all-defined-out))


;; Controls whether synthesis should be performed
;; by placing asserts on specific lanes of the 
;; output vector or the input-vector
(define synthesize-by-lane #t)


(define (set-synthesize-full)
  (set! synthesize-by-lane #f)
  )


(define (set-synthesize-by-lane)
  (set! synthesize-by-lane #t)
  )

(define target 'hvx)






;; Evaluate the symbol defined at index i
;; of symbols for the counter example in cex
(define (eval-bv-cex symbols cex i)
  (define sym (vector-ref symbols i))
  (evaluate sym cex)
  )



;; Verify that the spec is equivalent to the synthesized results over all lanes by verifying 
;; each lane independently over symbolic bitvectors.
(define (verify-across-lanes bw-list invoke_ref_lane invoke_sol_lane solver lane-size output_size)
  (clear-vc!)

  (define num-lanes (/ output_size lane-size))

  (define num-bw (length bw-list))
  (define symbols (create-symbolic-bvs bw-list))
  (debug-log (format "Symbols: ~a\n" symbols))

  (define uneq? #f)

  (define (test-lane lane-idx)
    (if uneq? 
      #f
      (begin 

        (define cex 
          (verify 
            (begin
              (assert (bveq   (invoke_ref_lane lane-idx symbols) (invoke_sol_lane lane-idx symbols)))
              )
            )
          )
        (define verified? (not (sat? cex))) ;; True i verified equal on lane-idx

        (if (not verified?)
          (set! uneq? #t)
          '()
          )

        verified?

        )

      )
    )


  (define apply-test-lane (build-list num-lanes test-lane))

  ;; Returns true if all lanes verified equal
  ;; else returns false
  (define result (fold-and apply-test-lane))
  (debug-log (format "verify-across-lanes returned ~a ... \n" result))
  result

  )

;; Solution 'sol' was synthesized using
;; concrete values and hence may not be 
;; correct for all possible values, hence
;; we verify with symbolic values. If 
;; the solution is not true for all
;; values we return the counter example
;; which it failed on
(define (verify-synth-sol  sol bw-list invoke_ref solver)

  (clear-vc!)

  (define interpreter
    (cond
      [(equal? target 'x86)
       hydride:interpret
       ]
      [(equal? target 'hvx)
       hvx:interpret
       ]
      )
    )
  ;(current-solver (z3)) ;; timeout verification after 5 mins
  (define start (current-seconds))
  (debug-log "Attempting to verify synthesized solution")
  (define num-bw (length bw-list))
  (define symbols (create-symbolic-bvs bw-list))
  (debug-log (format "Symbols: ~a\n" symbols))
  (define cex 
    (verify 
      (begin
          (assert (bveq   (invoke_ref symbols) (interpreter sol symbols)))

           )
      )
    )
  (define end (current-seconds))
  (debug-log (format "Verification took ~a seconds\n" (- end start)))
  (debug-log cex)

  ;; Restore solver state
  ;(if (equal? solver 'boolector)
  ;  (current-solver (boolector))
  ;  (current-solver (z3))
  ;  )
  (begin
    (cond
      [(sat? cex) ;; If there exists some cex for which it is not equal
      (begin
        (define complete-sol (complete-solution cex (vector->list symbols)))
        (define (helper i)
          (eval-bv-cex symbols complete-sol i)
          )
        (debug-log "Verification failed :(")

        (define new-bvs (build-vector num-bw helper))
        (debug-log new-bvs)
        (define spec_res (invoke_ref new-bvs))
        (debug-log spec_res)

      (define interpreter
        (cond
          [(equal? target 'x86)
           hydride:interpret
           ]
          [(equal? target 'hvx)
           hvx:interpret
           ]
          )
        )


        (define synth_res  (interpreter sol new-bvs))
        (debug-log (format "Verification failed ...\n\tspec produced: ~a ~a \n\tsynthesized result produced: ~a ~a\n" spec_res (bvlength spec_res) synth_res (bvlength synth_res)))
        (values #f new-bvs)

        )]

      [(unknown? cex)
       (debug-log "Unknown result, unsoundly assuming solution is equivalent\n")
       (values #t '())
        ]
      [else
        (values #t '()) ;; No cex exists => Verified solution
        ]



      )
    )

  )


(define (general-verify-synth-sol invoke_f1 invoke_f2  bw-list assert-query-fn generate-params solver)
  (define start (current-seconds))
  (debug-log "Attempting to verify synthesized solution")
  (define num-bw (length bw-list))
  (define symbols (create-symbolic-bvs bw-list))
  (define cex 
    (verify 
        (assert-query-fn symbols)
        )
    )
  (define end (current-seconds))
  (debug-log (format "Verification took ~a seconds\n" (- end start)))
  (debug-log cex)
  (begin
    (if
      (sat? cex) ;; If there exists some cex for which it is not equal

      (begin
        (define (helper i)
          (eval-bv-cex symbols cex i)
          )
        (debug-log "Verification failed :(")

        (define new-bvs (build-vector num-bw helper))
        (debug-log new-bvs)
        (define spec_res (invoke_f2 (generate-params new-bvs)))
        (debug-log spec_res)

        (define synth_res (invoke_f1 (generate-params new-bvs)))
        (debug-log (format "Verification failed ...\n\tspec produced: ~a\n\tsynthesized result produced: ~a\n" spec_res synth_res))
        (values #f new-bvs)

        )

      (values #t '()) ;; No cex exists => Verified solution

      )
    )

  )


(define (fold-and ls)
  (define list-len (length ls))

  (cond
    [(equal? list-len 0)
     #t
     ]
    [(equal? list-len 1)
     (list-ref ls 0)
     ]
    [else
      (and (car ls) (fold-and (cdr ls)))
      ]
    )
  
  )


(define (get-concrete-asserts assert-query-fn cex-ls failing-ls)


  (define (helper i)
    (assert-query-fn (list-ref cex-ls i) (list-ref failing-ls i))
    )
  (define num-cex (length cex-ls))

  ;; Build list of conditions
  (define assertions (build-list num-cex helper))
  assertions
  )


(define (get-concrete-asserts-grammar assert-query-fn grammar cex-ls)
  (define (helper i)
    (assert-query-fn grammar (list-ref cex-ls i))
    )
  (define num-cex (length cex-ls))

  ;; Build list of conditions
  (define assertions (build-list num-cex helper))
  assertions
  )


(define (get-concrete-noteq-asserts grammar failed-sols)
  (define (helper i)
    (assert (not (equal? (list-ref failed-sols i) grammar)))
    )
  (define num-fail (length failed-sols))
  (define assertions (build-list num-fail helper))
  assertions
  )


(define (regular-concrete-synthesis assert-query-fn grammar cex-ls failing-ls cost-fn cost-bound failed-sols)
  (begin 
    (synthesize 
      #:forall (list cex-ls)
      #:guarantee 
      (begin 
        ;; loop over inputs and add asserts
        (get-concrete-asserts assert-query-fn cex-ls failing-ls) 
        ;(assert (< (cost-fn grammar) cost-bound))
        )
      ) 
    )
  )

(define (z3-optimize assert-query-fn grammar cex-ls failing-ls cost-fn cost-bound failed-sols)
  (begin 
    (debug-log "*********** z3-optimize *****************")

    (define sol?
            (optimize 
              #:minimize (list (cost-fn grammar))
              #:guarantee 
                ;; loop over inputs and add asserts
                (begin 
                        (get-concrete-asserts assert-query-fn cex-ls failing-ls)
                        ;(assert (< (cost-fn grammar) cost-bound))
                  )

                )
              )
    (if (sat? sol?)
      (begin
        (define mat (evaluate grammar sol?))
        (displayln "Z3 Synthesized Solution")
        (println mat)
      )
      '()
      )
    sol?
    )
)


(define (boolector-optimize assert-query-fn grammar cex-ls failing-ls cost-fn cost-bound failed-sols)
  (begin
    (debug-log (format "Boolector optimize with cost-bound ~a ...\n" cost-bound))
    (debug-log "Synthesizing...\n")
    ;(current-solver (boolector))
    ;(current-bitwidth 16)
    ;(custodian-limit-memory (current-custodian) (* 20000 1024 1024))

    (define sol?
      (synthesize 
        #:forall (list cex-ls)
        #:guarantee 
        (begin 
          ;; loop over inputs and add asserts
          (get-concrete-asserts assert-query-fn cex-ls failing-ls)
          (assert (< (cost-fn grammar) cost-bound))
          )
        ) 
      )


    (define satisfiable? (sat? sol?))




    (define materialize 
      (if satisfiable? 
        (evaluate grammar sol?)
        '()
        )
      )

    (if satisfiable?
      (debug-log materialize)
      '()
      )

    sol?


    )
  )


(define (iterative-synth-query assert-query-fn grammar cex-ls failing-ls optimize? cost-fn cost-bound solver failed-sols) 
  (if optimize?
    (if 
      (equal? solver 'z3)
      (z3-optimize assert-query-fn grammar cex-ls failing-ls cost-fn cost-bound failed-sols)
      (boolector-optimize assert-query-fn grammar cex-ls failing-ls cost-fn cost-bound failed-sols)
      )

    (regular-concrete-synthesis assert-query-fn grammar cex-ls failing-ls cost-fn cost-bound failed-sols)
    )
  )



(define (print-temp-result-on-cex mat invoke_ref cex-ls)


  (define interpreter
    (cond
      [(equal? target 'x86)
       hydride:interpret
       ]
      [(equal? target 'hvx)
       hvx:interpret
       ]
      )
    )

  (for/list
    ([cex cex-ls])
    (define hydride-result (interpreter mat cex))
    (define halide-result (invoke_ref cex))
    (displayln "Counter Example:")
    (println cex)
    (displayln "Hydride Result:")
    (println hydride-result)

    (displayln "Halide Result:")
    (println halide-result)
    cex
    )
  )


(define (get-failing-lanes invoke_ref synth-sol cex-ls word-size)

  (define interpreter
    (cond
      [(equal? target 'x86)
       hydride:interpret
       ]
      [(equal? target 'hvx)
       hvx:interpret
       ]
      )
    )

  (define difference-predicate
  (for/list ([cex cex-ls])
            (define spec-result (invoke_ref cex))
            (define synth-result (interpreter synth-sol cex))
            (define size (bvlength spec-result))
            (define num-elems (/ size word-size))

            (for/list ([i (reverse (range num-elems))])
                      (define low (* word-size (- num-elems 1 i)))
                      (define high (+ low (- word-size 1)))
                      (define ext-spec (extract high low spec-result))
                      (define ext-synth (extract high low synth-result))
                      (if
                        (bveq ext-spec ext-synth )
                        0 ; 0 if the element in the lane is the same
                        1
                       )
            )
                    )
   )

  (displayln "Difference  Predicate")
  (println difference-predicate)
  
  (define differing-lanes
      (for/list ([diff-list difference-predicate])
                (if (equal? (member 1 diff-list) #f)
                  0
                  (index-of diff-list 1)
                )
               ) 
      
  )

  (displayln "differing-lanes")
  (println differing-lanes)
  differing-lanes
)


(define (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? interpreter-fn cost-fn cexs failing-lanes cost-bound solver failed-sols)
  (debug-log "synthesize-sol-iterative")


  ;; Clear the verification condition up till this point
  (clear-vc!)

  

  ;(gc-terms!)


  (debug-log "Garbage collected")
  ;; If the cexs is empty 
  ;; create a random set of concrete inputs
  ;; else use the concrete inputs accumulated
  ;; so far
  (define cex-ls
    (if
      (equal? (length cexs) 0)
      (list (create-concrete-bvs bitwidth-list)  (create-concrete-bvs bitwidth-list) )
      cexs
      )
    )


  (define failing-ls
    (if
      (equal? (length failing-lanes) 0)
      (list 0 0)
      failing-lanes
      )
    )

  (define output-size (bvlength (invoke_ref (list-ref cex-ls 0))))
  (define lane-sol (invoke_ref_lane 0 (list-ref cex-ls 0)))
  (define word-size (bvlength lane-sol ))
  (define num-lanes (/ output-size word-size))

  (debug-log "Concrete counter examples:")
  (debug-log cex-ls)


  (debug-log "Failing lanes examples:")
  (debug-log failing-ls)


  ;; Sythesizing keeping only a single lane
  ;; in the assertion. We'll verify over all
  ;; lanes
  (define (assert-query-synth-fn env random-idx)


    (define full-interpret-res (interpreter-fn grammar env))
    (displayln "Lane Index")
    (println random-idx)

    (define low (* word-size random-idx))
    (define high (+ low  (- word-size 1)))

    (define interpret-res (extract high low full-interpret-res))

    (define halide-res 
        (invoke_ref_lane (+ random-idx 0) env)
      )

    (displayln "Spec Produced:")
    (println halide-res)

    (if synthesize-by-lane
      (debug-log "Synthesize by lane...")
      (debug-log "Synthesize by entire vector size...")
      )

    (define condition 
      (if synthesize-by-lane
        (equal? halide-res interpret-res)
        (equal? (invoke_ref env) full-interpret-res)
      )
    )
    (assert condition)
    )


  (define start_time (current-seconds))
  (define sol?
    (iterative-synth-query assert-query-synth-fn grammar cex-ls failing-ls optimize? cost-fn cost-bound solver failed-sols)
    )

  (define end_time (current-seconds))
  (define elapsed_time (- end_time start_time))

  (define satisfiable? (sat? sol?))

  (debug-log satisfiable?)




  (define materialize 
    (if satisfiable? 
      (evaluate grammar sol?)

      '()
      )
    )


  (define boolector-opt-case (and
    optimize?
    (equal? solver 'boolector)
    ))

  (debug-log (format "Is this boolector optimization case ~a ?\n" boolector-opt-case))

  (define is-union (not (concrete? materialize)))

  (cond 
    [(and satisfiable? (not is-union))

    ;; If satisfiable, verify current solution and check
    ;; if it's true over ALL inputs
    (begin

      (debug-log "Unchecked solution:")
      (debug-log materialize)

      (debug-log (format "Is concrete? ~a\n" (concrete? materialize)))

      (debug-log (format "Is solution a union? ~a\n" is-union))

      (define (invoke_sol_lane lane-idx env)
        (define intermediate-result (interpreter-fn materialize env))
        (define low (* word-size lane-idx))
        (define high (+ low  (- word-size 1)))
        (extract high low intermediate-result)
        )

      (define-values 
        (verified? new-cex) 
        (cond
          [synthesize-by-lane
            ;; For operations involving division the solver
            ;; often get's stuck when verifying a correct
            ;; solution. Hence we first do a quick verification
            ;; across lanes individually and only execute full verification
            ;; when there exists some lane which failed.
            (begin
              (define verify-individual-lanes (verify-across-lanes bitwidth-list invoke_ref_lane invoke_sol_lane solver word-size output-size))
              (if verify-individual-lanes
                (values #t '())
                (verify-synth-sol  materialize bitwidth-list invoke_ref solver)
                )
              )
            ]
          [else 
            (verify-synth-sol  materialize bitwidth-list invoke_ref solver)
            ]
          )
        )


      (define const-fold 
        (cond
          [(equal? target 'x86)
           hydride:const-fold
           ]
          [(equal? target 'hvx)
           hvx:const-fold
           ]
          )
        )


      (if
        verified? ;; If solution is found to be correct for all possible inputs

        (if 

          ;; Check if optimizations is enabled and the current solver is boolector
          boolector-opt-case

          ;; If true, then attempt synthesizing a solution with a tighter cost bound
          (begin
            (define simplify (const-fold materialize))
            (debug-log (format "Searching for better solution with cost < ~a \n" (cost-fn simplify)))
            (define-values (tighter-sol-sat? tighter-sol-materialize tighter-sol-elapsed-time )
              (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? interpreter-fn cost-fn 
                                        cex-ls  
                                        failing-ls
                                        (cost-fn simplify) ;; Use tighter cost bound
                                        solver
                                        failed-sols
                                        )
              )

            ;; If a tighter solution exists then return that, else return current found solution
            (if 
              tighter-sol-sat?
              (values tighter-sol-sat? tighter-sol-materialize tighter-sol-elapsed-time)
              (values satisfiable? simplify elapsed_time)
              )
            )

          ;; If not doing optimizaiton and boolector then return current verified solution directly
          (values satisfiable? materialize elapsed_time)
          )


        ;; If not verified then attempt synthesizing with appended counter example
        (begin
          (define new-failing-cex 
            (if (member new-cex cex-ls)
              (begin
                (debug-log "Returned a counter example which was previously seen, generating different cex")
                (create-concrete-bvs bitwidth-list)
              )
              new-cex
              )
            )
          (define new-failing-lane (get-failing-lanes invoke_ref materialize (list new-failing-cex) word-size))

            (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? interpreter-fn cost-fn  
                                      (append cex-ls (list new-failing-cex)) ;; Append new cex into accumulated inputs
                                      (append failing-ls new-failing-lane)
                                      cost-bound
                                      solver
                                      (append failed-sols (list materialize))
                                      )
            )
        )
      )]

    ;; Found a solution, but it contains a symbolic
    ;; union term as one of the sub-trees. Add another
    ;; counter example and re-attempt synthesis.
    [satisfiable? 
      (begin
        (debug-log "Contains symbolic union, retry synthesis")
        (debug-log "Union solution:")
        (debug-log materialize)
        (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? interpreter-fn cost-fn 
                                      (append cex-ls (list (create-concrete-bvs bitwidth-list))) ;; Append new cex into accumulated inputs
                                      (append failing-ls (list (random num-lanes)))
                                      cost-bound
                                      solver
                                      (append failed-sols (list materialize))
                                      )
        
        
        )
      ]
    [else (values satisfiable? materialize elapsed_time) ;; If not satisfiable just return current state
          ]
    )


  )




(define (general-synthesize-sol-iterative invoke_f1 invoke_f2 bitwidth-list generate-params cexs solver)

  
  (if (equal? solver 'boolector)
    (current-solver (boolector))
    (current-solver (z3))
    )


    ;(current-bitwidth 16)
    (custodian-limit-memory (current-custodian) (* 20000 1024 1024))


  ;; Clear the verification condition up till this point
  ;(clear-vc!)

  ;; If the cexs is empty 
  ;; create a random set of concrete inputs
  ;; else use the concrete inputs accumulated
  ;; so far
  (define cex-ls
    (if
      (equal? (length cexs) 0)
      (list (create-concrete-bvs bitwidth-list) )
      cexs
      )
    )

  (debug-log "Concrete counter examples:")
  (debug-log cex-ls)



  (define (assert-query-fn env)
    (define parameters (generate-params env))
    (assert (equal? (invoke_f1 parameters)  (invoke_f2 parameters)))
    )

  (define start_time (current-seconds))
  (define sol?
    (iterative-synth-query assert-query-fn invoke_f1 cex-ls #f '() 0 solver)
    )

  (define end_time (current-seconds))
  (define elapsed_time (- end_time start_time))

  (define satisfiable? (sat? sol?))

  (debug-log satisfiable?)




  (define materialize 
    (if satisfiable? 
      (evaluate invoke_f1 sol?)
      '()
      )
    )

  (define boolector-opt-case #f)


  (if 
    satisfiable?

    ;; If satisfiable, verify current solution and check
    ;; if it's true over ALL inputs
    (begin
      (debug-log "Unchecked solution:")
      (debug-log materialize)
      (print-forms sol?)
      (displayln "Testing materialized!")
      (println (invoke_f2 (generate-params (list-ref cex-ls 0))))
      (println (evaluate (materialize (generate-params (list-ref cex-ls 0))) sol?))


      (define (exec-synth-sol env)
        (evaluate (materialize env) sol?)
        )

      (define (assert-query-mat-fn env)
        (define parameters (generate-params env))

        (assert (equal? (exec-synth-sol parameters)  (invoke_f2 parameters)))
        )

      (define-values 
        (verified? new-cex) 
                (general-verify-synth-sol exec-synth-sol invoke_f2 bitwidth-list assert-query-mat-fn generate-params  solver)
        )




      (if
        verified? ;; If solution is found to be correct for all possible inputs

          ;; If not doing optimizaiton and boolector then return current verified solution directly
          (values satisfiable? materialize elapsed_time)


            ;; If not verified then attempt synthesizing with appended counter example
            (general-synthesize-sol-iterative invoke_f1 invoke_f2  bitwidth-list generate-params 
                                      (append cex-ls (list new-cex)) ;; Append new cex into accumulated inputs
                                      solver
                                      )
        )
      )

    (values satisfiable? materialize elapsed_time) ;; If not satisfiable just return current state
    )


  )




