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

(define (pimMax_v2048_e8__v2048_e8__v2048_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %0 (+  i0  %lastidx0))
  (define %1 (extract  %0 i0 a))
  (define %3 (extract  %0 i0 b))
  (define %4.ab0 (bvmax %1 %3 %arg0 ))
  %4.ab0
 )
 )
)
)
)
(bvpadhighbits  dst %arg1)
)

(define (pimOr_v2048_e32__v2048_e32__v2048_e32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0  %lastidx0))
  (define %4 (extract  %3 i0 a))
  (define %6 (extract  %3 i0 b))
  (define %7 (bvor  %4  %6))
  %7
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (pimAnd_v32_e8__v32_e8__v32_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0  %lastidx0))
  (define %4 (extract  %3 i0 a))
  (define %6 (extract  %3 i0 b))
  (define %7 (bvand  %4  %6))
  %7
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (pimGT_v512_e32__v512_e32__v512_e32  %arg0.perm %arg1.perm b.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm %arg3.perm )
(define dst.perm
(apply
concat
(for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
 (apply
 concat
 (for/list ([i0.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
  (define %lastidx0.perm (-  %elemsize0.perm  1))
  (define %1.perm (+  i0.perm  %lastidx0.perm))
  (define %2.perm (extract  %1.perm i0.perm a.perm))
  (define %4.perm (extract  %1.perm i0.perm b.perm))
  (define %5.ab0.perm (bvgt %2.perm %4.perm %arg2.perm ))
  (define %6.perm (if (equal? %5.ab0.perm #t) %arg0.perm %arg1.perm))
  %6.perm
 )
 )
)
)
)
(bvpadhighbits  dst.perm %arg3.perm)
)

(define (pimEQ_v512_e32__v512_e32__v512_e32  b.norm %arg0.norm a.norm %arg1.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm )
(define dst.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([i0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %1.norm (+  i0.norm  %lastidx0.norm))
  (define %2.norm (extract  %1.norm i0.norm a.norm))
  (define %4.norm (extract  %1.norm i0.norm b.norm))
  (define %5.norm (bveq  %2.norm  %4.norm))
  (define %6.norm (if (equal? %5.norm #t) %arg0.norm %arg1.norm))
  %6.norm
 )
 )
)
)
)
(bvpadhighbits  dst.norm %arg2.norm)
)

(define (pimMin_v8192_e8__v8192_e8__v8192_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %0 (+  i0  %lastidx0))
  (define %1 (extract  %0 i0 a))
  (define %3 (extract  %0 i0 b))
  (define %4.ab0 (bvmin %1 %3 %arg0 ))
  %4.ab0
 )
 )
)
)
)
(bvpadhighbits  dst %arg1)
)

(define (pimDiv_v2048_e16__v2048_e16__v2048_e16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %1 (+  i0  %lastidx0))
  (define %2 (extract  %1 i0 a))
  (define %4 (extract  %1 i0 b))
  (define %5.ab0 (bvsizeext  %2 %arg4 %arg3))
  (define %6.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %7.ab0 (bvdiv %5.ab0 %6.ab0 %arg0 ))
  (define %9.high.idx 31 )
  (define %9.low.idx (+ (- %9.high.idx %elemsize0) 1) )
  (define %9 (extract  %9.high.idx %9.low.idx %7.ab0))
  %9
 )
 )
)
)
)
(bvpadhighbits  dst %arg5)
)

(define (pimBroadCast_v512_e32__v32_e32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %0 (extract  %highidx0 %arg0 a))
  %0
 )
 )
)
)
)
(bvpadhighbits  dst %arg1)
)

(define (pimDiv_v2048_e32__v2048_e32__v2048_e32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %1 (+  i0  %lastidx0))
  (define %2 (extract  %1 i0 a))
  (define %4 (extract  %1 i0 b))
  (define %5.ab0 (bvsizeext  %2 %arg4 %arg3))
  (define %6.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %7.ab0 (bvdiv %5.ab0 %6.ab0 %arg0 ))
  (define %9.high.idx 63 )
  (define %9.low.idx (+ (- %9.high.idx %elemsize0) 1) )
  (define %9 (extract  %9.high.idx %9.low.idx %7.ab0))
  %9
 )
 )
)
)
)
(bvpadhighbits  dst %arg5)
)

(define (pimDiv_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %1 (+  i0  %lastidx0))
  (define %2 (extract  %1 i0 a))
  (define %4 (extract  %1 i0 b))
  (define %5.ab0 (bvsizeext  %2 %arg4 %arg3))
  (define %6.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %7.ab0 (bvdiv %5.ab0 %6.ab0 %arg0 ))
  (define %9.high.idx 15 )
  (define %9.low.idx (+ (- %9.high.idx %elemsize0) 1) )
  (define %9 (extract  %9.high.idx %9.low.idx %7.ab0))
  %9
 )
 )
)
)
)
(bvpadhighbits  dst %arg5)
)

(define (pimAdd_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0  %lastidx0))
  (define %4 (extract  %3 i0 a))
  (define %6 (extract  %3 i0 b))
  (define %7.ab0 (bvaddnw %4 %6 %elemsize0 %arg0 ))
  %7.ab0
 )
 )
)
)
)
(bvpadhighbits  dst %arg1)
)

(define (pimSub_v256_e16__v256_e16__v256_e16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0  %lastidx0))
  (define %4 (extract  %3 i0 a))
  (define %6 (extract  %3 i0 b))
  (define %7.ab0 (bvsubnw %4 %6 %elemsize0 %arg0 ))
  %7.ab0
 )
 )
)
)
)
(bvpadhighbits  dst %arg1)
)

(define (pimMul_v16_e8__v16_e8__v16_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %1 (+  i0  %lastidx0))
  (define %2 (extract  %1 i0 a))
  (define %4 (extract  %1 i0 b))
  (define %5.ab0 (bvsizeext  %2 %arg1 %arg2))
  (define %6.ab0 (bvsizeext  %4 %arg1 %arg0))
  (define %7 (bvmul  %5.ab0  %6.ab0))
  (define %9.high.idx (- %arg1 1))
  (define %9.low.idx (+ (- %9.high.idx %elemsize0) 1) )
  (define %9 (extract  %9.high.idx %9.low.idx %7))
  %9
 )
 )
)
)
)
(bvpadhighbits  dst %arg3)
)

(define (pimXor_v8_e16__v8_e16__v8_e16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0  %lastidx0))
  (define %4 (extract  %3 i0 a))
  (define %6 (extract  %3 i0 b))
  (define %7 (bvxor  %4  %6))
  %7
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)


;; ================================================================================

