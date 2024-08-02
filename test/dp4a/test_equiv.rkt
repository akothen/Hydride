#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)

(require hydride)

(enable-debug)
(define (VDP4A_16_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %9.new.high.idx0 (+  %0.new0  7))
  (define %80.new (extract  %9.new.high.idx0 %0.new0 src1))
  (define %10 (sign-extend  %80.new (bitvector 64)))
  (define %150.new (extract  %9.new.high.idx0 %0.new0 src2))
  (define %18 (sign-extend  %150.new (bitvector 64)))
  (define %17 (bvmul  %10  %18))
  (define %24.new.low.idx (+  %0.new0  8))
  (define %24.new.high.idx0 (+  %24.new.low.idx  7))
  (define %230.new (extract  %24.new.high.idx0 %24.new.low.idx src1))
  (define %25 (sign-extend  %230.new (bitvector 64)))
  (define %300.new (extract  %24.new.high.idx0 %24.new.low.idx src2))
  (define %33 (sign-extend  %300.new (bitvector 64)))
  (define %32 (bvmul  %25  %33))
  (define %34 (bvadd  %17  %32))
  (define %40.new.low.idx (+  %0.new0  16))
  (define %40.new.high.idx0 (+  %40.new.low.idx  7))
  (define %390.new (extract  %40.new.high.idx0 %40.new.low.idx src1))
  (define %41 (sign-extend  %390.new (bitvector 64)))
  (define %460.new (extract  %40.new.high.idx0 %40.new.low.idx src2))
  (define %49 (sign-extend  %460.new (bitvector 64)))
  (define %48 (bvmul  %41  %49))
  (define %50 (bvadd  %34  %48))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %57 (sign-extend  %550.new (bitvector 64)))
  (define %620.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %65 (sign-extend  %620.new (bitvector 64)))
  (define %64 (bvmul  %57  %65))
  (define %66 (bvadd  %50  %64))
  (define %71 (extract  %3 %0.new0 src0))
  (define %73 (sign-extend  %71 (bitvector 64)))
  (define %72 (bvadd  %66  %73))
  (define %74 (extract  31 0 %72))
  %74
 )
 )
)
)
)
dst)


; Rounding Shift Right: Compute saturating_narrow(widening_add(a, (1 << max(b, 0)) / 2) >> b). 
; Rounding Mul Shift Right: Compute saturating_narrow(rounding_shift_right(widening_mul(a, b), q)) 

;; This instruction is equivalent to Rounding_mul_shift_right(Vu, Vv, xBroadcast(15))

(define (get-mlir-result env)
  (define reg_0 (arith:create-tensor (vector-ref env 0) (vector 16) (vector 0) 'int32 1))
  (define reg_1 (arith:create-tensor (vector-ref env 1) (vector 64) (vector 0) 'int8 2))
  (define reg_3 (arith:create-tensor (vector-ref env 2) (vector 64) (vector 0) 'int8 3))

  (define mlir-expr 
    (arith:tensor-add 
      (arith:tensor-add 
          (arith:tensor-add 
              (arith:tensor-add 
                  reg_0 
                  (arith:tensor-mul 
                      (arith:cast-int (vector:extract_strided_slice reg_1 (vector 0) (vector 16) (vector 4)) 16 32)
                      (arith:cast-int (vector:extract_strided_slice reg_3 (vector 0) (vector 16) (vector 4)) 16 32)))
              (arith:tensor-mul
                  (arith:cast-int (vector:extract_strided_slice reg_1 (vector 1) (vector 16) (vector 4) )16 32)
                  (arith:cast-int (vector:extract_strided_slice reg_3 (vector 1) (vector 16) (vector 4) )16 32)))
          (arith:tensor-mul
              (arith:cast-int (vector:extract_strided_slice reg_1 (vector 2) (vector 16) (vector 4) )16 32)
              (arith:cast-int (vector:extract_strided_slice reg_3 (vector 2) (vector 16) (vector 4) )16 32)))
      (arith:tensor-mul
          (arith:cast-int (vector:extract_strided_slice reg_1 (vector 3) (vector 16) (vector 4) )16 32)
          (arith:cast-int (vector:extract_strided_slice reg_3 (vector 3) (vector 16) (vector 4) )16 32)))
    ;;; (arith:tensor-add reg_1 reg_3)
    ;;; (vector:extract_strided_slice reg_1 (vector 16) (vector 16) (vector 1))
  )

  ;;; (mlir:assemble-bitvector (mlir:interpret mlir-expr) (mlir:vec-len mlir-expr))
  (arith:evaluate-arith-expr-env mlir-expr env)
)

(define (get-hydride-result env)
  (VDP4A_16_D_D_D_D (vector-ref env 0) (vector-ref env 1) (vector-ref env 2))
  )

(define v0 (?? (bitvector 512)))
(define v1 (?? (bitvector 512)))
(define v2 (?? (bitvector 512)))

;; comment these lines below for testing verification
;(set! v1 (bv #x904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d 1024))
;(set! v2 (bv #xe6ecadd6bff66ffc31aaeba0ca5a77af60c69332969e4a9e11be6957c11ddff18001ad04610181cfc532a536e526b8768cebd2dcfffe2b47343eb4fad3a0ffff89fdc08afd7e91041a49409ca9b9ea0a93768a5859368000d801800180000768104073c0fff172993433bee3967de07f0001fc328005783a6dc9bfe09766ce59 1024))
;;; (set! v0 (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 512))
;;; (set! v1 (bv #x00be2f0681779755ffdeba8869b84da6416fd4d4db00f86976809ff1ee25a0f0bd73e530fc40f5e573800039717114c0b087801e3b9162d788f031716ec5ba00 512))
;;; (set! v2 (bv #x0047dc9f414f7be693467c60e5fc8a8705b6db8b76008667ffd47e56b07dd861b6f127c8408c0cb54e8100311eeae9cee4876d97b3cb6d4773bb4150e9fd0900 512))
(define env (vector v0 v1 v2))


;;; (printf "V1: \n")
;;; (print-mat v1 1 16 32)


;;; (printf "V2: \n")
;;; (print-mat v2 1 16 32)



(define hydride-result (get-hydride-result env))
(printf "\nHydride Result:\t~a\n" hydride-result)
(print-mat hydride-result 1 16 32)
(define mlir-result (get-mlir-result env))
(printf "\nmlir Result:\t~a\n" mlir-result)
(print-mat mlir-result 1 16 32)

(printf "\nEqual? ~a\n" (equal? mlir-result hydride-result))

;;; (cond
;;;   [(not (equal? mlir-result hydride-result))
;;;    (for/list ([i (range 64)])
;;;              (define low (* i 16))
;;;              (define high (+ low 15))

;;;              (define mlir-i (extract high low mlir-result))
;;;              (define hydride-i (extract high low hydride-result))

;;;              (printf "Element ~a equal?:\t ~a\n" i (equal? mlir-i hydride-i))

;;;              (cond 
;;;                [(not (equal? mlir-i hydride-i))
;;;                 (printf "   mlir: ~a , Hydride: ~a\n" mlir-i hydride-i)
;;;                 (printf "   mlir: ~a , Hydride: ~a\n" (bitvector->integer mlir-i) (bitvector->integer hydride-i))
                
;;;                 ]
;;;                )

             
             
;;;              )
   
;;;    ]
;;;   )

(define cex
  (verify
    (assert (equal? mlir-result hydride-result))
    )
  
  )

(println cex)
(cond 
  [(unsat? cex) (exit)]
  
  )

(printf "(set! v0 ~a)\n" (evaluate v0 cex))
(printf "(set! v1 ~a)\n" (evaluate v1 cex))
(printf "(set! v2 ~a)\n" (evaluate v2 cex))
