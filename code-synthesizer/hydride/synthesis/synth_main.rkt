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
(require hydride/synthesis/iterative_synthesis)


(provide (all-defined-out))

(define (synthesize-sol-with-depth depth depth-limit invoke_ref grammar-fn bitwidth-list optimize? cost-fn symbolic?)
  (printf "Synthesizing solution with depth ~a and depth-limit ~a ...\n" depth depth-limit)

  (if
    (<= depth depth-limit)

    (begin

      (define grammar (grammar-fn depth))

      (define-values 
        (satisfiable? materialize elapsed_time)
        (if symbolic?
            (synthesize-sol invoke_ref grammar bitwidth-list optimize? cost-fn)
            (synthesize-sol-iterative invoke_ref grammar bitwidth-list optimize? cost-fn '())
          )
        )


      (if satisfiable? 
        (values satisfiable? materialize elapsed_time)

        (begin
          (define-values 
            (_satisfiable? _materialize _elapsed_time)
            (synthesize-sol-with-depth (+ 1 depth) depth-limit invoke_ref grammar-fn bitwidth-list optimize? cost-fn symbolic?)
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