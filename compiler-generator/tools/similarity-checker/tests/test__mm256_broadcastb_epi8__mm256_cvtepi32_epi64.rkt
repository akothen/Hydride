#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_broadcastb_epi8  a %vectsize %lanesize %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %1 (extract  %highidx0 %arg0 a))
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  %1
 )
 )
)
)
)

(define (_mm256_cvtepi32_epi64  a %vectsize %lanesize %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx1))
  (define %3 (extract  %2 j0.new a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %lastidx0 (-  %arg0  1))
  (define %5 (+  %0.new0  %lastidx0))
  %4
 )
 )
)
)
)

(define-symbolic a_1 (bitvector 128))
(define %vectsize_1 256)
(define %lanesize_1 256)
(define %elemsize_1 8)
(define %laneoffset_1 0)
(define %arg0_1 0)

(verify (assert (equal? (_mm256_broadcastb_epi8 a_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 ) (_mm256_cvtepi32_epi64 a_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 ))))

(define-symbolic a_2 (bitvector 128))
(define %vectsize_2 256)
(define %lanesize_2 256)
(define %elemsize_2 32)
(define %laneoffset_2 0)
(define %arg0_2 64)

(verify (assert (equal? (_mm256_broadcastb_epi8 a_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 ) (_mm256_cvtepi32_epi64 a_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 ))))
