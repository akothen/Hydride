(define (_mm256_maskz_mov_epi16  k a %vectsize %lanesize %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_mov_epi16  src k a %vectsize %lanesize %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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

(define (_mm256_mask_abs_epi8  src k a %vectsize %lanesize %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (abs  %3))
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

(define (_mm256_maskz_abs_epi8  k a %vectsize %lanesize %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (abs  %3))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm256_blendv_epi8  a b mask %vectsize %lanesize %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define %1 (+  j0.new  %arg0))
  (define %2 (extract  %1 %1 mask))
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

(define (_mm256_blend_epi16  a b imm8 %vectsize %lanesize %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define j0.new.div (/  j0.new  %arg1))
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

(define (_mm_blend_epi16  a b imm8 %vectsize %lanesize %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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

