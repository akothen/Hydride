#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm_blend_epi32  a b imm8 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([j0.new (reverse (range 0 128 32))])
  (define j0.new.div (/  j0.new  32))
  (define %1 (extract  j0.new.div j0.new.div imm8))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %3 (+  j0.new  31))
   (define %4 (extract  %3 j0.new b))
   %4
   )
   (begin
   (define %7 (+  j0.new  31))
   (define %8 (extract  %7 j0.new a))
   %8
   )
  )
 )
 )
)
)
)

(define _0 (bv #x0f0e0d0c0b0a09080706050403020100 128))

(define _1 (bv #x1f1e1d1c1b1a19181716151413121110 128))

(define _2 (bv #x0 4))

(pretty-print (_mm_blend_epi32 _0 _1 _2))
