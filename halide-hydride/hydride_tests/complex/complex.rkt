#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

;(current-solver (boolector))
(current-bitwidth 16)




(custodian-limit-memory (current-custodian) (* 22000 1024 1024))


(define reg_5_bitvector (create-tensor 1 32 16))
(define reg_9_bitvector (create-tensor 1 32 16))
(define reg_13_bitvector (create-tensor 1 32 16))
(define reg_17_bitvector (create-tensor 1 32 16))


;(define-symbolic reg_5_bitvector (bitvector 512))
(define reg_5 (halide:create-buffer reg_5_bitvector 'uint16))
;(define-symbolic reg_9_bitvector (bitvector 512))
(define reg_9 (halide:create-buffer reg_9_bitvector 'uint16))
;(define-symbolic reg_13_bitvector (bitvector 512))
(define reg_13 (halide:create-buffer reg_13_bitvector 'uint16))
;(define-symbolic reg_17_bitvector (bitvector 512))
(define reg_17 (halide:create-buffer reg_17_bitvector 'uint16))



(define-symbolic reg_7_bitvector (bitvector 32))
(define reg_7 (halide:create-buffer reg_7_bitvector 'int32))
(define-symbolic reg_0_bitvector (bitvector 32))
(define reg_0 (halide:create-buffer reg_0_bitvector 'int32))
(define-symbolic reg_15_bitvector (bitvector 32))
(define reg_15 (halide:create-buffer reg_15_bitvector 'int32))
(define-symbolic reg_37_bitvector (bitvector 32))
(define reg_37 (halide:create-buffer reg_37_bitvector 'int32))
(define-symbolic reg_23_bitvector (bitvector 32))
(define reg_23 (halide:create-buffer reg_23_bitvector 'int32))
(define-symbolic reg_21_bitvector (bitvector 32))
(define reg_21 (halide:create-buffer reg_21_bitvector 'int32))
(define-symbolic reg_11_bitvector (bitvector 32))
(define reg_11 (halide:create-buffer reg_11_bitvector 'int32))
(define-symbolic reg_34_bitvector (bitvector 32))
(define reg_34 (halide:create-buffer reg_34_bitvector 'int32))
(define-symbolic reg_6_bitvector (bitvector 32))
(define reg_6 (halide:create-buffer reg_6_bitvector 'int32))
(define-symbolic reg_16_bitvector (bitvector 32))
(define reg_16 (halide:create-buffer reg_16_bitvector 'int32))
(define-symbolic reg_14_bitvector (bitvector 32))
(define reg_14 (halide:create-buffer reg_14_bitvector 'int32))
(define-symbolic reg_2_bitvector (bitvector 32))
(define reg_2 (halide:create-buffer reg_2_bitvector 'int32))
(define-symbolic reg_18_bitvector (bitvector 32))
(define reg_18 (halide:create-buffer reg_18_bitvector 'int32))
(define-symbolic reg_27_bitvector (bitvector 32))
(define reg_27 (halide:create-buffer reg_27_bitvector 'int32))
(define-symbolic reg_25_bitvector (bitvector 32))
(define reg_25 (halide:create-buffer reg_25_bitvector 'int32))
(define-symbolic reg_26_bitvector (bitvector 32))
(define reg_26 (halide:create-buffer reg_26_bitvector 'int32))
(define-symbolic reg_20_bitvector (bitvector 32))
(define reg_20 (halide:create-buffer reg_20_bitvector 'int32))
(define-symbolic reg_4_bitvector (bitvector 32))
(define reg_4 (halide:create-buffer reg_4_bitvector 'int32))
(define-symbolic reg_1_bitvector (bitvector 32))
(define reg_1 (halide:create-buffer reg_1_bitvector 'int32))
(define-symbolic reg_8_bitvector (bitvector 32))
(define reg_8 (halide:create-buffer reg_8_bitvector 'int32))
(define-symbolic reg_36_bitvector (bitvector 32))
(define reg_36 (halide:create-buffer reg_36_bitvector 'int32))
(define-symbolic reg_3_bitvector (bitvector 32))
(define reg_3 (halide:create-buffer reg_3_bitvector 'int32))
(define-symbolic reg_22_bitvector (bitvector 32))
(define reg_22 (halide:create-buffer reg_22_bitvector 'int32))
(define-symbolic reg_33_bitvector (bitvector 32))
(define reg_33 (halide:create-buffer reg_33_bitvector 'int32))
(define-symbolic reg_12_bitvector (bitvector 32))
(define reg_12 (halide:create-buffer reg_12_bitvector 'int32))
(define-symbolic reg_10_bitvector (bitvector 32))
(define reg_10 (halide:create-buffer reg_10_bitvector 'int32))
(define-symbolic reg_19_bitvector (bitvector 32))
(define reg_19 (halide:create-buffer reg_19_bitvector 'int32))
(define-symbolic reg_28_bitvector (bitvector 32))
(define reg_28 (halide:create-buffer reg_28_bitvector 'int32))
(define-symbolic reg_29_bitvector (bitvector 32))
(define reg_29 (halide:create-buffer reg_29_bitvector 'int32))
(define-symbolic reg_30_bitvector (bitvector 32))
(define reg_30 (halide:create-buffer reg_30_bitvector 'int32))
(define-symbolic reg_31_bitvector (bitvector 32))
(define reg_31 (halide:create-buffer reg_31_bitvector 'int32))
(define-symbolic reg_32_bitvector (bitvector 32))
(define reg_32 (halide:create-buffer reg_32_bitvector 'int32))
(define-symbolic reg_24_bitvector (bitvector 32))
(define reg_24 (halide:create-buffer reg_24_bitvector 'int32))

(define sym_env (vector reg_5 reg_9 reg_13 reg_17 ))
(define-symbolic-buffer input1 uint16_t)
(define-symbolic-buffer input2 uint16_t)
(define-symbolic-buffer input3 uint16_t)
(define-symbolic-buffer input4 uint16_t)

(define-symbolic output.s0.y.rebased integer?)
(define-symbolic t79 integer?)
(define-symbolic t69 integer?)
(define-symbolic t54 integer?)
(define-symbolic t97 integer?)
(define-symbolic t89 integer?)
(define-symbolic t94 integer?)
(define-symbolic t64 integer?)
(define-symbolic t74 integer?)
(define-symbolic t118 integer?)
(define-symbolic t59 integer?)
(define-symbolic t106 integer?)
(define-symbolic t108 integer?)
(define-symbolic t109 integer?)
(define-symbolic t110 integer?)
(define-symbolic t111 integer?)
(define-symbolic t84 integer?)

(define axioms 
  (list ))

(define input1.min.0 (var-lookup 'input1.min.0 reg_18))
(define input1.stride.1 (var-lookup 'input1.stride.1 reg_19))
(define input2.min.0 (var-lookup 'input2.min.0 reg_20))
(define input2.stride.1 (var-lookup 'input2.stride.1 reg_21))
(define input3.min.0 (var-lookup 'input3.min.0 reg_22))
(define input3.stride.1 (var-lookup 'input3.stride.1 reg_23))
(define input4.min.0 (var-lookup 'input4.min.0 reg_24))
(define input4.stride.1 (var-lookup 'input4.stride.1 reg_25))
(define output.min.0 (var-lookup 'output.min.0 reg_26))
(define output.min.1 (var-lookup 'output.min.1 reg_27))
(define t42 (var-lookup 't42 reg_28))
(define t44 (var-lookup 't44 reg_29))
(define t45 (var-lookup 't45 reg_30))
(define t46 (var-lookup 't46 reg_31))
(define t47 (var-lookup 't47 reg_32))
(define t35 (var-lookup 't35 (sca-add  (sca-mul  reg_33  32)  reg_34)))
(define t27 (var-lookup 't27 (sca-add  reg_36  reg_37)))

(define halide-expr 
 (uint16x32
  (vec-mul
   (vec-add
    (uint32x32
     reg_5)
    (uint32x32
     reg_9))
   (vec-add
    (uint32x32
     reg_13)
    (uint32x32
     reg_17))))
)
(define result (halide:assemble-bitvector (halide:interpret halide-expr) 32))
(print-mat result 1 32 16)

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (sext_grammar_mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[else
	(lit (?? (bitvector 512)));;(create-symbolic-bv 512))
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
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		8				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		16				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		8				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		16				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		8				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		16				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		8				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		16				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		8				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		16				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		8				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_shuffle vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		32				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Lane Size 
		16				;; Integer Operand 
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
		_mm512_mullo_epi16_dsl
		(sext_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_m_paddw_dsl
		(sext_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_mulhi_pi16_dsl
		(sext_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(sext_grammar_operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		16				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[else
	(sext_grammar_shuffle vars #:depth k)
	]
	)
)



(define (invoke_sext env)

  (define _reg_0 (halide:create-buffer (vector-ref env 0) 'uint16))
  (define _reg_1 (halide:create-buffer (vector-ref env 1) 'uint16))
  (define _reg_2 (halide:create-buffer (vector-ref env 2) 'uint16))
  (define _reg_3 (halide:create-buffer (vector-ref env 3) 'uint16))
  (define _halide-expr 

 (uint16x32
  (vec-mul
   (vec-add
    (uint32x32
     _reg_0)
    (uint32x32
     _reg_1))
   (vec-add
    (uint32x32
     _reg_2)
    (uint32x32
     _reg_3))))
 )
  (define _result (halide:assemble-bitvector (halide:interpret _halide-expr) 32))
  _result

  )

(define spec_exprs
  (list
    invoke_sext
    )
  )


(define spec_inputs_sizes 
  (list
    (list 512 512 512 512)
    )
  )

(define grammar-fns 
  (list
    (lambda (i) (sext_grammar_operations (list (reg 0) (reg 1) (reg 2) (reg 3)) #:depth i  )  )
    ))

(define manual-sol 
        (_mm_mulhi_pi16_dsl
            (
            _m_paddw_dsl
            (reg 0 ) ;; 512-bit Bitvector operand
            (reg 1) ;; 512-bit Bitvector operand
            512				;; Integer Operand 
            512				;; Lane Size 
            512				;; Integer Operand 
            16				;; Precision Operand 
            0				;; Integer Operand 
            )

            (
            _m_paddw_dsl
            (reg 2 ) ;; 512-bit Bitvector operand
            (reg 3) ;; 512-bit Bitvector operand
            512				;; Integer Operand 
            512				;; Lane Size 
            512				;; Integer Operand 
            16				;; Precision Operand 
            0				;; Integer Operand 
            )
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		16				;; Integer Operand 
		32				;; Integer Operand 
	 )
  )

(printf "Manual cost: ~a \n" (cost manual-sol))


(define orig-sol (bv #x6ce6c24059d8a7665a5690c854b6c705f7afae6ebd62020a8b52caf69dcda270fffefffffffffffffffffffffffafffffffaffffffffffffffffffffe762b1d0 512))
(displayln "Original  Solution:")
(print-mat orig-sol 1 32 16)


(define synth-sol (bv #xfde5687a4240b7255bf69f3c1173c3c23e7ef3fa6ba70f3a9bdafdfeffdea891fffffffefffefffefffefffefffefffefff2fffefffefffefffefffee76be79c 512))
(displayln "Synth  Solution:")
(print-mat synth-sol 1 32 16)

(define-values (verified? new-cex)
               (verify-synth-sol manual-sol (list 512 512 512 512) invoke_sext )
               )

(printf "Solution verified: ~a \n" verified?)
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

          (define optimize? #t)
          (define symbolic? #f)
          (define cost-bound 50)
          (define solver 'boolector)

          (define test-start (current-seconds))
          (define-values (satisfiable? materialize elap) 
                         (synthesize-sol-with-depth 3 depth-limit sub_expr test_grammar-fn bw-list optimize? cost symbolic? cost-bound solver) )

          (define test-end (current-seconds))

          (printf "Test elapsed time: ~a \n" (- test-end test-start))

          (displayln "Synthesis step completed!")

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
