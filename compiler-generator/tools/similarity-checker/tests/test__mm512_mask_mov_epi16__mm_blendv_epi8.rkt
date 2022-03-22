#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

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

(define-symbolic src_1 (bitvector 512))
(define-symbolic k_1 (bitvector 32))
(define-symbolic a_1 (bitvector 512))
(define %vectsize_1 512)
(define %lanesize1_1 512)
(define %lanesize2_1 512)
(define %elemsize_1 16)
(define %laneoffset_1 0)

(verify (assert (equal? (_mm512_mask_mov_epi16 src_1 k_1 a_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 ) (_mm_blendv_epi8 src_1 k_1 a_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 ))))

(define-symbolic a_2 (bitvector 128))
(define-symbolic b_2 (bitvector 128))
(define-symbolic mask_2 (bitvector 128))
(define %vectsize_2 128)
(define %lanesize1_2 128)
(define %lanesize2_2 128)
(define %elemsize_2 8)
(define %laneoffset_2 0)

(verify (assert (equal? (_mm512_mask_mov_epi16 a_2 b_2 mask_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 ) (_mm_blendv_epi8 a_2 b_2 mask_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 ))))
