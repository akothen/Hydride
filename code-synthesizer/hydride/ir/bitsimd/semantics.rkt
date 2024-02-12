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

(define (dram_pimcpy_v16384_e8__v16384_e8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  %2
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimmax_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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

(define (dram_pimeq_v16384_e1__v16384_e8__v16384_e8  %arg1.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm )
(define dst.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %0.norm (*  j0.norm  %arg3.norm))
  (define %lastidx1.norm (-  %arg2.norm  1))
  (define %1.norm (+  %0.norm  %lastidx1.norm))
  (define %2.norm (extract  %1.norm %0.norm a.norm))
  (define %4.norm (extract  %1.norm %0.norm b.norm))
  (define %5.norm (bveq  %2.norm  %4.norm))
  (define %6.norm (if (equal? %5.norm #t) %arg0.norm %arg1.norm))
  %6.norm
 )
 )
)
)
)
(bvpadhighbits  dst.norm %arg4.norm)
)

(define (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %7 (bvashr  %4  %6))
  %7
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimor_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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

(define (dram_pimnot_v16384_e8__v16384_e8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %3 (bvnot  %2))
  %3
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %7 (bvshl  %4  %6))
  %7
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimbitcount_v16384_e8__v16384_e8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %2 (bvpopcnt %1 %elemsize0))  %2
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimsearch_v16384_e1__v16384_e8__v1_e8  %arg0.norm %arg1.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm )
(define dst.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %0.norm (*  j0.norm  %arg4.norm))
  (define %lastidx2.norm (-  %arg2.norm  1))
  (define %1.norm (+  %0.norm  %lastidx2.norm))
  (define %2.norm (extract  %1.norm %0.norm a.norm))
  (define %lastidx1.norm (-  %arg2.norm  1))
  (define %highidx1.norm (+  %lastidx1.norm  %arg3.norm))
  (define %3.norm (extract  %highidx1.norm %arg3.norm b.norm))
  (define %4.norm (bveq  %2.norm  %3.norm))
  (define %5.norm (if (equal? %4.norm #t) %arg0.norm %arg1.norm))
  %5.norm
 )
 )
)
)
)
(bvpadhighbits  dst.norm %arg5.norm)
)

(define (dram_pimxor_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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

(define (dram_pimabs_v16384_e8__v16384_e8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %2 (integer->bitvector (abs (bitvector->integer %1)) (bitvector %elemsize0)))
  %2
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimpopcount_v1_e16__v16384_e1  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (define %0.red
(apply
 bvadd
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %highidx1 (+  i0  %lastidx1))
  (define %1 (extract  %highidx1 i0 a))
  (define %2.ab0 (bvsizeext  %1 %arg0 %arg3))
  %2.ab0
 )
))
 (define %lastidx2 (-  %arg0  1))
 (define %highidx2 (+  %lastidx2  %arg4))
 (define %3.ab0 (bvaddnw %0.red (bv 0 16) %arg0 %arg2))
 %3.ab0
)
)
)
(bvpadhighbits  dst %arg5)
)

(define (dram_pimlt_v16384_e1__v16384_e8__v16384_e8  %arg1.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm )
(define dst.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define %0.norm (*  j0.norm  %arg4.norm))
  (define %lastidx1.norm (-  %arg3.norm  1))
  (define %1.norm (+  %0.norm  %lastidx1.norm))
  (define %2.norm (extract  %1.norm %0.norm a.norm))
  (define %4.norm (extract  %1.norm %0.norm b.norm))
  (define %5.ab0.norm (bvlt %2.norm %4.norm %arg2.norm ))
  (define %6.norm (if (equal? %5.ab0.norm #t) %arg0.norm %arg1.norm))
  %6.norm
 )
 )
)
)
)
(bvpadhighbits  dst.norm %arg5.norm)
)

(define (dram_pimnand_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %5 (bvand  %2  %4))
  (define %6 (bvnot  %5))
  %6
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
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

(define (dram_vadd_v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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

(define (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %5 (bvxor  %2  %4))
  (define %6 (bvnot  %5))
  %6
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimand_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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

(define (dram_pimmin_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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

(define (dram_pimmul_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
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

(define (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1  c.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm )
(define dst.norm
(apply
concat
(for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
 (apply
 concat
 (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
  (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
  (define %lastidx0.norm (-  %arg1.norm  1))
  (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
  (define %1.norm (extract  %highidx0.norm j0.new.div.norm c.norm))
  (define %2.norm (bveq  %1.norm  %arg0.norm))
  (cond
  [(equal? %2.norm #t)
   (begin
   (define %lastidx1.norm (-  %elemsize0.norm  1))
   (define %4.norm (+  j0.new.norm  %lastidx1.norm))
   (define %5.norm (extract  %4.norm j0.new.norm a.norm))
   %5.norm
   )]
  [else (begin
   (define %lastidx2.norm (-  %elemsize0.norm  1))
   (define %8.norm (+  j0.new.norm  %lastidx2.norm))
   (define %9.norm (extract  %8.norm j0.new.norm a.norm))
   %9.norm
   )]
  )
 )
 )
)
)
)
(bvpadhighbits  dst.norm %arg3.norm)
)

(define (dram_pimsub_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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

(define (dram_pimrem_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %7 (bvsmod  %4  %6))
  %7
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)

(define (dram_pimReLU_v16384_e8__v16384_e8__v1_e8  %arg0.norm a.norm %arg1.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm )
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
  (define %3.ab0.norm (bvgt %2.norm %arg1.norm %arg2.norm ))
  (define %6.norm (if (equal? %3.ab0.norm #t)  (extract  %1.norm i0.norm a.norm) %arg0.norm))
  %6.norm
 )
 )
)
)
)
(bvpadhighbits  dst.norm %arg3.norm)
)

(define (dram_pimredsum_v1_e8__v16384_e8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
 (define %1.red
(apply
 bvadd
 (for/list ([i0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
  (define %lastidx1 (-  %elemsize0  1))
  (define %2 (+  i0  %lastidx1))
  (define %3 (extract  %2 i0 a))
  %3
 )
))
 (define %lastidx2 (-  %elemsize0  1))
 (define %highidx1 (+  %lastidx2  %arg2))
 (define %4.ab0 (bvaddnw %1.red (bv 0 8) %elemsize0 %arg1))
 %4.ab0
)
)
)
(bvpadhighbits  dst %arg3)
)

(define (dram_pimbrdcst_v16384_e8__v1_e8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
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

(define (dram_pimnor_v16384_e8__v16384_e8__v16384_e8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
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
  (define %5 (bvor  %2  %4))
  (define %6 (bvnot  %5))
  %6
 )
 )
)
)
)
(bvpadhighbits  dst %arg0)
)


;; ================================================================================

