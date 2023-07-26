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

(define (vqrdmulh_s32  %arg4 %arg2 %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg3 %arg5 %arg6 )
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
  (define %8.ab0 (bvsizeext  %7 192 %arg6))
  (define %13 (extract  %6 e0.new b))
  (define %14.ab0 (bvsizeext  %13 192 %arg5))
  (define %15 (bvmul  %arg4  %8.ab0))
  (define %16 (bvmul  %15  %14.ab0))
  (define %17.ab0 (bvaddnw %16 %arg2 192 %arg3 ))
  (define %22 (bvashr  %17.ab0  %arg1))
  (define %23.ab0 (bvsaturate  %22 192 %elemsize0 %arg0))
  %23.ab0
 )
 )
)
)
)
result)

(define (vqshrn_n_s64  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %5.new0 (*  e0.new  %arg4))
  (define %lastidx1 (-  %arg3  1))
  (define %10 (+  %5.new0  %lastidx1))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.ab0 (bvsizeext  %12 192 %arg2))
  (define %15 (bvashr  %13.ab0  %1.ab0))
  (define %20.ab0 (bvsaturate  %15 192 %elemsize0 %arg1))
  %20.ab0
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

(define (vcltzq_s64  %arg1.norm %arg0.norm %arg2.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %7.ab0.norm (bvlt %6.ab0.norm %arg2.norm %arg3.norm ))
  (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
  %14.norm
 )
 )
)
)
)
result.norm)

(define (vsub_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %10 (extract  %4 e0.new b))
  (define %15.ab0 (bvsubnw %5 %10 %elemsize0 %arg0 ))
  %15.ab0
 )
 )
)
)
)
result)

(define (vqdmlsl_n_s16  %arg9 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg10 )
(define %7 (extract  15 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx1))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg10))
  (define %16 (bvmul  %arg9  %15.ab0))
  (define %17 (bvmul  %16  %8.ab0))
  (define %19.ab0 (bvsaturate  %17 192 %arg8 %arg7))
  (define %21.new0 (*  e0.new  %arg6))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %28 (extract  %26 %21.new0 a))
  (define %29.ab0 (bvsizeext  %28 192 %arg5))
  (define %30.ab0 (bvsizeext  %19.ab0 192 %arg4))
  (define %31.ab0 (bvsubnw %29.ab0 %30.ab0 192 %arg3 ))
  (define %41.ab0 (bvsaturate  %31.ab0 192 %arg1 %arg2))
  %41.ab0
 )
 )
)
)
)
result)

(define (vabal_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx2))
  (define %8 (extract  %7 e0.new b))
  (define %9.ab0 (bvsizeext  %8 192 %arg6))
  (define %14 (extract  %7 e0.new c))
  (define %15.ab0 (bvsizeext  %14 192 %arg5))
  (define %18.ab0 (bvsubnw %9.ab0 %15.ab0 192 %arg4 ))
  (define %19 (integer->bitvector (abs (bitvector->integer %18.ab0)) (bitvector 192)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %20 (extract  %highidx0 %arg3 %19))
  (define %22.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %27 (+  %22.new0  %lastidx0))
  (define %37 (extract  %27 %22.new0 a))
  (define %38.ab0 (bvaddnw %37 %20 %arg0 %arg1 ))
  %38.ab0
 )
 )
)
)
)
result2)

(define (vabdq_u8  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %5 (+  e0.new  %lastidx0))
  (define %6 (extract  %5 e0.new a))
  (define %7.ab0 (bvsizeext  %6 192 %arg5))
  (define %12 (extract  %5 e0.new b))
  (define %13.ab0 (bvsizeext  %12 192 %arg4))
  (define %15.ab0 (bvsubnw %7.ab0 %13.ab0 192 %arg3 ))
  (define %16 (integer->bitvector (abs (bitvector->integer %15.ab0)) (bitvector 192)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %17 (extract  %highidx0 %arg2 %16))
  (define %27.ab0 (bvaddnw %arg0 %17 %elemsize0 %arg1 ))
  %27.ab0
 )
 )
)
)
)
result2)

(define (vqrshl_s64  b.norm %arg13.norm %arg11.norm %arg10.norm %arg8.norm %arg7.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg9.norm %arg12.norm %arg14.norm %arg15.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg15.norm))
  (define %8.norm (bvneg  %7.ab0.norm))
  (define %9.ab0.norm (bvsubnw %8.norm %arg13.norm 192 %arg14.norm ))
  (define %11.ab0.norm (bvgt %9.ab0.norm %arg11.norm %arg12.norm ))
  (define %12.norm (bvshl  %arg10.norm  %9.ab0.norm))
  (define %13.ab0.norm (bvsubnw %arg8.norm %9.ab0.norm 192 %arg9.norm ))
  (define %14.norm (bvlshr  %arg7.norm  %13.ab0.norm))
  (define %15.norm (if (equal? %11.ab0.norm #t) %12.norm %14.norm))
  (define %20.norm (extract  %5.norm e0.new.norm a.norm))
  (define %21.ab0.norm (bvsizeext  %20.norm 192 %arg6.norm))
  (define %22.ab0.norm (bvaddnw %21.ab0.norm %15.norm 192 %arg5.norm ))
  (define %24.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %25.norm (bvshl  %22.ab0.norm  %7.ab0.norm))
  (define %26.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %27.norm (bvashr  %22.ab0.norm  %26.ab0.norm))
  (define %28.norm (if (equal? %24.ab0.norm #t) %25.norm %27.norm))
  (define %33.ab0.norm (bvsaturate  %28.norm 192 %elemsize0.norm %arg0.norm))
  %33.ab0.norm
 )
 )
)
)
)
result.norm)

(define (vmull_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
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
  (define %7.ab0 (bvsizeext  %6 192 %arg4))
  (define %12 (extract  %5 e0.new b))
  (define %13.ab0 (bvsizeext  %12 192 %arg3))
  (define %24 (bvmul  %7.ab0  %13.ab0))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %25 (extract  %highidx0 %arg1 %24))
  %25
 )
 )
)
)
)
result)

(define (vmovl_s8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %7.ab0 (bvsizeext  %6 192 %arg3))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %19 (extract  %highidx0 %arg1 %7.ab0))
  %19
 )
 )
)
)
)
result)

(define (vqrdmulhq_n_s32  %arg5 %arg3 %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg4 %arg6 )
(define %6 (extract  31 0 b))
(define %7.ab0 (bvsizeext  %6 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %12 (+  e0.new  %lastidx0))
  (define %13 (extract  %12 e0.new a))
  (define %14.ab0 (bvsizeext  %13 192 %arg6))
  (define %15 (bvmul  %arg5  %14.ab0))
  (define %16 (bvmul  %15  %7.ab0))
  (define %17.ab0 (bvaddnw %16 %arg3 192 %arg4 ))
  (define %22 (bvashr  %17.ab0  %arg2))
  (define %23.ab0 (bvsaturate  %22 192 %elemsize0 %arg1))
  %23.ab0
 )
 )
)
)
)
result)

(define (vqrshlb_u8  b.norm %arg13.norm %arg11.norm %arg10.norm %arg8.norm %arg7.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg9.norm %arg12.norm %arg14.norm %arg15.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg15.norm))
  (define %8.norm (bvneg  %7.ab0.norm))
  (define %9.ab0.norm (bvsubnw %8.norm %arg13.norm 192 %arg14.norm ))
  (define %11.ab0.norm (bvgt %9.ab0.norm %arg11.norm %arg12.norm ))
  (define %12.norm (bvshl  %arg10.norm  %9.ab0.norm))
  (define %13.ab0.norm (bvsubnw %arg8.norm %9.ab0.norm 192 %arg9.norm ))
  (define %14.norm (bvlshr  %arg7.norm  %13.ab0.norm))
  (define %15.norm (if (equal? %11.ab0.norm #t) %12.norm %14.norm))
  (define %20.norm (extract  %5.norm e0.new.norm a.norm))
  (define %21.ab0.norm (bvsizeext  %20.norm 192 %arg6.norm))
  (define %22.ab0.norm (bvaddnw %21.ab0.norm %15.norm 192 %arg5.norm ))
  (define %24.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %25.norm (bvshl  %22.ab0.norm  %7.ab0.norm))
  (define %26.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %27.norm (bvlshr  %22.ab0.norm  %26.ab0.norm))
  (define %28.norm (if (equal? %24.ab0.norm #t) %25.norm %27.norm))
  (define %33.ab0.norm (bvsaturate  %28.norm 192 %elemsize0.norm %arg0.norm))
  %33.ab0.norm
 )
 )
)
)
)
result.norm)

(define (vneg_s16  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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
  (define %6.ab0 (bvsizeext  %5 192 %arg1))
  (define %7 (bvneg  %6.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %13 (extract  %highidx0 %arg0 %7))
  %13
 )
 )
)
)
)
result)

(define (vsqaddq_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %7.ab0 (bvsizeext  %5 192 %arg3))
  (define %12 (extract  %4 e0.new a))
  (define %13.ab0 (bvsizeext  %12 192 %arg2))
  (define %18.ab0 (bvaddnw %7.ab0 %13.ab0 192 %arg1 ))
  (define %19.ab0 (bvsaturate  %18.ab0 192 %elemsize0 %arg0))
  %19.ab0
 )
 )
)
)
)
result)

(define (vcle_s32  %arg1.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm b.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %11.norm (extract  %4.norm e0.new.norm a.norm))
  (define %12.ab0.norm (bvsizeext  %11.norm 192 %arg3.norm))
  (define %13.ab0.norm (bvge %6.ab0.norm %12.ab0.norm %arg2.norm ))
  (define %20.norm (if (equal? %13.ab0.norm #t) %arg0.norm %arg1.norm))
  %20.norm
 )
 )
)
)
)
result.norm)

(define (vmlal_n_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %7 (extract  31 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx2))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg5))
  (define %18 (bvmul  %15.ab0  %8.ab0))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %19 (extract  %highidx0 %arg4 %18))
  (define %21.new0 (*  e0.new  %arg3))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %36 (extract  %26 %21.new0 a))
  (define %37.ab0 (bvaddnw %36 %19 %arg1 %arg2 ))
  %37.ab0
 )
 )
)
)
)
result)

(define (vuzp1_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (*  e0.new  %arg0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %14 (+  %9.new0  %lastidx1))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)

(define (vrshrn_n_s64  %arg6 %arg4 %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %3.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %5.ab0 (bvgt %3.ab0 %arg4 %arg5 ))
(define %6 (bvshl  %arg3  %3.ab0))
(define %7.ab0 (bvsubnw %arg1 %3.ab0 192 %arg2 ))
(define %8 (bvlshr  %arg0  %7.ab0))
(define %9 (if (equal? %5.ab0 #t) %6 %8))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %12.new0 (*  e0.new  %arg13))
  (define %lastidx2 (-  %arg12  1))
  (define %17 (+  %12.new0  %lastidx2))
  (define %19 (extract  %17 %12.new0 a))
  (define %20.ab0 (bvsizeext  %19 192 %arg11))
  (define %21.ab0 (bvaddnw %20.ab0 %9 192 %arg10 ))
  (define %22 (bvlshr  %21.ab0  %1.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg9))
  (define %28 (extract  %highidx0 %arg9 %22))
  %28
 )
 )
)
)
)
result)

(define (vhsubq_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %13.ab0 (bvsubnw %6.ab0 %12.ab0 192 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %18 (extract  %highidx0 %arg0 %13.ab0))
  %18
 )
 )
)
)
)
result)

(define (vqdmull_n_s32  %arg4 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg5 )
(define %6 (extract  31 0 b))
(define %7.ab0 (bvsizeext  %6 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %12 (+  e0.new  %lastidx1))
  (define %13 (extract  %12 e0.new a))
  (define %14.ab0 (bvsizeext  %13 192 %arg5))
  (define %15 (bvmul  %arg4  %14.ab0))
  (define %16 (bvmul  %15  %7.ab0))
  (define %18.ab0 (bvsaturate  %16 192 %arg1 %arg3))
  %18.ab0
 )
 )
)
)
)
result)

(define (vshl_s64  b.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg6.norm))
  (define %12.norm (extract  %5.norm e0.new.norm a.norm))
  (define %13.ab0.norm (bvsizeext  %12.norm 192 %arg5.norm))
  (define %16.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %17.norm (bvshl  %13.ab0.norm  %7.ab0.norm))
  (define %18.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %19.norm (bvashr  %13.ab0.norm  %18.ab0.norm))
  (define %20.norm (if (equal? %16.ab0.norm #t) %17.norm %19.norm))
  (define %lastidx1.norm (-  %elemsize0.norm  1))
  (define %highidx0.norm (+  %lastidx1.norm  %arg0.norm))
  (define %26.norm (extract  %highidx0.norm %arg0.norm %20.norm))
  %26.norm
 )
 )
)
)
)
result.norm)

(define (vshrn_n_u64  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %5.new0 (*  e0.new  %arg4))
  (define %lastidx2 (-  %arg3  1))
  (define %10 (+  %5.new0  %lastidx2))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.ab0 (bvsizeext  %12 192 %arg2))
  (define %15 (bvlshr  %13.ab0  %1.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %21 (extract  %highidx0 %arg1 %15))
  %21
 )
 )
)
)
)
result)

(define (vrhaddq_s32  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
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
  (define %6.ab0 (bvsizeext  %5 192 %arg5))
  (define %11 (extract  %4 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg4))
  (define %17.ab0 (bvaddnw %6.ab0 %12.ab0 192 %arg3 ))
  (define %18.ab0 (bvaddnw %17.ab0 %arg1 192 %arg2 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %19 (extract  %highidx0 %arg0 %18.ab0))
  %19
 )
 )
)
)
)
result)

(define (vhadd_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %13.ab0 (bvaddnw %6.ab0 %12.ab0 192 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %18 (extract  %highidx0 %arg0 %13.ab0))
  %18
 )
 )
)
)
)
result)

(define (vdotq_u32  r a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
 (define %lastidx0 (-  %outerlanesize0  1))
 (define %120.clone.0 (+  e0.new  %lastidx0))
 (define %121.clone.0 (extract  %120.clone.0 e0.new r))
 (define result2 %121.clone.0)
 (define %29.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (+  e0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize0  1))
  (define %11.new0 (+  %4.new0  %lastidx2))
  (define %13 (extract  %11.new0 %4.new0 a))
  (define %14.ab0 (bvsizeext  %13 %outerlanesize0 %arg2))
  (define %27 (extract  %11.new0 %4.new0 b))
  (define %28.ab0 (bvsizeext  %27 %outerlanesize0 %arg1))
  (define %29 (bvmul  %14.ab0  %28.ab0))
  %29
 )
))
 (define %lastidx1 (-  %outerlanesize0  1))
 (define %126.clone.4.new1 (+  e0.new  %lastidx1))
 (define %29.acc0.ab0 (bvaddnw %29.ext0.red result2 %outerlanesize0 %arg0))
 %29.acc0.ab0
)
)
)
result2)

(define (vqshld_s64  b.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg6.norm))
  (define %12.norm (extract  %5.norm e0.new.norm a.norm))
  (define %13.ab0.norm (bvsizeext  %12.norm 192 %arg5.norm))
  (define %16.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %17.norm (bvshl  %13.ab0.norm  %7.ab0.norm))
  (define %18.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %19.norm (bvashr  %13.ab0.norm  %18.ab0.norm))
  (define %20.norm (if (equal? %16.ab0.norm #t) %17.norm %19.norm))
  (define %25.ab0.norm (bvsaturate  %20.norm 192 %elemsize0.norm %arg0.norm))
  %25.ab0.norm
 )
 )
)
)
)
result.norm)

(define (vrshr_n_u8  %arg9 %arg6 %arg4 %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg10 %arg11 %arg12 %arg13 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %2.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %4.ab0 (bvgt %2.ab0 %arg4 %arg5 ))
(define %5 (bvshl  %arg3  %2.ab0))
(define %6.ab0 (bvsubnw %arg1 %2.ab0 192 %arg2 ))
(define %7 (bvlshr  %arg0  %6.ab0))
(define %8 (if (equal? %4.ab0 #t) %5 %7))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %14 (+  e0.new  %lastidx0))
  (define %15 (extract  %14 e0.new a))
  (define %16.ab0 (bvsizeext  %15 192 %arg13))
  (define %17.ab0 (bvaddnw %16.ab0 %8 192 %arg12 ))
  (define %18 (bvlshr  %17.ab0  %1.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg11))
  (define %29 (extract  %highidx0 %arg11 %18))
  (define %30.ab0 (bvaddnw %arg9 %29 %elemsize0 %arg10 ))
  %30.ab0
 )
 )
)
)
)
result)

(define (vtst_u16  %arg1.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %10.norm (extract  %4.norm e0.new.norm b.norm))
  (define %11.norm (bvand  %5.norm  %10.norm))
  (define %12.norm (bvzero  %11.norm))
  (define %13.norm (not  %12.norm))
  (define %20.norm (if (equal? %13.norm #t) %arg0.norm %arg1.norm))
  %20.norm
 )
 )
)
)
)
result.norm)

(define (vaba_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %4 (+  e0.new  %lastidx0))
  (define %5 (extract  %4 e0.new b))
  (define %6.ab0 (bvsizeext  %5 192 %arg4))
  (define %11 (extract  %4 e0.new c))
  (define %12.ab0 (bvsizeext  %11 192 %arg3))
  (define %14.ab0 (bvsubnw %6.ab0 %12.ab0 192 %arg2 ))
  (define %15 (integer->bitvector (abs (bitvector->integer %14.ab0)) (bitvector 192)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %16 (extract  %highidx0 %arg1 %15))
  (define %25 (extract  %4 e0.new a))
  (define %26.ab0 (bvaddnw %25 %16 %elemsize0 %arg0 ))
  %26.ab0
 )
 )
)
)
)
result2)

(define (vshl_u32  b.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg6.norm))
  (define %12.norm (extract  %5.norm e0.new.norm a.norm))
  (define %13.ab0.norm (bvsizeext  %12.norm 192 %arg5.norm))
  (define %16.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %17.norm (bvshl  %13.ab0.norm  %7.ab0.norm))
  (define %18.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %19.norm (bvlshr  %13.ab0.norm  %18.ab0.norm))
  (define %20.norm (if (equal? %16.ab0.norm #t) %17.norm %19.norm))
  (define %lastidx1.norm (-  %elemsize0.norm  1))
  (define %highidx0.norm (+  %lastidx1.norm  %arg0.norm))
  (define %26.norm (extract  %highidx0.norm %arg0.norm %20.norm))
  %26.norm
 )
 )
)
)
)
result.norm)

(define (vqdmullh_s16  %arg3 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %6 (+  e0.new  %lastidx1))
  (define %7 (extract  %6 e0.new a))
  (define %8.ab0 (bvsizeext  %7 192 %arg5))
  (define %13 (extract  %6 e0.new b))
  (define %14.ab0 (bvsizeext  %13 192 %arg4))
  (define %15 (bvmul  %arg3  %8.ab0))
  (define %16 (bvmul  %15  %14.ab0))
  (define %18.ab0 (bvsaturate  %16 192 %arg0 %arg2))
  %18.ab0
 )
 )
)
)
)
result)

(define (vqdmlalh_s16  %arg8 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg9 %arg10 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx1))
  (define %8 (extract  %7 e0.new b))
  (define %9.ab0 (bvsizeext  %8 192 %arg10))
  (define %14 (extract  %7 e0.new c))
  (define %15.ab0 (bvsizeext  %14 192 %arg9))
  (define %16 (bvmul  %arg8  %9.ab0))
  (define %17 (bvmul  %16  %15.ab0))
  (define %19.ab0 (bvsaturate  %17 192 %arg7 %arg6))
  (define %21.new0 (*  e0.new  %arg5))
  (define %lastidx0 (-  %arg0  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %28 (extract  %26 %21.new0 a))
  (define %29.ab0 (bvsizeext  %28 192 %arg4))
  (define %30.ab0 (bvsizeext  %19.ab0 192 %arg3))
  (define %31.ab0 (bvaddnw %29.ab0 %30.ab0 192 %arg2 ))
  (define %41.ab0 (bvsaturate  %31.ab0 192 %arg0 %arg1))
  %41.ab0
 )
 )
)
)
)
result)

(define (vqdmulhq_n_s32  %arg3 %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg4 )
(define %4 (extract  31 0 b))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
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
  (define %12.ab0 (bvsizeext  %11 192 %arg4))
  (define %13 (bvmul  %arg3  %12.ab0))
  (define %14 (bvmul  %13  %5.ab0))
  (define %20 (bvashr  %14  %arg2))
  (define %21.ab0 (bvsaturate  %20 192 %elemsize0 %arg1))
  %21.ab0
 )
 )
)
)
)
result)

(define (vsraq_n_u8  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
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
  (define %8.ab0 (bvsizeext  %7 192 %arg3))
  (define %10 (bvlshr  %8.ab0  %1.ab0))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21 (extract  %highidx0 %arg2 %10))
  (define %22.ab0 (bvaddnw %19 %21 %elemsize0 %arg1 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vcgez_s32  %arg0.norm %arg1.norm %arg2.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %7.ab0.norm (bvge %6.ab0.norm %arg2.norm %arg3.norm ))
  (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
  %14.norm
 )
 )
)
)
)
result.norm)

(define (vaddw_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg5))
  (define %lastidx0 (-  %arg0  1))
  (define %9 (+  %4.new0  %lastidx0))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.ab0 (bvsizeext  %11 192 %arg4))
  (define %lastidx2 (-  %elemsize0  1))
  (define %16 (+  e0.new  %lastidx2))
  (define %17 (extract  %16 e0.new b))
  (define %18.ab0 (bvsizeext  %17 192 %arg3))
  (define %19.ab0 (bvaddnw %12.ab0 %18.ab0 192 %arg2 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %30 (extract  %highidx0 %arg1 %19.ab0))
  %30
 )
 )
)
)
)
result)

(define (vsubhn_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %7.new0 (*  e0.new  %arg3))
  (define %lastidx2 (-  %arg2  1))
  (define %12 (+  %7.new0  %lastidx2))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24.ab0 (bvsubnw %14 %23 %arg2 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %32 (extract  %highidx0 %arg0 %24.ab0))
  %32
 )
 )
)
)
)
result)

(define (vmax_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %13.ab0 (bvmax %6.ab0 %12.ab0 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %19 (extract  %highidx0 %arg0 %13.ab0))
  %19
 )
 )
)
)
)
result)

(define (vqsub_u64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %13.ab0 (bvsubnw %6.ab0 %12.ab0 192 %arg1 ))
  (define %18.ab0 (bvsaturate  %13.ab0 192 %elemsize0 %arg0))
  %18.ab0
 )
 )
)
)
)
result)

(define (vmlal_s16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx2))
  (define %9 (extract  %8 e0.new b))
  (define %10.ab0 (bvsizeext  %9 192 %arg5))
  (define %15 (extract  %8 e0.new c))
  (define %16.ab0 (bvsizeext  %15 192 %arg4))
  (define %19 (bvmul  %10.ab0  %16.ab0))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %20 (extract  %highidx0 %arg3 %19))
  (define %22.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %27 (+  %22.new0  %lastidx0))
  (define %29 (extract  %27 %22.new0 a))
  (define %30.ab0 (bvaddnw %29 %20 %arg0 %arg1 ))
  %30.ab0
 )
 )
)
)
)
result)

(define (vqdmlal_n_s16  %arg9 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg10 )
(define %7 (extract  15 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx1))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg10))
  (define %16 (bvmul  %arg9  %15.ab0))
  (define %17 (bvmul  %16  %8.ab0))
  (define %19.ab0 (bvsaturate  %17 192 %arg8 %arg7))
  (define %21.new0 (*  e0.new  %arg6))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %28 (extract  %26 %21.new0 a))
  (define %29.ab0 (bvsizeext  %28 192 %arg5))
  (define %30.ab0 (bvsizeext  %19.ab0 192 %arg4))
  (define %31.ab0 (bvaddnw %29.ab0 %30.ab0 192 %arg3 ))
  (define %41.ab0 (bvsaturate  %31.ab0 192 %arg1 %arg2))
  %41.ab0
 )
 )
)
)
)
result)

(define (vabdl_u8  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx2))
  (define %9 (extract  %8 e0.new a))
  (define %10.ab0 (bvsizeext  %9 192 %arg7))
  (define %15 (extract  %8 e0.new b))
  (define %16.ab0 (bvsizeext  %15 192 %arg6))
  (define %19.ab0 (bvsubnw %10.ab0 %16.ab0 192 %arg5 ))
  (define %20 (integer->bitvector (abs (bitvector->integer %19.ab0)) (bitvector 192)))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %21 (extract  %highidx0 %arg4 %20))
  (define %39.ab0 (bvaddnw %arg1 %21 %arg0 %arg2 ))
  %39.ab0
 )
 )
)
)
)
result2)

(define (vqdmlsl_s32  %arg8 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg9 %arg10 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %7 (+  e0.new  %lastidx1))
  (define %8 (extract  %7 e0.new b))
  (define %9.ab0 (bvsizeext  %8 192 %arg10))
  (define %14 (extract  %7 e0.new c))
  (define %15.ab0 (bvsizeext  %14 192 %arg9))
  (define %16 (bvmul  %arg8  %9.ab0))
  (define %17 (bvmul  %16  %15.ab0))
  (define %19.ab0 (bvsaturate  %17 192 %arg7 %arg6))
  (define %21.new0 (*  e0.new  %arg5))
  (define %lastidx0 (-  %arg0  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %28 (extract  %26 %21.new0 a))
  (define %29.ab0 (bvsizeext  %28 192 %arg4))
  (define %30.ab0 (bvsizeext  %19.ab0 192 %arg3))
  (define %31.ab0 (bvsubnw %29.ab0 %30.ab0 192 %arg2 ))
  (define %41.ab0 (bvsaturate  %31.ab0 192 %arg0 %arg1))
  %41.ab0
 )
 )
)
)
)
result)

(define (vsra_n_s16  a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
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
  (define %8.ab0 (bvsizeext  %7 192 %arg3))
  (define %10 (bvashr  %8.ab0  %1.ab0))
  (define %19 (extract  %6 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %21 (extract  %highidx0 %arg2 %10))
  (define %22.ab0 (bvaddnw %19 %21 %elemsize0 %arg1 ))
  %22.ab0
 )
 )
)
)
)
result)

(define (vzip2q_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
   (define %iterator1.new.div (/  %iterator1.new  %arg9))
   (define %25 (+  %arg5  %iterator1.new.div))
   (define %26 (*  %25  %arg4))
   (define %lastidx3 (-  %elemsize1  1))
   (define %30 (+  %26  %lastidx3))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
   (define %iterator0.new.div (/  %iterator0.new  %arg3))
   (define %10 (+  %arg1  %iterator0.new.div))
   (define %11 (*  %10  %arg0))
   (define %lastidx1 (-  %elemsize0  1))
   (define %15 (+  %11  %lastidx1))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)

(define (vmlsl_n_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %7 (extract  31 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx2))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg5))
  (define %18 (bvmul  %15.ab0  %8.ab0))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %19 (extract  %highidx0 %arg4 %18))
  (define %21.new0 (*  e0.new  %arg3))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %36 (extract  %26 %21.new0 a))
  (define %37.ab0 (bvsubnw %36 %19 %arg1 %arg2 ))
  %37.ab0
 )
 )
)
)
)
result)

(define (vtrn1_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
   (define %28.new0 (*  %iterator1.new  %arg1))
   (define %lastidx2 (-  %elemsize1  1))
   (define %33 (+  %28.new0  %lastidx2))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
   (define %3.new0 (*  %iterator0.new  %arg0))
   (define %lastidx0 (-  %elemsize0  1))
   (define %8 (+  %3.new0  %lastidx0))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)

(define (vqdmulh_n_s16  %arg3 %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg4 )
(define %4 (extract  15 0 b))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
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
  (define %12.ab0 (bvsizeext  %11 192 %arg4))
  (define %13 (bvmul  %arg3  %12.ab0))
  (define %14 (bvmul  %13  %5.ab0))
  (define %20 (bvashr  %14  %arg2))
  (define %21.ab0 (bvsaturate  %20 192 %elemsize0 %arg1))
  %21.ab0
 )
 )
)
)
)
result)

(define (vqabs_s8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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
  (define %6.ab0 (bvsizeext  %5 192 %arg1))
  (define %7 (integer->bitvector (abs (bitvector->integer %6.ab0)) (bitvector 192)))
  (define %12.ab0 (bvsaturate  %7 192 %elemsize0 %arg0))
  %12.ab0
 )
 )
)
)
)
result)

(define (vcge_s32  %arg0.norm %arg1.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %11.norm (extract  %4.norm e0.new.norm b.norm))
  (define %12.ab0.norm (bvsizeext  %11.norm 192 %arg3.norm))
  (define %13.ab0.norm (bvge %6.ab0.norm %12.ab0.norm %arg2.norm ))
  (define %20.norm (if (equal? %13.ab0.norm #t) %arg0.norm %arg1.norm))
  %20.norm
 )
 )
)
)
)
result.norm)

(define (vabs_s8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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
  (define %6.ab0 (bvsizeext  %5 192 %arg1))
  (define %7 (integer->bitvector (abs (bitvector->integer %6.ab0)) (bitvector 192)))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %13 (extract  %highidx0 %arg0 %7))
  %13
 )
 )
)
)
)
result)

(define (vqdmulhq_s16  %arg2 %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg3 %arg4 )
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
  (define %6.ab0 (bvsizeext  %5 192 %arg4))
  (define %11 (extract  %4 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg3))
  (define %13 (bvmul  %arg2  %6.ab0))
  (define %14 (bvmul  %13  %12.ab0))
  (define %20 (bvashr  %14  %arg1))
  (define %21.ab0 (bvsaturate  %20 192 %elemsize0 %arg0))
  %21.ab0
 )
 )
)
)
)
result)

(define (vqdmull_n_s16  %arg4 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg5 )
(define %6 (extract  15 0 b))
(define %7.ab0 (bvsizeext  %6 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %12 (+  e0.new  %lastidx1))
  (define %13 (extract  %12 e0.new a))
  (define %14.ab0 (bvsizeext  %13 192 %arg5))
  (define %15 (bvmul  %arg4  %14.ab0))
  (define %16 (bvmul  %15  %7.ab0))
  (define %18.ab0 (bvsaturate  %16 192 %arg1 %arg3))
  %18.ab0
 )
 )
)
)
)
result)

(define (vqshrnh_n_u16  a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %5.new0 (*  e0.new  %arg4))
  (define %lastidx1 (-  %arg3  1))
  (define %10 (+  %5.new0  %lastidx1))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.ab0 (bvsizeext  %12 192 %arg2))
  (define %15 (bvlshr  %13.ab0  %1.ab0))
  (define %20.ab0 (bvsaturate  %15 192 %elemsize0 %arg1))
  %20.ab0
 )
 )
)
)
)
result)

(define (vpmin_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
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
  (define %27 (extract  %highidx0 %arg0 %21.ab0))
  %27
 )
 )
)
)
)
result)

(define (vqdmlsl_n_s32  %arg9 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg10 )
(define %7 (extract  31 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx1))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg10))
  (define %16 (bvmul  %arg9  %15.ab0))
  (define %17 (bvmul  %16  %8.ab0))
  (define %19.ab0 (bvsaturate  %17 192 %arg8 %arg7))
  (define %21.new0 (*  e0.new  %arg6))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %28 (extract  %26 %21.new0 a))
  (define %29.ab0 (bvsizeext  %28 192 %arg5))
  (define %30.ab0 (bvsizeext  %19.ab0 192 %arg4))
  (define %31.ab0 (bvsubnw %29.ab0 %30.ab0 192 %arg3 ))
  (define %41.ab0 (bvsaturate  %31.ab0 192 %arg1 %arg2))
  %41.ab0
 )
 )
)
)
)
result)

(define (vqshld_u64  b.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg6.norm))
  (define %12.norm (extract  %5.norm e0.new.norm a.norm))
  (define %13.ab0.norm (bvsizeext  %12.norm 192 %arg5.norm))
  (define %16.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %17.norm (bvshl  %13.ab0.norm  %7.ab0.norm))
  (define %18.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %19.norm (bvlshr  %13.ab0.norm  %18.ab0.norm))
  (define %20.norm (if (equal? %16.ab0.norm #t) %17.norm %19.norm))
  (define %25.ab0.norm (bvsaturate  %20.norm 192 %elemsize0.norm %arg0.norm))
  %25.ab0.norm
 )
 )
)
)
)
result.norm)

(define (vcgtq_s8  %arg1.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %11.norm (extract  %4.norm e0.new.norm b.norm))
  (define %12.ab0.norm (bvsizeext  %11.norm 192 %arg3.norm))
  (define %13.ab0.norm (bvgt %6.ab0.norm %12.ab0.norm %arg2.norm ))
  (define %20.norm (if (equal? %13.ab0.norm #t) %arg0.norm %arg1.norm))
  %20.norm
 )
 )
)
)
)
result.norm)

(define (vadd_s8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %10 (extract  %4 e0.new b))
  (define %15.ab0 (bvaddnw %5 %10 %elemsize0 %arg0 ))
  %15.ab0
 )
 )
)
)
)
result)

(define (vrsubhn_s16  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (*  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %14 (+  %9.new0  %lastidx2))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26.ab0 (bvsubnw %16 %25 %arg4 %arg3 ))
  (define %27.ab0 (bvaddnw %26.ab0 %arg1 16 %arg2 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %34 (extract  %highidx0 %arg0 %27.ab0))
  %34
 )
 )
)
)
)
result)

(define (vqshlb_n_s8  a.norm %arg4.norm %arg2.norm n.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg1.norm %arg3.norm %arg5.norm %arg6.norm )
(define %1.ab0.norm (bvsizeext  n.norm 192 %arg0.norm))
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %6.norm (+  e0.new.norm  %lastidx0.norm))
  (define %7.norm (extract  %6.norm e0.new.norm a.norm))
  (define %8.ab0.norm (bvsizeext  %7.norm 192 %arg6.norm))
  (define %10.ab0.norm (bvgt %1.ab0.norm %arg4.norm %arg5.norm ))
  (define %11.norm (bvshl  %8.ab0.norm  %1.ab0.norm))
  (define %12.ab0.norm (bvsubnw %arg2.norm %1.ab0.norm 192 %arg3.norm ))
  (define %13.norm (bvashr  %8.ab0.norm  %12.ab0.norm))
  (define %14.norm (if (equal? %10.ab0.norm #t) %11.norm %13.norm))
  (define %19.ab0.norm (bvsaturate  %14.norm 192 %elemsize0.norm %arg1.norm))
  %19.ab0.norm
 )
 )
)
)
)
result.norm)

(define (vrshlq_u16  b.norm %arg13.norm %arg11.norm %arg10.norm %arg8.norm %arg7.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg9.norm %arg12.norm %arg14.norm %arg15.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg15.norm))
  (define %8.norm (bvneg  %7.ab0.norm))
  (define %9.ab0.norm (bvsubnw %8.norm %arg13.norm 192 %arg14.norm ))
  (define %11.ab0.norm (bvgt %9.ab0.norm %arg11.norm %arg12.norm ))
  (define %12.norm (bvshl  %arg10.norm  %9.ab0.norm))
  (define %13.ab0.norm (bvsubnw %arg8.norm %9.ab0.norm 192 %arg9.norm ))
  (define %14.norm (bvlshr  %arg7.norm  %13.ab0.norm))
  (define %15.norm (if (equal? %11.ab0.norm #t) %12.norm %14.norm))
  (define %20.norm (extract  %5.norm e0.new.norm a.norm))
  (define %21.ab0.norm (bvsizeext  %20.norm 192 %arg6.norm))
  (define %22.ab0.norm (bvaddnw %21.ab0.norm %15.norm 192 %arg5.norm ))
  (define %24.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %25.norm (bvshl  %22.ab0.norm  %7.ab0.norm))
  (define %26.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %27.norm (bvlshr  %22.ab0.norm  %26.ab0.norm))
  (define %28.norm (if (equal? %24.ab0.norm #t) %25.norm %27.norm))
  (define %lastidx1.norm (-  %elemsize0.norm  1))
  (define %highidx0.norm (+  %lastidx1.norm  %arg0.norm))
  (define %34.norm (extract  %highidx0.norm %arg0.norm %28.norm))
  %34.norm
 )
 )
)
)
)
result.norm)

(define (vmls_n_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %4 (extract  31 0 c))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg3))
  (define %14 (bvmul  %12.ab0  %5.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %15 (extract  %highidx0 %arg2 %14))
  (define %24 (extract  %10 e0.new a))
  (define %25.ab0 (bvsubnw %24 %15 %elemsize0 %arg1 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vraddhn_s32  %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %9.new0 (*  e0.new  %arg5))
  (define %lastidx2 (-  %arg4  1))
  (define %14 (+  %9.new0  %lastidx2))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26.ab0 (bvaddnw %16 %25 %arg4 %arg3 ))
  (define %27.ab0 (bvaddnw %26.ab0 %arg1 32 %arg2 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %34 (extract  %highidx0 %arg0 %27.ab0))
  %34
 )
 )
)
)
)
result)

(define (vcltq_s32  %arg0.norm %arg1.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm b.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %11.norm (extract  %4.norm e0.new.norm a.norm))
  (define %12.ab0.norm (bvsizeext  %11.norm 192 %arg3.norm))
  (define %13.ab0.norm (bvgt %6.ab0.norm %12.ab0.norm %arg2.norm ))
  (define %20.norm (if (equal? %13.ab0.norm #t) %arg0.norm %arg1.norm))
  %20.norm
 )
 )
)
)
)
result.norm)

(define (vrshrq_n_s64  %arg9 %arg6 %arg4 %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg10 %arg11 %arg12 %arg13 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %2.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %4.ab0 (bvgt %2.ab0 %arg4 %arg5 ))
(define %5 (bvshl  %arg3  %2.ab0))
(define %6.ab0 (bvsubnw %arg1 %2.ab0 192 %arg2 ))
(define %7 (bvlshr  %arg0  %6.ab0))
(define %8 (if (equal? %4.ab0 #t) %5 %7))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %14 (+  e0.new  %lastidx0))
  (define %15 (extract  %14 e0.new a))
  (define %16.ab0 (bvsizeext  %15 192 %arg13))
  (define %17.ab0 (bvaddnw %16.ab0 %8 192 %arg12 ))
  (define %18 (bvashr  %17.ab0  %1.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg11))
  (define %29 (extract  %highidx0 %arg11 %18))
  (define %30.ab0 (bvaddnw %arg9 %29 %elemsize0 %arg10 ))
  %30.ab0
 )
 )
)
)
)
result)

(define (vmlal_n_s16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %7 (extract  15 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx2))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg5))
  (define %18 (bvmul  %15.ab0  %8.ab0))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %19 (extract  %highidx0 %arg4 %18))
  (define %21.new0 (*  e0.new  %arg3))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %36 (extract  %26 %21.new0 a))
  (define %37.ab0 (bvaddnw %36 %19 %arg1 %arg2 ))
  %37.ab0
 )
 )
)
)
)
result)

(define (vrshlq_s32  b.norm %arg13.norm %arg11.norm %arg10.norm %arg8.norm %arg7.norm %arg3.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg9.norm %arg12.norm %arg14.norm %arg15.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %5.norm (+  e0.new.norm  %lastidx0.norm))
  (define %6.norm (extract  %5.norm e0.new.norm b.norm))
  (define %7.ab0.norm (bvsizeext  %6.norm 192 %arg15.norm))
  (define %8.norm (bvneg  %7.ab0.norm))
  (define %9.ab0.norm (bvsubnw %8.norm %arg13.norm 192 %arg14.norm ))
  (define %11.ab0.norm (bvgt %9.ab0.norm %arg11.norm %arg12.norm ))
  (define %12.norm (bvshl  %arg10.norm  %9.ab0.norm))
  (define %13.ab0.norm (bvsubnw %arg8.norm %9.ab0.norm 192 %arg9.norm ))
  (define %14.norm (bvlshr  %arg7.norm  %13.ab0.norm))
  (define %15.norm (if (equal? %11.ab0.norm #t) %12.norm %14.norm))
  (define %20.norm (extract  %5.norm e0.new.norm a.norm))
  (define %21.ab0.norm (bvsizeext  %20.norm 192 %arg6.norm))
  (define %22.ab0.norm (bvaddnw %21.ab0.norm %15.norm 192 %arg5.norm ))
  (define %24.ab0.norm (bvgt %7.ab0.norm %arg3.norm %arg4.norm ))
  (define %25.norm (bvshl  %22.ab0.norm  %7.ab0.norm))
  (define %26.ab0.norm (bvsubnw %arg1.norm %7.ab0.norm 192 %arg2.norm ))
  (define %27.norm (bvashr  %22.ab0.norm  %26.ab0.norm))
  (define %28.norm (if (equal? %24.ab0.norm #t) %25.norm %27.norm))
  (define %lastidx1.norm (-  %elemsize0.norm  1))
  (define %highidx0.norm (+  %lastidx1.norm  %arg0.norm))
  (define %34.norm (extract  %highidx0.norm %arg0.norm %28.norm))
  %34.norm
 )
 )
)
)
)
result.norm)

(define (vminq_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %19 (extract  %highidx0 %arg0 %13.ab0))
  %19
 )
 )
)
)
)
result)

(define (vuzp2_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %7.new0 (/  e0.new  %arg2))
  (define %8 (+  %7.new0  %arg1))
  (define %9 (*  %8  %arg0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %14 (+  %9  %lastidx1))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)

(define (vceqz_s64  %arg2.norm %arg0.norm %arg1.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg3.norm))
  (define %7.norm (bveq  %6.ab0.norm  %arg2.norm))
  (define %14.norm (if (equal? %7.norm #t) %arg0.norm %arg1.norm))
  %14.norm
 )
 )
)
)
)
result.norm)

(define (vmla_n_s32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %4 (extract  31 0 c))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg3))
  (define %14 (bvmul  %12.ab0  %5.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %15 (extract  %highidx0 %arg2 %14))
  (define %24 (extract  %10 e0.new a))
  (define %25.ab0 (bvaddnw %24 %15 %elemsize0 %arg1 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vmla_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %10 (extract  %4 e0.new c))
  (define %12.ab0 (bvsizeext  %5 192 %arg3))
  (define %13.ab0 (bvsizeext  %10 192 %arg2))
  (define %14 (bvmul  %12.ab0  %13.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %15 (extract  %highidx0 %arg1 %14))
  (define %24 (extract  %4 e0.new a))
  (define %25.ab0 (bvaddnw %24 %15 %elemsize0 %arg0 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vshll_n_u8  a.norm %arg6.norm %arg4.norm n.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm %arg7.norm %arg8.norm )
(define %1.ab0.norm (bvsizeext  n.norm 192 %arg0.norm))
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx2.norm (-  %elemsize0.norm  1))
  (define %7.norm (+  e0.new.norm  %lastidx2.norm))
  (define %8.norm (extract  %7.norm e0.new.norm a.norm))
  (define %9.ab0.norm (bvsizeext  %8.norm 192 %arg8.norm))
  (define %11.ab0.norm (bvgt %1.ab0.norm %arg6.norm %arg7.norm ))
  (define %12.norm (bvshl  %9.ab0.norm  %1.ab0.norm))
  (define %13.ab0.norm (bvsubnw %arg4.norm %1.ab0.norm 192 %arg5.norm ))
  (define %14.norm (bvlshr  %9.ab0.norm  %13.ab0.norm))
  (define %15.norm (if (equal? %11.ab0.norm #t) %12.norm %14.norm))
  (define %lastidx1.norm (-  %arg1.norm  1))
  (define %highidx0.norm (+  %lastidx1.norm  %arg2.norm))
  (define %26.norm (extract  %highidx0.norm %arg2.norm %15.norm))
  %26.norm
 )
 )
)
)
)
result.norm)

(define (vtrn2_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
   (define %18.new0 (/  %iterator1.new  %arg6))
   (define %19 (+  %18.new0  %arg5))
   (define %20 (*  %19  %arg4))
   (define %lastidx2 (-  %elemsize1  1))
   (define %25 (+  %20  %lastidx2))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
   (define %9.new0 (/  %iterator0.new  %arg2))
   (define %10 (+  %9.new0  %arg1))
   (define %11 (*  %10  %arg0))
   (define %lastidx1 (-  %elemsize0  1))
   (define %16 (+  %11  %lastidx1))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)

(define (vqdmlal_n_s32  %arg9 a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg10 )
(define %7 (extract  31 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx1))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg10))
  (define %16 (bvmul  %arg9  %15.ab0))
  (define %17 (bvmul  %16  %8.ab0))
  (define %19.ab0 (bvsaturate  %17 192 %arg8 %arg7))
  (define %21.new0 (*  e0.new  %arg6))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %28 (extract  %26 %21.new0 a))
  (define %29.ab0 (bvsizeext  %28 192 %arg5))
  (define %30.ab0 (bvsizeext  %19.ab0 192 %arg4))
  (define %31.ab0 (bvaddnw %29.ab0 %30.ab0 192 %arg3 ))
  (define %41.ab0 (bvsaturate  %31.ab0 192 %arg1 %arg2))
  %41.ab0
 )
 )
)
)
)
result)

(define (vmull_n_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %6 (extract  15 0 b))
(define %7.ab0 (bvsizeext  %6 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %12 (+  e0.new  %lastidx2))
  (define %13 (extract  %12 e0.new a))
  (define %14.ab0 (bvsizeext  %13 192 %arg4))
  (define %17 (bvmul  %14.ab0  %7.ab0))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %18 (extract  %highidx0 %arg3 %17))
  %18
 )
 )
)
)
)
result)

(define (vmulq_n_u32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define %4 (extract  31 0 b))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
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
  (define %12.ab0 (bvsizeext  %11 192 %arg2))
  (define %14 (bvmul  %12.ab0  %5.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %15 (extract  %highidx0 %arg1 %14))
  %15
 )
 )
)
)
)
result)

(define (vaddhn_s64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %7.new0 (*  e0.new  %arg3))
  (define %lastidx2 (-  %arg2  1))
  (define %12 (+  %7.new0  %lastidx2))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24.ab0 (bvaddnw %14 %23 %arg2 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %32 (extract  %highidx0 %arg0 %24.ab0))
  %32
 )
 )
)
)
)
result)

(define (vpadal_u16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg9))
  (define %lastidx3 (-  %elemsize0  1))
  (define %9 (+  %4.new0  %lastidx3))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.ab0 (bvsizeext  %10 192 %arg8))
  (define %12.new0 (/  e0.new  %arg7))
  (define %13 (+  %12.new0  %arg6))
  (define %14 (*  %13  %arg5))
  (define %lastidx2 (-  %elemsize0  1))
  (define %19 (+  %14  %lastidx2))
  (define %20 (extract  %19 %14 b))
  (define %21.ab0 (bvsizeext  %20 192 %arg4))
  (define %24.ab0 (bvaddnw %11.ab0 %21.ab0 192 %arg3 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %25 (extract  %highidx0 %arg2 %24.ab0))
  (define %lastidx0 (-  %arg0  1))
  (define %32 (+  %4.new0  %lastidx0))
  (define %42 (extract  %32 %4.new0 a))
  (define %43.ab0 (bvaddnw %42 %25 %arg0 %arg1 ))
  %43.ab0
 )
 )
)
)
)
result2)

(define (vqadd_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %13.ab0 (bvaddnw %6.ab0 %12.ab0 192 %arg1 ))
  (define %18.ab0 (bvsaturate  %13.ab0 192 %elemsize0 %arg0))
  %18.ab0
 )
 )
)
)
)
result)

(define (vceqq_u8  a.norm %arg1.norm %arg0.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %10.norm (extract  %4.norm e0.new.norm b.norm))
  (define %11.norm (bveq  %5.norm  %10.norm))
  (define %18.norm (if (equal? %11.norm #t) %arg0.norm %arg1.norm))
  %18.norm
 )
 )
)
)
)
result.norm)

(define (vzip1q_u64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
   (define %lastidx3 (-  %elemsize1  1))
   (define %30 (+  %iterator1.new  %lastidx3))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
   (define %lastidx1 (-  %elemsize0  1))
   (define %15 (+  %iterator0.new  %lastidx1))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)

(define (vmlaq_n_s16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %4 (extract  15 0 c))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg3))
  (define %14 (bvmul  %12.ab0  %5.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %15 (extract  %highidx0 %arg2 %14))
  (define %24 (extract  %10 e0.new a))
  (define %25.ab0 (bvaddnw %24 %15 %elemsize0 %arg1 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vqrdmulhq_n_s16  %arg5 %arg3 %arg2 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg4 %arg6 )
(define %6 (extract  15 0 b))
(define %7.ab0 (bvsizeext  %6 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %12 (+  e0.new  %lastidx0))
  (define %13 (extract  %12 e0.new a))
  (define %14.ab0 (bvsizeext  %13 192 %arg6))
  (define %15 (bvmul  %arg5  %14.ab0))
  (define %16 (bvmul  %15  %7.ab0))
  (define %17.ab0 (bvaddnw %16 %arg3 192 %arg4 ))
  (define %22 (bvashr  %17.ab0  %arg2))
  (define %23.ab0 (bvsaturate  %22 192 %elemsize0 %arg1))
  %23.ab0
 )
 )
)
)
)
result)

(define (vqrshrn_n_s16  %arg6 %arg4 %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %3.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %5.ab0 (bvgt %3.ab0 %arg4 %arg5 ))
(define %6 (bvshl  %arg3  %3.ab0))
(define %7.ab0 (bvsubnw %arg1 %3.ab0 192 %arg2 ))
(define %8 (bvlshr  %arg0  %7.ab0))
(define %9 (if (equal? %5.ab0 #t) %6 %8))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %12.new0 (*  e0.new  %arg13))
  (define %lastidx1 (-  %arg12  1))
  (define %17 (+  %12.new0  %lastidx1))
  (define %19 (extract  %17 %12.new0 a))
  (define %20.ab0 (bvsizeext  %19 192 %arg11))
  (define %21.ab0 (bvaddnw %20.ab0 %9 192 %arg10 ))
  (define %22 (bvashr  %21.ab0  %1.ab0))
  (define %27.ab0 (bvsaturate  %22 192 %elemsize0 %arg9))
  %27.ab0
 )
 )
)
)
)
result)

(define (vshr_n_s64  %arg1 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
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
  (define %9.ab0 (bvsizeext  %8 192 %arg4))
  (define %11 (bvashr  %9.ab0  %1.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %22 (extract  %highidx0 %arg3 %11))
  (define %23.ab0 (bvaddnw %arg1 %22 %elemsize0 %arg2 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vrsra_n_s64  %arg6 %arg4 %arg3 %arg1 %arg0 a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %2.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %4.ab0 (bvgt %2.ab0 %arg4 %arg5 ))
(define %5 (bvshl  %arg3  %2.ab0))
(define %6.ab0 (bvsubnw %arg1 %2.ab0 192 %arg2 ))
(define %7 (bvlshr  %arg0  %6.ab0))
(define %8 (if (equal? %4.ab0 #t) %5 %7))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx0))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg12))
  (define %16.ab0 (bvaddnw %15.ab0 %8 192 %arg11 ))
  (define %17 (bvashr  %16.ab0  %1.ab0))
  (define %26 (extract  %13 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg10))
  (define %28 (extract  %highidx0 %arg10 %17))
  (define %29.ab0 (bvaddnw %26 %28 %elemsize0 %arg9 ))
  %29.ab0
 )
 )
)
)
)
result)

(define (vmovn_s64  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %17.new.high.idx0 (+  %4.new0  %lastidx1))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)

(define (vclez_s16  %arg0.norm %arg1.norm %arg2.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %7.ab0.norm (bvle %6.ab0.norm %arg2.norm %arg3.norm ))
  (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
  %14.norm
 )
 )
)
)
)
result.norm)

(define (vmlsl_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define %7 (extract  15 0 c))
(define %8.ab0 (bvsizeext  %7 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx2))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg5))
  (define %18 (bvmul  %15.ab0  %8.ab0))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg4))
  (define %19 (extract  %highidx0 %arg4 %18))
  (define %21.new0 (*  e0.new  %arg3))
  (define %lastidx0 (-  %arg1  1))
  (define %26 (+  %21.new0  %lastidx0))
  (define %36 (extract  %26 %21.new0 a))
  (define %37.ab0 (bvsubnw %36 %19 %arg1 %arg2 ))
  %37.ab0
 )
 )
)
)
)
result)

(define (vaddl_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
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
  (define %7.ab0 (bvsizeext  %6 192 %arg5))
  (define %12 (extract  %5 e0.new b))
  (define %13.ab0 (bvsizeext  %12 192 %arg4))
  (define %14.ab0 (bvaddnw %7.ab0 %13.ab0 192 %arg3 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %25 (extract  %highidx0 %arg1 %14.ab0))
  %25
 )
 )
)
)
)
result)

(define (vpmax_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
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
  (define %21.ab0 (bvmax %10.ab0 %20.ab0 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %27 (extract  %highidx0 %arg0 %21.ab0))
  %27
 )
 )
)
)
)
result)

(define (vshr_n_u8  %arg1 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 )
(define %1.ab0 (bvsizeext  n 192 %arg0))
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
  (define %9.ab0 (bvsizeext  %8 192 %arg4))
  (define %11 (bvlshr  %9.ab0  %1.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %22 (extract  %highidx0 %arg3 %11))
  (define %23.ab0 (bvaddnw %arg1 %22 %elemsize0 %arg2 ))
  %23.ab0
 )
 )
)
)
)
result)

(define (vmls_n_u16  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define %4 (extract  15 0 c))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %10 (+  e0.new  %lastidx0))
  (define %11 (extract  %10 e0.new b))
  (define %12.ab0 (bvsizeext  %11 192 %arg3))
  (define %14 (bvmul  %12.ab0  %5.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %15 (extract  %highidx0 %arg2 %14))
  (define %24 (extract  %10 e0.new a))
  (define %25.ab0 (bvsubnw %24 %15 %elemsize0 %arg1 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vmulq_n_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
(define %4 (extract  15 0 b))
(define %5.ab0 (bvsizeext  %4 192 %arg0))
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
  (define %12.ab0 (bvsizeext  %11 192 %arg2))
  (define %14 (bvmul  %12.ab0  %5.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %15 (extract  %highidx0 %arg1 %14))
  %15
 )
 )
)
)
)
result)

(define (vmlsl_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %8 (+  e0.new  %lastidx2))
  (define %9 (extract  %8 e0.new b))
  (define %10.ab0 (bvsizeext  %9 192 %arg5))
  (define %15 (extract  %8 e0.new c))
  (define %16.ab0 (bvsizeext  %15 192 %arg4))
  (define %19 (bvmul  %10.ab0  %16.ab0))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %20 (extract  %highidx0 %arg3 %19))
  (define %22.new0 (*  e0.new  %arg2))
  (define %lastidx0 (-  %arg0  1))
  (define %27 (+  %22.new0  %lastidx0))
  (define %29 (extract  %27 %22.new0 a))
  (define %30.ab0 (bvsubnw %29 %20 %arg0 %arg1 ))
  %30.ab0
 )
 )
)
)
)
result)

(define (vqneg_s16  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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
  (define %6.ab0 (bvsizeext  %5 192 %arg1))
  (define %7 (bvneg  %6.ab0))
  (define %12.ab0 (bvsaturate  %7 192 %elemsize0 %arg0))
  %12.ab0
 )
 )
)
)
)
result)

(define (vcgtzd_s64  %arg0.norm %arg1.norm %arg2.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm )
(define result.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %lastidx0.norm (-  %elemsize0.norm  1))
  (define %4.norm (+  e0.new.norm  %lastidx0.norm))
  (define %5.norm (extract  %4.norm e0.new.norm a.norm))
  (define %6.ab0.norm (bvsizeext  %5.norm 192 %arg4.norm))
  (define %7.ab0.norm (bvgt %6.ab0.norm %arg2.norm %arg3.norm ))
  (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
  %14.norm
 )
 )
)
)
)
result.norm)

(define (vmls_u32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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
  (define %10 (extract  %4 e0.new c))
  (define %12.ab0 (bvsizeext  %5 192 %arg3))
  (define %13.ab0 (bvsizeext  %10 192 %arg2))
  (define %14 (bvmul  %12.ab0  %13.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %15 (extract  %highidx0 %arg1 %14))
  (define %24 (extract  %4 e0.new a))
  (define %25.ab0 (bvsubnw %24 %15 %elemsize0 %arg0 ))
  %25.ab0
 )
 )
)
)
)
result)

(define (vmull_n_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
(define %6 (extract  31 0 b))
(define %7.ab0 (bvsizeext  %6 192 %arg0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx2 (-  %elemsize0  1))
  (define %12 (+  e0.new  %lastidx2))
  (define %13 (extract  %12 e0.new a))
  (define %14.ab0 (bvsizeext  %13 192 %arg4))
  (define %17 (bvmul  %14.ab0  %7.ab0))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg3))
  (define %18 (extract  %highidx0 %arg3 %17))
  %18
 )
 )
)
)
)
result)

(define (vrsra_n_u16  %arg6 %arg4 %arg3 %arg1 %arg0 a b n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %2.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %4.ab0 (bvgt %2.ab0 %arg4 %arg5 ))
(define %5 (bvshl  %arg3  %2.ab0))
(define %6.ab0 (bvsubnw %arg1 %2.ab0 192 %arg2 ))
(define %7 (bvlshr  %arg0  %6.ab0))
(define %8 (if (equal? %4.ab0 #t) %5 %7))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %13 (+  e0.new  %lastidx0))
  (define %14 (extract  %13 e0.new b))
  (define %15.ab0 (bvsizeext  %14 192 %arg12))
  (define %16.ab0 (bvaddnw %15.ab0 %8 192 %arg11 ))
  (define %17 (bvlshr  %16.ab0  %1.ab0))
  (define %26 (extract  %13 e0.new a))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg10))
  (define %28 (extract  %highidx0 %arg10 %17))
  (define %29.ab0 (bvaddnw %26 %28 %elemsize0 %arg9 ))
  %29.ab0
 )
 )
)
)
)
result)

(define (vsubl_s32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
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
  (define %7.ab0 (bvsizeext  %6 192 %arg5))
  (define %12 (extract  %5 e0.new b))
  (define %13.ab0 (bvsizeext  %12 192 %arg4))
  (define %14.ab0 (bvsubnw %7.ab0 %13.ab0 192 %arg3 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %25 (extract  %highidx0 %arg1 %14.ab0))
  %25
 )
 )
)
)
)
result)

(define (vqmovn_u32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg3))
  (define %lastidx1 (-  %arg2  1))
  (define %9 (+  %4.new0  %lastidx1))
  (define %11 (extract  %9 %4.new0 a))
  (define %16.ab0 (bvsizeext  %11 192 %arg1))
  (define %17.ab0 (bvsaturate  %16.ab0 192 %elemsize0 %arg0))
  %17.ab0
 )
 )
)
)
)
result)

(define (vmul_s16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
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
  (define %10 (extract  %4 e0.new b))
  (define %12.ab0 (bvsizeext  %5 192 %arg2))
  (define %13.ab0 (bvsizeext  %10 192 %arg1))
  (define %14 (bvmul  %12.ab0  %13.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %15 (extract  %highidx0 %arg0 %14))
  %15
 )
 )
)
)
)
result)

(define (vqrshrnh_n_u16  %arg6 %arg4 %arg3 %arg1 %arg0 a n %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg5 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 )
(define %1.ab0 (bvsizeext  n 192 %arg8))
(define %3.ab0 (bvsubnw %1.ab0 %arg6 192 %arg7 ))
(define %5.ab0 (bvgt %3.ab0 %arg4 %arg5 ))
(define %6 (bvshl  %arg3  %3.ab0))
(define %7.ab0 (bvsubnw %arg1 %3.ab0 192 %arg2 ))
(define %8 (bvlshr  %arg0  %7.ab0))
(define %9 (if (equal? %5.ab0 #t) %6 %8))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %12.new0 (*  e0.new  %arg13))
  (define %lastidx1 (-  %arg12  1))
  (define %17 (+  %12.new0  %lastidx1))
  (define %19 (extract  %17 %12.new0 a))
  (define %20.ab0 (bvsizeext  %19 192 %arg11))
  (define %21.ab0 (bvaddnw %20.ab0 %9 192 %arg10 ))
  (define %22 (bvlshr  %21.ab0  %1.ab0))
  (define %27.ab0 (bvsaturate  %22 192 %elemsize0 %arg9))
  %27.ab0
 )
 )
)
)
)
result)

(define (vpaddq_u32  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
 (define %lastidx0 (-  %outerlanesize0  1))
 (define %22.0 (+  e0.new  %lastidx0))
 (define %24 (extract  %22.0 e0.new %arg0))
 (define result %24)
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define iterator.0.new.div (/  iterator.0.new  %arg4))
  (define %3.new1 (/  e0.new  %arg3))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  %arg2))
  (define %lastidx2 (-  %outerlanesize0  1))
  (define %8.new0 (+  %4  %lastidx2))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %lastidx1 (-  %outerlanesize0  1))
 (define %22.clone.0.new1 (+  e0.new  %lastidx1))
 (define %9.acc0.ab0 (bvaddnw %9.ext0.red result %outerlanesize0 %arg1))
 %9.acc0.ab0
)
)
)
result)

(define (vmvn_u8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
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
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)

(define (vsubw_u8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %4.new0 (*  e0.new  %arg5))
  (define %lastidx0 (-  %arg0  1))
  (define %9 (+  %4.new0  %lastidx0))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.ab0 (bvsizeext  %11 192 %arg4))
  (define %lastidx2 (-  %elemsize0  1))
  (define %16 (+  e0.new  %lastidx2))
  (define %17 (extract  %16 e0.new b))
  (define %18.ab0 (bvsizeext  %17 192 %arg3))
  (define %19.ab0 (bvsubnw %12.ab0 %18.ab0 192 %arg2 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %30 (extract  %highidx0 %arg1 %19.ab0))
  %30
 )
 )
)
)
)
result)


;; ================================================================================

