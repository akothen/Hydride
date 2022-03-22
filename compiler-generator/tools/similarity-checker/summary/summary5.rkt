(define (_mm512_maskz_set1_epi16  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
   (define %highidx0 (+  %lastidx1  %arg0))
   (define %2 (extract  %highidx0 %arg0 a))
   %2
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

(define (_mm256_mask_min_epu8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_blend_epi32  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm512_mul_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm_mask_mulhrs_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
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
   (define %4 (sign-extend  %3 (bitvector %arg3)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg3)))
   (define %8 (bvmul  %4  %7))
   (define %9 (bvashr  %8  %arg2))
   (define %10 (bvadd  %9  %arg1))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg0))
   (define %11 (extract  (- (- %arg3 1) %arg0) (- (- %arg3 1) %highidx0) %10))
   %11
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %14 (+  j0.new  %lastidx2))
   (define %15 (extract  %14 j0.new src))
   %15
   )
  )
 )
 )
)
)
)

(define (_mm256_max_epu64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm256_mul_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm_add_pi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_m_pmaddwd  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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

(define (_mm512_movepi16_mask  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg1))
  (define %1 (+  %0  %arg0))
  (define %2 (extract  %1 %1 a))
  (if (equal? %2 (bv #b1 1))
   (begin
   (bv #b1 %elemsize)
   )
   (begin
   (bv #b0 %elemsize)
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_mulhrs_epi16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
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
   (define %4 (sign-extend  %3 (bitvector %arg3)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg3)))
   (define %8 (bvmul  %4  %7))
   (define %9 (bvashr  %8  %arg2))
   (define %10 (bvadd  %9  %arg1))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg0))
   (define %11 (extract  (- (- %arg3 1) %arg0) (- (- %arg3 1) %highidx0) %10))
   %11
   )
   (begin
   %arg4
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_broadcastb_epi8  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   (define %highidx0 (+  %lastidx1  %arg0))
   (define %2 (extract  %highidx0 %arg0 a))
   %2
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx2))
   (define %6 (extract  %5 j0.new src))
   %6
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_min_epu8  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm_mask_add_epi8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_min_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm_mullo_pi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
  (define %6 (zero-extend  %3 (bitvector %arg1)))
  (define %7 (zero-extend  %5 (bitvector %arg1)))
  (define %8 (bvmul  %6  %7))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %9 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %8))
  %9
 )
 )
)
)
)

(define (_mm512_min_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm_avg_pu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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

(define (_mm512_maskz_abs_epi16  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm_mask_madd_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
   (define %3 (+  %0.copy.0.new0  %arg1))
   (define %lastidx0 (-  %arg0  1))
   (define %4 (+  %0.copy.0.new0  %lastidx0))
   (define %5 (extract  %4 %3 a))
   (define %8 (extract  %4 %3 b))
   (define %9 (sign-extend  %5 (bitvector %arg0)))
   (define %10 (sign-extend  %8 (bitvector %arg0)))
   (define %11 (bvmul  %9  %10))
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  %0.copy.0.new0  %lastidx1))
   (define %13 (extract  %12 %0.copy.0.new0 a))
   (define %15 (extract  %12 %0.copy.0.new0 b))
   (define %16 (sign-extend  %13 (bitvector %arg0)))
   (define %17 (sign-extend  %15 (bitvector %arg0)))
   (define %18 (bvmul  %16  %17))
   (define %19 (bvadd  %11  %18))
   %19
   )
   (begin
   (define %factor1 (/  %arg0  %elemsize))
   (define %0.copy.6.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %22 (+  %0.copy.6.new0  %lastidx2))
   (define %23 (extract  %22 %0.copy.6.new0 src))
   %23
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_max_epu16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_cvtepi8_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm256_sub_epi64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm512_maskz_madd_epi16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
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
   (define %3 (+  %0.copy.0.new0  %arg1))
   (define %lastidx0 (-  %arg0  1))
   (define %4 (+  %0.copy.0.new0  %lastidx0))
   (define %5 (extract  %4 %3 a))
   (define %8 (extract  %4 %3 b))
   (define %9 (sign-extend  %5 (bitvector %arg0)))
   (define %10 (sign-extend  %8 (bitvector %arg0)))
   (define %11 (bvmul  %9  %10))
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  %0.copy.0.new0  %lastidx1))
   (define %13 (extract  %12 %0.copy.0.new0 a))
   (define %15 (extract  %12 %0.copy.0.new0 b))
   (define %16 (sign-extend  %13 (bitvector %arg0)))
   (define %17 (sign-extend  %15 (bitvector %arg0)))
   (define %18 (bvmul  %16  %17))
   (define %19 (bvadd  %11  %18))
   %19
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

(define (_mm256_broadcastmb_epi64  k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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

(define (_mm512_mask_madd52hi_epu64  a k b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
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

(define (_mm_mask_cvtepi8_epi16  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   (define %1.copy.2.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %8 (+  %1.copy.2.new0  %lastidx2))
   (define %9 (extract  %8 %1.copy.2.new0 src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_sub_epi16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm256_min_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm_maskz_min_epi16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm256_dpbusd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %11.sum
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
 (define %11.acc0 (bvadd %11.sum %11.ext0))
 %11.acc0
)
)
)

(define (_mm_madd52lo_epu64  a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
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

(define (_mm256_maskz_mov_epi32  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm512_or_epi64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm512_maskz_max_epu8  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm512_set1_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm512_mulhrs_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
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

(define (_mm512_broadcast_i32x8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm256_abs_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize)))
  %3
 )
 )
)
)
)

(define (_mm512_mask_cvtepu8_epi16  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   (define %5 (zero-extend  %4 (bitvector %arg0)))
   %5
   )
   (begin
   (define %factor1 (/  %arg0  %elemsize))
   (define %1.copy.2.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %8 (+  %1.copy.2.new0  %lastidx2))
   (define %9 (extract  %8 %1.copy.2.new0 src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_max_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm512_mask_or_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm256_mask_mullo_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
   (define %4 (sign-extend  %3 (bitvector %arg1)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg1)))
   (define %8 (bvmul  %4  %7))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg0))
   (define %9 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %8))
   %9
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

(define (_mm512_maskz_mulhi_epu16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
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
   (define %7 (zero-extend  %4 (bitvector %arg1)))
   (define %8 (zero-extend  %6 (bitvector %arg1)))
   (define %9 (bvmul  %7  %8))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg0))
   (define %10 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %9))
   %10
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

(define (_mm_cvtepu8_epi16  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm256_maskz_add_epi16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm_mask_abs_epi64  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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
   (define %8 (extract  %7 j0.new src))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_cvtepu8_epi16  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
   (define %5 (zero-extend  %4 (bitvector %arg0)))
   %5
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

(define (_mm512_mask_mov_epi16  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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
   (define %8 (extract  %7 j0.new src))
   %8
   )
  )
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

(define (_mm256_maskz_cvtepi8_epi16  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
   %arg1
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_cvtepi16_epi8  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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
   %arg1
   )
  )
 )
 )
)
)
)

(define (_mm256_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %1.new0 (*  j0.new  %factor0))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11.new0 (/  j0.new  %arg2))
  (define %12 (+  %11.new0  %arg1))
  (define %13 (*  %elemsize  %12))
  (define %lastidx1 (-  %elemsize  1))
  (define %14 (+  %13  %lastidx1))
  (define %15 (extract  %14 %13 a))
  (define %16 (sign-extend  %15 (bitvector %arg0)))
  (define %21 (extract  %14 %13 b))
  (define %22 (sign-extend  %21 (bitvector %arg0)))
  (define %23 (bvmul  %16  %22))
  (define %lastidx0 (-  %arg0  1))
  (define %25 (+  %1.new0  %lastidx0))
  (define %26 (extract  %25 %1.new0 src))
  (define %27 (bvadd  %26  %10))
  (define %28 (bvadd  %27  %23))
  %28
 )
 )
)
)
)

(define (_mm_movemask_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

(define (_mm256_mask_blend_epi16  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm512_mask_xor_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm_blendv_epi8  a b mask %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm256_maskz_madd52lo_epu64  k a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
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
   %arg4
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_max_epi8  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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
   %arg0
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

(define (_mm_mask_sub_epi8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_xor_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define (_mm_mask_cvtepi16_epi8  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
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

