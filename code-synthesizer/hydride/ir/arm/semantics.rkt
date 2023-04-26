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

(define (vpmin_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg9))
  (define %lastidx3 (-  %arg8  1))
  (define %8 (+  %4.new0  %lastidx3))
  (define %9 (extract  %8 %4.new0 %1))
  (define %10.ab0 (bvsizeext  %9 192 %arg7))
  (define %11.new0 (/  e0.new  %arg6))
  (define %12 (+  %11.new0  %arg5))
  (define %13 (*  %12  %arg4))
  (define %lastidx2 (-  %arg3  1))
  (define %18 (+  %13  %lastidx2))
  (define %19 (extract  %18 %13 %1))
  (define %20.ab0 (bvsizeext  %19 192 %arg2))
  (define %21.ab0 (bvmin %10.ab0 %20.ab0 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %28 (extract  %highidx0 %arg0 %21.ab0))
  %28
 )
 )
)
)
)
result)

(define (vpmaxq_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg9))
  (define %lastidx3 (-  %arg8  1))
  (define %8 (+  %4.new0  %lastidx3))
  (define %9 (extract  %8 %4.new0 %1))
  (define %10.ab0 (bvsizeext  %9 192 %arg7))
  (define %11.new0 (/  e0.new  %arg6))
  (define %12 (+  %11.new0  %arg5))
  (define %13 (*  %12  %arg4))
  (define %lastidx2 (-  %arg3  1))
  (define %18 (+  %13  %lastidx2))
  (define %19 (extract  %18 %13 %1))
  (define %20.ab0 (bvsizeext  %19 192 %arg2))
  (define %22.ab0 (bvmax %10.ab0 %20.ab0 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %28 (extract  %highidx0 %arg0 %22.ab0))
  %28
 )
 )
)
)
)
result)

(define (vmaxq_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new a))
  (define %6.ab0 (bvsizeext  %5 192 %arg3))
  (define %11 (extract  %4 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg2))
  (define %14.ab0 (bvmax %6.ab0 %12.ab0 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %20 (extract  %highidx0 %arg0 %14.ab0))
  %20
 )
 )
)
)
)
result)

(define (vminq_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new a))
  (define %6.ab0 (bvsizeext  %5 192 %arg3))
  (define %11 (extract  %4 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg2))
  (define %13.ab0 (bvmin %6.ab0 %12.ab0 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %20 (extract  %highidx0 %arg0 %13.ab0))
  %20
 )
 )
)
)
)
result)


;; ================================================================================

