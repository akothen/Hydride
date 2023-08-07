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
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Visitor 
;; ================================================================================
(define (arm:visitor prog fn)
 (destruct prog
	[(dim-x id) (fn prog)]
	[(dim-y id) (fn prog)]
	[(idx-i id) (fn prog)]
	[(idx-j id) (fn prog)]
	[(reg id) (fn prog) ]
	[(lit v) (fn prog)]
	[(nop v1) (arm:visitor v1 fn)]
	[(idx-add i1 i2) (fn prog) ]
	[(idx-mul i1 i2) (fn prog) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vector-two-input-swizzle_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( interleave-vectors_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( interleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( deinterleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( llvm_shuffle_vectors_dsl v0-visited v1-visited num_2 prec_i_o v4-visited num_5 ))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( llvm-vect-add_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( llvm-vect-sub_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( llvm-vect-mul_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( llvm-vect-sdiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( llvm-vect-udiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( llvm-zext_dsl v0-visited size_i size_o ))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( scalar_splat_dsl v0-visited size_i size_o ))
	]
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshrn_n_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ))
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmov_n_u16_dsl v0-visited size_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltzq_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsub_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdq_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovl_s8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ))
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhq_n_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vneg_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsqaddq_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcle_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp1_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhsubq_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshrn_n_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ))
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrhaddq_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhadd_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vdotq_u32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vdotq_u32_dsl v0-visited v1-visited v2-visited size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ))
	]
	[ (vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vtst_u16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vaba_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmullh_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlalh_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmulhq_n_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsraq_n_u8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgez_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubhn_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ))
	]
	[ (vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmax_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqsub_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsra_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip2q_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ))
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn1_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmulh_n_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqabs_s8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcge_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vabs_s8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshrnh_n_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ))
	]
	[ (vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmin_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtq_s8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vadd_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrsubhn_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vraddhn_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltq_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vminq_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp2_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vceqz_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn2_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddhn_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ))
	]
	[ (vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpadal_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqadd_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vceqq_u8_dsl v0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip1q_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlaq_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhq_n_s16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshr_n_s64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovn_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vclez_s16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmax_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshr_n_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqneg_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtzd_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqmovn_u32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ))
	]
	[ (vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vpaddq_u32_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vpaddq_u32_dsl vc_0-visited v1-visited v2-visited size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmvn_u8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vget_low_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vget_low_u32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vcombine_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ))
	]
	[ (vget_high_u16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vget_high_u16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vpaddl_s16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpaddl_s16_dsl vc_0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhs_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmulh_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vshll_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshll_n_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vrshr_n_s8_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrshr_n_s8_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vrsraq_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrsraq_n_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshrnd_n_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ))
	]
	[ (vrshrn_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshrn_n_u32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ))
	]
	[ (vrsraq_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrsraq_n_u8_dsl vc_0-visited vc_1-visited v2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vqrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshrn_n_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ))
	]
	[ (vrshr_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrshr_n_u16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vqshlq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshlq_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vrshlq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshlq_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vshld_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshld_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqrshl_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshl_u32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

