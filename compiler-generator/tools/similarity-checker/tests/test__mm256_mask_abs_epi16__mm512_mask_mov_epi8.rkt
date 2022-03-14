#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_mask_abs_epi16  src k a %vectsize %lanesize %elemsize %laneoffset )
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

(define (_mm512_mask_mov_epi8  src k a %vectsize %lanesize %elemsize %laneoffset )
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

(define-symbolic src_1 (bitvector 256))
(define-symbolic k_1 (bitvector 16))
(define-symbolic a_1 (bitvector 256))
(define %vectsize_1 256)
(define %lanesize_1 256)
(define %elemsize_1 16)
(define %laneoffset_1 0)

(verify (assert (equal? (_mm256_mask_abs_epi16 src_1 k_1 a_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 ) (_mm512_mask_mov_epi8 src_1 k_1 a_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 ))))

(define-symbolic src_2 (bitvector 512))
(define-symbolic k_2 (bitvector 64))
(define-symbolic a_2 (bitvector 512))
(define %vectsize_2 512)
(define %lanesize_2 512)
(define %elemsize_2 8)
(define %laneoffset_2 0)

(verify (assert (equal? (_mm256_mask_abs_epi16 src_2 k_2 a_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 ) (_mm512_mask_mov_epi8 src_2 k_2 a_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 ))))
