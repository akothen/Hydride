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

(define (add_v16acc64 arg0 arg1 %lanesize %datasize)
(define dst
(apply concat
(for/list ([%i (range 0 %lanesize 1)])
(define %low1 (* %datasize %i))
(define %high1 (+ %low1 (- %datasize 1)))
(define %ext_xbuff (extract %high1 %low1 arg0))
(define %low2 (* %datasize %i))
(define %high2 (+ %low2 (- %datasize 1)))
(define %ext_ybuff (extract %high2 %low2 arg1))
(define %o (bvadd %ext_xbuff %ext_ybuff))
%o
)
)
)
dst
)
(define (sub_v16acc64 arg0 arg1 %lanesize %datasize)
(define dst
(apply concat
(for/list ([%i (range 0 %lanesize 1)])
(define %low1 (* %datasize %i))
(define %high1 (+ %low1 (- %datasize 1)))
(define %ext_xbuff (extract %high1 %low1 arg0))
(define %low2 (* %datasize %i))
(define %high2 (+ %low2 (- %datasize 1)))
(define %ext_ybuff (extract %high2 %low2 arg1))
(define %o (bvsub %ext_xbuff %ext_ybuff))
%o
)
)
)
dst
)

;; ================================================================================

