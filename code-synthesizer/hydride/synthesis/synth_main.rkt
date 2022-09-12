#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/ir/hydride/interpreter)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)


(provide (all-defined-out))

(define (synthesize-sol-with-depth depth depth-limit invoke_ref invoke_ref_lane grammar-fn bitwidth-list optimize? cost-fn symbolic? cost-bound solver)
  (debug-log (format "Synthesizing solution with depth ~a, depth-limit ~a, and cost-bound ~a ...\n" depth depth-limit cost-bound))

  (if
    (<= depth depth-limit)

    (begin

      (define grammar (grammar-fn depth))

      (define-values 
        (satisfiable? materialize elapsed_time)
        (if symbolic?
            (synthesize-sol invoke_ref invoke_ref_lane grammar bitwidth-list optimize? cost-fn cost-bound solver)
            (synthesize-sol-iterative invoke_ref invoke_ref_lane grammar bitwidth-list optimize? cost-fn '() cost-bound solver)
          )
        )


      (if satisfiable? 
        (values satisfiable? materialize elapsed_time)

        (begin
          (define-values 
            (_satisfiable? _materialize _elapsed_time)
            (synthesize-sol-with-depth (+ 1 depth) depth-limit invoke_ref invoke_ref_lane grammar-fn bitwidth-list optimize? cost-fn symbolic? cost-bound solver)
            )
          (values _satisfiable? _materialize (+ elapsed_time _elapsed_time)) ;; Accumulate synthesis time 
          )
        )
      )

    (begin
      (values #f '() 0)
      )
    )
  )
