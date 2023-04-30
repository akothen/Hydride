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
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtd_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqdmulh_n_s16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlaq_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqrshl_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshl_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vzip2q_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip2q_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ))
	]
	[ (vmaxq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmaxq_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vrsubhn_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrsubhn_u32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vabs_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vcltq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltq_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqshl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqshl_u32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqshl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqshl_u8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vuzp2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp2q_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vsqaddq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsqaddq_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vminq_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmulq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vuzp1_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vuzp1_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vqdmlal_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vpminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpminq_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmlslh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlslh_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_high_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s32_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vqrshlq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqrshlq_s8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddw_u8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vsubl_high_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubl_high_u32_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmovl_high_s8_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmovl_high_s8_dsl vc_0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 ))
	]
	[ (vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmovn_u64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 ))
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmul_n_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhq_s16_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn2_s32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ))
	]
	[ (vtst_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vtst_u8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vqmovunh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqmovunh_s16_dsl v0-visited size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ))
	]
	[ (vaddhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vaddhn_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ))
	]
	[ (vtrn1_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vtrn1_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ))
	]
	[ (vhaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhaddq_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vclez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vclez_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vmlsq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsq_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ))
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(define v4-visited (arm:visitor v4 fn))
		(fn ( vqrdmulhq_n_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited v4-visited size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmls_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmvnq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vmvnq_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o ))
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmulq_n_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ))
	]
	[ (vpmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vpmax_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ))
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlal_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmull_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vhsub_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vhsub_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vcltzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcltzd_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ))
	]
	[ (vcleq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcleq_u64_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[ (vmull_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_u32_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_n_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ))
	]
	[ (vsubw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vadd_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vcgtz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgtz_s32_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vqnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqnegq_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmla_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vaddl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_s8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmull_high_n_u16_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vrshlq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshlq_s16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ))
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vmlsq_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsq_s8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vsubw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubw_high_s16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vpaddq_s64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vpaddq_s64_dsl vc_0-visited v1-visited v2-visited size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ))
	]
	[ (vqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqadd_s64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vnegq_s64_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vmlsl_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vshld_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshld_u64_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_s16_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vshlq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vshlq_s8_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ))
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vqsubq_u16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (vsubq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vsubq_u64_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (vmovl_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vmovl_s32_dsl vc_0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 ))
	]
	[ (vrshl_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vrshl_s8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vaddl_high_s8_dsl v0-visited v1-visited size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_n_s32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ))
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vrhaddq_s16_dsl vc_0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vcgez_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcgez_s64_dsl vc_0-visited vc_1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (vmlal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlal_high_u32_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vzip1_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(fn ( vzip1_u32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ))
	]
	[ (vqabsq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (arm:visitor v0 fn))
		(fn ( vqabsq_s32_dsl v0-visited size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_u16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vceqzq_s64_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define vc_2-visited (arm:visitor vc_2 fn))
		(define vc_3-visited (arm:visitor vc_3 fn))
		(fn ( vceqzq_s64_dsl vc_0-visited v1-visited vc_2-visited vc_3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (vqdmlals_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlals_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vqdmlsl_high_n_s32_dsl vc_0-visited v1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ))
	]
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-visited (arm:visitor v0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vmlsl_high_n_s16_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ))
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_n_s32_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vceqq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vceqq_s8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o ))
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define v1-visited (arm:visitor v1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(fn ( vqdmull_high_s16_dsl vc_0-visited v1-visited v2-visited size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (vcge_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-visited (arm:visitor vc_0 fn))
		(define vc_1-visited (arm:visitor vc_1 fn))
		(define v2-visited (arm:visitor v2 fn))
		(define v3-visited (arm:visitor v3 fn))
		(fn ( vcge_u16_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ))
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

