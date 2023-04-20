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
      (reg 0)
      (reg 1)
      1024 1024 0 1024 8 0 1024 8 1024 0
      )
    1024 1024 0 1024 8 1024 0
    )
  )

;; number of bits for each register
(define input-sizes (list 1024 1024))


;; number of element-bitwidth for each register
(define input-precs (list 16 16))

(define input-hash-name "inst.combine.expr.1") ;; empty string means no cache
(define output-hash-name "inst.combine.expr.2")
;; Depending on target being compiled for, the last argument would be "hvx" or "x86"

(define inst-combine-cost-model 'instcombine) ; Costmodel type is one of 'instcombine or 'regular


(define-values (in-cache-hash-name out-cache-hash-name) "" "")
(define output-expr (inst-combine hydride-expr #t #f 'z3 input-sizes input-precs "hvx" inst-combine-cost-model input-hash-name output-hash-name))

(displayln "Simplified expression")
(pretty-print output-expr)



;; Once the expression is simplfied it needs to be saved into a .rtk file
(define method-name "hvx.lo.combine.1")
(define file-name "test_combine")

; Appends the synthesized expression to `/tmp/${file-name}.rkt`
(save-simplified-expr output-expr input-sizes input-precs method-name file-name)
