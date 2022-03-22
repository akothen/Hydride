#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm_mulhi_pu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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

(define (_m_pmulhuw  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
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

(define-symbolic a_1 (bitvector 64))
(define-symbolic b_1 (bitvector 64))
(define %vectsize_1 64)
(define %lanesize1_1 64)
(define %lanesize2_1 64)
(define %elemsize_1 16)
(define %laneoffset_1 0)
(define %arg0_1 16)
(define %arg1_1 32)

(verify (assert (equal? (_mm_mulhi_pu16 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 ) (_m_pmulhuw a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 ))))

(define-symbolic a_2 (bitvector 64))
(define-symbolic b_2 (bitvector 64))
(define %vectsize_2 64)
(define %lanesize1_2 64)
(define %lanesize2_2 64)
(define %elemsize_2 16)
(define %laneoffset_2 0)
(define %arg0_2 16)
(define %arg1_2 32)

(verify (assert (equal? (_mm_mulhi_pu16 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 ) (_m_pmulhuw a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 ))))
