#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_maskz_add_epi8  k a b %vectsize %lanesize %elemsize %laneoffset %arg0 )
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
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvadd  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm_blendv_epi8  a b mask %vectsize %lanesize %elemsize %laneoffset %arg0 )
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

(define-symbolic k_1 (bitvector 32))
(define-symbolic a_1 (bitvector 256))
(define-symbolic b_1 (bitvector 256))
(define %vectsize_1 256)
(define %lanesize_1 256)
(define %elemsize_1 8)
(define %laneoffset_1 0)
(define %arg0_1 (bv #x00000000 8))

(verify (assert (equal? (_mm256_maskz_add_epi8 k_1 a_1 b_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 ) (_mm_blendv_epi8 k_1 a_1 b_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 ))))

(define-symbolic a_2 (bitvector 128))
(define-symbolic b_2 (bitvector 128))
(define-symbolic mask_2 (bitvector 128))
(define %vectsize_2 128)
(define %lanesize_2 128)
(define %elemsize_2 8)
(define %laneoffset_2 0)
(define %arg0_2 7)

(verify (assert (equal? (_mm256_maskz_add_epi8 a_2 b_2 mask_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 ) (_mm_blendv_epi8 a_2 b_2 mask_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 ))))
