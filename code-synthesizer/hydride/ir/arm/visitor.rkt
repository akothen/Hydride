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
	[ (vabdl_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_high_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabdl_s8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vabd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vabd_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhsub_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmvn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmvn_u32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (vmlal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhq_n_s16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vsubhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsubhn_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vmaxq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmaxq_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vpadd_s16_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vpadd_s16_dsl vc_0-visited v1-visited v2-visited size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vceqz_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vceqz_s8_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vqrshl_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshl_u32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vmul_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_n_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ))
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmovl_u16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmovl_u16_dsl vc_0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 ))
	]
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmull_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ))
	]
	[ (vtrn2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn2q_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmovq_n_s64_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovq_n_s64_dsl v0-visited size_o num_2 num_3 num_4 prec_o ))
	]
	[ (vqsubd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqsubd_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmull_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_s8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vcge_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcge_u8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlaq_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqrshlb_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshlb_s8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmlsl_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_s8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vzip1q_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip1q_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vcleq_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcleq_u16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vclez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vclez_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vqrdmulh_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulh_n_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vsubq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubq_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vcltzq_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltzq_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vqshlq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqshlq_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrhaddq_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovn_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vhadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhadd_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vshlq_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshlq_s64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmlal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vsqaddh_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsqaddh_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp2_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_u32_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqmovn_u32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ))
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsq_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlsl_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vrshl_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshl_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vneg_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vcltq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltq_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vsubw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_high_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vadd_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vtrn1q_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn1q_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vtst_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vtst_s64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vmin_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmin_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqabsh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqabsh_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vaddl_high_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_high_u8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqadd_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlalh_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vaddw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_high_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vshlq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshlq_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vmla_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_s8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqshlb_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqshlb_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsls_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqneg_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vrshl_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshl_u8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmovl_high_s32_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmovl_high_s32_dsl vc_0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vsubl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_high_s8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vaddw_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vpminq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpminq_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vaddl_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vcgez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgez_s8_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vuzp1q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp1q_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vmls_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vpmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmax_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vceq_u8_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define vc_3-visited (arm:visitor vc_3 fn))
		(fn ( vceq_u8_dsl v0-visited v1-visited vc_2-visited vc_3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vcgtz_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtz_s8_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vsubw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vabsq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vabsq_s8_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vcgtq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtq_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vmlsl_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vraddhn_u64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vzip2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip2_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ))
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

