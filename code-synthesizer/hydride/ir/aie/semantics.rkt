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

(define (add_v16int32 arg0 arg1 %lanesize %datasize)
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
(define (mac_elem_32 a b c)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 32 1))])
(define %low1 (* 16 %i))
(define %high1 (+ %low1 (- 16 1)))
(define %ext_a (sign-extend (extract %high1 %low1 a) (bitvector 32)))
(define %low2 (* 16 %i))
(define %high2 (+ %low2 (- 16 1)))
(define %ext_b (sign-extend (extract %high2 %low2 b) (bitvector 32)))
(define %low3 (* 32 %i))
(define %high3 (+ %low3 (- 32 1)))
(define %ext_c (extract %high3 %low3 c))
(define %o (bvadd %ext_c (bvmul %ext_a %ext_b)))
%o
)
)
)
dst
)
(define (srs_to_v32int16 acc)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 32 1))])
(define %low1 (* 32 %i))
(define %high1 (+ %low1 (- 32 1)))
(define %o (extract 15 0 (extract %high1 %low1 acc)))
%o
)
)
)
dst 
)
(define (ups_to_v32acc32 vec)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 32 1))])
(define %low1 (* 16 %i))
(define %high1 (+ %low1 (- 16 1)))
(define %o (sign-extend (extract %high1 %low1 vec) (bitvector 32)))
%o
)
)
)
dst
)

;; ================================================================================

