#lang rosette
(require "rosette_test/bvops.rkt")
(define (vqadd_s16  a b )
(define result
(apply
concat
(for/list ([e0 (reverse (range 0 1 1))])
 (define %1 (*  e0  16))
 (define %2 (*  e0  16))
 (define %4 (+  %2  15))
 (define %5 (extract  %4 %1 a))
 (define %6 (sign-extend  %5 (bitvector 192)))
 (define %7 (*  e0  16))
 (define %8 (*  e0  16))
 (define %10 (+  %8  15))
 (define %11 (extract  %10 %7 b))
 (define %12 (sign-extend  %11 (bitvector 192)))
 (define %13 (bvadd  %6  %12))
 (define %18 (bvssat %13 192 16 ))
 %18
)
)
)
result)
(define (SignedSatQ i N)
  (define p (cond [(> i (- (arithmetic-shift 1 (- N 1)) 1))
                   (- (arithmetic-shift 1 (- N 1)) 1)]
                  [(< i (- (arithmetic-shift 1 (- N 1))))
                   (- (arithmetic-shift 1 (- N 1)))]
                  [else i]))
  (integer->bitvector p (bitvector N))
  )

(define (Int i unsigned)
  (if unsigned (bitvector->natural i) (bitvector->integer i)))

(define (SQADD operand1 operand2 datasize esize elements unsigned)
  (define result
    (apply
     concat (for/list ([e (reverse (range elements))])
              (define op1 (Int (ext-bv operand1 e esize) unsigned))
              (define op2 (Int (ext-bv operand2 e esize) unsigned))
              (define p (SignedSatQ (+ op1 op2) esize))
              p)))
  result)
(define (myvqadd_s16 a b) (SQADD a b 16 16 1 #f))
(define int64? (bitvector 16))
(define (int64 i)
  (bv i int64?))
(define-symbolic l h int64?)
; (verify (assert (eq? (myvqadd_s16 l h) (vqadd_s16 l h))))
(define cex (verify (assert (eq? (myvqadd_s16 l h) (vqadd_s16 l h)))))

(define cl (evaluate l cex))
(define ch (evaluate h cex))
(list cl ch)
(myvqadd_s16 cl ch)
(vqadd_s16 cl ch)