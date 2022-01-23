#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/provide)
; API for non floating point stuff we need to support

(provide SMIN)
(provide SMAX)
(provide UMIN)
(provide UMAX)
(provide ABS)
(provide Signed)
(provide Saturate8)
(provide Saturate16)
(provide SaturateU8)
(provide SaturateU16)
(provide ZeroExtend8)
(provide ZeroExtend16)
(provide ZeroExtend32)
(provide ZeroExtend64)
(provide SignExtend8)
(provide SignExtend16)
(provide SignExtend32)
(provide SignExtend64)
(provide Truncate8)

(define (saturate-signed-bv a max_sz min_sz bits)
  (define _a_xl (sign-extend a (bitvector 1024)))

  (cond
    [(bvsge _a_xl (bv max_sz 1024)) (bv max_sz bits)]
    [(bvsle _a_xl (bv min_sz 1024)) (bv min_sz bits)]
    [else (extract (- bits 1) 0 a)]))

(define (saturate-unsigned-bv a max_sz bits)
  (define _a_xl (zero-extend a (bitvector 1024)))
  (cond
    [(bvuge _a_xl (bv max_sz 1024)) (bv max_sz bits)]
    [else (extract (- bits 1) 0 a)]))

(define (saturate-signed-int a max_sz min_sz)
  (cond
    [(>= a max_sz) max_sz]
    [(<= a min_sz) min_sz]
    [else a]))

(define (saturate-unsigned-int a max_sz)
  (cond
    [(>= a max_sz) max_sz]
    [(< a 0) max_sz]
    [else a]))

(define (saturate-N a max_sz min_sz bits)
  (if (bv? a) (saturate-signed-bv a max_sz min_sz bits) (saturate-signed-int a max_sz min_sz)))

(define (saturateu-N a max_sz bits)
  (if (bv? a) (saturate-unsigned-bv a max_sz bits) (saturate-unsigned-int a max_sz)))

; Could make these more robust to handle BV of size larger than N
; gracefully. Reality is it is bugger in translator if that ever happens
; to keep loud failure.
(define (zero-extend-N a N)
  (if (bv? a) (zero-extend a (bitvector N)) a))

(define (sign-extend-N a N)
  (if (bv? a) (sign-extend a (bitvector N)) a))

(define (truncate-N a N)
  (if (bv? a) (extract (- N 1) 0 a) (bitwise-and a (- (arithmetic-shift 1 N) 1))))

(define (UMIN a b)
  (if (bv? a) (bvumin a b) (min a b)))

(define (SMIN a b)
  (if (bv? a) (bvsmin a b) (min a b)))

(define (UMAX a b)
  (if (bv? a) (bvumax a b) (max a b)))

(define (SMAX a b)
  (if (bv? a) (bvsmax a b) (max a b)))

(define (ABS a)
  (if (bv? a) (bvsmax a (bvneg a)) (max a (- 0 a))))

(define (Saturate8 a)
  (saturate-N a 127 -128 8))

(define (Saturate16 a)
  (saturate-N a 32767 -32768 16))

(define (SaturateU8 a)
  (saturateu-N a 255 8))

(define (SaturateU16 a)
  (saturateu-N a 65535 16))

(define (ZeroExtend8 a)
  (zero-extend-N a 8))

(define (ZeroExtend16 a)
  (zero-extend-N a 16))

(define (ZeroExtend32 a)
  (zero-extend-N a 32))

(define (ZeroExtend64 a)
  (zero-extend-N a 64))

(define (SignExtend8 a)
  (sign-extend-N a 8))

(define (SignExtend16 a)
  (sign-extend-N a 16))

(define (SignExtend32 a)
  (sign-extend-N a 32))

(define (SignExtend64 a)
  (sign-extend-N a 64))

(define (Truncate8 a)
  (truncate-N a 8))

(define (Signed a)
  a)
