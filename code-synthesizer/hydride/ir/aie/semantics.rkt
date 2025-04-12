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
(define (add_v64uint8 arg0 arg1 %lanesize %datasize)
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
(define (mul_elem_32_v32acc32 arg0 arg1 %lanesize %indatasize %outdatasize)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 %lanesize 1))])
(define %low1 (* %indatasize %i))
(define %high1 (+ %low1 (- %indatasize 1)))
(define %ext_a (sign-extend (extract %high1 %low1 arg0) (bitvector %outdatasize)))
(define %low2 (* %indatasize %i))
(define %high2 (+ %low2 (- %indatasize 1)))
(define %ext_b (sign-extend (extract %high2 %low2 arg1) (bitvector %outdatasize)))
(define %o (bvmul %ext_a %ext_b))
%o
)
)
)
dst
)
(define (mul_elem_32_conf_v32acc32 arg0 arg1 int_sub %lanesize %indatasize %outdatasize)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 %lanesize 1))])
(define %low1 (* %indatasize %i))
(define %high1 (+ %low1 (- %indatasize 1)))
(define %ext_a (sign-extend (extract %high1 %low1 arg0) (bitvector %outdatasize)))
(define %low2 (* %indatasize %i))
(define %high2 (+ %low2 (- %indatasize 1)))
(define %ext_b (sign-extend (extract %high2 %low2 arg1) (bitvector %outdatasize)))
(define %o (bvmul %ext_a %ext_b))
(if (bveq (extract (+ %i 0) %i int_sub) (bv #b1 1)) (bvneg %o) %o)
)
)
)
dst
)
(define (sub_v64uint8 arg0 arg1 %lanesize %datasize)
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

