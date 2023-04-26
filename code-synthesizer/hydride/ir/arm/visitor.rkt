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
	[ (vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqmovn_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ))
	]
	[ (vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsls_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vcgtzq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtzq_s8_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vtrn1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn1_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vneg_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vuqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuqadd_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vorrq_u16_dsl v0 v1)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vorrq_u16_dsl v0-visited v1-visited ))
	]
	[ (vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vaddl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_high_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmovn_high_u32_dsl v0 v1 size_i num_3 num_4 num_5 num_6 prec_i num_8)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmovn_high_u32_dsl v0-visited v1-visited size_i num_3 num_4 num_5 num_6 prec_i num_8 ))
	]
	[ (vaddw_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vbicq_s32_dsl v0 v1)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vbicq_s32_dsl v0-visited v1-visited ))
	]
	[ (vceq_s16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vceq_s16_dsl vc_0-visited v1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vsubw_high_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_high_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vtrn2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn2q_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vmulq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vmulq_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_n_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmax_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vclt_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vclt_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vbcaxq_u8_dsl v0 v1 v2)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vbcaxq_u8_dsl v0-visited v1-visited v2-visited ))
	]
	[ (vrax1q_u64_dsl vc_0 vc_1 v2 v3)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrax1q_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited ))
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsq_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vhaddq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhaddq_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vceqz_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define vc_3-visited (arm:visitor vc_3 fn))
		(fn ( vceqz_s8_dsl vc_0-visited v1-visited vc_2-visited vc_3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqsubq_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vcle_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcle_u16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vandq_u16_dsl v0 v1)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vandq_u16_dsl v0-visited v1-visited ))
	]
	[ (vmull_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmlal_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_s8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vzip1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip1_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vorn_s8_dsl v0 v1)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vorn_s8_dsl v0-visited v1-visited ))
	]
	[ (veorq_s16_dsl vc_0 v1 v2)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( veorq_s16_dsl vc_0-visited v1-visited v2-visited ))
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddq_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmovq_n_s16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovq_n_s16_dsl v0-visited size_o num_2 num_3 num_4 prec_o ))
	]
	[ (vqmovn_high_u64_dsl v0 v1 size_i num_3 num_4 num_5 prec_i num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqmovn_high_u64_dsl v0-visited v1-visited size_i num_3 num_4 num_5 prec_i num_7 num_8 num_9 num_10 ))
	]
	[ (vpmin_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmin_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmin_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vpaddq_s8_dsl vc_0 v1 v2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vpaddq_s8_dsl vc_0-visited v1-visited v2-visited num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_u32_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltz_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vaddhn_high_u64_dsl vc_0 v1 v2 v3 size_i num_5 num_6 num_7 prec_i num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vaddhn_high_u64_dsl vc_0-visited v1-visited v2-visited v3-visited size_i num_5 num_6 num_7 prec_i num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhs_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vzip2q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip2q_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ))
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrhaddq_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmul_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_n_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqdmulhq_n_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqneg_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqneg_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vaddw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_high_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vuzp2_s32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp2_s32_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 ))
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vraddhn_u64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vclezq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vclezq_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqdmulh_n_s16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmls_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmla_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqaddq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqaddq_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vpmax_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmax_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vhsub_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhsub_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmvn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmvn_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (vqabss_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqabss_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vtstq_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vtstq_u16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vsubl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_high_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vcgezq_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgezq_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vsubq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubq_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcge_s32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vsubhn_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vsubhn_s64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vabs_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vabs_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vuzp1q_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp1q_u8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 ))
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vbsl_s16_dsl v0 v1 v2)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vbsl_s16_dsl v0-visited v1-visited v2-visited ))
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlal_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovn_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtd_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (veor3q_u16_dsl v0 v1 v2)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( veor3q_u16_dsl v0-visited v1-visited v2-visited ))
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vrsubhn_high_u32_dsl vc_0 v1 v2 v3 size_i num_5 num_6 num_7 prec_i num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrsubhn_high_u32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i num_5 num_6 num_7 prec_i num_9 num_10 num_11 num_12 num_13 ))
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

