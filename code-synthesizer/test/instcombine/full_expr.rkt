#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)


;; Uncomment the line below to enable verbose logging
(enable-debug)

(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))


;; Input expression to simplify
(define hydride-expr
  (hexagon_V6_lo_128B_dsl
    (hexagon_V6_vcombine_128B_dsl
      (reg (bv 0 8))
      (reg (bv 1 8))
      1024 1024 0 1024 8 0 1024 8 1024 0
      )
    1024 1024 0 1024 8 1024 0
    )
  )

;; number of bits for each register
(define input-sizes (list 1024 1024))


;; number of element-bitwidth for each register
(define input-precs (list 16 16))



(define type-info (vector  (vector 16 1024) (vector 16 1024)))


;; Depending on target being compiled for, the last argument would be "hvx" or "x86"
(define output-expr (inst-combine-hydride-expr hydride-expr 3 "hvx" type-info))

(displayln "Simplified expression")
(pretty-print output-expr)
