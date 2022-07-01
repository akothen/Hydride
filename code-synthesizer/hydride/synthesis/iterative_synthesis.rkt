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
(define (verify-synth-sol sol bw-list invoke_ref)
  (displayln "Attempting to verify synthesized solution")
  (define num-bw (length bw-list))
  (define symbols (create-symbolic-bvs bw-list))
  (define cex 
    (verify 
      (assert
        (equal? (interpret sol symbols) (invoke_ref symbols) )
        ))
    )
  (begin
    (if
      (sat? cex) ;; If there exists some cex for which it is not equal

      (begin
        (define (helper i)
          (eval-bv-cex symbols cex i)
          )

        (define new-bvs (build-vector num-bw helper))
        (define spec_res (invoke_ref new-bvs))
        (define synth_res (interpret sol new-bvs))
        (printf "Verification failed ...\n\tspec produced: ~a\n\tsynthesized result produced: ~a\n" spec_res synth_res)
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



(define (regular-concrete-synthesis assert-query-fn grammar cex-ls cost-fn)
  (begin 
    (synthesize 
      #:forall (list cex-ls)
      #:guarantee 
      (begin 
        ;; loop over inputs and add asserts
        (get-concrete-asserts assert-query-fn cex-ls)
        )
      ) 
    )
  )

(define (z3-optimize assert-query-fn grammar cex-ls cost-fn)
  (begin 
    (current-solver (z3))

    (optimize 
      #:minimize (list (cost-fn grammar))
      #:guarantee 
      (begin 
        ;; loop over inputs and add asserts
        (get-concrete-asserts assert-query-fn cex-ls)

        )
      )

    )
  )


(define (boolector-optimize assert-query-fn grammar cex-ls cost-fn cost-bound)
  (begin
    (printf "Boolector optimize with cost-bound ~a ...\n" cost-bound)
    (current-solver (boolector))

    (define sol?
      (synthesize 
        #:forall (list cex-ls)
        #:guarantee 
        (begin 
          ;; loop over inputs and add asserts
          (get-concrete-asserts assert-query-fn cex-ls)
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
      (pretty-print materialize)
      '()
      )

    sol?


    )
  )


(define (iterative-synth-query assert-query-fn grammar cex-ls optimize? cost-fn cost-bound solver) 
  (if optimize?
    (if 
      (equal? solver 'z3)
      (z3-optimize assert-query-fn grammar cex-ls cost-fn)
      (boolector-optimize assert-query-fn grammar cex-ls cost-fn cost-bound)
      )

    (regular-concrete-synthesis assert-query-fn grammar cex-ls cost-fn)
    )
  )




(define (synthesize-sol-iterative invoke_ref grammar bitwidth-list optimize? cost-fn cexs cost-bound solver)

  ;; Save current solver environment and restore 
  ;; after synthesis step
  (define curr-bw (current-bitwidth))
  (define curr-solver (current-solver))


  ;; Clear the verification condition up till this point
  ;;(clear-vc!)

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

  (displayln "Concrete counter examples:")
  (println cex-ls)


  (define (assert-query-fn env)
    (assert (equal? (invoke_ref env)  (interpret grammar env)))
    )

  (define start_time (current-seconds))
  (define sol?
    (iterative-synth-query assert-query-fn grammar cex-ls optimize? cost-fn cost-bound solver)
    )

  (define end_time (current-seconds))
  (define elapsed_time (- end_time start_time))

  (define satisfiable? (sat? sol?))

  (println satisfiable?)


  ;; Restore solvers
  (current-solver curr-solver)
  (current-bitwidth curr-bw) 


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

  (printf "Is this boolector optimization case ~a ?\n" boolector-opt-case)

  (if 
    satisfiable?

    ;; If satisfiable, verify current solution and check
    ;; if it's true over ALL inputs
    (begin
      (displayln "Unchecked solution:")
      (pretty-print materialize)
      (define-values 
        (verified? new-cex) 
        (verify-synth-sol materialize bitwidth-list invoke_ref)
        )

      (if
        verified? ;; If solution is found to be correct for all possible inputs

        (if 

          ;; Check if optimizations is enabled and the current solver is boolector
          boolector-opt-case

          ;; If true, then attempt synthesizing a solution with a tighter cost bound
          (begin
            (printf "Searching for better solution with cost < ~a \n" (cost-fn materialize))
            (define-values (tighter-sol-sat? tighter-sol-materialize tighter-sol-elapsed-time )
              (synthesize-sol-iterative invoke_ref grammar bitwidth-list optimize? cost-fn 
                                        cex-ls  
                                        (cost-fn materialize) ;; Use tighter cost bound
                                        solver
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
        (synthesize-sol-iterative invoke_ref grammar bitwidth-list optimize? cost-fn 
                                  (append cex-ls (list new-cex)) ;; Append new cex into accumulated inputs
                                  cost-bound
                                  solver
                                  )
        )
      )

    (values satisfiable? materialize elapsed_time) ;; If not satisfiable just return current state
    )


  )
