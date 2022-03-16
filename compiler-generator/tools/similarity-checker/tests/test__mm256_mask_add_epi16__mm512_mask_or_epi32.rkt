#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_mask_add_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
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

(define-symbolic src_1 (bitvector 256))
(define-symbolic k_1 (bitvector 16))
(define-symbolic a_1 (bitvector 256))
(define-symbolic b_1 (bitvector 256))
(define %vectsize_1 256)
(define %lanesize1_1 256)
(define %lanesize2_1 256)
(define %elemsize_1 16)
(define %laneoffset_1 0)

(verify (assert (equal? (_mm256_mask_add_epi16 src_1 k_1 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 ) (_mm512_mask_or_epi32 src_1 k_1 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 ))))

(define-symbolic src_2 (bitvector 512))
(define-symbolic k_2 (bitvector 16))
(define-symbolic a_2 (bitvector 512))
(define-symbolic b_2 (bitvector 512))
(define %vectsize_2 512)
(define %lanesize1_2 512)
(define %lanesize2_2 512)
(define %elemsize_2 32)
(define %laneoffset_2 0)

(verify (assert (equal? (_mm256_mask_add_epi16 src_2 k_2 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 ) (_mm512_mask_or_epi32 src_2 k_2 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 ))))
