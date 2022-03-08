#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm512_dpbusd_epi32  src a b )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 512 32))])
 (define %11.sum
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %2 (+  %1.new0  7))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (zero-extend  %3 (bitvector 16)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector 16)))
  (define %10 (bvmul  %4  %9))
  (define %11 (sign-extend  %10 (bitvector 32)))
  %11
 )
))
 (define %62.clone.4 (+  j0.new  31))
 (define %11.ext0 (extract  %62.clone.4 j0.new dst))
 (define %11.acc0 (bvadd %11.sum %11.ext0))
 %11.acc0
)
)
)

(define _0 (bv #x0123456789abcdef101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f 512))

(define _1 (bv #x0123456789abcdef101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f 512))

(define _2 (bv #x0123456789abcdef101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f 512))

(pretty-print (_mm512_dpbusd_epi32 _0 _1 _2))
