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
(require rosette/lib/destruct)

(require hydride/utils/bvops)
(require hydride/utils/misc)
(require hydride/utils/llvm_impl)


(require hydride/ir/hydride/definition)


(require hydride/ir/bitsimd/semantics)
(require hydride/ir/bitsimd/definition)
(require hydride/ir/bitsimd/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (bitsimd:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (bitsimd:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (bitsimd:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o (bitsimd:interpret v4 env) num_5)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext (bitsimd:interpret v0 env) size_i size_o)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat (bitsimd:interpret v0 env) size_i size_o)
	]
	[ (dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimcpy_v16384_e8__v16384_e8 (bitsimd:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_pimmax_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(dram_pimeq_v16384_e1__v16384_e8__v16384_e8 (bitsimd:interpret vc_0 env) (bitsimd:interpret vc_1 env) (bitsimd:interpret v2 env) 
		 (bitsimd:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 prec_i num_10 num_11)
	]
	[ (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimor_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimnot_v16384_e8__v16384_e8 (bitsimd:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimbitcount_v16384_e8__v16384_e8 (bitsimd:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(dram_pimsearch_v16384_e1__v16384_e8__v1_e8 (bitsimd:interpret vc_0 env) (bitsimd:interpret vc_1 env) (bitsimd:interpret v2 env) 
		 (bitsimd:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 prec_i num_10 num_11 
		 num_12)
	]
	[ (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimxor_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimabs_v16384_e8__v16384_e8 (bitsimd:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(dram_pimpopcount_v1_e16__v16384_e1 (bitsimd:interpret v0 env) size_i num_2 
		 num_3 num_4 num_5 
		 size_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(dram_pimlt_v16384_e1__v16384_e8__v16384_e8 (bitsimd:interpret vc_0 env) (bitsimd:interpret vc_1 env) (bitsimd:interpret v2 env) 
		 (bitsimd:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 prec_i num_11 
		 num_12)
	]
	[ (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimnand_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(dram_pimdiv_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_vadd_v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimxnor_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimand_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_pimmin_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(dram_pimmul_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1 (bitsimd:interpret v0 env) (bitsimd:interpret vc_1 env) (bitsimd:interpret v2 env) 
		 (bitsimd:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_pimsub_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimrem_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(dram_pimReLU_v16384_e8__v16384_e8__v1_e8 (bitsimd:interpret vc_0 env) (bitsimd:interpret v1 env) (bitsimd:interpret vc_2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(dram_pimredsum_v1_e8__v16384_e8 (bitsimd:interpret v0 env) size_i num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7 num_8 
		 num_9)
	]
	[ (dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(dram_pimbrdcst_v16384_e8__v1_e8 (bitsimd:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimnor_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

