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


(require hydride/ir/arm/semantics)
(require hydride/ir/arm/definition)
(require hydride/ir/arm/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (arm:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (arm:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (arm:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o (arm:interpret v4 env) num_5)
	]
	[ (vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(vqmovn_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_o 
		 num_6 num_7 prec_i 
		 num_9)
	]
	[ (vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(vqdmull_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsls_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vcgtzq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgtzq_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlsl_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vtrn1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(vtrn1_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vneg_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vuqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vuqadd_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vorrq_u16_dsl v0 v1)
		(vorrq_u16 (arm:interpret v0 env) (arm:interpret v1 env))
	]
	[ (vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vaddl_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vmull_high_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vaddl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vaddl_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlsl_high_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vmovn_high_u32_dsl v0 v1 size_i num_3 num_4 num_5 num_6 prec_i num_8)
		(vmovn_high_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i 
		 num_3 num_4 num_5 
		 num_6 prec_i num_8)
	]
	[ (vaddw_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vaddw_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vbicq_s32_dsl v0 v1)
		(vbicq_s32 (arm:interpret v0 env) (arm:interpret v1 env))
	]
	[ (vceq_s16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vceq_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vsubw_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vsubw_high_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vsubw_high_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vtrn2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vtrn2q_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vmulq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vmulq_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmax_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vclt_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vclt_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlal_high_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vbcaxq_u8_dsl v0 v1 v2)
		(vbcaxq_u8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env))
	]
	[ (vrax1q_u64_dsl vc_0 vc_1 v2 v3)
		(vrax1q_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env))
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlsq_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmlal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlal_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vhaddq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhaddq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vceqz_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vceqz_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqsubq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlsl_high_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vcle_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcle_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vandq_u16_dsl v0 v1)
		(vandq_u16 (arm:interpret v0 env) (arm:interpret v1 env))
	]
	[ (vmull_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vmull_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vsubl_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmlal_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlal_high_s8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vzip1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vzip1_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlsl_high_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vorn_s8_dsl v0 v1)
		(vorn_s8 (arm:interpret v0 env) (arm:interpret v1 env))
	]
	[ (veorq_s16_dsl vc_0 v1 v2)
		(veorq_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env))
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vaddq_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(vmull_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmovq_n_s16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(vmovq_n_s16 (arm:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_o)
	]
	[ (vqmovn_high_u64_dsl v0 v1 size_i num_3 num_4 num_5 prec_i num_7 num_8 num_9 num_10)
		(vqmovn_high_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i 
		 num_3 num_4 num_5 
		 prec_i num_7 num_8 
		 num_9 num_10)
	]
	[ (vpmin_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vpmin_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmin_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vpaddq_s8_dsl vc_0 v1 v2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(vpaddq_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 num_3 prec_i_o num_5 
		 num_6 num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vmull_high_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcltz_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vaddhn_high_u64_dsl vc_0 v1 v2 v3 size_i num_5 num_6 num_7 prec_i num_9 num_10 num_11 num_12 num_13)
		(vaddhn_high_u64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i num_5 
		 num_6 num_7 prec_i 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqrdmulhs_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vzip2q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(vzip2q_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19)
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vrhaddq_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmul_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmul_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqneg_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqneg_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vaddw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vaddw_high_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vuzp2_s32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9)
		(vuzp2_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9)
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vraddhn_u64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlal_high_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vclezq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vclezq_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqdmulh_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmls_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmla_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqaddq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqaddq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vpmax_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vpmax_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vhsub_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhsub_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmvn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(vmvn_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (vqabss_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqabss_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vtstq_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vtstq_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vsubl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vsubl_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vcgezq_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgezq_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vsubq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vsubq_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcge_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vsubhn_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vsubhn_s64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vabs_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vabs_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vuzp1q_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(vuzp1q_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7)
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_high_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vbsl_s16_dsl v0 v1 v2)
		(vbsl_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env))
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmlal_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vmovn_s16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcgtd_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (veor3q_u16_dsl v0 v1 v2)
		(veor3q_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env))
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vrsubhn_high_u32_dsl vc_0 v1 v2 v3 size_i num_5 num_6 num_7 prec_i num_9 num_10 num_11 num_12 num_13)
		(vrsubhn_high_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i num_5 
		 num_6 num_7 prec_i 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

