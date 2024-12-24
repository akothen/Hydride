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
(for/list ([%i (range 0 16 1)])
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
(define (v8int32_add8 xbuff ybuff)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 8 1))])
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
(define (v16int32_sub16 xbuff ybuff)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 16 1))])
(define %low1 (* 32 %i))
(define %high1 (+ %low1 (- 32 1)))
(define %ext_xbuff (extract %high1 %low1 xbuff))
(define %low2 (* 32 %i))
(define %high2 (+ %low2 (- 32 1)))
(define %ext_ybuff (extract %high2 %low2 ybuff))
(define %o (bvsub %ext_xbuff %ext_ybuff))
 %o
)
)
)
dst
)
(define (mul_elem_32 a b)
(define dst
(apply concat
(for/list ([%i (range 0 32 1)])
(define %low1 (* 16 %i))
(define %high1 (+ %low1 (- 16 1)))
(define %ext_a (extract %high1 %low1 a))
(define %low2 (* 16 %i))
(define %high2 (+ %low2 (- 16 1)))
(define %ext_b (extract %high2 %low2 b))
(define %o (bvmul %ext_a %ext_b))
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
(define %o (bvand (bv #xffff 16) (extract %high1 %low1 acc)))
%o
)
)
)
dst
)
(define (ups_8_32_to_8_80 xbuff)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 8 1))])
(define %low1 (* 32 %i))
(define %high1 (+ %low1 (- 32 1)))
(define %o (sign-extend (extract %high1 %low1 xbuff) (bitvector 80)))
%o
)
)
)
dst 
)

;; ================================================================================

