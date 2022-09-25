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
(require hydride/ir/hydride/interpreter)
(require hydride/ir/hydride/length)
(require hydride/synthesis/symbolic_synthesis)


(provide (all-defined-out))

;; Create random concrete bitvector
;; to use in iterative synthesis
(define (create-concrete-bv bw) 
  ;(random-bv (/ bw 8))
  ;(define cur_time (current-seconds))
  (if 
    (<= bw 16)
    (begin
      (define max-val (expt 2 bw))
      (define rand-val (random max-val))
      (bv rand-val (bitvector bw))
      )
    (concat
      (create-concrete-bv (/ bw 2))
      (create-concrete-bv (/ bw 2))
      )

    )
  )




;; Create a vector of concrete bitvectors
;; according to the bitwidths specified 
;; in the list
(define (create-concrete-bvs bw-list) 
  (define num-bw (length bw-list))
  (define (helper i)
    (define conc-bv (create-concrete-bv (list-ref bw-list i)))
    conc-bv
    )
  (build-vector num-bw helper)
  )


;; Evaluate the symbol defined at index i
;; of symbols for the counter example in cex
(define (eval-bv-cex symbols cex i)
  (define sym (vector-ref symbols i))
  (evaluate sym cex)
  )


;; Solution 'sol' was synthesized using
;; concrete values and hence may not be 
;; correct for all possible values, hence
;; we verify with symbolic values. If 
;; the solution is not true for all
;; values we return the counter example
;; which it failed on
(define (verify-synth-sol sol bw-list invoke_ref solver)
  (define start (current-seconds))
  (debug-log "Attempting to verify synthesized solution")
  (define num-bw (length bw-list))
  (define symbols (create-symbolic-bvs bw-list))
  (define cex 
    (verify 
      (assert
        (equal?  (interpret sol symbols) (invoke_ref symbols) )
        ))
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
        (define spec_res (invoke_ref new-bvs))
        (debug-log spec_res)


        (define synth_res  (interpret sol new-bvs))
        (debug-log (format "Verification failed ...\n\tspec produced: ~a ~a \n\tsynthesized result produced: ~a ~a\n" spec_res (bvlength spec_res) synth_res (bvlength synth_res)))
        (values #f new-bvs)

        )

      (values #t '()) ;; No cex exists => Verified solution

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
        ;(equal? (interpret sol symbols) (invoke_ref symbols) )
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


(define (get-concrete-asserts assert-query-fn cex-ls)
  (define (helper i)
    (assert-query-fn (list-ref cex-ls i))
    )
  (define num-cex (length cex-ls))
  (define assertions (build-list num-cex helper))
  assertions
  )


(define (get-concrete-noteq-asserts grammar failed-sols)
  (define (helper i)
    (printf "Adding ~a to exclude list ...\n" (list-ref failed-sols i))
    (assert (not (equal? (list-ref failed-sols i) grammar)))
    )
  (define num-fail (length failed-sols))
  (define assertions (build-list num-fail helper))
  assertions
  )


(define (regular-concrete-synthesis assert-query-fn grammar cex-ls cost-fn failed-sols)
  (begin 
    (synthesize 
      #:forall (list cex-ls)
      #:guarantee 
      (begin 
        ;; loop over inputs and add asserts
        (get-concrete-asserts assert-query-fn cex-ls)
        (get-concrete-noteq-asserts grammar failed-sols)
        )
      ) 
    )
  )

(define (z3-optimize assert-query-fn grammar cex-ls cost-fn failed-sols)
  (begin 
    (current-solver (z3))

    (optimize 
      #:minimize (list (cost-fn grammar))
      #:guarantee 
      (begin 
        ;; loop over inputs and add asserts
        (get-concrete-asserts assert-query-fn cex-ls)
        (get-concrete-noteq-asserts grammar failed-sols)

        )
      )

    )
  )


(define (boolector-optimize assert-query-fn grammar cex-ls cost-fn cost-bound failed-sols)
  (begin
    (debug-log (format "Boolector optimize with cost-bound ~a ...\n" cost-bound))
    (debug-log "Synthesizing...\n")
    (current-solver (boolector))

    (define sol?
      (synthesize 
        #:forall (list cex-ls)
        #:guarantee 
        (begin 
          ;; loop over inputs and add asserts
          (get-concrete-asserts assert-query-fn cex-ls)
          (get-concrete-noteq-asserts grammar failed-sols)
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


(define (iterative-synth-query assert-query-fn grammar cex-ls optimize? cost-fn cost-bound solver failed-sols) 
  (if optimize?
    (if 
      (equal? solver 'z3)
      (z3-optimize assert-query-fn grammar cex-ls cost-fn failed-sols)
      (boolector-optimize assert-query-fn grammar cex-ls cost-fn cost-bound failed-sols)
      )

    (regular-concrete-synthesis assert-query-fn grammar cex-ls cost-fn failed-sols)
    )
  )


;; fn1 with holes, and invoke_ref: fn2  -> iterative synthesis with concrete/symbolic vectors
;; (fn1 -> int depth -> fn1 with specific depth)

;; invoke_ref :: (vector symb_bv1 symb_bv2 1 2)
;; generate-params :: (vector symbolic-bvs) -> (vector sym-bv1 symbv2 16 23)


(define (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? cost-fn cexs cost-bound solver failed-sols)
  (debug-log "synthesize-sol-iterative")

  ;; Save current solver environment and restore 
  ;; after synthesis step
  ;; (define curr-bw (current-bitwidth))
  ;; (define curr-solver (current-solver))
  
  (if (equal? solver 'boolector)
    (current-solver (boolector))
    (current-solver (z3))
    )


  ;; Clear the verification condition up till this point
  ;(clear-vc!)
  ;(clear-terms!)
  ;(collect-garbage 'major)

  (debug-log "Garbage collected")
  ;; If the cexs is empty 
  ;; create a random set of concrete inputs
  ;; else use the concrete inputs accumulated
  ;; so far
  (define cex-ls
    (if
      (equal? (length cexs) 0)
      (list (create-concrete-bvs bitwidth-list) (create-concrete-bvs bitwidth-list))
      cexs
      )
    )

  (debug-log "Concrete counter examples:")
  (debug-log cex-ls)


  ;; Sythesizing keeping only a single lane
  ;; in the assertion. We'll verify over all
  ;; lanes
  (define (assert-query-synth-fn env)
    ;; FIXME: Hacky way to get extraction limits
    ;(define extraction-limits (- (bvlength (invoke_ref_lane env)) 1))
    ;(define lane-sol (invoke_ref_lane env))
    ;(define word-size (bvlength lane-sol ))
    ;16
    ;32 - 1 = 32
    ;(define interpret-res (extract (- (* 2 word-size) 1 ) word-size (interpret grammar env)))
    
    (define full-interpret-res (interpret grammar env))

    (begin
        (assert (equal? (invoke_ref env)   full-interpret-res))
        ;(assert (equal? lane-sol   interpret-res))
        )
    )

  (define start_time (current-seconds))
  (define sol?
    (iterative-synth-query assert-query-synth-fn grammar cex-ls optimize? cost-fn cost-bound solver failed-sols)
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

  (if 
    satisfiable?

    ;; If satisfiable, verify current solution and check
    ;; if it's true over ALL inputs
    (begin
      (debug-log "Unchecked solution:")
      (debug-log materialize)
      (define cur-out-port (current-output-port))
      (define cur-err-port (current-error-port))
      (define cur-inp-port (current-input-port))
      (define cur-solver (current-solver))

      (debug-log (format "Current Output port: ~a\n" cur-out-port))
      (debug-log (format "Current Error  port: ~a\n" cur-err-port))
      (debug-log (format "Current Input  port: ~a\n" cur-inp-port))
      (debug-log (format "Current Solver: ~a\n" cur-solver))

      (define-values 
        (verified? new-cex) 
            ;(with-handlers 
            ;  ([exn:fail? (lambda (exn) (begin
            ;                             (values #t '())
            ;                             )
            ;                )])  
            ;  (with-deep-time-limit 10 
                                    (verify-synth-sol materialize bitwidth-list invoke_ref solver)
            ;                        ))
        )


      (current-solver cur-solver)
      (current-output-port cur-out-port)
      (current-input-port cur-inp-port)
      (current-error-port cur-err-port)


      (if
        verified? ;; If solution is found to be correct for all possible inputs

        (if 

          ;; Check if optimizations is enabled and the current solver is boolector
          boolector-opt-case

          ;; If true, then attempt synthesizing a solution with a tighter cost bound
          (begin
            (debug-log (format "Searching for better solution with cost < ~a \n" (cost-fn materialize)))
            (define-values (tighter-sol-sat? tighter-sol-materialize tighter-sol-elapsed-time )
              (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? cost-fn 
                                        cex-ls  
                                        (cost-fn materialize) ;; Use tighter cost bound
                                        solver
                                        failed-sols
                                        )
              )

            ;; If a tighter solution exists then return that, else return current found solution
            (if 
              tighter-sol-sat?
              (values tighter-sol-sat? tighter-sol-materialize tighter-sol-elapsed-time)
              (values satisfiable? materialize elapsed_time)
              )
            )

          ;; If not doing optimizaiton and boolector then return current verified solution directly
          (values satisfiable? materialize elapsed_time)
          )


        ;; If not verified then attempt synthesizing with appended counter example
        (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? cost-fn 
                                  (append cex-ls (list new-cex)) ;; Append new cex into accumulated inputs
                                  cost-bound
                                  solver
                                  (append failed-sols (list materialize))
                                  )
        )
      )

    (values satisfiable? materialize elapsed_time) ;; If not satisfiable just return current state
    )


  )




(define (general-synthesize-sol-iterative invoke_f1 invoke_f2 bitwidth-list generate-params cexs solver)

  
  (if (equal? solver 'boolector)
    (current-solver (boolector))
    (current-solver (z3))
    )


  ;; Clear the verification condition up till this point
  (clear-vc!)

  ;; If the cexs is empty 
  ;; create a random set of concrete inputs
  ;; else use the concrete inputs accumulated
  ;; so far
  (define cex-ls
    (if
      (equal? (length cexs) 0)
      (list (create-concrete-bvs bitwidth-list) (create-concrete-bvs bitwidth-list))
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
      ;(generate-forms sol?)
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




