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

(define _0 (bv #x3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221201f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100 512))

(define _1 (bv #x7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261605f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140 512))

(define _2 (bv #xbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a09f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180 512))

(pretty-print (_mm512_dpbusd_epi32 _0 _1 _2))
