#lang rosette (require rosette/lib/synthax) (require rosette/lib/angelic) (require racket/pretty) (require data/bit-vector) (require rosette/lib/destruct) (require rosette/solver/smt/boolector) (require rosette/solver/smt/z3) (require hydride/utils/bvops) (require hydride/utils/debug) (require hydride/ir/hydride/interpreter)


(require hydride/utils/target)
(require hydride/ir/hvx/interpreter)



(require (only-in racket build-vector))

;; Use 16 bits as a default bitwidth for
;; the Boolector solver
(define boolector-bw 16)



(provide (all-defined-out))

;; This file defines the function to perform a single synthesis step



(define (create-symbolic-bv bw) 
  (define-symbolic* sym_bv (bitvector bw))

  sym_bv
  )

;; Create a vector of symbolic bitvectors
;; according to the bitwidths specified 
;; in the list
(define (create-symbolic-bvs bw-list) 
  (define num-bw (length bw-list))
  (define (helper i)
    (create-symbolic-bv (list-ref bw-list i))
    )
  (build-vector num-bw helper)
  )


(define (print-symbols symbol-vector)
  (define vlen (vector-length symbol-vector))
  (debug-log "Printing Symbolic Bitvectors length")
  (for/list ([i (range vlen)])
            (debug-log (format "~a :" i))
            (debug-log (bvlength (vector-ref symbol-vector i)))

            )
  symbol-vector
  )

;; Performs synthesis using a provided grammar and a reference specification. This method creates symbolic bitvectors for the bitvector operands and returns multiple values:
;; satisfiable? : Whether there exists a synthesizable solution for the reference implementation using the current grammar?
;; materialize  : If a solutio exists, refers to the specific solution. else it returns a '()
;; elapsed_time : Returns the synthesis time (in seconds)

(define (synthesize-sol invoke_ref invoke_ref_lane grammar bitwidth-list optimize? interpreter-fn cost-fn cost-bound solver)

  ;; Save current solver environment and restore 
  ;; after synthesis step
  (define curr-bw (current-bitwidth))
  (define curr-solver (current-solver))


  ;; Clear the verification condition up till this point
  (clear-vc!)
  (clear-terms!)
  (collect-garbage)

  ;; Create the symbolic bitvectors to use in synthesis
  (define symbols (create-symbolic-bvs bitwidth-list))
  (debug-log "Symbols for synthesis")
  (print-symbols symbols)

  (define start_time (current-seconds))
  (define sol?

    (if optimize?
      ;; Use Z3 for optimization
      (begin 

        (optimize 
          #:minimize (list (cost-fn grammar))
          #:guarantee 
          (begin 
            ;(define symbols-new (create-symbolic-bvs bitwidth-list))
            (assert 
              (bveq ;equal? 
                (interpreter-fn grammar symbols)  (invoke_ref symbols)
                )
              )
            )
          )

        )

      ;; Use regular synthesis, default boolector
      (begin

        (synthesize 
          #:forall (list (symbolics symbols))
          #:guarantee 
          (begin 
            (assert 
              (bveq ;equal? 
                (interpreter-fn grammar symbols)  (invoke_ref symbols)
                )
              )
            )
          )

        )
      )
    )
  (define end_time (current-seconds))
  (define elapsed_time (- end_time start_time))

  (define satisfiable? (sat? sol?))

  ;; Restore solvers
  (current-solver curr-solver)
  (current-bitwidth curr-bw) 


  (define materialize 
    (if satisfiable? 
      (evaluate grammar sol?)

      '()
      )
    )

  (values satisfiable? materialize elapsed_time)
  )



