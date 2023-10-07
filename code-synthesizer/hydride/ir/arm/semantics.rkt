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

(define (vpmin_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %2.new0 (*  e0.new  %arg7))
  (define %lastidx3 (-  %arg6  1))
  (define %6 (+  %2.new0  %lastidx3))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  %arg5))
  (define %10 (+  %9.new0  %arg4))
  (define %11 (*  %10  %arg3))
  (define %lastidx2 (-  %arg2  1))
  (define %16 (+  %11  %lastidx2))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0.ab0 (bvmin %7 %17 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %24.downcasted0 (extract  %highidx0 %arg0 %19.downcasted0.ab0))
  %24.downcasted0
 )
 )
)
)
)
result)

(define (vrshrn_n_s64  %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg9))
  (define %lastidx2 (-  %arg8  1))
  (define %7 (+  %4.new0  %lastidx2))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg7))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg4 %arg6 ))
  (define %11.downcasted0 (bvlshr  %10.downcasted0.ab0  %1.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %16.downcasted0 (extract  %highidx0 %arg5 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vpaddq_u8  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
 (define %lastidx0 (-  %outerlanesize0  1))
 (define %20.0 (+  e0.new  %lastidx0))
 (define %22 (extract  %20.0 e0.new %arg0))
 (define result %22)
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define iterator.0.new.div (/  iterator.0.new  %arg4))
  (define %1.new1 (/  e0.new  %arg3))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  %arg2))
  (define %lastidx2 (-  %outerlanesize0  1))
  (define %6.new0 (+  %2  %lastidx2))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %lastidx1 (-  %outerlanesize0  1))
 (define %20.clone.0.new1 (+  e0.new  %lastidx1))
 (define %7.acc0.ab0 (bvaddnw %7.ext0.red result %outerlanesize0 %arg1))
 %7.acc0.ab0
)
)
)
result)

(define (vqdmlsl_n_s32  %arg5 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
(define %4 (extract  31 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx1))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg6))
  (define %12.downcasted0 (bvmul  %arg5  %11.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0.ab0 %arg2))
  (define %15.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0.ab0 (bvsubnw %19 %13.downcasted0 %arg2 %arg3 ))
  %22.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmlal_high_s16  %arg1 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg5))
  (define %lastidx1 (-  %arg3  1))
  (define %9 (+  %6.new0  %lastidx1))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %elemsize0 %arg4))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %elemsize0 %arg2))
  (define %18.downcasted0 (bvmul  %arg1  %11.downcasted0.ab0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0.ab0 %elemsize0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %24 (+  e0.new  %lastidx0))
  (define %25 (extract  %24 e0.new a))
  (define %28.downcasted0.ab0 (bvaddnw %25 %19.downcasted0 %elemsize0 %arg0 ))
  %28.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vget_high_u64  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %11 (+  %inner.it  %arg1))
  (define %lastidx1 (-  %elemsize0  1))
  (define %12 (+  %11  %lastidx1))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)

(define (vabal_high_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg8))
  (define %lastidx2 (-  %arg5  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg7 %arg6))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg4 %arg3))
  (define %18.downcasted0.ab0 (bvsubnw %11.downcasted0.ab0 %17.downcasted0.ab0 %arg7 %arg2 ))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0.ab0)) (bitvector 64)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %19.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %24 (+  e0.new  %lastidx0))
  (define %29 (extract  %24 e0.new a))
  (define %30.ab0 (bvaddnw %29 %20.downcasted0 %elemsize0 %arg0 ))
  %30.ab0
 )
 )
)
)
)
result2)

(define (vqdmull_s16  %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx1))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg0 %arg4))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg0 %arg3))
  (define %12.downcasted0 (bvmul  %arg2  %5.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0.ab0 %arg0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vqrshrnd_n_u64  %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg9))
  (define %lastidx1 (-  %arg8  1))
  (define %7 (+  %4.new0  %lastidx1))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg7))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg4 %arg6 ))
  (define %11.downcasted0 (bvlshr  %10.downcasted0.ab0  %1.downcasted0.ab0))
  (define %16.downcasted0.ab0 (bvsaturate  %11.downcasted0 %arg4 %elemsize0 %arg5))
  %16.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqmovn_u64  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %0.new0 (*  e0.new  %arg4))
  (define %lastidx1 (-  %arg3  1))
  (define %3 (+  %0.new0  %lastidx1))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %10.downcasted0.ab0 (bvsaturate  %9.downcasted0.ab0 %arg2 %elemsize0 %arg0))
  %10.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqneg_s32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %6.downcasted0 (bvneg  %5.downcasted0.ab0))
  (define %11.downcasted0.ab0 (bvsaturate  %6.downcasted0 %arg2 %elemsize0 %arg0))
  %11.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmlsl_s32  %arg3 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx1))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg0 %arg5))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg0 %arg4))
  (define %12.downcasted0 (bvmul  %arg3  %5.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0.ab0 %arg0))
  (define %15.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0.ab0 (bvsubnw %19 %13.downcasted0 %arg0 %arg1 ))
  %22.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vaba_u8  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg6 %arg5))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg4 %arg3))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg6 %arg2 ))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0.ab0)) (bitvector 16)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %14.downcasted0 (extract  %highidx0 %arg1 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24.ab0 (bvaddnw %23 %14.downcasted0 %elemsize0 %arg0 ))
  %24.ab0
 )
 )
)
)
)
result2)

(define (vmlal_n_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %4 (extract  31 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg6))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %arg2  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %13.downcasted0 (extract  %highidx0 %arg5 %12.downcasted0))
  (define %14.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %17 (+  %14.new0  %lastidx0))
  (define %22 (extract  %17 %14.new0 a))
  (define %23.ab0 (bvaddnw %22 %13.downcasted0 %arg2 %arg3 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vpadalq_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (*  e0.new  %arg11))
  (define %lastidx3 (-  %elemsize0  1))
  (define %5 (+  %1.new0  %lastidx3))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0.ab0 (bvsizeext  %6 %arg10 %arg9))
  (define %8.new0 (/  e0.new  %arg8))
  (define %9 (+  %8.new0  %arg7))
  (define %10 (*  %9  %arg6))
  (define %lastidx2 (-  %elemsize0  1))
  (define %15 (+  %10  %lastidx2))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg5 %arg4))
  (define %18.downcasted0.ab0 (bvaddnw %7.downcasted0.ab0 %17.downcasted0.ab0 %arg10 %arg3 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %19.downcasted0 (extract  %highidx0 %arg2 %18.downcasted0.ab0))
  (define %lastidx0 (-  %arg0  1))
  (define %23 (+  %1.new0  %lastidx0))
  (define %28 (extract  %23 %1.new0 a))
  (define %29.ab0 (bvaddnw %28 %19.downcasted0 %arg0 %arg1 ))
  %29.ab0
 )
 )
)
)
)
result2)

(define (vtrn2_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([p0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  p0.new  %arg2))
  (define %7 (+  %6.new0  %arg1))
  (define %8 (*  %7  %arg0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %13 (+  %8  %lastidx0))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)

(define (vmull_n_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %4 (extract  31 0 b))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg5))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %arg2  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %13.downcasted0 (extract  %highidx0 %arg4 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vqshlq_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new b))
  (define %6.ab0 (bvsizeext  %5 %arg2 %arg3))
  (define %11 (extract  %4 e0.new a))
  (define %12.ab0 (bvsizeext  %11 %arg2 %arg1))
  (define %14 (bvshl  %12.ab0  %6.ab0))
  (define %19.ab0 (bvsaturate  %14 %arg2 %elemsize0 %arg0))
  %19.ab0
 )
 )
)
)
)
result)

(define (vqabsq_s64  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0.ab0)) (bitvector %arg2)))
  (define %11.downcasted0.ab0 (bvsaturate  %6.downcasted0 %arg2 %elemsize0 %arg0))
  %11.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vmlsl_high_n_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx2 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg1 %arg4))
  (define %15.downcasted0 (bvmul  %14.downcasted0.ab0  %8.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %16.downcasted0 (extract  %highidx0 %arg3 %15.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %20 (+  e0.new  %lastidx0))
  (define %25 (extract  %20 e0.new a))
  (define %26.ab0 (bvsubnw %25 %16.downcasted0 %elemsize0 %arg2 ))
  %26.ab0
 )
 )
)
)
)
result)

(define (vclez_s8  %arg0.norm %arg1.norm %arg2.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %3.norm (+  e0.new.norm  %lastidx0.norm))
  (define %4.norm (extract  %3.norm e0.new.norm a.norm))
  (define %6.downcasted0.ab0.norm (bvle %4.norm %arg2.norm %arg3.norm ))
  (define %13.norm (if (equal? %6.downcasted0.ab0.norm #t) %arg0.norm %arg1.norm))
  %13.norm
 )
 )
)
)
)
result.norm)

(define (vqdmull_n_s16  %arg4 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg5 )
(define %4 (extract  15 0 b))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx1))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg5))
  (define %12.downcasted0 (bvmul  %arg4  %11.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0.ab0 %arg2))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vsubhn_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (*  e0.new  %arg3))
  (define %lastidx2 (-  %arg2  1))
  (define %4 (+  %1.new0  %lastidx2))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11.ab0 (bvsubnw %5 %10 %arg2 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17 (extract  %highidx0 %arg0 %11.ab0))
  %17
 )
 )
)
)
)
result)

(define (vmla_n_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %4 (extract  31 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx0))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg4))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %13.downcasted0 (extract  %highidx0 %arg3 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23.ab0 (bvaddnw %22 %13.downcasted0 %elemsize0 %arg2 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vmls_n_s16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %4 (extract  15 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx0))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg4))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %13.downcasted0 (extract  %highidx0 %arg3 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23.ab0 (bvsubnw %22 %13.downcasted0 %elemsize0 %arg2 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vmlsl_n_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %4 (extract  31 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg6))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %arg2  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %13.downcasted0 (extract  %highidx0 %arg5 %12.downcasted0))
  (define %14.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %17 (+  %14.new0  %lastidx0))
  (define %22 (extract  %17 %14.new0 a))
  (define %23.ab0 (bvsubnw %22 %13.downcasted0 %arg2 %arg3 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vmlsq_n_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %4 (extract  31 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx0))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg4))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %13.downcasted0 (extract  %highidx0 %arg3 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23.ab0 (bvsubnw %22 %13.downcasted0 %elemsize0 %arg2 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vqdmlal_n_s32  %arg5 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
(define %4 (extract  31 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx1))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg6))
  (define %12.downcasted0 (bvmul  %arg5  %11.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0.ab0 %arg2))
  (define %15.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0.ab0 (bvaddnw %19 %13.downcasted0 %arg2 %arg3 ))
  %22.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vaddw_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %0.new0 (*  e0.new  %arg7))
  (define %lastidx0 (-  %arg0  1))
  (define %3 (+  %0.new0  %lastidx0))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg6 %arg5))
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg4 %arg3))
  (define %12.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg6 %arg2 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %17.downcasted0 (extract  %highidx0 %arg1 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vrsra_n_u64  %arg1 %arg0 a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg8))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg4 %arg7 ))
  (define %11.downcasted0 (bvlshr  %10.downcasted0.ab0  %1.downcasted0.ab0))
  (define %20 (extract  %7 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg6))
  (define %21.downcasted0 (extract  %highidx0 %arg6 %11.downcasted0))
  (define %22.ab0 (bvaddnw %20 %21.downcasted0 %elemsize0 %arg5 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vqshrn_n_u32  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (*  e0.new  %arg4))
  (define %lastidx1 (-  %arg3  1))
  (define %6 (+  %3.new0  %lastidx1))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg2 %arg1))
  (define %10.downcasted0 (bvlshr  %8.downcasted0.ab0  n))
  (define %15.downcasted0.ab0 (bvsaturate  %10.downcasted0 %arg2 %elemsize0 %arg0))
  %15.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqshrnd_n_u64  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (*  e0.new  %arg2))
  (define %lastidx1 (-  %arg1  1))
  (define %6 (+  %3.new0  %lastidx1))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0.ab0 (bvsaturate  %10.downcasted0 %arg1 %elemsize0 %arg0))
  %15.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vshl_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new b))
  (define %6.ab0 (bvsizeext  %5 %arg2 %arg3))
  (define %11 (extract  %4 e0.new a))
  (define %12.ab0 (bvsizeext  %11 %arg2 %arg1))
  (define %14 (bvshl  %12.ab0  %6.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %19 (extract  %highidx0 %arg0 %14))
  %19
 )
 )
)
)
)
result)

(define (vpaddlq_s32  %arg1 a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %2.new0 (*  e0.new  %arg12))
  (define %lastidx3 (-  %elemsize0  1))
  (define %6 (+  %2.new0  %lastidx3))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg11 %arg10))
  (define %9.new0 (/  e0.new  %arg9))
  (define %10 (+  %9.new0  %arg8))
  (define %11 (*  %10  %arg7))
  (define %lastidx2 (-  %elemsize0  1))
  (define %16 (+  %11  %lastidx2))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0.ab0 (bvsizeext  %17 %arg6 %arg5))
  (define %19.downcasted0.ab0 (bvaddnw %8.downcasted0.ab0 %18.downcasted0.ab0 %arg11 %arg4 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %20.downcasted0 (extract  %highidx0 %arg3 %19.downcasted0.ab0))
  (define %30.ab0 (bvaddnw %arg1 %20.downcasted0 %arg0 %arg2 ))
  %30.ab0
 )
 )
)
)
)
result2)

(define (vshrn_n_s32  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (*  e0.new  %arg4))
  (define %lastidx2 (-  %arg3  1))
  (define %6 (+  %3.new0  %lastidx2))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg2 %arg1))
  (define %10.downcasted0 (bvlshr  %8.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %15.downcasted0 (extract  %highidx0 %arg0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)

(define (vshrn_n_u64  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (*  e0.new  %arg2))
  (define %lastidx2 (-  %arg1  1))
  (define %6 (+  %3.new0  %lastidx2))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %15.downcasted0 (extract  %highidx0 %arg0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)

(define (vqshrn_n_s16  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (*  e0.new  %arg4))
  (define %lastidx1 (-  %arg3  1))
  (define %6 (+  %3.new0  %lastidx1))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg2 %arg1))
  (define %10.downcasted0 (bvashr  %8.downcasted0.ab0  n))
  (define %15.downcasted0.ab0 (bvsaturate  %10.downcasted0 %arg2 %elemsize0 %arg0))
  %15.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vceqzq_s8  %arg1.norm a.norm %arg2.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %3.norm (+  e0.new.norm  %lastidx0.norm))
  (define %4.norm (extract  %3.norm e0.new.norm a.norm))
  (define %6.downcasted0.norm (bveq  %4.norm  %arg2.norm))
  (define %13.norm (if (equal? %6.downcasted0.norm #t) %arg0.norm %arg1.norm))
  %13.norm
 )
 )
)
)
)
result.norm)

(define (vmla_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %4 (extract  15 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx0))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg4))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %13.downcasted0 (extract  %highidx0 %arg3 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23.ab0 (bvaddnw %22 %13.downcasted0 %elemsize0 %arg2 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vqshlu_n_s64  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %5 (+  e0.new  %lastidx0))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0.ab0 (bvsizeext  %6 %arg1 %arg3))
  (define %8.downcasted0 (bvshl  %7.downcasted0.ab0  %1.downcasted0.ab0))
  (define %13.downcasted0.ab0 (bvsaturate  %8.downcasted0 %arg1 %elemsize0 %arg2))
  %13.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vabdl_high_u8  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %7.new0 (/  e0.new  %arg9))
  (define %lastidx2 (-  %arg6  1))
  (define %10 (+  %7.new0  %lastidx2))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg8 %arg7))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0.ab0 (bvsizeext  %17 %arg5 %arg4))
  (define %19.downcasted0.ab0 (bvsubnw %12.downcasted0.ab0 %18.downcasted0.ab0 %arg8 %arg3 ))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0.ab0)) (bitvector 16)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21.downcasted0 (extract  %highidx0 %arg2 %20.downcasted0))
  (define %31.ab0 (bvaddnw %arg0 %21.downcasted0 %elemsize0 %arg1 ))
  %31.ab0
 )
 )
)
)
)
result2)

(define (vmlal_high_n_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx2 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg1 %arg4))
  (define %15.downcasted0 (bvmul  %14.downcasted0.ab0  %8.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %16.downcasted0 (extract  %highidx0 %arg3 %15.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %20 (+  e0.new  %lastidx0))
  (define %25 (extract  %20 e0.new a))
  (define %26.ab0 (bvaddnw %25 %16.downcasted0 %elemsize0 %arg2 ))
  %26.ab0
 )
 )
)
)
)
result)

(define (vmovn_s16  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %0.new0 (*  e0.new  %arg0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %9.new.high.idx0 (+  %0.new0  %lastidx1))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)

(define (vshll_n_s8  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %5 (+  e0.new  %lastidx2))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0.ab0 (bvsizeext  %6 %arg4 %arg3))
  (define %8.downcasted0 (bvshl  %7.downcasted0.ab0  n))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %13.downcasted0 (extract  %highidx0 %arg1 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vaddhn_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (*  e0.new  %arg3))
  (define %lastidx2 (-  %arg2  1))
  (define %4 (+  %1.new0  %lastidx2))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11.ab0 (bvaddnw %5 %10 %arg2 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17 (extract  %highidx0 %arg0 %11.ab0))
  %17
 )
 )
)
)
)
result)

(define (vqdmlal_high_n_s16  %arg3 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %elemsize0 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx1 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx1))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %elemsize0 %arg4))
  (define %15.downcasted0 (bvmul  %arg3  %14.downcasted0.ab0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0.ab0 %elemsize0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %21 (+  e0.new  %lastidx0))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0.ab0 (bvaddnw %22 %16.downcasted0 %elemsize0 %arg2 ))
  %25.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vmovl_s32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg4 %arg3))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %10.downcasted0 (extract  %highidx0 %arg1 %5.downcasted0.ab0))
  %10.downcasted0
 )
 )
)
)
)
result)

(define (vtrn1_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([p0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (*  p0.new  %arg3))
  (define %lastidx1 (-  %elemsize0  1))
  (define %5 (+  %1.new0  %lastidx1))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)

(define (vmul_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg3))
  (define %11.downcasted0.ab0 (bvsizeext  %9 %arg2 %arg1))
  (define %12.downcasted0 (bvmul  %10.downcasted0.ab0  %11.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %13.downcasted0 (extract  %highidx0 %arg0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vmlal_high_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx2 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg1 %arg4))
  (define %15.downcasted0 (bvmul  %14.downcasted0.ab0  %8.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %16.downcasted0 (extract  %highidx0 %arg3 %15.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %20 (+  e0.new  %lastidx0))
  (define %25 (extract  %20 e0.new a))
  (define %26.ab0 (bvaddnw %25 %16.downcasted0 %elemsize0 %arg2 ))
  %26.ab0
 )
 )
)
)
)
result)

(define (vrshrq_n_u16  %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx0))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0.ab0 (bvsizeext  %9 %arg8 %arg7))
  (define %11.downcasted0.ab0 (bvaddnw %10.downcasted0.ab0 %3.downcasted0 %arg8 %arg6 ))
  (define %12.downcasted0 (bvlshr  %11.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %22.downcasted0 (extract  %highidx0 %arg5 %12.downcasted0))
  (define %23.ab0 (bvaddnw %arg3 %22.downcasted0 %elemsize0 %arg4 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vcltz_s32  %arg1.0 %arg0.0 %arg2.0 a.0 %vectsize0.0 %outerlanesize0.0 %innerlaneoffset0.0 %innerlanesize0.0 %elemsize0.0 %arg3.0 )
(define result.0
(apply
concat
(for/list ([%outer.it.0 (reverse (range 0 %vectsize0.0 %outerlanesize0.0))])
 (apply
 concat
 (for/list ([e0.new.0 (reverse (range %innerlaneoffset0.0 %innerlanesize0.0 %elemsize0.0))])
  (define %lastidx0.0 (-  %elemsize0.0  1))
  (define %3.0 (+  e0.new.0  %lastidx0.0))
  (define %4.0 (extract  %3.0 e0.new.0 a.0))
  (define %6.downcasted0.ab0.0 (bvlt %4.0 %arg2.0 %arg3.0 ))
  (define %13.0 (if (equal? %6.downcasted0.ab0.0 #t) %arg0.0 %arg1.0))
  %13.0
 )
 )
)
)
)
result.0)

(define (vqdmlsl_high_n_s16  %arg3 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %elemsize0 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx1 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx1))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %elemsize0 %arg4))
  (define %15.downcasted0 (bvmul  %arg3  %14.downcasted0.ab0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0.ab0 %elemsize0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %21 (+  e0.new  %lastidx0))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0.ab0 (bvsubnw %22 %16.downcasted0 %elemsize0 %arg2 ))
  %25.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vrsra_n_s32  %arg1 %arg0 a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg7 %arg6))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg7 %arg5 ))
  (define %11.downcasted0 (bvashr  %10.downcasted0.ab0  n))
  (define %20 (extract  %7 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %21.downcasted0 (extract  %highidx0 %arg4 %11.downcasted0))
  (define %22.ab0 (bvaddnw %20 %21.downcasted0 %elemsize0 %arg3 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vabal_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg8 %arg7))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg6 %arg5))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg8 %arg4 ))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0.ab0)) (bitvector 32)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %14.downcasted0 (extract  %highidx0 %arg3 %13.downcasted0))
  (define %15.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %23 (extract  %18 %15.new0 a))
  (define %24.ab0 (bvaddnw %23 %14.downcasted0 %arg0 %arg1 ))
  %24.ab0
 )
 )
)
)
)
result2)

(define (vmull_high_n_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 a))
(define %7 (extract  15 0 b))
(define %8.downcasted0.ab0 (bvsizeext  %7 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg1 %arg3))
  (define %15.downcasted0 (bvmul  %14.downcasted0.ab0  %8.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %16.downcasted0 (extract  %highidx0 %arg2 %15.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vget_low_u8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %11 (+  %inner.it  %arg0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %12 (+  %11  %lastidx0))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)

(define (vsraq_n_u64  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %10.downcasted0))
  (define %21.ab0 (bvaddnw %19 %20.downcasted0 %elemsize0 %arg0 ))
  %21.ab0
 )
 )
)
)
)
result)

(define (vmlal_high_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg6))
  (define %lastidx2 (-  %arg4  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg5))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg3 %arg2))
  (define %18.downcasted0 (bvmul  %11.downcasted0.ab0  %17.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %19.downcasted0 (extract  %highidx0 %arg1 %18.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %23 (+  e0.new  %lastidx0))
  (define %24 (extract  %23 e0.new a))
  (define %25.ab0 (bvaddnw %24 %19.downcasted0 %elemsize0 %arg0 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vmull_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg4 %arg5))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg4 %arg3))
  (define %16.downcasted0 (bvmul  %5.downcasted0.ab0  %11.downcasted0.ab0))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %17.downcasted0 (extract  %highidx0 %arg1 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vrsra_n_u8  %arg1 %arg0 a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg7 %arg6))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg7 %arg5 ))
  (define %11.downcasted0 (bvlshr  %10.downcasted0.ab0  n))
  (define %20 (extract  %7 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %21.downcasted0 (extract  %highidx0 %arg4 %11.downcasted0))
  (define %22.ab0 (bvaddnw %20 %21.downcasted0 %elemsize0 %arg3 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vmul_n_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %4 (extract  31 0 b))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx0))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg3))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %13.downcasted0 (extract  %highidx0 %arg2 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vqrshrun_n_s64  %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg9))
  (define %lastidx1 (-  %arg8  1))
  (define %7 (+  %4.new0  %lastidx1))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg7))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg4 %arg6 ))
  (define %11.downcasted0 (bvashr  %10.downcasted0.ab0  %1.downcasted0.ab0))
  (define %16.downcasted0.ab0 (bvsaturate  %11.downcasted0 %arg4 %elemsize0 %arg5))
  %16.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vmlal_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %4 (extract  15 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg6))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %arg2  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %13.downcasted0 (extract  %highidx0 %arg5 %12.downcasted0))
  (define %14.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %17 (+  %14.new0  %lastidx0))
  (define %22 (extract  %17 %14.new0 a))
  (define %23.ab0 (bvaddnw %22 %13.downcasted0 %arg2 %arg3 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vrsubhn_u16  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (*  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %4 (+  %1.new0  %lastidx2))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11.ab0 (bvsubnw %5 %10 %arg4 %arg3 ))
  (define %12.ab0 (bvaddnw %11.ab0 %arg1 16 %arg2 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17 (extract  %highidx0 %arg0 %12.ab0))
  %17
 )
 )
)
)
)
result)

(define (vaddw_high_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg7 %arg6))
  (define %9.new0 (/  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg3 %arg2))
  (define %15.downcasted0.ab0 (bvaddnw %8.downcasted0.ab0 %14.downcasted0.ab0 %arg7 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %20.downcasted0 (extract  %highidx0 %arg0 %15.downcasted0.ab0))
  %20.downcasted0
 )
 )
)
)
)
result)

(define (vrshld_s64  %arg5 %arg4 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg6 %arg7 %arg8 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new b))
  (define %6.ab0 (bvsizeext  %5 %arg8 %arg7))
  (define %7 (bvneg  %6.ab0))
  (define %8.ab0 (bvsubnw %7 %arg5 %arg8 %arg6 ))
  (define %9 (bvshl  %arg4  %8.ab0))
  (define %14 (extract  %4 e0.new a))
  (define %15.ab0 (bvsizeext  %14 %arg3 %arg2))
  (define %16.ab0 (bvaddnw %15.ab0 %9 %arg3 %arg1 ))
  (define %17 (bvshl  %16.ab0  %6.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %22 (extract  %highidx0 %arg0 %17))
  %22
 )
 )
)
)
)
result)

(define (vqdmull_n_s32  %arg4 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg5 )
(define %4 (extract  31 0 b))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx1))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg5))
  (define %12.downcasted0 (bvmul  %arg4  %11.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0.ab0 %arg2))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vraddhn_u64  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (*  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %4 (+  %1.new0  %lastidx2))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11.ab0 (bvaddnw %5 %10 %arg4 %arg3 ))
  (define %12.ab0 (bvaddnw %11.ab0 %arg1 64 %arg2 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17 (extract  %highidx0 %arg0 %12.ab0))
  %17
 )
 )
)
)
)
result)

(define (vshr_n_u64  %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21.downcasted0 (extract  %highidx0 %arg2 %11.downcasted0))
  (define %22.ab0 (bvaddnw %arg0 %21.downcasted0 %elemsize0 %arg1 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vabs_s32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0.ab0)) (bitvector %arg2)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %11.downcasted0 (extract  %highidx0 %arg0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)

(define (vqdmlsl_high_n_s32  %arg3 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %elemsize0 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx1 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx1))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %elemsize0 %arg4))
  (define %15.downcasted0 (bvmul  %arg3  %14.downcasted0.ab0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0.ab0 %elemsize0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %21 (+  e0.new  %lastidx0))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0.ab0 (bvsubnw %22 %16.downcasted0 %elemsize0 %arg2 ))
  %25.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vmull_high_n_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 a))
(define %7 (extract  31 0 b))
(define %8.downcasted0.ab0 (bvsizeext  %7 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg1 %arg3))
  (define %15.downcasted0 (bvmul  %14.downcasted0.ab0  %8.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %16.downcasted0 (extract  %highidx0 %arg2 %15.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vsraq_n_s64  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %10.downcasted0))
  (define %21.ab0 (bvaddnw %19 %20.downcasted0 %elemsize0 %arg0 ))
  %21.ab0
 )
 )
)
)
)
result)

(define (vsqadds_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg4))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg2))
  (define %16.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg5 %arg1 ))
  (define %17.downcasted0.ab0 (bvsaturate  %16.downcasted0.ab0 64 %elemsize0 %arg0))
  %17.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vabal_high_s16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg8))
  (define %lastidx2 (-  %arg5  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg7 %arg6))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg4 %arg3))
  (define %18.downcasted0.ab0 (bvsubnw %11.downcasted0.ab0 %17.downcasted0.ab0 %arg7 %arg2 ))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0.ab0)) (bitvector 32)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %19.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %24 (+  e0.new  %lastidx0))
  (define %29 (extract  %24 e0.new a))
  (define %30.ab0 (bvaddnw %29 %20.downcasted0 %elemsize0 %arg0 ))
  %30.ab0
 )
 )
)
)
)
result2)

(define (vqdmlal_high_n_s32  %arg3 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %elemsize0 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx1 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx1))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %elemsize0 %arg4))
  (define %15.downcasted0 (bvmul  %arg3  %14.downcasted0.ab0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0.ab0 %elemsize0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %21 (+  e0.new  %lastidx0))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0.ab0 (bvaddnw %22 %16.downcasted0 %elemsize0 %arg2 ))
  %25.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmlsl_high_s16  %arg1 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg5))
  (define %lastidx1 (-  %arg3  1))
  (define %9 (+  %6.new0  %lastidx1))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %elemsize0 %arg4))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %elemsize0 %arg2))
  (define %18.downcasted0 (bvmul  %arg1  %11.downcasted0.ab0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0.ab0 %elemsize0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %24 (+  e0.new  %lastidx0))
  (define %25 (extract  %24 e0.new a))
  (define %28.downcasted0.ab0 (bvsubnw %25 %19.downcasted0 %elemsize0 %arg0 ))
  %28.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vaddl_high_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg7))
  (define %lastidx2 (-  %arg4  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg6 %arg5))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg3 %arg2))
  (define %18.downcasted0.ab0 (bvaddnw %11.downcasted0.ab0 %17.downcasted0.ab0 %arg6 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %23.downcasted0 (extract  %highidx0 %arg0 %18.downcasted0.ab0))
  %23.downcasted0
 )
 )
)
)
)
result)

(define (vqdmlal_n_s16  %arg5 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
(define %4 (extract  15 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx1))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg6))
  (define %12.downcasted0 (bvmul  %arg5  %11.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0.ab0 %arg2))
  (define %15.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0.ab0 (bvaddnw %19 %13.downcasted0 %arg2 %arg3 ))
  %22.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vmul_n_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %4 (extract  15 0 b))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx0))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg3))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %13.downcasted0 (extract  %highidx0 %arg2 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vabdl_s8  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx2))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg9 %arg8))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg7 %arg6))
  (define %13.downcasted0.ab0 (bvsubnw %6.downcasted0.ab0 %12.downcasted0.ab0 %arg9 %arg5 ))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0.ab0)) (bitvector 16)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %15.downcasted0 (extract  %highidx0 %arg4 %14.downcasted0))
  (define %25.ab0 (bvaddnw %arg1 %15.downcasted0 %arg0 %arg2 ))
  %25.ab0
 )
 )
)
)
)
result2)

(define (vcombine_u16  low high %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %15 (+  %inner.it  %arg1))
  (define %lastidx1 (-  %elemsize0  1))
  (define %16 (+  %15  %lastidx1))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)

(define (vmlsl_high_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg6))
  (define %lastidx2 (-  %arg4  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg5))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg3 %arg2))
  (define %18.downcasted0 (bvmul  %11.downcasted0.ab0  %17.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %19.downcasted0 (extract  %highidx0 %arg1 %18.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %23 (+  e0.new  %lastidx0))
  (define %24 (extract  %23 e0.new a))
  (define %25.ab0 (bvsubnw %24 %19.downcasted0 %elemsize0 %arg0 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vuqaddq_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg4))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg2))
  (define %16.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg5 %arg1 ))
  (define %17.downcasted0.ab0 (bvsaturate  %16.downcasted0.ab0 16 %elemsize0 %arg0))
  %17.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vabal_high_u8  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg8))
  (define %lastidx2 (-  %arg5  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg7 %arg6))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg4 %arg3))
  (define %18.downcasted0.ab0 (bvsubnw %11.downcasted0.ab0 %17.downcasted0.ab0 %arg7 %arg2 ))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0.ab0)) (bitvector 16)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %19.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %24 (+  e0.new  %lastidx0))
  (define %29 (extract  %24 e0.new a))
  (define %30.ab0 (bvaddnw %29 %20.downcasted0 %elemsize0 %arg0 ))
  %30.ab0
 )
 )
)
)
)
result2)

(define (vsqadd_u64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg4))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg2))
  (define %16.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg5 %arg1 ))
  (define %17.downcasted0.ab0 (bvsaturate  %16.downcasted0.ab0 128 %elemsize0 %arg0))
  %17.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmull_high_s16  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg4))
  (define %lastidx1 (-  %arg2  1))
  (define %9 (+  %6.new0  %lastidx1))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %elemsize0 %arg3))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %elemsize0 %arg1))
  (define %18.downcasted0 (bvmul  %arg0  %11.downcasted0.ab0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0.ab0 %elemsize0))
  %19.downcasted0
 )
 )
)
)
)
result)

(define (vqrshrns_n_u32  %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg8))
  (define %lastidx1 (-  %arg7  1))
  (define %7 (+  %4.new0  %lastidx1))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg6 %arg5))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg6 %arg4 ))
  (define %11.downcasted0 (bvlshr  %10.downcasted0.ab0  n))
  (define %16.downcasted0.ab0 (bvsaturate  %11.downcasted0 64 %elemsize0 %arg3))
  %16.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqrshrnh_n_s16  %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg8))
  (define %lastidx1 (-  %arg7  1))
  (define %7 (+  %4.new0  %lastidx1))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg6 %arg5))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg6 %arg4 ))
  (define %11.downcasted0 (bvashr  %10.downcasted0.ab0  n))
  (define %16.downcasted0.ab0 (bvsaturate  %11.downcasted0 64 %elemsize0 %arg3))
  %16.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vsra_n_s64  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %10.downcasted0))
  (define %21.ab0 (bvaddnw %19 %20.downcasted0 %elemsize0 %arg0 ))
  %21.ab0
 )
 )
)
)
)
result)

(define (vabal_s8  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg8 %arg7))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg6 %arg5))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg8 %arg4 ))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0.ab0)) (bitvector 16)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %14.downcasted0 (extract  %highidx0 %arg3 %13.downcasted0))
  (define %15.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %23 (extract  %18 %15.new0 a))
  (define %24.ab0 (bvaddnw %23 %14.downcasted0 %arg0 %arg1 ))
  %24.ab0
 )
 )
)
)
)
result2)

(define (vceqq_u16  b.norm a.norm %arg0.norm %arg1.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %3.norm (+  e0.new.norm  %lastidx0.norm))
  (define %4.norm (extract  %3.norm e0.new.norm a.norm))
  (define %9.norm (extract  %3.norm e0.new.norm b.norm))
  (define %10.norm (bveq  %4.norm  %9.norm))
  (define %17.norm (if (equal? %10.norm #t) %arg0.norm %arg1.norm))
  %17.norm
 )
 )
)
)
)
result.norm)

(define (vaddl_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg7 %arg6))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg5 %arg4))
  (define %12.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg7 %arg3 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %17.downcasted0 (extract  %highidx0 %arg1 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vmull_high_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg5))
  (define %lastidx2 (-  %arg3  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg4))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg2 %arg1))
  (define %22.downcasted0 (bvmul  %11.downcasted0.ab0  %17.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %23.downcasted0 (extract  %highidx0 %arg0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)

(define (vabal_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg8 %arg7))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg6 %arg5))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg8 %arg4 ))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0.ab0)) (bitvector 64)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %14.downcasted0 (extract  %highidx0 %arg3 %13.downcasted0))
  (define %15.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %23 (extract  %18 %15.new0 a))
  (define %24.ab0 (bvaddnw %23 %14.downcasted0 %arg0 %arg1 ))
  %24.ab0
 )
 )
)
)
)
result2)

(define (vzip1q_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([p0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %12 (+  p0.new  %lastidx1))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)

(define (vmlsl_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg6))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg5 %arg4))
  (define %12.downcasted0 (bvmul  %5.downcasted0.ab0  %11.downcasted0.ab0))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %13.downcasted0 (extract  %highidx0 %arg3 %12.downcasted0))
  (define %14.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %17 (+  %14.new0  %lastidx0))
  (define %18 (extract  %17 %14.new0 a))
  (define %19.ab0 (bvsubnw %18 %13.downcasted0 %arg0 %arg1 ))
  %19.ab0
 )
 )
)
)
)
result)

(define (vrhadd_s16  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg7 %arg6))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg5 %arg4))
  (define %16.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg7 %arg3 ))
  (define %17.downcasted0.ab0 (bvaddnw %16.downcasted0.ab0 %arg1 32 %arg2 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %18.downcasted0 (extract  %highidx0 %arg0 %17.downcasted0.ab0))
  %18.downcasted0
 )
 )
)
)
)
result)

(define (vrshrd_n_s64  %arg5 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg6 %arg7 %arg8 %arg9 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx0))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0.ab0 (bvsizeext  %9 %arg4 %arg9))
  (define %11.downcasted0.ab0 (bvaddnw %10.downcasted0.ab0 %3.downcasted0 %arg4 %arg8 ))
  (define %12.downcasted0 (bvashr  %11.downcasted0.ab0  %1.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg7))
  (define %22.downcasted0 (extract  %highidx0 %arg7 %12.downcasted0))
  (define %23.ab0 (bvaddnw %arg5 %22.downcasted0 %elemsize0 %arg6 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vuzp1q_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (*  e0.new  %arg0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %10 (+  %6.new0  %lastidx1))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)

(define (vhsub_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg4))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg2))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg5 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17.downcasted0 (extract  %highidx0 %arg0 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vqshlh_n_s16  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %5 (+  e0.new  %lastidx0))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0.ab0 (bvsizeext  %6 %arg2 %arg1))
  (define %8.downcasted0 (bvshl  %7.downcasted0.ab0  n))
  (define %13.downcasted0.ab0 (bvsaturate  %8.downcasted0 %arg2 %elemsize0 %arg0))
  %13.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vabdl_s16  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx2))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg9 %arg8))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg7 %arg6))
  (define %13.downcasted0.ab0 (bvsubnw %6.downcasted0.ab0 %12.downcasted0.ab0 %arg9 %arg5 ))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0.ab0)) (bitvector 32)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %15.downcasted0 (extract  %highidx0 %arg4 %14.downcasted0))
  (define %25.ab0 (bvaddnw %arg1 %15.downcasted0 %arg0 %arg2 ))
  %25.ab0
 )
 )
)
)
)
result2)

(define (vmovl_high_s8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (/  e0.new  %arg4))
  (define %lastidx2 (-  %arg3  1))
  (define %6 (+  %3.new0  %lastidx2))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg2 %arg1))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %13.downcasted0 (extract  %highidx0 %arg0 %8.downcasted0.ab0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vcgt_u32  %arg1.perm %arg0.perm b.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm )
(define result.perm
(apply
concat
(for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
 (apply
 concat
 (for/list ([e0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
  (define %lastidx0.perm (-  %elemsize0.perm  1))
  (define %3.perm (+  e0.new.perm  %lastidx0.perm))
  (define %4.perm (extract  %3.perm e0.new.perm a.perm))
  (define %10.perm (extract  %3.perm e0.new.perm b.perm))
  (define %12.downcasted0.ab0.perm (bvgt %4.perm %10.perm %arg2.perm ))
  (define %19.perm (if (equal? %12.downcasted0.ab0.perm #t) %arg0.perm %arg1.perm))
  %19.perm
 )
 )
)
)
)
result.perm)

(define (vrshr_n_u64  %arg5 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg6 %arg7 %arg8 %arg9 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx0))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0.ab0 (bvsizeext  %9 %arg4 %arg9))
  (define %11.downcasted0.ab0 (bvaddnw %10.downcasted0.ab0 %3.downcasted0 %arg4 %arg8 ))
  (define %12.downcasted0 (bvlshr  %11.downcasted0.ab0  %1.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg7))
  (define %22.downcasted0 (extract  %highidx0 %arg7 %12.downcasted0))
  (define %23.ab0 (bvaddnw %arg5 %22.downcasted0 %elemsize0 %arg6 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vqdmull_high_n_s16  %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 a))
(define %7 (extract  15 0 b))
(define %8.downcasted0.ab0 (bvsizeext  %7 %elemsize0 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg5))
  (define %lastidx1 (-  %arg4  1))
  (define %12 (+  %9.new0  %lastidx1))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %elemsize0 %arg3))
  (define %15.downcasted0 (bvmul  %arg2  %14.downcasted0.ab0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0.ab0 %elemsize0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vsraq_n_s32  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg3 %arg2))
  (define %10.downcasted0 (bvashr  %8.downcasted0.ab0  n))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %10.downcasted0))
  (define %21.ab0 (bvaddnw %19 %20.downcasted0 %elemsize0 %arg0 ))
  %21.ab0
 )
 )
)
)
)
result)

(define (vabdl_high_s16  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %7.new0 (/  e0.new  %arg9))
  (define %lastidx2 (-  %arg6  1))
  (define %10 (+  %7.new0  %lastidx2))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg8 %arg7))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0.ab0 (bvsizeext  %17 %arg5 %arg4))
  (define %19.downcasted0.ab0 (bvsubnw %12.downcasted0.ab0 %18.downcasted0.ab0 %arg8 %arg3 ))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0.ab0)) (bitvector 32)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21.downcasted0 (extract  %highidx0 %arg2 %20.downcasted0))
  (define %31.ab0 (bvaddnw %arg0 %21.downcasted0 %elemsize0 %arg1 ))
  %31.ab0
 )
 )
)
)
)
result2)

(define (vmlsq_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0.ab0 (bvsizeext  %4 %arg3 %arg4))
  (define %11.downcasted0.ab0 (bvsizeext  %9 %arg3 %arg2))
  (define %12.downcasted0 (bvmul  %10.downcasted0.ab0  %11.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %13.downcasted0 (extract  %highidx0 %arg1 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23.ab0 (bvsubnw %22 %13.downcasted0 %elemsize0 %arg0 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vabdq_s32  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg7 %arg6))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg5 %arg4))
  (define %13.downcasted0.ab0 (bvsubnw %6.downcasted0.ab0 %12.downcasted0.ab0 %arg7 %arg3 ))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0.ab0)) (bitvector 64)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %15.downcasted0 (extract  %highidx0 %arg2 %14.downcasted0))
  (define %25.ab0 (bvaddnw %arg0 %15.downcasted0 %elemsize0 %arg1 ))
  %25.ab0
 )
 )
)
)
)
result2)

(define (vpmaxq_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %2.new0 (*  e0.new  %arg7))
  (define %lastidx3 (-  %arg6  1))
  (define %6 (+  %2.new0  %lastidx3))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  %arg5))
  (define %10 (+  %9.new0  %arg4))
  (define %11 (*  %10  %arg3))
  (define %lastidx2 (-  %arg2  1))
  (define %16 (+  %11  %lastidx2))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0.ab0 (bvmax %7 %17 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %24.downcasted0 (extract  %highidx0 %arg0 %19.downcasted0.ab0))
  %24.downcasted0
 )
 )
)
)
)
result)

(define (vshrq_n_u8  %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg3))
  (define %11.downcasted0 (bvlshr  %9.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21.downcasted0 (extract  %highidx0 %arg2 %11.downcasted0))
  (define %22.ab0 (bvaddnw %arg0 %21.downcasted0 %elemsize0 %arg1 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vqdmlal_s32  %arg3 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx1))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg0 %arg5))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg0 %arg4))
  (define %12.downcasted0 (bvmul  %arg3  %5.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0.ab0 %arg0))
  (define %15.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0.ab0 (bvaddnw %19 %13.downcasted0 %arg0 %arg1 ))
  %22.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vshr_n_s16  %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg3))
  (define %11.downcasted0 (bvashr  %9.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21.downcasted0 (extract  %highidx0 %arg2 %11.downcasted0))
  (define %22.ab0 (bvaddnw %arg0 %21.downcasted0 %elemsize0 %arg1 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vrshr_n_s32  %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx0))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0.ab0 (bvsizeext  %9 %arg8 %arg7))
  (define %11.downcasted0.ab0 (bvaddnw %10.downcasted0.ab0 %3.downcasted0 %arg8 %arg6 ))
  (define %12.downcasted0 (bvashr  %11.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %22.downcasted0 (extract  %highidx0 %arg5 %12.downcasted0))
  (define %23.ab0 (bvaddnw %arg3 %22.downcasted0 %elemsize0 %arg4 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vadd_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14.ab0 (bvaddnw %4 %9 %elemsize0 %arg0 ))
  %14.ab0
 )
 )
)
)
)
result)

(define (vuqaddq_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg4))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg2))
  (define %16.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg5 %arg1 ))
  (define %17.downcasted0.ab0 (bvsaturate  %16.downcasted0.ab0 32 %elemsize0 %arg0))
  %17.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vtst_u64  %arg0.norm %arg1.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %3.norm (+  e0.new.norm  %lastidx0.norm))
  (define %4.norm (extract  %3.norm e0.new.norm a.norm))
  (define %9.norm (extract  %3.norm e0.new.norm b.norm))
  (define %10.norm (bvand  %4.norm  %9.norm))
  (define %11.norm (bvzero  %10.norm))
  (define %12.norm (not  %11.norm))
  (define %19.norm (if (equal? %12.norm #t) %arg0.norm %arg1.norm))
  %19.norm
 )
 )
)
)
)
result.norm)

(define (vnegq_s64  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg1))
  (define %6.downcasted0 (bvneg  %5.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %11.downcasted0 (extract  %highidx0 %arg0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)

(define (vqdmull_high_n_s32  %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg3 %arg4 %arg5 )
(define %2 (extract  127 64 a))
(define %7 (extract  31 0 b))
(define %8.downcasted0.ab0 (bvsizeext  %7 %elemsize0 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg5))
  (define %lastidx1 (-  %arg4  1))
  (define %12 (+  %9.new0  %lastidx1))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %elemsize0 %arg3))
  (define %15.downcasted0 (bvmul  %arg2  %14.downcasted0.ab0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0.ab0 %elemsize0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vmull_n_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %4 (extract  15 0 b))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg5))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %arg2  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %13.downcasted0 (extract  %highidx0 %arg4 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)

(define (vrsra_n_s64  %arg1 %arg0 a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %1.downcasted0.ab0 (bvsizeext  n %arg4 %arg3))
(define %2.downcasted0.ab0 (bvsubnw %1.downcasted0.ab0 %arg1 %arg4 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx0))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg4 %arg8))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg4 %arg7 ))
  (define %11.downcasted0 (bvashr  %10.downcasted0.ab0  %1.downcasted0.ab0))
  (define %20 (extract  %7 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg6))
  (define %21.downcasted0 (extract  %highidx0 %arg6 %11.downcasted0))
  (define %22.ab0 (bvaddnw %20 %21.downcasted0 %elemsize0 %arg5 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vabdl_u32  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx2))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg9 %arg8))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg7 %arg6))
  (define %13.downcasted0.ab0 (bvsubnw %6.downcasted0.ab0 %12.downcasted0.ab0 %arg9 %arg5 ))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0.ab0)) (bitvector 64)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %15.downcasted0 (extract  %highidx0 %arg4 %14.downcasted0))
  (define %25.ab0 (bvaddnw %arg1 %15.downcasted0 %arg0 %arg2 ))
  %25.ab0
 )
 )
)
)
)
result2)

(define (vabdl_high_u32  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %7.new0 (/  e0.new  %arg9))
  (define %lastidx2 (-  %arg6  1))
  (define %10 (+  %7.new0  %lastidx2))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg8 %arg7))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0.ab0 (bvsizeext  %17 %arg5 %arg4))
  (define %19.downcasted0.ab0 (bvsubnw %12.downcasted0.ab0 %18.downcasted0.ab0 %arg8 %arg3 ))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0.ab0)) (bitvector 64)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21.downcasted0 (extract  %highidx0 %arg2 %20.downcasted0))
  (define %31.ab0 (bvaddnw %arg0 %21.downcasted0 %elemsize0 %arg1 ))
  %31.ab0
 )
 )
)
)
)
result2)

(define (vsubl_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg7 %arg6))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg5 %arg4))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg7 %arg3 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %17.downcasted0 (extract  %highidx0 %arg1 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vsubl_high_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %6.new0 (/  e0.new  %arg7))
  (define %lastidx2 (-  %arg4  1))
  (define %9 (+  %6.new0  %lastidx2))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg6 %arg5))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0.ab0 (bvsizeext  %16 %arg3 %arg2))
  (define %18.downcasted0.ab0 (bvsubnw %11.downcasted0.ab0 %17.downcasted0.ab0 %arg6 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %23.downcasted0 (extract  %highidx0 %arg0 %18.downcasted0.ab0))
  %23.downcasted0
 )
 )
)
)
)
result)

(define (vsubw_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %0.new0 (*  e0.new  %arg7))
  (define %lastidx0 (-  %arg0  1))
  (define %3 (+  %0.new0  %lastidx0))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg6 %arg5))
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg4 %arg3))
  (define %12.downcasted0.ab0 (bvsubnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg6 %arg2 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %17.downcasted0 (extract  %highidx0 %arg1 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vsubw_high_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg7 %arg6))
  (define %9.new0 (/  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg3 %arg2))
  (define %15.downcasted0.ab0 (bvsubnw %8.downcasted0.ab0 %14.downcasted0.ab0 %arg7 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %20.downcasted0 (extract  %highidx0 %arg0 %15.downcasted0.ab0))
  %20.downcasted0
 )
 )
)
)
)
result)

(define (vmov_n_u16  value %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  value
 )
 )
)
)
)
result)

(define (vmin_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0.ab0 (bvmin %4 %10 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17.downcasted0 (extract  %highidx0 %arg0 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vrshrn_n_s16  %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define %2.downcasted0.ab0 (bvsubnw n %arg1 64 %arg2 ))
(define %3.downcasted0 (bvshl  %arg0  %2.downcasted0.ab0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg8))
  (define %lastidx2 (-  %arg7  1))
  (define %7 (+  %4.new0  %lastidx2))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0.ab0 (bvsizeext  %8 %arg6 %arg5))
  (define %10.downcasted0.ab0 (bvaddnw %9.downcasted0.ab0 %3.downcasted0 %arg6 %arg4 ))
  (define %11.downcasted0 (bvlshr  %10.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %16.downcasted0 (extract  %highidx0 %arg3 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vmlsl_high_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0.ab0 (bvsizeext  %7 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (/  e0.new  %arg6))
  (define %lastidx2 (-  %arg5  1))
  (define %12 (+  %9.new0  %lastidx2))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0.ab0 (bvsizeext  %13 %arg1 %arg4))
  (define %15.downcasted0 (bvmul  %14.downcasted0.ab0  %8.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %16.downcasted0 (extract  %highidx0 %arg3 %15.downcasted0))
  (define %lastidx0 (-  %elemsize0  1))
  (define %20 (+  e0.new  %lastidx0))
  (define %25 (extract  %20 e0.new a))
  (define %26.ab0 (bvsubnw %25 %16.downcasted0 %elemsize0 %arg2 ))
  %26.ab0
 )
 )
)
)
)
result)

(define (vmlal_u8  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx2))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg6))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg5 %arg4))
  (define %12.downcasted0 (bvmul  %5.downcasted0.ab0  %11.downcasted0.ab0))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %13.downcasted0 (extract  %highidx0 %arg3 %12.downcasted0))
  (define %14.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %17 (+  %14.new0  %lastidx0))
  (define %18 (extract  %17 %14.new0 a))
  (define %19.ab0 (bvaddnw %18 %13.downcasted0 %arg0 %arg1 ))
  %19.ab0
 )
 )
)
)
)
result)

(define (vqdmlsl_n_s16  %arg5 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
(define %4 (extract  15 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg2 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx1))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg2 %arg6))
  (define %12.downcasted0 (bvmul  %arg5  %11.downcasted0.ab0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0.ab0 %arg2))
  (define %15.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %18 (+  %15.new0  %lastidx0))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0.ab0 (bvsubnw %19 %13.downcasted0 %arg2 %arg3 ))
  %22.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vsraq_n_u8  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx0))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0.ab0 (bvsizeext  %7 %arg3 %arg2))
  (define %10.downcasted0 (bvlshr  %8.downcasted0.ab0  n))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %20.downcasted0 (extract  %highidx0 %arg1 %10.downcasted0))
  (define %21.ab0 (bvaddnw %19 %20.downcasted0 %elemsize0 %arg0 ))
  %21.ab0
 )
 )
)
)
)
result)

(define (vmlaq_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0.ab0 (bvsizeext  %4 %arg3 %arg4))
  (define %11.downcasted0.ab0 (bvsizeext  %9 %arg3 %arg2))
  (define %12.downcasted0 (bvmul  %10.downcasted0.ab0  %11.downcasted0.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %13.downcasted0 (extract  %highidx0 %arg1 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23.ab0 (bvaddnw %22 %13.downcasted0 %elemsize0 %arg0 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vmvn_s16  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)

(define (vuzp2_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %5.new0 (/  e0.new  %arg2))
  (define %6 (+  %5.new0  %arg1))
  (define %7 (*  %6  %arg0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %12 (+  %7  %lastidx1))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)

(define (vqrshld_s64  %arg5 %arg4 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg6 %arg7 %arg8 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new b))
  (define %6.ab0 (bvsizeext  %5 %arg8 %arg7))
  (define %7 (bvneg  %6.ab0))
  (define %8.ab0 (bvsubnw %7 %arg5 %arg8 %arg6 ))
  (define %9 (bvshl  %arg4  %8.ab0))
  (define %14 (extract  %4 e0.new a))
  (define %15.ab0 (bvsizeext  %14 %arg3 %arg2))
  (define %16.ab0 (bvaddnw %15.ab0 %9 %arg3 %arg1 ))
  (define %17 (bvshl  %16.ab0  %6.ab0))
  (define %22.ab0 (bvsaturate  %17 %arg8 %elemsize0 %arg0))
  %22.ab0
 )
 )
)
)
)
result)

(define (vzip2q_s64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([p0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define p0.new.div (/  p0.new  %arg6))
  (define %7 (+  %arg4  p0.new.div))
  (define %8 (*  %7  %arg3))
  (define %lastidx1 (-  %elemsize0  1))
  (define %12 (+  %8  %lastidx1))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)

(define (vsubq_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14.ab0 (bvsubnw %4 %9 %elemsize0 %arg0 ))
  %14.ab0
 )
 )
)
)
)
result)

(define (vqshrn_n_s64  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %3.new0 (*  e0.new  %arg2))
  (define %lastidx1 (-  %arg1  1))
  (define %6 (+  %3.new0  %lastidx1))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0.ab0 (bvsaturate  %10.downcasted0 %arg1 %elemsize0 %arg0))
  %15.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vhadd_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0.ab0 (bvsizeext  %4 %arg5 %arg4))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg3 %arg2))
  (define %12.downcasted0.ab0 (bvaddnw %5.downcasted0.ab0 %11.downcasted0.ab0 %arg5 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17.downcasted0 (extract  %highidx0 %arg0 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vshll_high_n_s8  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %5.new0 (/  e0.new  %arg4))
  (define %lastidx2 (-  %arg3  1))
  (define %8 (+  %5.new0  %lastidx2))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0.ab0 (bvsizeext  %9 %arg2 %arg1))
  (define %11.downcasted0 (bvshl  %10.downcasted0.ab0  n))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %16.downcasted0 (extract  %highidx0 %arg0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)

(define (vdotq_s32  r a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
 (define %lastidx0 (-  %outerlanesize0  1))
 (define %83.clone.0 (+  e0.new  %lastidx0))
 (define %84.clone.0 (extract  %83.clone.0 e0.new r))
 (define result2 %84.clone.0)
 (define %16.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %1.new0 (+  e0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize0  1))
  (define %5.new0 (+  %1.new0  %lastidx2))
  (define %6 (extract  %5.new0 %1.new0 a))
  (define %7.ab0 (bvsizeext  %6 %outerlanesize0 %arg2))
  (define %14 (extract  %5.new0 %1.new0 b))
  (define %15.ab0 (bvsizeext  %14 %outerlanesize0 %arg1))
  (define %16 (bvmul  %7.ab0  %15.ab0))
  %16
 )
))
 (define %lastidx1 (-  %outerlanesize0  1))
 (define %88.clone.4.new1 (+  e0.new  %lastidx1))
 (define %16.acc0.ab0 (bvaddnw %16.ext0.red result2 %outerlanesize0 %arg0))
 %16.acc0.ab0
)
)
)
result2)

(define (vmax_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  e0.new  %lastidx0))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0.ab0 (bvmax %4 %10 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17.downcasted0 (extract  %highidx0 %arg0 %12.downcasted0.ab0))
  %17.downcasted0
 )
 )
)
)
)
result)

(define (vmlsl_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define %4 (extract  15 0 c))
(define %5.downcasted0.ab0 (bvsizeext  %4 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %9 (+  e0.new  %lastidx2))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0.ab0 (bvsizeext  %10 %arg1 %arg6))
  (define %12.downcasted0 (bvmul  %11.downcasted0.ab0  %5.downcasted0.ab0))
  (define %lastidx1 (-  %arg2  1))
  (define %highidx0 (+  %lastidx1  %arg5))
  (define %13.downcasted0 (extract  %highidx0 %arg5 %12.downcasted0))
  (define %14.new0 (*  e0.new  %arg4))
  (define %lastidx0 (-  %arg2  1))
  (define %17 (+  %14.new0  %lastidx0))
  (define %22 (extract  %17 %14.new0 a))
  (define %23.ab0 (bvsubnw %22 %13.downcasted0 %arg2 %arg3 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vzip_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([p0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %9 (+  p0.new  %lastidx1))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)

(define (vqrdmulhq_n_s32  %arg4 %arg3 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg5 %arg6 )
(define %5 (extract  31 0 b))
(define %6.downcasted0.ab0 (bvsizeext  %5 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg1 %arg6))
  (define %13.downcasted0 (bvmul  %12.downcasted0.ab0  %6.downcasted0.ab0))
  (define %14.downcasted0.ab0 (bvaddnw %13.downcasted0 %arg4 %arg1 %arg5 ))
  (define %19.downcasted0 (bvashr  %14.downcasted0.ab0  %arg3))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 128 %elemsize0 %arg2))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmulh_n_s16  %arg3 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 )
(define %5 (extract  15 0 b))
(define %6.downcasted0.ab0 (bvsizeext  %5 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg1 %arg4))
  (define %13.downcasted0 (bvmul  %12.downcasted0.ab0  %6.downcasted0.ab0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  %arg3))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 %arg1 %elemsize0 %arg2))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqrdmulhq_s16  %arg2 %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg3 %arg4 %arg5 %arg6 )
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
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg5 %arg6))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg5 %arg4))
  (define %13.downcasted0 (bvmul  %6.downcasted0.ab0  %12.downcasted0.ab0))
  (define %14.downcasted0.ab0 (bvaddnw %13.downcasted0 %arg2 %arg5 %arg3 ))
  (define %19.downcasted0 (bvashr  %14.downcasted0.ab0  %arg1))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 64 %elemsize0 %arg0))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqrdmulhq_n_s16  %arg4 %arg3 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg5 %arg6 )
(define %5 (extract  15 0 b))
(define %6.downcasted0.ab0 (bvsizeext  %5 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg1 %arg6))
  (define %13.downcasted0 (bvmul  %12.downcasted0.ab0  %6.downcasted0.ab0))
  (define %14.downcasted0.ab0 (bvaddnw %13.downcasted0 %arg4 %arg1 %arg5 ))
  (define %19.downcasted0 (bvashr  %14.downcasted0.ab0  %arg3))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 64 %elemsize0 %arg2))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmulhq_n_s32  %arg3 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 )
(define %5 (extract  31 0 b))
(define %6.downcasted0.ab0 (bvsizeext  %5 %arg1 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg1 %arg4))
  (define %13.downcasted0 (bvmul  %12.downcasted0.ab0  %6.downcasted0.ab0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  %arg3))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 %arg1 %elemsize0 %arg2))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqrdmulh_s32  %arg2 %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg3 %arg4 %arg5 %arg6 )
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
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg5 %arg6))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg5 %arg4))
  (define %13.downcasted0 (bvmul  %6.downcasted0.ab0  %12.downcasted0.ab0))
  (define %14.downcasted0.ab0 (bvaddnw %13.downcasted0 %arg2 %arg5 %arg3 ))
  (define %19.downcasted0 (bvashr  %14.downcasted0.ab0  %arg1))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 128 %elemsize0 %arg0))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)

(define (vqdmulh_s16  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 )
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
  (define %6.downcasted0.ab0 (bvsizeext  %5 %arg3 %arg4))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0.ab0 (bvsizeext  %11 %arg3 %arg2))
  (define %13.downcasted0 (bvmul  %6.downcasted0.ab0  %12.downcasted0.ab0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  %arg1))
  (define %20.downcasted0.ab0 (bvsaturate  %19.downcasted0 %arg3 %elemsize0 %arg0))
  %20.downcasted0.ab0
 )
 )
)
)
)
result)


;; ================================================================================

