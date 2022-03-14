#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm_sub_pi32  a b %vectsize %lanesize %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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

(define (_mm512_or_epi32  a b %vectsize %lanesize %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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

(define-symbolic a_1 (bitvector 64))
(define-symbolic b_1 (bitvector 64))
(define %vectsize_1 64)
(define %lanesize_1 64)
(define %elemsize_1 32)
(define %laneoffset_1 0)

(verify (assert (equal? (_mm_sub_pi32 a_1 b_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 ) (_mm512_or_epi32 a_1 b_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 ))))

(define-symbolic a_2 (bitvector 512))
(define-symbolic b_2 (bitvector 512))
(define %vectsize_2 512)
(define %lanesize_2 512)
(define %elemsize_2 32)
(define %laneoffset_2 0)

(verify (assert (equal? (_mm_sub_pi32 a_2 b_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 ) (_mm512_or_epi32 a_2 b_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 ))))
