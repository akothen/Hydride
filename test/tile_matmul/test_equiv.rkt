#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require hydride)
(require errortrace)

(define (_tile_dpbssd dst a b dst_rows dst_colsb a_colsb)
  (define (DPBD x y)
    (define %0 (* 8 0))
    (define %1 (+ %0 7))
    (define %2 (extract %1 %0 x))
    (define %3 (sign-extend %2 (bitvector 32)))
    (define %4 (* 8 0))
    (define %5 (+ %4 7))
    (define %6 (extract %5 %4 y))
    (define %7 (sign-extend %6 (bitvector 32)))
    (define %8 (bvmul %3 %7))
    (define %9 (* 8 1))
    (define %10 (+ %9 7))
    (define %11 (extract %10 %9 x))
    (define %12 (sign-extend %11 (bitvector 32)))
    (define %13 (* 8 1))
    (define %14 (+ %13 7))
    (define %15 (extract %14 %13 y))
    (define %16 (sign-extend %15 (bitvector 32)))
    (define %17 (bvmul %12 %16))
    (define %18 (* 8 2))
    (define %19 (+ %18 7))
    (define %20 (extract %19 %18 x))
    (define %21 (sign-extend %20 (bitvector 32)))
    (define %22 (* 8 2))
    (define %23 (+ %22 7))
    (define %24 (extract %23 %22 y))
    (define %25 (sign-extend %24 (bitvector 32)))
    (define %26 (bvmul %21 %25))
    (define %27 (* 8 3))
    (define %28 (+ %27 7))
    (define %29 (extract %28 %27 x))
    (define %30 (sign-extend %29 (bitvector 32)))
    (define %31 (* 8 3))
    (define %32 (+ %31 7))
    (define %33 (extract %32 %31 y))
    (define %34 (sign-extend %33 (bitvector 32)))
    (define %35 (bvmul %30 %34))
    (define %36 %8)
    (define %37 (bvadd %36 %17))
    (define %38 (bvadd %37 %26))
    (define %39 (bvadd %38 %35))
    %39)
  (define %0 (- dst_rows 1))
  (define %1 (+ %0 1))
  (define %2
    (apply concat
           (for/list ([m0 (reverse (range 0 %1 1))])
             (define %2 (extract (+ (* m0 512) (- 512 1)) (* m0 512) dst))
             (define %3 (/ dst_colsb 4))
             (define %4 (- %3 1))
             (define %5 (+ %4 1))
             (apply concat
                    (for/list ([n0 (reverse (range 0 %5 1))])
                      (define %6 (/ a_colsb 4))
                      (define %7 (- %6 1))
                      (define %8 (+ %7 1))
                      (define %9 (* 32 n0))
                      (define %10 (+ %9 31))
                      (define %11 (extract %10 %9 %2))
                      (bvadd %11
                             (apply bvadd
                                    (for/list ([k0 (reverse (range 0 %8 1))])
                                      (define %12 (* 32 k0))
                                      (define %13 (extract (+ (* m0 512) (- 512 1)) (* m0 512) a))
                                      (define %14 (+ %12 31))
                                      (define %15 (extract %14 %12 %13))
                                      (define %16 (* 32 n0))
                                      (define %17 (extract (+ (* k0 512) (- 512 1)) (* k0 512) b))
                                      (define %18 (+ %16 31))
                                      (define %19 (extract %18 %16 %17))
                                      (define %20 (DPBD %15 %19))
                                      %20)))))
             ;;;  (define %24 (* dst_colsb 8))
             ;;;  (define %25 (- 512 %24))
             ;;;  (define %26 (bvpadlowbits %2 %25))
             ;;;  %26
             )))
  %2)

(define (get-halide-result env)
  (define reg_0 (halide:create-buffer (vector-ref env 0) 'int32))
  (define reg_1 (halide:create-buffer (vector-ref env 1) 'int8))
  (define reg_2 (halide:create-buffer (vector-ref env 2) 'int8))

  (define halide-expr
    ;;; (int-imm (bv 16 32) #t)
    ;;; (int-imm (bv 64 32) #t)
    ;;; (int-imm (bv 16 32) #t)
    (vec-tile_matmul 16 64 64 reg_0 reg_1 reg_2))

  (halide:assemble-bitvector (halide:interpret halide-expr) (halide:vec-len halide-expr)))

(define (get-hydride-result env)
  (_tile_dpbssd (vector-ref env 0) (vector-ref env 1) (vector-ref env 2) 16 64 64))

(define v1 (?? (bitvector 8192)))
(define v2 (?? (bitvector 8192)))
(define v3 (?? (bitvector 8192)))

;; comment these lines below for testing verification
;;; (set!
;;;  v1
;;;  (bv
;;;   #x904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d
;;;   8192))
;;; (set!
;;;  v2
;;;  (bv
;;;   #x904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d
;;;   8192))
;;; (set!
;;;  v3
;;;  (bv
;;;   #x904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d
;;;   8192))
(define env (vector v1 v2 v3))

(printf "V1: \n")
(print-mat v1 16 64 8)

(printf "V2: \n")
(print-mat v2 16 64 8)
(printf "V3: \n")
(print-mat v3 16 16 32)

(define halide-result (get-halide-result env))
(printf "\nHalide Result:\t~a\n" halide-result)
(define hydride-result (get-hydride-result env))
(printf "\nHydride Result:\t~a\n" hydride-result)

(printf "\nEqual? ~a\n" (equal? halide-result hydride-result))

(define cex (verify (assert (equal? halide-result hydride-result))))

(println cex)
(cond
  [(unsat? cex) (exit)])

(printf "(set! v1 ~a)\n" (evaluate v1 cex))
(printf "(set! v2 ~a)\n" (evaluate v2 cex))
(printf "(set! v3 ~a)\n" (evaluate v3 cex))
