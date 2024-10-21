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

(define (VMAD_sat_2_UB_UB_UB_UB  src0 src1 src2 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %9.ab0 (bvsizeext  %8 %arg5 %arg6))
  (define %14 (extract  %3 i0.new src1))
  (define %16.ab0 (bvsizeext  %14 %arg5 %arg4))
  (define %15 (bvmulnsw  %9.ab0  %16.ab0 %arg5))
  (define %22 (extract  %3 i0.new src2))
  (define %24.ab0 (bvsizeext  %22 %arg3 %arg2))
  (define %23.ab0 (bvaddnw %15 %24.ab0 %arg5 %arg1 ))
  (define %26.ab0 (bvsaturate  %23.ab0 64 %elemsize0 %arg0))
  %26.ab0
 )
 )
)
)
)
dst)

(define (VBFI_4_UD_UD_UD_UD_UD  %arg4 %arg3 %arg2 %arg0 src0 src1 src2 src3 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  %arg4))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  %arg3))
  (define %12 (bvshl  %arg2  %5))
  (define %13.ab0 (bvsubnw %12 %arg0 %elemsize0 %arg1 ))
  (define %14 (bvshl  %13.ab0  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)

(define (VBFE_32_D_D_D_D  %arg6 %arg5 %arg4 %arg2 %arg0 src0 src1 src2 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  %arg6))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  %arg5))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  %arg4  %5))
  (define %23.ab0 (bvsubnw %22 %arg2 %elemsize0 %arg3 ))
  (define %24 (bvand  %21  %23.ab0))
  (define %25.ab0 (bvsubnw %arg0 %5 %elemsize0 %arg1 ))
  (define %26 (bvshl  %24  %25.ab0))
  (define %28 (bvashr  %26  %25.ab0))
  %28
 )
 )
)
)
)
dst)

(define (VAVG_sat_8_UB_UB_UB  %arg2 %arg1 src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %9.ab0 (bvsizeext  %8 %arg8 %arg7))
  (define %14 (extract  %3 i0.new src1))
  (define %16.ab0 (bvsizeext  %14 %arg6 %arg5))
  (define %15.ab0 (bvaddnw %9.ab0 %16.ab0 %arg8 %arg4 ))
  (define %18.ab0 (bvaddnw %15.ab0 %arg2 64 %arg3 ))
  (define %20 (bvashr  %18.ab0  %arg1))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %21 (extract  %highidx0 %arg0 %20))
  %21
 )
 )
)
)
)
dst)

(define (VMAD_4_B_B_B_B  src0 src1 src2 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %9.ab0 (bvsizeext  %8 %arg5 %arg6))
  (define %14 (extract  %3 i0.new src1))
  (define %16.ab0 (bvsizeext  %14 %arg5 %arg4))
  (define %15 (bvmul  %9.ab0  %16.ab0))
  (define %21 (extract  %3 i0.new src2))
  (define %23.ab0 (bvsizeext  %21 %arg3 %arg2))
  (define %22.ab0 (bvaddnw %15 %23.ab0 %arg5 %arg1 ))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %24 (extract  %highidx0 %arg0 %22.ab0))
  %24
 )
 )
)
)
)
dst)

(define (VMULH_1_D_D_D  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %9.ab0 (bvsizeext  %8 %arg2 %arg3))
  (define %14 (extract  %3 i0.new src1))
  (define %16.ab0 (bvsizeext  %14 %arg2 %arg1))
  (define %15 (bvmul  %9.ab0  %16.ab0))
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %17 (extract  %highidx0 %arg0 %15))
  %17
 )
 )
)
)
)
dst)

(define (VMUL_sat_8_UW_UW_UW  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 %elemsize0))
  %14
 )
 )
)
)
)
dst)

(define (VADD_4_W_W_W  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14.ab0 (bvaddnw %8 %13 %elemsize0 %arg0 ))
  %14.ab0
 )
 )
)
)
)
dst)

(define (VMOV_1_Q_Q  src0 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)

(define (VDP4A_sat_32_D_D_D_D  src0 src1 src2 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 %arg18 %arg19 %arg20 %arg21 %arg22 %arg23 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %0.new0 (*  i0.new  %arg23))
  (define %lastidx0 (-  %arg0  1))
  (define %3 (+  %0.new0  %lastidx0))
  (define %lastidx4 (-  %elemsize0  1))
  (define %9.new.high.idx0 (+  %0.new0  %lastidx4))
  (define %80.new (extract  %9.new.high.idx0 %0.new0 src1))
  (define %10.ab0 (bvsizeext  %80.new %arg21 %arg22))
  (define %150.new (extract  %9.new.high.idx0 %0.new0 src2))
  (define %18.ab0 (bvsizeext  %150.new %arg21 %arg20))
  (define %17 (bvmulnsw  %10.ab0  %18.ab0 %arg21))
  (define %25.new.low.idx (+  %0.new0  %arg19))
  (define %lastidx3 (-  %elemsize0  1))
  (define %25.new.high.idx0 (+  %25.new.low.idx  %lastidx3))
  (define %240.new (extract  %25.new.high.idx0 %25.new.low.idx src1))
  (define %26.ab0 (bvsizeext  %240.new %arg17 %arg18))
  (define %310.new (extract  %25.new.high.idx0 %25.new.low.idx src2))
  (define %34.ab0 (bvsizeext  %310.new %arg17 %arg16))
  (define %33 (bvmulnsw  %26.ab0  %34.ab0 %arg17))
  (define %36.ab0 (bvaddnw %17 %33 %arg21 %arg15 ))
  (define %43.new.low.idx (+  %0.new0  %arg14))
  (define %lastidx2 (-  %elemsize0  1))
  (define %43.new.high.idx0 (+  %43.new.low.idx  %lastidx2))
  (define %420.new (extract  %43.new.high.idx0 %43.new.low.idx src1))
  (define %44.ab0 (bvsizeext  %420.new %arg12 %arg13))
  (define %490.new (extract  %43.new.high.idx0 %43.new.low.idx src2))
  (define %52.ab0 (bvsizeext  %490.new %arg12 %arg11))
  (define %51 (bvmulnsw  %44.ab0  %52.ab0 %arg12))
  (define %54.ab0 (bvaddnw %36.ab0 %51 64 %arg10 ))
  (define %61.new.low.idx (+  %0.new0  %arg9))
  (define %lastidx1 (-  %elemsize0  1))
  (define %61.new.high.idx0 (+  %61.new.low.idx  %lastidx1))
  (define %600.new (extract  %61.new.high.idx0 %61.new.low.idx src1))
  (define %62.ab0 (bvsizeext  %600.new %arg7 %arg8))
  (define %670.new (extract  %61.new.high.idx0 %61.new.low.idx src2))
  (define %70.ab0 (bvsizeext  %670.new %arg7 %arg6))
  (define %69 (bvmulnsw  %62.ab0  %70.ab0 %arg7))
  (define %72.ab0 (bvaddnw %54.ab0 %69 64 %arg5 ))
  (define %78 (extract  %3 %0.new0 src0))
  (define %80.ab0 (bvsizeext  %78 %arg4 %arg3))
  (define %79.ab0 (bvaddnw %72.ab0 %80.ab0 64 %arg2 ))
  (define %82.ab0 (bvsaturate  %79.ab0 64 %arg0 %arg1))
  %82.ab0
 )
 )
)
)
)
dst)

(define (VNOT_32_W_W  src0 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)

(define (VXOR_32_UD_UD_UD  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)

(define (VDP4A_1_UD_UD_UD_UD  src0 src1 src2 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 %arg18 %arg19 %arg20 %arg21 %arg22 %arg23 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %0.new0 (*  i0.new  %arg23))
  (define %lastidx0 (-  %arg0  1))
  (define %3 (+  %0.new0  %lastidx0))
  (define %lastidx5 (-  %elemsize0  1))
  (define %9.new.high.idx0 (+  %0.new0  %lastidx5))
  (define %80.new (extract  %9.new.high.idx0 %0.new0 src1))
  (define %10.ab0 (bvsizeext  %80.new %arg21 %arg22))
  (define %150.new (extract  %9.new.high.idx0 %0.new0 src2))
  (define %18.ab0 (bvsizeext  %150.new %arg21 %arg20))
  (define %17 (bvmul  %10.ab0  %18.ab0))
  (define %24.new.low.idx (+  %0.new0  %arg19))
  (define %lastidx4 (-  %elemsize0  1))
  (define %24.new.high.idx0 (+  %24.new.low.idx  %lastidx4))
  (define %230.new (extract  %24.new.high.idx0 %24.new.low.idx src1))
  (define %25.ab0 (bvsizeext  %230.new %arg17 %arg18))
  (define %300.new (extract  %24.new.high.idx0 %24.new.low.idx src2))
  (define %33.ab0 (bvsizeext  %300.new %arg17 %arg16))
  (define %32 (bvmul  %25.ab0  %33.ab0))
  (define %34.ab0 (bvaddnw %17 %32 %arg21 %arg15 ))
  (define %40.new.low.idx (+  %0.new0  %arg14))
  (define %lastidx3 (-  %elemsize0  1))
  (define %40.new.high.idx0 (+  %40.new.low.idx  %lastidx3))
  (define %390.new (extract  %40.new.high.idx0 %40.new.low.idx src1))
  (define %41.ab0 (bvsizeext  %390.new %arg12 %arg13))
  (define %460.new (extract  %40.new.high.idx0 %40.new.low.idx src2))
  (define %49.ab0 (bvsizeext  %460.new %arg12 %arg11))
  (define %48 (bvmul  %41.ab0  %49.ab0))
  (define %50.ab0 (bvaddnw %34.ab0 %48 64 %arg10 ))
  (define %56.new.low.idx (+  %0.new0  %arg9))
  (define %lastidx2 (-  %elemsize0  1))
  (define %56.new.high.idx0 (+  %56.new.low.idx  %lastidx2))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %57.ab0 (bvsizeext  %550.new %arg7 %arg8))
  (define %620.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %65.ab0 (bvsizeext  %620.new %arg7 %arg6))
  (define %64 (bvmul  %57.ab0  %65.ab0))
  (define %66.ab0 (bvaddnw %50.ab0 %64 64 %arg5 ))
  (define %71 (extract  %3 %0.new0 src0))
  (define %73.ab0 (bvsizeext  %71 %arg4 %arg3))
  (define %72.ab0 (bvaddnw %66.ab0 %73.ab0 64 %arg2 ))
  (define %lastidx1 (-  %arg0  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %74 (extract  %highidx0 %arg1 %72.ab0))
  %74
 )
 )
)
)
)
dst)

(define (VMUL_1_UB_UB_UB  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)

(define (VAND_1_UD_UD_UD  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)

(define (VOR_8_D_D_D  src0 src1 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (apply
 concat
 (for/list ([i0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx0 (-  %elemsize0  1))
  (define %3 (+  i0.new  %lastidx0))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)


;; ================================================================================

