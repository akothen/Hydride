#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)


(current-solver (boolector))
(current-bitwidth 16)




(custodian-limit-memory (current-custodian) (* 22000 1024 1024))

(define (create-tensor rows cols precision)
  (apply concat
         (for/list ([i (range (* rows cols))])
                   (bv i (bitvector precision))
                   ))

  )

;; Specification of sobel3x3 filter on an element 
(define (sobel-body img i j )
  (define IP 8) ;; Precision of input elements
  (define P 16) ;; Precision to cast input to before doing compute
  (define OP 8) ;; Precision to cast output back to
  (define rows 3)
  (define cols 8)
  (define extend-type (bitvector P))

  (define (bvabs x)
    (if
      (bvslt x (bv 0 (bitvector (bvlength x))))
      (bvmul (bv -1 (bvlength x)) x)
      x
      )
    )

  (define (x_avg _i _j)

    (bvadd
      (sign-extend (ext-bv img (+ (* (- _i 1) cols) _j) IP) extend-type)
      (bvmul (sign-extend (ext-bv img (+ (* _i cols) _j) IP) extend-type) (bv 2 (bitvector P)))
      (sign-extend (ext-bv img (+ (* (+ _i 1) cols) _j) IP) extend-type)
      )
    )

  (define (sobel_x _i _j)
    (define diff_res (bvadd (x_avg _i (- _j 1)) (x_avg _i (+ _j 1))    ))
    (bvabs diff_res)
    )


  (define (y_avg _i _j)
    (bvadd
      (sign-extend (ext-bv img (+ (* _i  cols) (- _j 1)) IP) extend-type)
      (bvmul (sign-extend (ext-bv img (+ (* _i cols) _j) IP) extend-type) (bv 2 (bitvector P)))
      (sign-extend (ext-bv img (+ (* _i  cols) (+ _j 1)) IP) extend-type)
      )
    )

  (define (sobel_y _i _j)
    (define diff_res (bvadd (y_avg (- _i 1) _j ) (y_avg (+ _i 1) _j )    ))
    (bvabs diff_res)
    )

  (define (clamp_res val low high)
    (define low_bv (bv low (bitvector (bvlength val))))
    (define high_bv (bv high (bitvector (bvlength val))))
    (define clamp_low (bvsmax val low_bv))
    (define clamp_high (bvsmin clamp_low high_bv))
    clamp_high

    )

  (define (output _i _j)
    (define add_res (bvadd (sobel_x i j) (sobel_y i j) ))
    (clamp_res add_res 0 255) ;; Clamp the value between 0 and 255
    ) 

  (output i j)
  )


;; Sobel filter expressed as sub-expressions

(define VF 8)

(define test (create-tensor 1 16 8))

(define (sext input)
  (define extend-type (bitvector 16))
  (apply concat 
         (for/list ( [i (reverse (range VF))] )
                     (sign-extend (ext-bv input i 8) extend-type)
                   )

         )
  )

(displayln "Testing Sext")
(println test)
(println (sext test))
(println (_mm_cvtepi16_epi64 test 128 128 64 8 0 16))



(define (x_avg v1 v2 v3)
  (define IP 16)
  (define extend-type (bitvector 16))

  (apply concat 
         (for/list ( [i (reverse (range VF))] )
                   (bvadd
                     (ext-bv v1 i IP) 
                     (bvmul (ext-bv v2 i IP)  (bv 2 extend-type))
                     (ext-bv  v3 i IP)
                     )
                   )

         )
  )







(define (sobel_x v1 v2)

  (define IP 16)
  (define (bvabs x)
    (if
      (bvslt x (bv 0 (bitvector (bvlength x))))
      (bvmul (bv -1 (bvlength x)) x)
      x
      )
    )


  (define (iabs x)
    (define integer_abs (abs (bitvector->integer x)))
    (integer->bitvector integer_abs (bitvector (bvlength x)))
    )

  (apply concat 
         (for/list ( [i (reverse (range VF))] )
              (define diff_res 
                (bvsub 
                  (ext-bv v1 i IP)
                  (ext-bv v2 i IP)
                                   
                                 )
                )
              ;(bvabs diff_res)
              (iabs diff_res)
            )
        
        )
  )


(displayln "Testing Sobel x")
(define sobel_x_input (bvmul (bv -1 128) test))
(printf "v1:\t~a\n" test)
(print-mat test 1 8 16)
(printf "v2:\t~a\n" sobel_x_input)
(print-mat sobel_x_input 1 8 16)
(println (sobel_x test sobel_x_input))
(print-mat (sobel_x test sobel_x_input) 1 8 16)



(define sub_expr  (
    _mm512_sub_epi8_dsl
    (reg 0)
    (reg 1)
    128				;; Integer Operand 
    128				;; Lane Size 
    128				;; Integer Operand 
    16				;; Precision Operand 
    0				;; Integer Operand 
))

(define manual 
  (

		_mm512_abs_epi64_dsl
        sub_expr
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
   ))

(define-symbolic sv1 (bitvector 128))
(define-symbolic sv2 (bitvector 128))

(define cex
  (verify 
    (begin
      (assert (equal? (sobel_x sv1 sv2) (interpret manual (vector sv1 sv2))))
      )))

;(assert (sat? cex) "Verification passed")

(define (y_avg v1 v2 v3)
  (define extend-type (bitvector 16))
  (define IP 16)

  (apply concat 
         (for/list ( [i (reverse (range VF))] )
                   (bvadd
                     (ext-bv v1 i IP)
                     (bvmul (ext-bv v2 i IP) (bv 2 extend-type))
                     (ext-bv v3 i IP)
                     )
                   )

         )
  )




(define (sobel_y v1 v2)

  (define IP 16)
  (define (bvabs x)
    (if
      (bvslt x (bv 0 (bitvector (bvlength x))))
      (bvmul (bv -1 (bvlength x)) x)
      x
      )
    )


  (define (iabs x)
    (define integer_abs (abs (bitvector->integer x)))
    (integer->bitvector integer_abs (bitvector (bvlength x)))
    )

  (apply concat 
         (for/list ( [i (reverse (range VF))] )
              (define diff_res 
                (bvsub 
                  (ext-bv v1 i IP)
                  (ext-bv v2 i IP)
                                   
                                 )
                )
              ;(bvabs diff_res)
              (iabs diff_res)
            )
        
        )
  )



(define (output v1 v2)
  (define (clamp_res val low high)
    (define low_bv (bv low (bitvector (bvlength val))))
    (define high_bv (bv high (bitvector (bvlength val))))
    (define clamp_low (bvsmax val low_bv))
    (define clamp_high (bvsmin clamp_low high_bv))
    clamp_high

    )
  (apply concat 
         (for/list ( [i (reverse (range VF))] )

          (define add_res (bvadd 
                            (ext-bv v1 i 16) 
                            (ext-bv v2 i 16) 
                            )
            )
          (clamp_res add_res 0 255) ;; Clamp the value between 0 and 255

                   ))
  ) 

(displayln "Testing Output")
(printf "v1:\t~a\n" test)
(printf "v2:\t~a\n" test)
(printf "output:\t~a\n" (output test test))


(define (invoke_sext env)
  (sext (vector-ref env 0)
         )
  )

(define (invoke_x_avg env)
  (x_avg (vector-ref env 0)
         (vector-ref env 1)
         (vector-ref env 2)
         )
  )


(define (invoke_sobel_x env)
  (sobel_x (vector-ref env 0)
         (vector-ref env 1)
         )
  )


(define (invoke_y_avg env)
  (y_avg (vector-ref env 0)
         (vector-ref env 1)
         (vector-ref env 2)
         )
  )


(define (invoke_sobel_y env)
  (sobel_y (vector-ref env 0)
         (vector-ref env 1)
         )
  )


(define (invoke_output env)
  (output (vector-ref env 0)
         (vector-ref env 1)
         )
  )




;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (sext_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[else
	(lit (?? (bitvector 64)))
	]
	)
)

(define (sext_grammar_shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(sext_grammar_mem vars #:depth k)
	]
	)
)

(define (sext_grammar_operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_mm_cvtepi16_epi64_dsl
		(sext_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		64				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		16				;; Precision Operand 
	)]
	[(choose* #t #f)
	(
		_mm_cvtepi16_epi64_dsl
		(sext_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		16				;; Precision Operand 
	)]
	[else
	(sext_grammar_shuffle vars #:depth k)
	]
	)
)


;; ================================================================================

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (x_avg_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[else
	(lit (?? (bitvector 128)))
	]
	)
)

(define (x_avg_grammar_shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(x_avg_grammar_mem vars #:depth k)
	]
	)
)

(define (x_avg_grammar_operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_m_paddw_dsl
		(x_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(x_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(x_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(x_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(x_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(x_avg_grammar_shuffle vars #:depth k)
	]
	)
)


;; ================================================================================

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (y_avg_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[else
	(lit (?? (bitvector 128)))
	]
	)
)

(define (y_avg_grammar_shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(y_avg_grammar_mem vars #:depth k)
	]
	)
)

(define (y_avg_grammar_operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_m_paddw_dsl
		(y_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(y_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(y_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(y_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(y_avg_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(y_avg_grammar_shuffle vars #:depth k)
	]
	)
)


;; ================================================================================

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (sobel_x_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[else
	(lit (?? (bitvector 128)))
	]
	)
)

(define (sobel_x_grammar_shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(sobel_x_grammar_mem vars #:depth k)
	]
	)
)

(define (sobel_x_grammar_operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_mm_maskz_sub_epi16_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_sub_epi16_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_sub_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_abs_epi64_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		64				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		64				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_mask_blend_epi64_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_maskz_mov_epi64_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_maskz_mov_epi64_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_blend_epi16_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_abs_epi16_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_abs_epi16_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 512)))				;; 512-bit Constant Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 256)))				;; 256-bit Constant Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(sobel_x_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(sobel_x_grammar_shuffle vars #:depth k)
	]
	)
)


;; ================================================================================

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (sobel_y_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[else
	(lit (?? (bitvector 128)))
	]
	)
)

(define (sobel_y_grammar_shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(sobel_y_grammar_mem vars #:depth k)
	]
	)
)

(define (sobel_y_grammar_operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_mm_maskz_sub_epi16_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_sub_epi16_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_sub_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_abs_epi64_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		64				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		64				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_mask_blend_epi64_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_maskz_mov_epi64_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_maskz_mov_epi64_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_blend_epi16_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_abs_epi16_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_abs_epi16_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 512)))				;; 512-bit Constant Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 256)))				;; 256-bit Constant Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(sobel_y_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(sobel_y_grammar_shuffle vars #:depth k)
	]
	)
)


;; ================================================================================

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (output_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f) 
	(lit (?? (bitvector 128)))
     ]
	[else
	(lit (?? (bitvector 128)))
	]
	)
)

(define (output_grammar_shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_shuffle vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(output_grammar_mem vars #:depth k)
	]
	)
)

(define (output_grammar_operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_m_paddw_dsl
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_max_epi8_dsl
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_min_epi8_dsl
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_broadcastq_epi64_dsl
		(output_grammar_operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(output_grammar_shuffle vars #:depth k)
	]
	)
)


(define spec_exprs
  (list
    invoke_sext
    invoke_x_avg
    invoke_sobel_x
    invoke_y_avg
    ;;invoke_sobel_y
    invoke_output
   )
  )


(define spec_inputs_sizes 
  (list
    (list 128)
    (list 128 128 128)
    (list 128 128)
    (list 128 128 128)
    ;;(list 128 128)
    (list 128 128)
    )
  )

(define grammar-fns 
  (list
    (lambda (i) (sext_grammar_operations (list (reg 0)) #:depth i  )  )
    (lambda (i) (x_avg_grammar_operations (list (reg 0) (reg 1) (reg 2)) #:depth i  )  )
    (lambda (i) (sobel_x_grammar_operations (list (reg 0) (reg 1)) #:depth i  )  )
    (lambda (i) (y_avg_grammar_operations (list (reg 0) (reg 1) (reg 2)) #:depth i  )  )
    ;; Skipping as identical to sobel_x ;; (lambda (i) (sobel_y_grammar_operations (list (reg 0) (reg 1)) #:depth i  )  )
    (lambda (i) (output_grammar_operations (list (reg 0) (reg 1)) #:depth i  )  )
    ))



(define depth-limit 5)

(define start_time (current-seconds))

(for/list ([i (range (length spec_exprs))])
          (clear-vc!)
          (displayln "===================================")
          (display "Synthesizing Subexpression #")
          (displayln i)
          (define sub_expr (list-ref spec_exprs i))
          (define bw-list (list-ref spec_inputs_sizes i))

          (define test_grammar-fn (list-ref grammar-fns i))

          (println sub_expr)
          (println bw-list)

          (define-values (satisfiable? materialize elap) 
                         (synthesize-sol-with-depth 2 depth-limit sub_expr test_grammar-fn bw-list #f cost) )

          (displayln "Synthesis step completed!")
          (display "Synthesis took ")
          (display elap)
          (displayln " seconds")

          (if satisfiable? 
            (begin
              (displayln "Solution")
              (pretty-print materialize)
              )
            (displayln "Unsatisfiable")
            )


          )

(define end_time (current-seconds))
(define elapsed_time (- end_time start_time))
(printf "Total Synthesis took ~a seconds ...\n" elapsed_time )
