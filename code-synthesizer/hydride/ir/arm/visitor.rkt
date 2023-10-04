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
	[ (vpmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmin_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 ))
	]
	[ (vqdmulhq_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmulhq_n_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshrn_n_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vpaddq_u8_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vpaddq_u8_dsl vc_0-visited v1-visited v2-visited size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ))
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vget_high_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vget_high_u64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vabal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_high_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 ))
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshrnd_n_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vqmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqmovn_u64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10 ))
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqneg_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ))
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vaba_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vaba_u8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ))
	]
	[ (vpadalq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpadalq_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vtrn2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn2_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vqshlq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshlq_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqabsq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqabsq_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ))
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vclez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vclez_s8_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 ))
	]
	[ (vsubhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubhn_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ))
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ))
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsq_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ))
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vrsra_n_u64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrsra_n_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqshrn_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshrn_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ))
	]
	[ (vqshrnd_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshrnd_n_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 ))
	]
	[ (vshl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshl_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vpaddlq_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpaddlq_s32_dsl vc_0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vshrn_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshrn_n_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ))
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshrn_n_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 ))
	]
	[ (vqshrn_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshrn_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ))
	]
	[ (vceqzq_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define vc_3-visited (arm:visitor vc_3 fn))
		(fn ( vceqzq_s8_dsl vc_0-visited v1-visited vc_2-visited vc_3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vmla_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqshlu_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshlu_n_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vabdl_high_u8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_high_u8_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovn_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrdmulhq_n_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vshll_n_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshll_n_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ))
	]
	[ (vaddhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddhn_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ))
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmovl_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovl_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10 ))
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn1_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmlal_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vrshrq_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrshrq_n_u16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltz_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vrsra_n_s32_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrsra_n_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vabal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_s16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vget_low_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vget_low_u8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vsraq_n_u64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsraq_n_u64_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ))
	]
	[ (vmlal_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrsra_n_u8_dsl vc_0-visited vc_1-visited v2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vmul_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqrdmulh_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrdmulh_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vqrshrun_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshrun_n_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ))
	]
	[ (vrsubhn_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrsubhn_u16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_high_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrdmulhq_n_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrdmulhq_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshld_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 ))
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vraddhn_u64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vshr_n_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshr_n_u64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ))
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vabs_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ))
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmull_high_n_s32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_s32_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmulhh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmulhh_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vsraq_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsraq_n_s64_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ))
	]
	[ (vsqadds_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsqadds_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vabal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_high_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_high_s8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ))
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_s8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vcombine_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ))
	]
	[ (vmlsl_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuqaddq_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vabal_high_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_high_u8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vsqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsqadd_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshrns_n_u32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ))
	]
	[ (vqrshrnh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshrnh_n_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ))
	]
	[ (vsra_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsra_n_s64_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ))
	]
	[ (vabal_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_s8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vceqq_u16_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define vc_3-visited (arm:visitor vc_3 fn))
		(fn ( vceqq_u16_dsl v0-visited v1-visited vc_2-visited vc_3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vaddl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmull_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_s16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vabal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabal_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vzip1q_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip1q_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqdmulh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmulh_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vrhadd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrhadd_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vrshrd_n_s64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrshrd_n_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vuzp1q_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp1q_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhsub_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqshlh_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshlh_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vabdl_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vmovl_high_s8_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovl_high_s8_dsl v0-visited size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10 ))
	]
	[ (vcgt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgt_u32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vrshr_n_u64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrshr_n_u64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vsraq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsraq_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vabdl_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_high_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsq_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vabdq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdq_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vpmaxq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmaxq_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 ))
	]
	[ (vshrq_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshrq_n_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlal_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vshr_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshr_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vrshr_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrshr_n_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vadd_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vuqaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuqaddq_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vtst_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vtst_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vnegq_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ))
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vrsra_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vrsra_n_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vabdl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_u32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vabdl_high_u32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_high_u32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vsubl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_high_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vsubw_high_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_high_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmov_n_u16_dsl v0-visited size_o num_2 num_3 num_4 prec_o ))
	]
	[ (vmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmin_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (vrshrn_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshrn_n_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ))
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vmlal_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_u8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ))
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsraq_n_u8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlaq_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmvn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmvn_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (vuzp2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp2_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vqrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshld_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vzip2q_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip2q_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubq_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqshrn_n_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 ))
	]
	[ (vhadd_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhadd_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vshll_high_n_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vshll_high_n_s8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vdotq_s32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vdotq_s32_dsl v0-visited v1-visited v2-visited size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ))
	]
	[ (vmax_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmax_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

