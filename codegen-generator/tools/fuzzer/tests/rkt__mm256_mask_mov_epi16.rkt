#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_mask_mov_epi16  src k a )
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
   (define %8 (extract  %7 j0.new src))
   %8
   )
  )
 )
 )
)
)
)

(define _0 (bv #x1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100 256))

(define _1 (bv #x2120 16))

(define _2 (bv #x41403f3e3d3c3b3a393837363534333231302f2e2d2c2b2a2928272625242322 256))

(pretty-print (_mm256_mask_mov_epi16 _0 _1 _2))
