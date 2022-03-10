#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_maskz_mov_epi16  k a )
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([j0.new (reverse (range 0 256 16))])
  (define j0.new.div (/  j0.new  16))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %3 (+  j0.new  15))
   (define %4 (extract  %3 j0.new a))
   %4
   )
   (begin
   (define %7 (+  j0.new  15))
   (bv #b0 16)
   )
  )
 )
 )
)
)
)

(define _0 (bv #x0100 16))

(define _1 (bv #x21201f1e1d1c1b1a191817161514131211100f0e0d0c0b0a0908070605040302 256))

(pretty-print (_mm256_maskz_mov_epi16 _0 _1))
