;#============================== Hydride File =================================
;#
;# Part of the Hydride Compiler Infrastructure.
;# <Placeholder for license information>
;#
;#=============================================================================
;#
;# Do NOT modify this file. It is automatically generated.
;#
;#=============================================================================

#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Semantics
;; ================================================================================

(define (v16int32_add16 xbuff ybuff)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 16 1))])
(define %low1 (* 32 %i))
(define %high1 (+ %low1 (- 32 1)))
(define %ext_xbuff (extract %high1 %low1 xbuff))
(define %low2 (* 32 %i))
(define %high2 (+ %low2 (- 32 1)))
(define %ext_ybuff (extract %high2 %low2 ybuff))
(define %o (bvadd %ext_xbuff %ext_ybuff))
 %o
)
)
)
dst
)

;; ================================================================================

