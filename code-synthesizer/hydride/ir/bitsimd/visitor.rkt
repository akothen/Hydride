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



(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Visitor 
;; ================================================================================
(define (bitsimd:visitor prog fn)
 (destruct prog
	[(dim-x id) (fn prog)]
	[(dim-y id) (fn prog)]
	[(idx-i id) (fn prog)]
	[(idx-j id) (fn prog)]
	[(reg id) (fn prog) ]
	[(lit v) (fn prog)]
	[(nop v1) (bitsimd:visitor v1 fn)]
	[(idx-add i1 i2) (fn prog) ]
	[(idx-mul i1 i2) (fn prog) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( vector-two-input-swizzle_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( interleave-vectors_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( interleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( deinterleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(define v4-visited (bitsimd:visitor v4 fn))
		(fn ( llvm_shuffle_vectors_dsl v0-visited v1-visited num_2 prec_i_o v4-visited num_5 ))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-add_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-sub_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-mul_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-sdiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-udiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( llvm-zext_dsl v0-visited size_i size_o ))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( scalar_splat_dsl v0-visited size_i size_o ))
	]
	[ (dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimcpy_v16384_e8__v16384_e8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 ))
	]
	[ (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimnot_v16384_e8__v16384_e8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimbitcount_v16384_e8__v16384_e8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12 ))
	]
	[ (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimabs_v16384_e8__v16384_e8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimpopcount_v1_e16__v16384_e1_dsl v0-visited size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 ))
	]
	[ (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_vadd_v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(define vc_2-visited (bitsimd:visitor vc_2 fn))
		(fn ( dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0-visited v1-visited vc_2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ))
	]
	[ (dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimredsum_v1_e8__v16384_e8_dsl v0-visited size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 ))
	]
	[ (dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( dram_pimbrdcst_v16384_e8__v1_e8_dsl v0-visited size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

