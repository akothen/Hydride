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
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcgtd_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqdmulh_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlaq_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
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
	[ (vqrshl_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vqrshl_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vzip2q_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(vzip2q_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19)
	]
	[ (vmaxq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmaxq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vrsubhn_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vrsubhn_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vsubl_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vabs_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vcltq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcltq_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
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
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqshl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vqshl_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqshl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vqshl_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vuzp2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vuzp2q_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vsqaddq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vsqaddq_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vminq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmulq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vuzp1_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vuzp1_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vqdmlal_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlal_high_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
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
	[ (vpminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpminq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqdmlslh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlslh_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vaddw_high_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vqrshlq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vqrshlq_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vaddw_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vsubl_high_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vsubl_high_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
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
	[ (vmovl_high_s8_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(vmovl_high_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vmovn_u64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmul_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqrdmulhq_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlal_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vtrn2_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vtst_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vtst_u8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vqmovunh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(vqmovunh_s16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_o 
		 num_6 num_7 prec_i 
		 num_9)
	]
	[ (vaddhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vaddhn_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vtrn1_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(vtrn1_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vhaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhaddq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vclez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vclez_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vmlsq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlsq_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqrdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmvnq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(vmvnq_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vpmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmax_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
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
	[ (vmull_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vmull_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vhsub_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhsub_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vcltzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcltzd_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(vqdmull_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vcleq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcleq_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vmull_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(vmull_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vmull_high_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vsubw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vsubw_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vadd_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vcgtz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgtz_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vqnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqnegq_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlsl_high_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vaddl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vaddl_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
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
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vmull_high_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vrshlq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrshlq_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlsq_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlsq_s8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vsubw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vsubw_high_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vpaddq_s64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(vpaddq_s64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i prec_i_o num_5 
		 num_6 num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqadd_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vnegq_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlal_high_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlsl_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlsl_high_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vshld_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vshld_u64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vshlq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vshlq_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqsubq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vsubq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vsubq_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vmovl_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(vmovl_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10)
	]
	[ (vrshl_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vrshl_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vaddl_high_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vrhaddq_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vcgez_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgez_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vmlal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlal_high_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vzip1_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vzip1_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqabsq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqabsq_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlsl_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vceqzq_s64_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vceqzq_s64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vqdmlals_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlals_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
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
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(vmlsl_high_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vceqq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vceqq_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vcge_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcge_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

