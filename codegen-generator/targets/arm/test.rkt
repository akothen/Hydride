#lang rosette
(require "rosette_test/bvops.rkt")


(define (vshl_s8  a b )
(define result
(apply
concat
(for/list ([e0 (reverse (range 0 8 1))])
 (define %2 (*  e0  8))
 (define %3 (+  e0  1))
 (define %4 (*  %3  8))
 (define %5 (-  %4  1))
 (define %6 (extract  %5 %2 b))
 (define %7 (extract  7 0 %6))
 (define %8 (sign-extend  %7 (bitvector 128)))
 (define %9 (*  e0  8))
 (define %10 (+  e0  1))
 (define %11 (*  %10  8))
 (define %12 (-  %11  1))
 (define %13 (extract  %12 %9 a))
 (define %14 (sign-extend  %13 (bitvector 128)))
 (define %15 (bvadd  %14  (bv 0 128)))
 (define %16 (bvshl  %15  %8))
 (define %22 (extract  7 0 %16))
 %22
)
)
)
result)
(vshl_s8 (bv #xf4db1c1c24a1128a 64) (bv #x67588f700642e7e3 64))
(assert (eq? (vshl_s8 (bv #xf4db1c1c24a1128a 64) (bv #x67588f700642e7e3 64)) (bv #x00000000000000ff 64)))