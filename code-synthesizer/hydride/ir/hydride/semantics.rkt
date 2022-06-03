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

(define (scalar-load mem mem_size index type_size)
(define total_num_elems (/ mem_size type_size))
(define result
(ext-bv mem (- (- total_num_elems  1) index) type_size))
result
)
(define (vector-load mem mem_size start num_elems type_size)
(define result
(apply
  concat
(for/list ([i (range num_elems)])
(scalar-load mem mem_size (+ i start) type_size))
))
result
)
(define (_mm512_mask_testn_epi64_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg4))
   (define %lastidx0 (-  %arg4  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvand  %3  %5))
   (define %7 (bveq  %6  %arg3))
   (define %8 (if (equal? %7 #t) %arg1 %arg2))
   %8
   )
   (begin
   (define %9 (extract  j0 j0 %arg0))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_mulhi_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   (define %6 (extract  %3 j0.new b))
   (define %7 (zero-extend  %4 (bitvector %arg2)))
   (define %8 (zero-extend  %6 (bitvector %arg2)))
   (define %9 (bvmul  %7  %8))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %10 (extract  (- (- %arg2 1) %arg1) (- (- %arg2 1) %highidx0) %9))
   %10
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %13 (+  j0.new  %lastidx2))
   (define %14 (extract  %13 j0.new %arg0))
   %14
   )
  )
 )
 )
)
)
)

(define (_mm_cmpge_epi16_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvsge  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_cmpge_epu8_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvuge  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_dpbusd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %11.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11 (sign-extend  %10 (bitvector %lanesize1)))
  %11
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %62.clone.4 (+  j0.new  %lastidx1))
 (define %11.ext0 (extract  %62.clone.4 j0.new dst))
 (define %11.acc0 (bvadd %11.red %11.ext0))
 %11.acc0
)
)
)

(define (_mm512_maskz_broadcast_i64x2  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %3 (extract  j0.new.div j0.new.div k))
  (if (equal? %3 (bv #b1 1))
   (begin
   (define j0.new.div.copy.3 (/  j0.new  %elemsize))
   (define %1.copy.0 (modulo  j0.new.div.copy.3  %arg1))
   (define %2.copy.0 (*  %1.copy.0  %elemsize))
   (define %lastidx1 (-  %elemsize  1))
   (define %5 (+  %2.copy.0  %lastidx1))
   (define %6 (extract  %5 %2.copy.0 a))
   %6
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx2))
   (define %10 (extract  %9 j0.new %arg0))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm256_blend_epi16  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (modulo  j0.new.div  %arg0))
  (define %2 (extract  %1 %1 imm8))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx0))
   (define %5 (extract  %4 j0.new b))
   %5
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx1))
   (define %9 (extract  %8 j0.new a))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_maddubs_pi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %1 (+  %0.new0  %arg1))
  (define %lastidx0 (-  %arg0  1))
  (define %2 (+  %0.new0  %lastidx0))
  (define %3 (extract  %2 %1 a))
  (define %6 (extract  %2 %1 b))
  (define %7 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (sign-extend  %6 (bitvector %arg0)))
  (define %9 (bvmul  %7  %8))
  (define %lastidx1 (-  %elemsize  1))
  (define %10 (+  %0.new0  %lastidx1))
  (define %11 (extract  %10 %0.new0 a))
  (define %13 (extract  %10 %0.new0 b))
  (define %14 (zero-extend  %11 (bitvector %arg0)))
  (define %15 (sign-extend  %13 (bitvector %arg0)))
  (define %16 (bvmul  %14  %15))
  (define %17 (bvaddnsw  %9  %16 %arg0))
  %17
 )
 )
)
)
)

(define (_mm256_mask_min_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsmin  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm256_avg_epu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bvadd  %3  %5))
  (define %7 (bvadd  %6  %arg1))
  (define %8 (bvashr  %7  %arg0))
  %8
 )
 )
)
)
)

(define (_mm256_mask_cmpgt_epi16_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvsgt  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_dpbusd_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg1)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %63.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %63.clone.4 j0.new dst))
  (define %12.acc0 (bvadd %12.red %12.ext0))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %65 (+  j0.new  %lastidx3))
   (define %66 (extract  %65 j0.new %arg0))
   %66
  )
  )
  )
 )
)
)
)

(define (_mm512_mask_cvtsepi32_epi16  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg0  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %arg0  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %5 (bvssat %4 %arg0 %elemsize ))
   %5
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx2))
   (define %9 (extract  %8 j0.new src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_mul_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %6 (extract  %2 %0.new0 b))
  (define %7 (sign-extend  %6 (bitvector %arg0)))
  (define %8 (bvmul  %4  %7))
  %8
 )
 )
)
)
)

(define (_mm_maskz_sub_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvsub  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_div_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (zero-extend  %3 (bitvector %arg1)))
   (define %7 (zero-extend  %5 (bitvector %arg1)))
   (define %8 (bvudiv  %6  %7))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg0))
   (define new.%9 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %8))
   new.%9
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx2))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_sub_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvsub  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm512_madd52hi_epu64  a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %0 (*  j0.new.div  %arg0))
  (define %lastidx2 (-  %elemsize  1))
  (define %1 (+  %0  %lastidx2))
  (define %2 (extract  %1 %0 b))
  (define %5 (extract  %1 %0 c))
  (define %7 (zero-extend  %2 (bitvector %arg3)))
  (define %8 (zero-extend  %5 (bitvector %arg3)))
  (define %9 (bvmul  %7  %8))
  (define %lastidx0 (-  %arg0  1))
  (define %12 (+  %0  %lastidx0))
  (define %13 (extract  %12 %0 a))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %14 (extract  (- (- %arg3 1) %arg2) (- (- %arg3 1) %highidx0) %9))
  (define %15 (zero-extend  %14 (bitvector %arg0)))
  (define %16 (bvadd  %13  %15))
  %16
 )
 )
)
)
)

(define (_mm256_cvtepi64_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %arg0  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %4.high.idx (- %arg0 1))
  (define %4.low.idx (- %4.high.idx %elemsize -1 ))
  (define %4 (extract  %4.high.idx %4.low.idx %3))
  %4
 )
 )
)
)
)

(define (_mm512_mullo_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (sign-extend  %2 (bitvector %arg1)))
  (define %5 (extract  %1 j0.new b))
  (define %6 (sign-extend  %5 (bitvector %arg1)))
  (define %7 (bvmul  %3  %6))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %8 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %7))
  %8
 )
 )
)
)
)

(define (_mm256_mask_cmpneq_epu32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (not (bveq  %3  %5 )))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_reduce_add_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %7 (extract  %lastidx0 %arg1 %arg0))
 (define dst %7)
 (define %5.red
(apply
 bvadd
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx3 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx3))
   (define %5 (extract  %4 j0.new a))
   %5
   )
   (begin
   (define %offset2 (+  %arg1  %elemsize))
   (define %lastidx2 (-  %offset2  1))
   (define %8 (extract  %lastidx2 %arg1 %arg0))
   %8
   )
  )
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %3 (extract  %lastidx1 %arg1 dst))
 (define %6 (bvadd %5.red %3))
 %6
)
)
)

(define (_mm512_subr_epi32  v2 v3 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new v3))
  (define %7 (extract  %4 j0.new v2))
  (define %8 (bvsub  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm256_subs_epu8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsubnuw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (temp_abs v)
  (define bvlen (bvlength v))
  (define zero (bv 0 (bitvector bvlen)))
  (define neg-one (bv -1 (bitvector bvlen)))

  (if
    (bvsge v zero)
    v
    (bvmul neg-one v)
    )
  )

(define (_mm512_abs_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  ;(define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize)))
  (define %3 (temp_abs %2))
  %3
 )
 )
)
)
)

(define (_mm_urem_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsrem  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm512_mask_cmple_epi32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvsle  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_cmpeq_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bveq  %3  %5))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm_maskz_adds_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvaddnuw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new %arg0))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_dpbusds_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg1)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %64.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %64.clone.4 j0.new dst))
  (define %12.acc0 (bvaddnsw %12.red %12.ext0 %lanesize1))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %66 (+  j0.new  %lastidx3))
   (define %67 (extract  %66 j0.new %arg0))
   %67
  )
  )
  )
 )
)
)
)

(define (_mm256_maskz_andnot_epi32  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   (define %5 (bvnot  %4))
   (define %7 (extract  %3 j0.new b))
   (define %8 (bvand  %5  %7))
   %8
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %11 (+  j0.new  %lastidx1))
   (define %12 (extract  %11 j0.new %arg0))
   %12
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_cvtepu32_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx1))
   (define %4 (extract  %3 j0.new a))
   (define %5 (zero-extend  %4 (bitvector %arg1)))
   %5
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.2.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %8 (+  %0.copy.2.new0  %lastidx2))
   (define %9 (extract  %8 %0.copy.2.new0 %arg0))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_xor_epi64  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvxor  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_rem_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsrem  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_mask_cvtepi32_epi64  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx1))
   (define %4 (extract  %3 j0.new a))
   (define %5 (sign-extend  %4 (bitvector %arg0)))
   %5
   )
   (begin
   (define %factor1 (/  %arg0  %elemsize))
   (define %0.copy.2.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %8 (+  %0.copy.2.new0  %lastidx2))
   (define %9 (extract  %8 %0.copy.2.new0 src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm512_testn_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg3))
  (define %lastidx0 (-  %arg3  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvand  %2  %4))
  (define %6 (bveq  %5  %arg2))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm512_reduce_add_epi64  %arg0 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %6 (extract  %lastidx0 %arg1 %arg0))
 (define dst %6)
 (define %4.red
(apply
 bvadd
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx2 (-  %elemsize  1))
  (define %3 (+  j0.new  %lastidx2))
  (define %4 (extract  %3 j0.new a))
  %4
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %2 (extract  %lastidx1 %arg1 dst))
 (define %5 (bvadd %4.red %2))
 %5
)
)
)

(define (_mm256_blendv_epi8  a b mask %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 %1 mask))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx1))
   (define %5 (extract  %4 j0.new b))
   %5
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx2))
   (define %9 (extract  %8 j0.new a))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_and_epi64  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvand  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_mask_cmplt_epi64_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvslt  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_dpwssds_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %32.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %32.clone.2 j0.new dst))
  (define %11.acc0 (bvaddnsw %11.red %11.ext0 %lanesize1))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %34 (+  j0.new  %lastidx3))
   (define %35 (extract  %34 j0.new %arg0))
   %35
  )
  )
  )
 )
)
)
)

(define (_mm512_andnot_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %4 (bvnot  %3))
  (define %6 (extract  %2 j0.new b))
  (define %7 (bvand  %4  %6))
  %7
 )
 )
)
)
)

(define (_mm512_reduce_and_epi64  %arg0 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %6 (extract  %lastidx0 %arg1 %arg0))
 (define dst %6)
 (define %4.red
(apply
 bvand
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx2 (-  %elemsize  1))
  (define %3 (+  j0.new  %lastidx2))
  (define %4 (extract  %3 j0.new a))
  %4
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %2 (extract  %lastidx1 %arg1 dst))
 (define %5 (bvand %4.red %2))
 %5
)
)
)

(define (_m_paddw  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvadd  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm256_max_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsmax  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm256_mask_dpbusds_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg0)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg0)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %64.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %64.clone.4 j0.new dst))
  (define %12.acc0 (bvaddnsw %12.red %12.ext0 %lanesize1))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %66 (+  j0.new  %lastidx3))
   (define %67 (extract  %66 j0.new src))
   %67
  )
  )
  )
 )
)
)
)

(define (_mm256_mask_madd52lo_epu64  a k b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define j0.new.div.copy.2 (/  j0.new  %elemsize))
   (define %0.copy.0 (*  j0.new.div.copy.2  %arg0))
   (define %lastidx2 (-  %elemsize  1))
   (define %2 (+  %0.copy.0  %lastidx2))
   (define %3 (extract  %2 %0.copy.0 b))
   (define %6 (extract  %2 %0.copy.0 c))
   (define %8 (zero-extend  %3 (bitvector %arg3)))
   (define %9 (zero-extend  %6 (bitvector %arg3)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx0 (-  %arg0  1))
   (define %13 (+  %0.copy.0  %lastidx0))
   (define %14 (extract  %13 %0.copy.0 a))
   (define %lastidx1 (-  %arg1  1))
   (define %highidx0 (+  %lastidx1  %arg2))
   (define %15 (extract  (- (- %arg3 1) %arg2) (- (- %arg3 1) %highidx0) %10))
   (define %16 (zero-extend  %15 (bitvector %arg0)))
   (define %17 (bvadd  %14  %16))
   %17
   )
   (begin
   (define j0.new.div.copy.8 (/  j0.new  %elemsize))
   (define %0.copy.6 (*  j0.new.div.copy.8  %arg0))
   (define %lastidx3 (-  %arg0  1))
   (define %20 (+  %0.copy.6  %lastidx3))
   (define %21 (extract  %20 %0.copy.6 a))
   %21
   )
  )
 )
 )
)
)
)

(define (_mm256_test_epi8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg3))
  (define %lastidx0 (-  %arg3  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvand  %2  %4))
  (define %6 (not (bveq  %5  %arg2 )))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm256_xor_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvxor  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm512_cmpeq_epi64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bveq  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_maskz_subs_epi8  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsubnsw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new %arg0))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_cmple_epu32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvule  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm_maskz_mul_epi32  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg1  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %5 (sign-extend  %4 (bitvector %arg1)))
   (define %7 (extract  %3 %0.copy.0.new0 b))
   (define %8 (sign-extend  %7 (bitvector %arg1)))
   (define %9 (bvmul  %5  %8))
   %9
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.5.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %12 (+  %0.copy.5.new0  %lastidx2))
   (define %13 (extract  %12 %0.copy.5.new0 %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_mulhi_pi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (sign-extend  %2 (bitvector %arg1)))
  (define %5 (extract  %1 j0.new b))
  (define %6 (sign-extend  %5 (bitvector %arg1)))
  (define %7 (bvmul  %3  %6))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %8 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %7))
  %8
 )
 )
)
)
)

(define (_mm512_mask_cmpgt_epu32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvugt  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_min_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvumin  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new %arg0))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_mask_dpwssd_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %31.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %31.clone.2 j0.new dst))
  (define %11.acc0 (bvadd %11.red %11.ext0))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %33 (+  j0.new  %lastidx3))
   (define %34 (extract  %33 j0.new src))
   %34
  )
  )
  )
 )
)
)
)

(define (_mm256_adds_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvaddnsw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm_dpbusds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %11.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11 (sign-extend  %10 (bitvector %lanesize1)))
  %11
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %63.clone.4 (+  j0.new  %lastidx1))
 (define %11.ext0 (extract  %63.clone.4 j0.new dst))
 (define %11.acc0 (bvaddnsw %11.red %11.ext0 %lanesize1))
 %11.acc0
)
)
)

(define (_mm256_cmpneq_epi8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (not (bveq  %2  %4 )))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_m_pmovmskb  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg0))
  (define %lastidx0 (-  %arg0  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %1 a))
  %2
 )
 )
)
)
)

(define (_mm512_mask_cvtepi32_epi8  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg0  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %arg0  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %5.high.idx (- %arg0 1))
   (define %5.low.idx (- %5.high.idx %elemsize -1 ))
   (define %5 (extract  %5.high.idx %5.low.idx %4))
   %5
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx2))
   (define %9 (extract  %8 j0.new src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_mask_mul_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg0  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %6 (extract  %3 %0.copy.0.new0 b))
   (define %7 (zero-extend  %4 (bitvector %arg0)))
   (define %8 (zero-extend  %6 (bitvector %arg0)))
   (define %9 (bvmul  %7  %8))
   %9
   )
   (begin
   (define %factor1 (/  %arg0  %elemsize))
   (define %0.copy.5.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %12 (+  %0.copy.5.new0  %lastidx2))
   (define %13 (extract  %12 %0.copy.5.new0 src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_cmpgt_epi8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvsgt  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_cmplt_epu64_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvult  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_reduce_and_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %7 (extract  %lastidx0 %arg1 %arg0))
 (define dst %7)
 (define %5.red
(apply
 bvand
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx3 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx3))
   (define %5 (extract  %4 j0.new a))
   %5
   )
   (begin
   (define %offset2 (+  %arg1  %elemsize))
   (define %lastidx2 (-  %offset2  1))
   (define %8 (extract  %lastidx2 %arg1 %arg0))
   %8
   )
  )
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %3 (extract  %lastidx1 %arg1 dst))
 (define %6 (bvand %5.red %3))
 %6
)
)
)

(define (_mm256_mask_dpwssds_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %32.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %32.clone.2 j0.new dst))
  (define %11.acc0 (bvaddnsw %11.red %11.ext0 %lanesize1))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %34 (+  j0.new  %lastidx3))
   (define %35 (extract  %34 j0.new src))
   %35
  )
  )
  )
 )
)
)
)

(define (_mm_cvtepi16_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx1))
  (define %3 (extract  %2 j0.new a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  %4
 )
 )
)
)
)

(define (_mm_mask_blend_epi64  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new b))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new a))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_cmple_epu32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvule  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_mov_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_cvtepu16_epi32  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx1))
  (define %3 (extract  %2 j0.new a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  %4
 )
 )
)
)
)

(define (_mm256_broadcastmw_epi32  k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %1 (extract  %highidx0 %arg1 k))
  (define %2 (zero-extend  %1 (bitvector %arg0)))
  %2
 )
 )
)
)
)

(define (_mm512_mask_div_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (sign-extend  %3 (bitvector %arg1)))
   (define %7 (sign-extend  %5 (bitvector %arg1)))
   (define %8 (bvsdiv  %6  %7))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg0))
   (define new.%9 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %8))
   new.%9
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx2))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_maddubs_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg1  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %2 (+  %0.copy.0.new0  %arg2))
   (define %lastidx0 (-  %arg1  1))
   (define %3 (+  %0.copy.0.new0  %lastidx0))
   (define %4 (extract  %3 %2 a))
   (define %7 (extract  %3 %2 b))
   (define %8 (zero-extend  %4 (bitvector %arg1)))
   (define %9 (sign-extend  %7 (bitvector %arg1)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx1 (-  %elemsize  1))
   (define %11 (+  %0.copy.0.new0  %lastidx1))
   (define %12 (extract  %11 %0.copy.0.new0 a))
   (define %14 (extract  %11 %0.copy.0.new0 b))
   (define %15 (zero-extend  %12 (bitvector %arg1)))
   (define %16 (sign-extend  %14 (bitvector %arg1)))
   (define %17 (bvmul  %15  %16))
   (define %18 (bvaddnsw  %10  %17 %arg1))
   %18
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.6.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %22 (+  %0.copy.6.new0  %lastidx2))
   (define %23 (extract  %22 %0.copy.6.new0 %arg0))
   %23
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_dpwssd_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %31.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %31.clone.2 j0.new dst))
  (define %11.acc0 (bvadd %11.red %11.ext0))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %33 (+  j0.new  %lastidx3))
   (define %34 (extract  %33 j0.new %arg0))
   %34
  )
  )
  )
 )
)
)
)

(define (_mm_cmplt_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvslt  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_cmpge_epi16_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvsge  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_dpwssds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %10.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %lanesize1)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %lanesize1)))
  (define %10 (bvmul  %4  %9))
  %10
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %31.clone.2 (+  j0.new  %lastidx1))
 (define %10.ext0 (extract  %31.clone.2 j0.new dst))
 (define %10.acc0 (bvaddnsw %10.red %10.ext0 %lanesize1))
 %10.acc0
)
)
)

(define (_mm_or_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvor  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %10.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %lanesize1)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %lanesize1)))
  (define %10 (bvmul  %4  %9))
  %10
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %30.clone.2 (+  j0.new  %lastidx1))
 (define %10.ext0 (extract  %30.clone.2 j0.new dst))
 (define %10.acc0 (bvadd %10.red %10.ext0))
 %10.acc0
)
)
)

(define (_mm256_maskz_mulhrs_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (sign-extend  %3 (bitvector %arg4)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg4)))
   (define %8 (bvmul  %4  %7))
   (define %9 (bvashr  %8  %arg3))
   (define %10 (bvadd  %9  %arg2))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %11 (extract  (- (- %arg4 1) %arg1) (- (- %arg4 1) %highidx0) %10))
   %11
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %14 (+  j0.new  %lastidx2))
   (define %15 (extract  %14 j0.new %arg0))
   %15
   )
  )
 )
 )
)
)
)

(define (_mm512_subs_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsubnsw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm256_mul_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %5 (extract  %2 %0.new0 b))
  (define %6 (zero-extend  %3 (bitvector %arg0)))
  (define %7 (zero-extend  %5 (bitvector %arg0)))
  (define %8 (bvmul  %6  %7))
  %8
 )
 )
)
)
)

(define (_mm512_min_epu64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvumin  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm512_mask_reduce_or_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %7 (extract  %lastidx0 %arg1 %arg0))
 (define dst %7)
 (define %5.red
(apply
 bvor
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx3 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx3))
   (define %5 (extract  %4 j0.new a))
   %5
   )
   (begin
   (define %offset2 (+  %arg1  %elemsize))
   (define %lastidx2 (-  %offset2  1))
   (define %8 (extract  %lastidx2 %arg1 %arg0))
   %8
   )
  )
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %3 (extract  %lastidx1 %arg1 dst))
 (define %6 (bvor %5.red %3))
 %6
)
)
)

(define (_mm256_cmpgt_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bvsgt  %3  %5))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm256_cmplt_epu16_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvult  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm256_mulhrs_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (sign-extend  %2 (bitvector %arg3)))
  (define %5 (extract  %1 j0.new b))
  (define %6 (sign-extend  %5 (bitvector %arg3)))
  (define %7 (bvmul  %3  %6))
  (define %8 (bvashr  %7  %arg2))
  (define %9 (bvadd  %8  %arg1))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %10 (extract  (- (- %arg3 1) %arg0) (- (- %arg3 1) %highidx0) %9))
  %10
 )
 )
)
)
)

(define (_mm512_min_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsmin  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm_cvtusepi64_epi32  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %arg0  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %4 (bvusat %3 %arg0 %elemsize ))
  %4
 )
 )
)
)
)

(define (_mm512_reduce_or_epi64  %arg0 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %6 (extract  %lastidx0 %arg1 %arg0))
 (define dst %6)
 (define %4.red
(apply
 bvor
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx2 (-  %elemsize  1))
  (define %3 (+  j0.new  %lastidx2))
  (define %4 (extract  %3 j0.new a))
  %4
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %2 (extract  %lastidx1 %arg1 dst))
 (define %5 (bvor %4.red %2))
 %5
)
)
)

(define (_mm_blend_epi16  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div imm8))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new b))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new a))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm256_movm_epi64  k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   %arg0
   )
   (begin
   %arg1
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_madd_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg1  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %3 (+  %0.copy.0.new0  %arg2))
   (define %lastidx0 (-  %arg1  1))
   (define %4 (+  %0.copy.0.new0  %lastidx0))
   (define %5 (extract  %4 %3 a))
   (define %8 (extract  %4 %3 b))
   (define %9 (sign-extend  %5 (bitvector %arg1)))
   (define %10 (sign-extend  %8 (bitvector %arg1)))
   (define %11 (bvmul  %9  %10))
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  %0.copy.0.new0  %lastidx1))
   (define %13 (extract  %12 %0.copy.0.new0 a))
   (define %15 (extract  %12 %0.copy.0.new0 b))
   (define %16 (sign-extend  %13 (bitvector %arg1)))
   (define %17 (sign-extend  %15 (bitvector %arg1)))
   (define %18 (bvmul  %16  %17))
   (define %19 (bvadd  %11  %18))
   %19
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.6.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %22 (+  %0.copy.6.new0  %lastidx2))
   (define %23 (extract  %22 %0.copy.6.new0 %arg0))
   %23
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_adds_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvaddnsw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new src))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_avg_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   (define %6 (extract  %3 j0.new b))
   (define %7 (bvadd  %4  %6))
   (define %8 (bvadd  %7  %arg2))
   (define %9 (bvashr  %8  %arg1))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_mask_or_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvor  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_abs_epi16  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (integer->bitvector (abs (bitvector->integer %3)) (bitvector %elemsize)))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_and_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvand  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm256_cmpgt_epu32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvugt  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm_cmpge_epu64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvuge  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_subs_epu16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsubnuw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new src))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_cmplt_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bvslt  %3  %5))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm256_maskz_set1_epi8  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %2 (extract  %highidx0 %arg1 a))
   %2
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx2))
   (define %6 (extract  %5 j0.new %arg0))
   %6
   )
  )
 )
 )
)
)
)

(define (_mm_adds_pu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvaddnuw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm256_mask_cmpeq_epi32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bveq  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_add_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvadd  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_mulhi_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (sign-extend  %3 (bitvector %arg2)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg2)))
   (define %8 (bvmul  %4  %7))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %9 (extract  (- (- %arg2 1) %arg1) (- (- %arg2 1) %highidx0) %8))
   %9
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx2))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_m_pmaxub  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvumax  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm512_broadcast_i64x2  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (modulo  j0.new.div  %arg0))
  (define %2 (*  %1  %elemsize))
  (define %lastidx1 (-  %elemsize  1))
  (define %4 (+  %2  %lastidx1))
  (define %5 (extract  %4 %2 a))
  %5
 )
 )
)
)
)

(define (_mm512_cmple_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvsle  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm256_maskz_max_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvumax  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new %arg0))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_madd52lo_epu64  %arg0 k a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define j0.new.div.copy.2 (/  j0.new  %elemsize))
   (define %0.copy.0 (*  j0.new.div.copy.2  %arg1))
   (define %lastidx2 (-  %elemsize  1))
   (define %2 (+  %0.copy.0  %lastidx2))
   (define %3 (extract  %2 %0.copy.0 b))
   (define %6 (extract  %2 %0.copy.0 c))
   (define %8 (zero-extend  %3 (bitvector %arg4)))
   (define %9 (zero-extend  %6 (bitvector %arg4)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx0 (-  %arg1  1))
   (define %13 (+  %0.copy.0  %lastidx0))
   (define %14 (extract  %13 %0.copy.0 a))
   (define %lastidx1 (-  %arg2  1))
   (define %highidx0 (+  %lastidx1  %arg3))
   (define %15 (extract  (- (- %arg4 1) %arg3) (- (- %arg4 1) %highidx0) %10))
   (define %16 (zero-extend  %15 (bitvector %arg1)))
   (define %17 (bvadd  %14  %16))
   %17
   )
   (begin
   (define j0.new.div.copy.8 (/  j0.new  %elemsize))
   (define %0.copy.6 (*  j0.new.div.copy.8  %arg1))
   (define %lastidx3 (-  %arg1  1))
   (define %20 (+  %0.copy.6  %lastidx3))
   (define %21 (extract  %20 %0.copy.6 %arg0))
   %21
   )
  )
 )
 )
)
)
)

(define (_mm_mask_dpbusd_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg0)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg0)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %63.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %63.clone.4 j0.new dst))
  (define %12.acc0 (bvadd %12.red %12.ext0))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %65 (+  j0.new  %lastidx3))
   (define %66 (extract  %65 j0.new src))
   %66
  )
  )
  )
 )
)
)
)

(define (_mm256_broadcastq_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %1 (extract  %highidx0 %arg0 a))
  %1
 )
 )
)
)
)

(define (_mm_movepi16_mask  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg0))
  (define %lastidx0 (-  %arg0  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %1 a))
  (if (equal? %2 (bv #b1 1))
   (begin
   %arg1
   )
   (begin
   %arg2
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_test_epi16_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg4))
   (define %lastidx0 (-  %arg4  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvand  %3  %5))
   (define %7 (not (bveq  %6  %arg3 )))
   (define %8 (if (equal? %7 #t) %arg1 %arg2))
   %8
   )
   (begin
   (define %9 (extract  j0 j0 %arg0))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_max_epi8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsmax  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_madd_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %2 (+  %0.new0  %arg1))
  (define %lastidx0 (-  %arg0  1))
  (define %3 (+  %0.new0  %lastidx0))
  (define %4 (extract  %3 %2 a))
  (define %7 (extract  %3 %2 b))
  (define %8 (sign-extend  %4 (bitvector %arg0)))
  (define %9 (sign-extend  %7 (bitvector %arg0)))
  (define %10 (bvmul  %8  %9))
  (define %lastidx1 (-  %elemsize  1))
  (define %11 (+  %0.new0  %lastidx1))
  (define %12 (extract  %11 %0.new0 a))
  (define %14 (extract  %11 %0.new0 b))
  (define %15 (sign-extend  %12 (bitvector %arg0)))
  (define %16 (sign-extend  %14 (bitvector %arg0)))
  (define %17 (bvmul  %15  %16))
  (define %18 (bvadd  %10  %17))
  %18
 )
 )
)
)
)

(define (_mm512_mask_subr_epi32  src k v2 v3 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new v3))
   (define %8 (extract  %5 j0.new v2))
   (define %9 (bvsub  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_div_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (sign-extend  %2 (bitvector %arg1)))
  (define %6 (sign-extend  %4 (bitvector %arg1)))
  (define %7 (bvsdiv  %5  %6))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define new.%8 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %7))
  new.%8
 )
 )
)
)
)

(define (_mm256_idiv_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (zero-extend  %2 (bitvector %arg1)))
  (define %6 (zero-extend  %4 (bitvector %arg1)))
  (define %7 (bvudiv  %5  %6))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define new.%8 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %7))
  new.%8
 )
 )
)
)
)


;; ================================================================================
