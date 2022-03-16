#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_blend_epi16  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
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

(define (_mm_dpbusd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %11.sum
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11 (sign-extend  %10 (bitvector %lanesize1)))
  %11
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %62.clone.4 (+  j0.new  %lastidx1))
 (define %11.ext0 (extract  %62.clone.4 j0.new dst))
 (define %11.acc0 (bvadd %11.sum %11.ext0))
 %11.acc0
)
)
)

(define-symbolic a_1 (bitvector 256))
(define-symbolic b_1 (bitvector 256))
(define-symbolic imm8_1 (bitvector 8))
(define %vectsize_1 256)
(define %lanesize1_1 256)
(define %lanesize2_1 256)
(define %elemsize_1 16)
(define %laneoffset_1 0)
(define %arg0_1 8)

(verify (assert (equal? (_mm256_blend_epi16 a_1 b_1 imm8_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 ) (_mm_dpbusd_epi32 a_1 b_1 imm8_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 ))))

(define-symbolic src_2 (bitvector 128))
(define-symbolic a_2 (bitvector 128))
(define-symbolic b_2 (bitvector 128))
(define %vectsize_2 128)
(define %lanesize1_2 32)
(define %lanesize2_2 32)
(define %elemsize_2 8)
(define %laneoffset_2 0)
(define %arg0_2 16)

(verify (assert (equal? (_mm256_blend_epi16 src_2 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 ) (_mm_dpbusd_epi32 src_2 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 ))))
