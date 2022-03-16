#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm_avg_pu8  a b %vectsize %lanesize %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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

(define (_m_pavgb  a b %vectsize %lanesize %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize %elemsize))])
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

(define-symbolic a_1 (bitvector 64))
(define-symbolic b_1 (bitvector 64))
(define %vectsize_1 64)
(define %lanesize_1 64)
(define %elemsize_1 8)
(define %laneoffset_1 0)
(define %arg0_1 (bv #x00000001 8))
(define %arg1_1 (bv #x00000001 8))

(verify (assert (equal? (_mm_avg_pu8 a_1 b_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 ) (_m_pavgb a_1 b_1 %vectsize_1 %lanesize_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 ))))

(define-symbolic a_2 (bitvector 64))
(define-symbolic b_2 (bitvector 64))
(define %vectsize_2 64)
(define %lanesize_2 64)
(define %elemsize_2 8)
(define %laneoffset_2 0)
(define %arg0_2 (bv #x00000001 8))
(define %arg1_2 (bv #x00000001 8))

(verify (assert (equal? (_mm_avg_pu8 a_2 b_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 ) (_m_pavgb a_2 b_2 %vectsize_2 %lanesize_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 ))))
