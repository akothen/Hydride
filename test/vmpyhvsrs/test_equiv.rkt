#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require hydride)


(define (hexagon_V6_vmpyhvsrs_128B  Vu Vv )
  (define Vd
    (apply
    concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
        (apply
        concat
          (for/list ([i.new (reverse (range 0 1024 16))])
            (define %lastidx0 (- 16  1))
            (define %1 (+  i.new  %lastidx0))
            (define %2 (extract  %1 i.new Vu))
            (define %3.ab0 (bvsizeext  %2 32 1))
            (define %4 (extract  %1 i.new Vv))
            (define %5.ab0 (bvsizeext  %4 32 1))
            (define %6 (bvmul %3.ab0 %5.ab0))
            (define %7 (bvshl %6 (bv 1 32)))
            (define %8.ab0 (bvaddnw %7 (bv #x00000000000000000000000000008000 32) 32 -1 ))
            (define %9.ab0 (bvsaturate %8.ab0 32 32 1))
            (define %lastidx1 (- 16  1))
            (define %highidx0 (+  %lastidx1  16))
            ;(printf "extracting ~a ~a from ~a\n" %highidx0 16 %9.ab0)
            (define %10 (extract %highidx0 16 %9.ab0))
            (define %11.ab0 (bvsaturate %10 16 16 1))
            %11.ab0
          )
        )
      )
    )
  )
  (bvpadhighbits  Vd 0)
)



; Rounding Shift Right: Compute saturating_narrow(widening_add(a, (1 << max(b, 0)) / 2) >> b). 
; Rounding Mul Shift Right: Compute saturating_narrow(rounding_shift_right(widening_mul(a, b), q)) 

;; This instruction is equivalent to Rounding_mul_shift_right(Vu, Vv, xBroadcast(15))
(define (hexagon_V6_vmpyhvsrs_128B_alt  Vu Vv )
  (define Vd
    (apply
    concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
        (apply
        concat
          (for/list ([i.new (reverse (range 0 1024 16))])
            (define %lastidx0 (- 16  1))
            (define %1 (+  i.new  %lastidx0))
            (define %2 (extract  %1 i.new Vu))
            (define %3.ab0 (bvsizeext  %2 32 1))
            (define %4 (extract  %1 i.new Vv))
            (define %5.ab0 (bvsizeext  %4 32 1))
            (define %6 (bvmul %3.ab0 %5.ab0)) ;; Computed widening_mul(a,b)


            ;; ================================================
            ;; Need to compute rounding shift right (%6, 15 : 32 bit)
            
            ;;(1 << max(15, 0)) 

            (define %rsh.0 (bvshl (bv 1 32)  (bv 15 32) ))

            ;;(1 << max(15, 0)) / 2

            (define %rsh.1 (bvsdiv %rsh.0  (bv 2 32) ))

            ;; widening_add calculation
            (define %rsh.2 (bvsizeext %rsh.1 64 1))
            (define %rsh.3 (bvsizeext %6 64 1))
            (define %widening_add (bvaddnw %rsh.2 %rsh.3 64 -1))

            ;; >> b
            (define %rhs.4 (bvashr %widening_add (bv 15 64)))

            ;; saturating narrow (to 32 bits from 64)
            (define %rhs.5 (bvsaturate %rhs.4 64 32 1))


            ;; ================================================

            ;; saturating narrow (to 32 bits from 16)
            (define %result (bvsaturate %rhs.5 32 16 1))
            %result
          )
        )
      )
    )
  )
  (bvpadhighbits  Vd 0)
)

(define (get-halide-result env)
  (define buf-0 (halide:create-buffer (vector-ref env 0) 'int16))
  (define buf-1 (halide:create-buffer (vector-ref env 1) 'int16))
  (define fifteen (xBroadcast (int-imm (bv 15 16) #t) 64))

  (define halide-expr
    (vec-rounding_mul_shift_right buf-0 buf-1 fifteen)

    )

  (halide:assemble-bitvector (halide:interpret halide-expr) (halide:vec-len halide-expr))
  
  )


(define (get-hydride-result env)
  (hexagon_V6_vmpyhvsrs_128B_alt (vector-ref env 0) (vector-ref env 1))
  )

(define v1 (?? (bitvector 1024)))
(define v2 (?? (bitvector 1024)))

;; comment these lines below for testing verification
;(set! v1 (bv #x904ba4869d16b1a567067f388d9092d779789196c18afffdc0fff33b1b08e3855401355c815393d5551b953753f97ff9fa554975e8f5663c8bedf1d1b197d300f8d76020e528106094de812dd4fa41934b6f7257ea6380009cc440078000ffee18207d7f042c553ecb93cf576293d878c2d17a19fa40ff47f92e17ce2727c41d 1024))
;(set! v2 (bv #xe6ecadd6bff66ffc31aaeba0ca5a77af60c69332969e4a9e11be6957c11ddff18001ad04610181cfc532a536e526b8768cebd2dcfffe2b47343eb4fad3a0ffff89fdc08afd7e91041a49409ca9b9ea0a93768a5859368000d801800180000768104073c0fff172993433bee3967de07f0001fc328005783a6dc9bfe09766ce59 1024))
(define env (vector v1 v2))


(printf "V1: \n")
(print-mat v1 1 64 16)


(printf "V2: \n")
(print-mat v2 1 64 16)



(define halide-result (get-halide-result env))
(printf "\nHalide Result:\t~a\n" halide-result)
(print-mat halide-result 1 64 16)
(define hydride-result (get-hydride-result env))
(printf "\nHydride Result:\t~a\n" hydride-result)
(print-mat hydride-result 1 64 16)

(printf "\nEqual? ~a\n" (equal? halide-result hydride-result))

(cond
  [(not (equal? halide-result hydride-result))
   (for/list ([i (range 64)])
             (define low (* i 16))
             (define high (+ low 15))

             (define halide-i (extract high low halide-result))
             (define hydride-i (extract high low hydride-result))

             (printf "Element ~a equal?:\t ~a\n" i (equal? halide-i hydride-i))

             (cond 
               [(not (equal? halide-i hydride-i))
                (printf "   Halide: ~a , Hydride: ~a\n" halide-i hydride-i)
                (printf "   Halide: ~a , Hydride: ~a\n" (bitvector->integer halide-i) (bitvector->integer hydride-i))
                
                ]
               )

             
             
             )
   
   ]
  )

(define cex
  (verify
    (assert (equal? halide-result hydride-result))
    )
  
  )

(println cex)
(cond 
  [(unsat? cex) (exit)]
  
  )

(printf "(set! v1 ~a)\n" (evaluate v1 cex))
(printf "(set! v2 ~a)\n" (evaluate v2 cex))
