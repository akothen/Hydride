#lang rosette
(require "rosette_test/bvops.rkt")


(define (vzip1_s8  a b )
(define result
(apply
concat
(for/list ([p0 (reverse (range 0 4 1))])
 (define %10 (+  0  p0))
 (define %11 (*  %10  8))
 (define %12 (+  0  p0))
 (define %13 (+  %12  1))
 (define %14 (*  %13  8))
 (define %15 (-  %14  1))
 (define %16 (extract  %15 %11 a))
 (define %25 (+  0  p0))
 (define %26 (*  %25  8))
 (define %27 (+  0  p0))
 (define %28 (+  %27  1))
 (define %29 (*  %28  8))
 (define %30 (-  %29  1))
 (define %31 (extract  %30 %26 b))
(concat %31 %16)
)
)
)
result)
(vzip1_s8 (bv #x28a3f1eb3d485054 64) (bv #xec16467685fddefd 64))
(assert (eq? (vzip1_s8 (bv #x28a3f1eb3d485054 64) (bv #xec16467685fddefd 64)) (bv #x28eca316f146eb76 64)))