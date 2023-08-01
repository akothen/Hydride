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
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext (arm:interpret v0 env) size_i size_o)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat (arm:interpret v0 env) size_i size_o)
	]
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(vqshrn_n_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 prec_i num_11)
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_i_o)
		(vmov_n_u16 (arm:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcltzq_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vsub_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
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
	[ (vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vabal_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vabdq_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(vmull_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(vmovl_s8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i 
		 prec_o num_7 num_8 
		 num_9)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqrdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vneg_s16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vsqaddq_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcle_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vuzp1_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhsubq_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(vshrn_n_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 prec_i num_11)
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vrhaddq_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhadd_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vdotq_u32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(vdotq_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i prec_o num_5 
		 num_6 prec_i num_8 
		 num_9 num_10)
	]
	[ (vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vtst_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vaba_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(vqdmullh_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlalh_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vqdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vsraq_n_u8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgez_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vaddw_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(vsubhn_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 prec_i num_10)
	]
	[ (vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmax_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqsub_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlal_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
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
	[ (vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vabdl_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vsra_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(vzip2q_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19)
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(vtrn1_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vqdmulh_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqabs_s8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcge_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vabs_s8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(vqshrnh_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 prec_i num_11)
	]
	[ (vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmin_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
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
	[ (vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcgtq_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vadd_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vrsubhn_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vraddhn_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcltq_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vminq_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vuzp2_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vceqz_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vtrn2_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
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
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(vaddhn_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 prec_i num_10)
	]
	[ (vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vpadal_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqadd_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vceqq_u8 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vzip1q_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlaq_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqrdmulhq_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vshr_n_s64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vmovn_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vclez_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vaddl_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmax_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vshr_n_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlsl_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqneg_s16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgtzd_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vsubl_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(vqmovn_u32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_o 
		 num_6 num_7 prec_i 
		 num_9)
	]
	[ (vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmul_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vpaddq_u32_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(vpaddq_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i prec_i_o num_5 
		 num_6 num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(vmvn_u8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vsubw_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vget_low_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vget_low_u32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(vcombine_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8)
	]
	[ (vget_high_u16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vget_high_u16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vpaddl_s16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vpaddl_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqrdmulhs_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vqdmulh_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vshl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vshl_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vshll_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vshll_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vqrshl_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vqrshl_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vrshld_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vrshld_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqshlb_n_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vqshlb_n_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vqshl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vqshl_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vrshr_n_s8_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrshr_n_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vrsraq_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrsraq_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(vqrshrnd_n_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 prec_i 
		 num_15)
	]
	[ (vrshrn_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(vrshrn_n_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 prec_i 
		 num_15)
	]
	[ (vrsraq_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrsraq_n_u8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(vqrshrn_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 prec_i 
		 num_15)
	]
	[ (vrshr_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrshr_n_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

