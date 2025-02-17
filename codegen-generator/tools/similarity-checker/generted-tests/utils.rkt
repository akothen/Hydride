#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/sandbox)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require (only-in racket build-vector))
(require (only-in racket build-list))

(provide (all-defined-out))

;; Evaluate the symbol defined at index i of symbols for the counter example in cex
(define (eval-bv-cex symbols cex i)
  (define sym (vector-ref symbols i))
  (evaluate sym cex))

(define (create-symbolic-bv bw)
  (define-symbolic* sym_bv (bitvector bw))
  sym_bv)

(define (create-symbolic-bvs bw-list)
  (define num-bw (length bw-list))
  (define (helper i)
    (create-symbolic-bv (list-ref bw-list i)))
  (build-vector num-bw helper))

;; Create random concrete bitvector to use in iterative synthesis
(define (create-concrete-bv bw)
  (if (<= bw 16)
      (begin
        (define max-val (expt 2 bw))
        (define rand-val (random max-val))
        (integer->bitvector rand-val (bitvector bw)))
      (concat (create-concrete-bv (/ bw 2)) (create-concrete-bv (/ bw 2)))))

;; Create a vector of concrete bitvectors according to the bitwidths specified
;; in the list
(define (create-concrete-bvs bw-list)
  (define num-bw (length bw-list))
  (define (helper i)
    (define conc-bv (create-concrete-bv (list-ref bw-list i)))
    conc-bv)
  (build-vector num-bw helper))


(define (general-verify-synth-sol invoke_f1
                                  invoke_f2
                                  bw-list
                                  assert-query-fn
                                  generate-params-f1
                                  generate-params-f2
                                  solver)
  (define start (current-seconds))
  (print "Attempting to verify synthesized solution")
  (define num-bw (length bw-list))
  (define symbols (create-symbolic-bvs bw-list))
  (define cex (verify (assert-query-fn symbols)))
  (define end (current-seconds))
  (print (format "Verification took ~a seconds\n" (- end start)))
  (print cex)
  (begin
    (if (sat? cex) ;; If there exists some cex for which it is not equal
        (begin
          (define (helper i)
            (eval-bv-cex symbols cex i))
          (print "Verification failed :(")
          (define new-bvs (build-vector num-bw helper))
          (print new-bvs)
          (define spec_res (invoke_f2 (generate-params-f2 new-bvs)))
          (print spec_res)
          (define synth_res (invoke_f1 (generate-params-f1 new-bvs)))
          (print
           (format "Verification failed ...\n\tspec produced: ~a\n\tsynthesized result produced: ~a\n"
                   spec_res
                   synth_res))
          (values #f new-bvs))
        (values #t '()) ;; No cex exists => Verified solution
    )
  )
)

(define (get-concrete-asserts assert-query-fn cex-ls) ;; failing-ls)
  (print "get-concrete-asserts")
  (define (helper i)
    (assert-query-fn (list-ref cex-ls i))) ;;(list-ref failing-ls i)))
  (define num-cex (length cex-ls))
  ;; Build list of conditions
  (define assertions (build-list num-cex helper))
  assertions
)


(define (general-synthesize-sol-iterative invoke_f1
                                          invoke_f2
                                          bitwidth-list
                                          generate-params-f1
                                          generate-params-f2
                                          cexs
                                          solver)
  (if (equal? solver 'boolector) (current-solver (boolector)) (current-solver (z3)))
  ;(current-bitwidth 16)
  (custodian-limit-memory (current-custodian) (* 20000 1024 1024))
  ;; Clear the verification condition up till this point
  ;(clear-vc!)
  ;; If the cexs is empty, create a random set of concrete inputs;
  ;; else, use the concrete inputs accumulated so far
  (define cex-ls (if (equal? (length cexs) 0) (list (create-concrete-bvs bitwidth-list)) cexs))
  (print "Concrete counter examples:")
  (print cex-ls)
  (define (assert-query-fn env);; idx)
    (define parameters-f1 (generate-params-f1 env))
    (define parameters-f2 (generate-params-f2 env))
    (assert (equal? (invoke_f1 parameters-f1) (invoke_f2 parameters-f2))))

  ;; (define failing-ls
  ;;   (for/list ([i (range (length cex-ls))])
  ;;     0))

  (define start_time (current-seconds))
  (define sol?
    (synthesize #:forall (list cex-ls)
                #:guarantee (begin
                              ;; loop over inputs and add asserts
                              (get-concrete-asserts assert-query-fn cex-ls );; failing-ls)
                              ;(assert (< (cost-fn grammar) cost-bound))
                              ))
  )
  (define end_time (current-seconds))
  (define elapsed_time (- end_time start_time))
  (define satisfiable? (sat? sol?))
  (print satisfiable?)
  (define materialize (if satisfiable? (evaluate invoke_f1 sol?) '()))
  (define iterative-opt-case #f)
  (if satisfiable?
      ;; If satisfiable, verify current solution and check if it's true over ALL inputs
      (begin
        (print "Unchecked solution:")
        (print materialize)
        (print-forms sol?)
        (print "Testing materialized!")
        (print (invoke_f2 (generate-params-f2 (list-ref cex-ls 0))))
        (print (evaluate (materialize (generate-params-f1 (list-ref cex-ls 0))) sol?))
        (define (exec-synth-sol env)
          (evaluate (materialize env) sol?))
        (define (assert-query-mat-fn env)
          (define parameters-f1 (generate-params-f1 env))
          (define parameters-f2 (generate-params-f2 env))
          (assert (equal? (exec-synth-sol parameters-f1) (invoke_f2 parameters-f2))))

        (define-values (verified? new-cex)
          (general-verify-synth-sol exec-synth-sol
                                    invoke_f2
                                    bitwidth-list
                                    assert-query-mat-fn
                                    generate-params-f1
                                    generate-params-f2
                                    solver))

        (if verified? ;; If solution is found to be correct for all possible inputs
            ;; If not doing optimizaiton and boolector then return current verified solution directly
            (values satisfiable? materialize elapsed_time)
            ;; If not verified then attempt synthesizing with appended counter example
            (general-synthesize-sol-iterative
             invoke_f1
             invoke_f2
             bitwidth-list
             generate-params-f1
             generate-params-f2
             (append cex-ls (list new-cex)) ;; Append new cex into accumulated inputs
             solver)))

      (values satisfiable? materialize elapsed_time) ;; If not satisfiable just return current state
      ))


