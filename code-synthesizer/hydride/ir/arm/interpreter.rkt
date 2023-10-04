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
	[ (vpmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(vpmin_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 prec_i num_14)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vqdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vrshrn_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vpaddq_u8_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(vpaddq_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i prec_i_o num_5 
		 num_6 num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(vqdmlsl_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vqdmlal_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vget_high_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vget_high_u64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vabal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabal_high_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11)
		(vqdmull_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11)
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vqrshrnd_n_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vqmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10)
		(vqmovn_u64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_o 
		 num_6 num_7 num_8 
		 prec_i num_10)
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(vqneg_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7 num_8)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(vqdmlsl_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vaba_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vaba_u8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(vmlal_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14)
	]
	[ (vpadalq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vpadalq_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vtrn2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vtrn2_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(vmull_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vqshlq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqshlq_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vqabsq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(vqabsq_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7 num_8)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlsl_high_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vclez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vclez_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(vqdmull_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 num_9 prec_o num_11 
		 num_12)
	]
	[ (vsubhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(vsubhn_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 prec_i num_10)
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vmla_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vmls_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(vmlsl_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14)
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vmlsq_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(vqdmlal_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14)
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vaddw_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vrsra_n_u64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vrsra_n_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqshrn_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(vqshrn_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 prec_i num_11)
	]
	[ (vqshrnd_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(vqshrnd_n_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 prec_i 
		 num_9)
	]
	[ (vshl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vshl_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vpaddlq_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vpaddlq_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vshrn_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(vshrn_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 prec_i num_11)
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(vshrn_n_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 prec_i 
		 num_9)
	]
	[ (vqshrn_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(vqshrn_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 prec_i num_11)
	]
	[ (vceqzq_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vceqzq_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vmla_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vmla_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqshlu_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqshlu_n_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vabdl_high_u8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabdl_high_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlal_high_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vmovn_s16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(vqrdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vshll_n_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(vshll_n_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vaddhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(vaddhn_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 prec_i num_10)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vqdmlal_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmovl_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
		(vmovl_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i 
		 prec_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vtrn1_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmul_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlal_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlal_high_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vrshrq_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrshrq_n_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vcltz_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vqdmlsl_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vrsra_n_s32_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrsra_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vabal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabal_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vmull_high_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vget_low_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vget_low_u8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vsraq_n_u64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(vsraq_n_u64 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (vmlal_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlal_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vmull_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrsra_n_u8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vmul_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmul_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vqrdmulh_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(vqrdmulh_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqrshrun_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vqrshrun_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(vmlal_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14)
	]
	[ (vrsubhn_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vrsubhn_u16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vaddw_high_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(vqrdmulhq_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(vqrdmulhq_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(vrshld_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(vqdmull_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 num_9 prec_o num_11 
		 num_12)
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vraddhn_u64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vshr_n_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(vshr_n_u64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(vabs_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7 num_8)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vqdmlsl_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmull_high_n_s32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vmull_high_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmulhh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vqdmulhh_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vsraq_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(vsraq_n_s64 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (vsqadds_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vsqadds_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vabal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabal_high_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vqdmlal_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vqdmlsl_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vaddl_high_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(vqdmlal_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14)
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmul_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabdl_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(vcombine_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8)
	]
	[ (vmlsl_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlsl_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vuqaddq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vabal_high_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabal_high_u8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vsqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vsqadd_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11)
		(vqdmull_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(vqrshrns_n_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 prec_i 
		 num_15)
	]
	[ (vqrshrnh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(vqrshrnh_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 prec_i 
		 num_15)
	]
	[ (vsra_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(vsra_n_s64 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (vabal_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabal_s8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vceqq_u16_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vceqq_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vaddl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vaddl_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmull_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vmull_high_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vabal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabal_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vzip1q_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vzip1q_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlsl_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqdmulh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vqdmulh_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vrhadd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vrhadd_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vrshrd_n_s64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vrshrd_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vuzp1q_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vuzp1q_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vhsub_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqshlh_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vqshlh_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vabdl_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabdl_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vmovl_high_s8_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10)
		(vmovl_high_s8 (arm:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_o 
		 num_6 num_7 num_8 
		 num_9 num_10)
	]
	[ (vcgt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vcgt_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vrshr_n_u64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vrshr_n_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vsraq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vsraq_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vabdl_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabdl_high_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vmlsq_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vabdq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vabdq_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vpmaxq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(vpmaxq_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 prec_i num_14)
	]
	[ (vshrq_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vshrq_n_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqdmlal_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(vqdmlal_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vshr_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vshr_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vrshr_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vrshr_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vadd_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vuqaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vuqaddq_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vtst_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vtst_u64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(vnegq_s64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7 num_8)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(vqdmull_high_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(vmull_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vrsra_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vrsra_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vabdl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabdl_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vabdl_high_u32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(vabdl_high_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vsubl_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vsubl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vsubl_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vsubw_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vsubw_high_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vsubw_high_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(vmov_n_u16 (arm:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_o)
	]
	[ (vmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(vmin_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (vrshrn_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(vrshrn_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 prec_i 
		 num_15)
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlsl_high_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmlal_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vmlal_u8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(vqdmlsl_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14)
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vsraq_n_u8 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vmlaq_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmvn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(vmvn_s16 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (vuzp2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vuzp2_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vqrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(vqrshld_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vzip2q_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(vzip2q_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vsubq_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(vqshrn_n_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 prec_i 
		 num_9)
	]
	[ (vhadd_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(vhadd_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vshll_high_n_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(vshll_high_n_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vdotq_s32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(vdotq_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i prec_o num_5 
		 num_6 prec_i num_8 
		 num_9 num_10)
	]
	[ (vmax_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(vmax_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(vmlsl_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

