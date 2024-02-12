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
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)

(require hydride/ir/bitsimd/semantics)
(require hydride/ir/bitsimd/definition)
(require hydride/ir/bitsimd/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Binder
;; ================================================================================
(define (bitsimd:bind-expr prog env)
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (vector-ref-bv env id)]
	[(lit v) (lit v)]
	[(idx-add i1 i2) (idx-add i1 i2)]
	[(idx-mul i1 i2) (idx-mul i1 i2)]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr prec_i_o env))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr v4 env) (bitsimd:bind-expr num_5 env))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i env) (bitsimd:bind-expr size_o env))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i env) (bitsimd:bind-expr size_o env))
	]
	[ (dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimcpy_v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env))
	]
	[ (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr vc_0 env) (bitsimd:bind-expr vc_1 env) (bitsimd:bind-expr v2 env) 
		 (bitsimd:bind-expr v3 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr prec_o env) 
		 (bitsimd:bind-expr prec_i env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env))
	]
	[ (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimnot_v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env))
	]
	[ (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimbitcount_v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env))
	]
	[ (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl (bitsimd:bind-expr vc_0 env) (bitsimd:bind-expr vc_1 env) (bitsimd:bind-expr v2 env) 
		 (bitsimd:bind-expr v3 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr prec_o env) 
		 (bitsimd:bind-expr prec_i env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env) 
		 (bitsimd:bind-expr num_12 env))
	]
	[ (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(dram_pimabs_v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env))
	]
	[ (dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(dram_pimpopcount_v1_e16__v16384_e1_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr size_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env))
	]
	[ (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr vc_0 env) (bitsimd:bind-expr vc_1 env) (bitsimd:bind-expr v2 env) 
		 (bitsimd:bind-expr v3 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr prec_o env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr prec_i env) (bitsimd:bind-expr num_11 env) 
		 (bitsimd:bind-expr num_12 env))
	]
	[ (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env) 
		 (bitsimd:bind-expr num_12 env))
	]
	[ (dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_vadd_v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env))
	]
	[ (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr vc_1 env) (bitsimd:bind-expr v2 env) 
		 (bitsimd:bind-expr v3 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env))
	]
	[ (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl (bitsimd:bind-expr vc_0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr vc_2 env) 
		 (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env))
	]
	[ (dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(dram_pimredsum_v1_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env))
	]
	[ (dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(dram_pimbrdcst_v16384_e8__v1_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_o env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env))
	]
	[ (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[v v]
 )
)
;; ================================================================================

