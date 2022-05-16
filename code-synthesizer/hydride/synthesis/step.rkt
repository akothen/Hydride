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

;; Use 8 bits as a default bitwidth for
;; the Boolector solver
(define boolector-bw 8)



(provide (all-defined-out))

;; This file defines the function to perform a single synthesis step



(define (create-symbolic-bv bw) 
  (define-symbolic sym_bv (bitvector bw))
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


;; Performs synthesis using a provided grammar and a reference specification. This method creates symbolic bitvectors for the bitvector operands and returns multiple values:
;; satisfiable? : Whether there exists a synthesizable solution for the reference implementation using the current grammar?
;; materialize  : If a solutio exists, refers to the specific solution. else it returns a '()
;; elapsed_time : Returns the synthesis time (in seconds)

(define (synthesize-sol invoke_ref grammar bitwidth-list optimize? cost-fn)

  ;; Save current solver environment and restore 
  ;; after synthesis step
  (define curr-bw (current-bitwidth))
  (define curr-solver (current-solver))


  ;; Clear the verification condition up till this point
  ;; (clear-vc!)

  ;; Create the symbolic bitvectors to use in synthesis
  (define symbols (create-symbolic-bvs bitwidth-list))

  (define start_time (current-seconds))
  (define sol?

    (if optimize?
      ;; Use Z3 for optimization
      (begin 
        (current-solver (z3))
        (current-bitwidth #f) 

        (optimize 
          #:minimize (list (cost-fn grammar))
          #:guarantee 
          (begin 
            (assert 
              (equal? 
                (interpret grammar symbols)  (invoke_ref symbols)
                )
              )
            )
          )

        )

      ;; Use regular synthesis, default boolector
      (begin
        (current-solver (boolector))
        (current-bitwidth boolector-bw) 

        (synthesize 
          #:forall (list (symbolics symbols))
          #:guarantee 
          (begin 
            (assert 
              (equal? 
                (interpret grammar symbols)  (invoke_ref symbols)
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
