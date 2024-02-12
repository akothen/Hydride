;#============================== Hydride File =================================
;#
;# Part of the Hydride Compiler Infrastructure.
;# <Placeholder for license information>
;#
;#=============================================================================
;#
;# Do NOT modify this file. It is automatically generated.
;#
;#=============================================================================

#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Extract Subexpressions
;; ================================================================================
(define (bitsimd:extract-expr prog num-consumed depth)
 (cond [(equal? depth 0) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))] 
[else
(destruct prog
	[(reg id) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))]
	[(lit v) (values (lit v) num-consumed) ]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (vector-two-input-swizzle_dsl expr-0 expr-1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) num-consumed-1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (interleave-vectors_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (interleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (deinterleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (bitsimd:extract-expr v4 num-consumed-1 (- depth 1)))

(values (llvm_shuffle_vectors_dsl expr-0 expr-1 num_2 prec_i_o expr-2 num_5 ) num-consumed-2)
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-add_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sub_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-mul_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sdiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-udiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (llvm-zext_dsl expr-0 size_i size_o ) num-consumed-0)
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (scalar_splat_dsl expr-0 size_i size_o ) num-consumed-0)
	]
	[(dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)); dram_pimcpy_v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimcpy_v16384_e8__v16384_e8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimcpy_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); dram_pimmax_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimmax_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 8) (equal? num_11 0)); dram_pimeq_v16384_e1__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimeq_v16384_e1__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimor_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)); dram_pimnot_v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimnot_v16384_e8__v16384_e8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimnot_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)); dram_pimbitcount_v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimbitcount_v16384_e8__v16384_e8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimbitcount_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0)); dram_pimsearch_v16384_e1__v16384_e8__v1_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0)); dram_pimmatch_v16384_e1__v16384_e8__v1_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimsearch_v16384_e1__v16384_e8__v1_e8")]
)

	]
	[(dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimxor_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimxor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)); dram_pimabs_v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimabs_v16384_e8__v16384_e8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimabs_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 16384) (equal? num_2 16384) (equal? num_3 0) (equal? num_4 16384) (equal? num_5 1) (equal? size_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); dram_pimpopcount_v1_e16__v16384_e1
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimpopcount_v1_e16__v16384_e1_dsl expr-0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimpopcount_v1_e16__v16384_e1")]
)

	]
	[(dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 8) (equal? num_12 0)); dram_pimlt_v16384_e1__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 8) (equal? num_12 0)); dram_pimgt_v16384_e1__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimlt_v16384_e1__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimnand_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimnand_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); dram_pimdiv_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimdiv_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); dram_vadd_v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_vadd_v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); dram_pimadd_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_vadd_v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_vadd_v16384_e8")]
)

	]
	[(dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimxnor_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimxnor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimand_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimand_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); dram_pimmin_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimmin_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); dram_pimmul_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimmul_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)); dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (bitsimd:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl expr-0 vc_1 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1")]
)

	]
	[(dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); dram_pimsub_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimsub_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimrem_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimrem_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_4 131072) (equal? num_5 0) (equal? num_6 131072) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 0)); dram_pimReLU_v16384_e8__v16384_e8__v1_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v1 num-consumed (- depth 1)))
 
 (values (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 expr-0 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimReLU_v16384_e8__v16384_e8__v1_e8")]
)

	]
	[(dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 -1) (equal? num_8 0) (equal? num_9 0)); dram_pimredsum_v1_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimredsum_v1_e8__v16384_e8_dsl expr-0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimredsum_v1_e8__v16384_e8")]
)

	]
	[(dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); dram_pimbrdcst_v16384_e8__v1_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (dram_pimbrdcst_v16384_e8__v1_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for dram_pimbrdcst_v16384_e8__v1_e8")]
)

	]
	[(dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); dram_pimnor_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for dram_pimnor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
 )
]
) 
)
;; ================================================================================

