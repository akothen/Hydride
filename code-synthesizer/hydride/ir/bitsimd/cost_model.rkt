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
(require hydride/ir/bitsimd/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost_dram_pimcpy_v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimnot_v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimbitcount_v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl 1)
(define cost_dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimabs_v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimpopcount_v1_e16__v16384_e1_dsl 1)
(define cost_dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_vadd_v16384_e8_dsl 1)
(define cost_dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl 1)
(define cost_dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl 1)
(define cost_dram_pimredsum_v1_e8__v16384_e8_dsl 1)
(define cost_dram_pimbrdcst_v16384_e8__v1_e8_dsl 1)
(define cost_dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl 1)

(define (bitsimd:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (bitsimd:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (bitsimd:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 (bitsimd:cost  v4) )
	]
		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-zext_dsl v0 size_i size_o)
		(+ 1 (bitsimd:cost  v0) )
	]
		[ (scalar_splat_dsl v0 size_i size_o)
		(+ 1 (bitsimd:cost  v0) )
	]
	[ (dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_dram_pimcpy_v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  
		 
		)
	]
	[ (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(+ cost_dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl (bitsimd:cost  vc_0)  (bitsimd:cost  vc_1)  (bitsimd:cost  v2)  
		 (bitsimd:cost  v3)  
		 
		)
	]
	[ (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_dram_pimnot_v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  
		 
		)
	]
	[ (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_dram_pimbitcount_v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  
		 
		)
	]
	[ (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(+ cost_dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl (bitsimd:cost  vc_0)  (bitsimd:cost  vc_1)  (bitsimd:cost  v2)  
		 (bitsimd:cost  v3)  
		 
		 
		)
	]
	[ (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_dram_pimabs_v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  
		 
		)
	]
	[ (dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_dram_pimpopcount_v1_e16__v16384_e1_dsl (bitsimd:cost  v0)  
		 
		 
		)
	]
	[ (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(+ cost_dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl (bitsimd:cost  vc_0)  (bitsimd:cost  vc_1)  (bitsimd:cost  v2)  
		 (bitsimd:cost  v3)  
		 
		 
		)
	]
	[ (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		 
		 
		)
	]
	[ (dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_dram_vadd_v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		 
		)
	]
	[ (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl (bitsimd:cost  v0)  (bitsimd:cost  vc_1)  (bitsimd:cost  v2)  
		 (bitsimd:cost  v3)  
		 
		)
	]
	[ (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ cost_dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl (bitsimd:cost  vc_0)  (bitsimd:cost  v1)  (bitsimd:cost  vc_2)  
		 
		 
		)
	]
	[ (dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(+ cost_dram_pimredsum_v1_e8__v16384_e8_dsl (bitsimd:cost  v0)  
		 
		 
		)
	]
	[ (dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_dram_pimbrdcst_v16384_e8__v1_e8_dsl (bitsimd:cost  v0)  
		 
		)
	]
	[ (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

