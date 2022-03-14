#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm_movemask_pi8  a %vectsize %lanesize %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize %elemsize))])
  (define %0 (*  j0  %arg1))
  (define %1 (+  %0  %arg0))
  (define %2 (extract  %1 %1 a))
  %2
 )
 )
)
)
)

(define (_mm256_cvtepi8_epi64  a %vectsize %lanesize %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
  (define j0.new.div (/  j0.new  %arg1))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx1))
  (define %3 (extract  %2 j0.new a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %lastidx0 (-  %arg0  1))
  (define %5 (+  j0.new.div  %lastidx0))
  %4
 )
 )
)
)
)

(define-symbolic a_1 (bitvector 64))
(define %vectsize_1 32)
(define %lanesize_1 32)
(define %elemsize_1 1)
(define %laneoffset_1 0)
(define %arg0_1 7)
(define %arg1_1 8)

(verify (assert (equal? (_mm_movemask_pi8 a_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 ) (_mm256_cvtepi8_epi64 a_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 ))))

(define-symbolic a_2 (bitvector 128))
(define %vectsize_2 256)
(define %lanesize_2 256)
(define %elemsize_2 8)
(define %laneoffset_2 0)
(define %arg0_2 64)
(define %arg1_2 8)

(verify (assert (equal? (_mm_movemask_pi8 a_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 ) (_mm256_cvtepi8_epi64 a_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 ))))
