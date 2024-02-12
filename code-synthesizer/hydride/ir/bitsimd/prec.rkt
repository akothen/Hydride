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
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)

(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (bitsimd:get-prec prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
	[(lit v) (bvlength v)]
	[(nop v1) (bitsimd:get-prec v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8) num_2]
	[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
	[(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
	[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[else (error "Unable to infer prec for dram_pimcpy_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 8]
		[else (error "Unable to infer prec for dram_pimmax_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 8) (equal? num_11 0)) 1]
		[else (error "Unable to infer prec for dram_pimeq_v16384_e1__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[else (error "Unable to infer prec for dram_pimnot_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[else (error "Unable to infer prec for dram_pimbitcount_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0)) 1]
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0)) 1]
		[else (error "Unable to infer prec for dram_pimsearch_v16384_e1__v16384_e8__v1_e8")]
)

	]
	[(dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimxor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_2 131072) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[else (error "Unable to infer prec for dram_pimabs_v16384_e8__v16384_e8")]
)

	]
	[(dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 16384) (equal? num_2 16384) (equal? num_3 0) (equal? num_4 16384) (equal? num_5 1) (equal? size_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[else (error "Unable to infer prec for dram_pimpopcount_v1_e16__v16384_e1")]
)

	]
	[(dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 8) (equal? num_12 0)) 1]
		[(and  (equal? size_i_o 16384) (equal? num_5 16384) (equal? num_6 0) (equal? num_7 16384) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 8) (equal? num_12 0)) 1]
		[else (error "Unable to infer prec for dram_pimlt_v16384_e1__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimnand_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 8]
		[else (error "Unable to infer prec for dram_pimdiv_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 8]
		[else (error "Unable to infer prec for dram_vadd_v16384_e8")]
)

	]
	[(dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimxnor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimand_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 8]
		[else (error "Unable to infer prec for dram_pimmin_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 8]
		[else (error "Unable to infer prec for dram_pimmul_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 8]
		[else (error "Unable to infer prec for dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1")]
)

	]
	[(dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 8]
		[else (error "Unable to infer prec for dram_pimsub_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimrem_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_4 131072) (equal? num_5 0) (equal? num_6 131072) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 0)) 8]
		[else (error "Unable to infer prec for dram_pimReLU_v16384_e8__v16384_e8__v1_e8")]
)

	]
	[(dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 -1) (equal? num_8 0) (equal? num_9 0)) 8]
		[else (error "Unable to infer prec for dram_pimredsum_v1_e8__v16384_e8")]
)

	]
	[(dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimbrdcst_v16384_e8__v1_e8")]
)

	]
	[(dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[else (error "Unable to infer prec for dram_pimnor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================

