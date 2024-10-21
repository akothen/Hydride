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
(require hydride/ir/visa/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Visitor 
;; ================================================================================
(define (visa:visitor prog fn)
 (destruct prog
	[(dim-x id) (fn prog)]
	[(dim-y id) (fn prog)]
	[(idx-i id) (fn prog)]
	[(idx-j id) (fn prog)]
	[(reg id) (fn prog) ]
	[(lit v) (fn prog)]
	[(nop v1) (visa:visitor v1 fn)]
	[(idx-add i1 i2) (fn prog) ]
	[(idx-mul i1 i2) (fn prog) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( vector-two-input-swizzle_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( interleave-vectors_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(fn ( interleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(fn ( deinterleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(define v4-visited (visa:visitor v4 fn))
		(fn ( llvm_shuffle_vectors_dsl v0-visited v1-visited num_2 prec_i_o v4-visited num_5 ))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( llvm-vect-add_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( llvm-vect-sub_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( llvm-vect-mul_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( llvm-vect-sdiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( llvm-vect-udiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-visited (visa:visitor v0 fn))
		(fn ( llvm-zext_dsl v0-visited size_i size_o ))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-visited (visa:visitor v0 fn))
		(fn ( scalar_splat_dsl v0-visited size_i size_o ))
	]
	[ (VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(define v2-visited (visa:visitor v2 fn))
		(fn ( VMAD_sat_2_UB_UB_UB_UB_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(define vc_0-visited (visa:visitor vc_0 fn))
		(define vc_1-visited (visa:visitor vc_1 fn))
		(define vc_2-visited (visa:visitor vc_2 fn))
		(define vc_3-visited (visa:visitor vc_3 fn))
		(define v4-visited (visa:visitor v4 fn))
		(define v5-visited (visa:visitor v5 fn))
		(define v6-visited (visa:visitor v6 fn))
		(define v7-visited (visa:visitor v7 fn))
		(fn ( VBFI_4_UD_UD_UD_UD_UD_dsl vc_0-visited vc_1-visited vc_2-visited vc_3-visited v4-visited v5-visited v6-visited v7-visited size_i_o num_9 num_10 num_11 prec_i_o num_13 ))
	]
	[ (VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(define vc_0-visited (visa:visitor vc_0 fn))
		(define vc_1-visited (visa:visitor vc_1 fn))
		(define vc_2-visited (visa:visitor vc_2 fn))
		(define vc_3-visited (visa:visitor vc_3 fn))
		(define vc_4-visited (visa:visitor vc_4 fn))
		(define v5-visited (visa:visitor v5 fn))
		(define v6-visited (visa:visitor v6 fn))
		(define v7-visited (visa:visitor v7 fn))
		(fn ( VBFE_32_D_D_D_D_dsl vc_0-visited vc_1-visited vc_2-visited vc_3-visited vc_4-visited v5-visited v6-visited v7-visited size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 ))
	]
	[ (VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (visa:visitor vc_0 fn))
		(define vc_1-visited (visa:visitor vc_1 fn))
		(define v2-visited (visa:visitor v2 fn))
		(define v3-visited (visa:visitor v3 fn))
		(fn ( VAVG_sat_8_UB_UB_UB_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(define v2-visited (visa:visitor v2 fn))
		(fn ( VMAD_4_B_B_B_B_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VMULH_1_D_D_D_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VMUL_sat_8_UW_UW_UW_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o ))
	]
	[ (VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VADD_4_W_W_W_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(fn ( VMOV_1_Q_Q_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(define v2-visited (visa:visitor v2 fn))
		(fn ( VDP4A_sat_32_D_D_D_D_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 ))
	]
	[ (VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(fn ( VNOT_32_W_W_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VXOR_32_UD_UD_UD_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o ))
	]
	[ (VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(define v2-visited (visa:visitor v2 fn))
		(fn ( VDP4A_1_UD_UD_UD_UD_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 ))
	]
	[ (VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VMUL_1_UB_UB_UB_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o ))
	]
	[ (VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VAND_1_UD_UD_UD_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o ))
	]
	[ (VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-visited (visa:visitor v0 fn))
		(define v1-visited (visa:visitor v1 fn))
		(fn ( VOR_8_D_D_D_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

