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
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vraddhn_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmla_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vmlaq_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlaq_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vqsub_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqsub_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vpminq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpminq_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vuqaddq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vcgtzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgtzq_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqdmulhq_n_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqabs_s8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(vmovn_u64 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6)
	]
	[ (vabd_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vabd_u16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
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
	[ (vmul_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmul_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vsubl_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmvnq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(vmvnq_s8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (vsraq_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(vsraq_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vsubhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(vsubhn_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 prec_i 
		 num_12)
	]
	[ (vclt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vclt_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(vqmovn_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_o 
		 num_6 num_7 prec_i 
		 num_9)
	]
	[ (vceqzq_s64_dsl v0 vc_1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(vceqzq_s64 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlal_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vmovq_n_u8_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(vmovq_n_u8 (arm:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_o)
	]
	[ (vrhaddq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vrhaddq_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vtst_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vtst_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vcgt_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcgt_u16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vsub_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vsub_s64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vceq_s8_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(vceq_s8 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret vc_3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o)
	]
	[ (vmlaq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlaq_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(vabdl_s8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(vrsra_n_u8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret v5 env) 
		 (arm:interpret v6 env) (arm:interpret v7 env) size_i_o 
		 num_9 num_10 num_11 
		 prec_i_o num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20)
	]
	[ (vadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(vadd_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(vmull_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i num_7 prec_o 
		 num_9 num_10 num_11)
	]
	[ (vhadd_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhadd_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(vmull_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vsra_n_u8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(vsra_n_u8 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(vqdmull_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmaxq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vcgeq_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcgeq_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vqneg_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
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
	[ (vmulq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcltz_s32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqdmulh_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vpaddq_u64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(vpaddq_u64 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i prec_i_o num_5 
		 num_6 num_7 num_8 
		 num_9 num_10 num_11)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_u32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vmlsq_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmlsq_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vclezq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vclezq_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vhsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vhsubq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlal_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vqdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(vqdmulhq_n_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vabs_s32 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(vaddl_u8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i prec_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vneg_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(vneg_s8 (arm:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
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
	[ (vpmax_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmax_u32 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(vqdmull_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vsubw_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vcle_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(vcle_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11)
	]
	[ (vqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vqadd_u64 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
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
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(vqdmlsl_n_s32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(vmlsl_n_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i num_8 
		 prec_o num_10 num_11 
		 num_12 num_13)
	]
	[ (vminq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vminq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(vmlsl_u16 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vcgez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(vcgez_s16 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(vmulq_n_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
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
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(vmls_n_s32 (arm:interpret v0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11)
	]
	[ (vaddw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(vaddw_s16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (vmovl_s16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 prec_i prec_o num_12 num_13 num_14 num_15 num_16)
		(vmovl_s16 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret vc_5 env) 
		 size_i_o num_7 num_8 
		 num_9 prec_i prec_o 
		 num_12 num_13 num_14 
		 num_15 num_16)
	]
	[ (vshr_n_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vshr_n_s8 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqrshrnd_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(vqrshrnd_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret v5 env) 
		 (arm:interpret v6 env) size_i_o num_8 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 prec_i num_20)
	]
	[ (vqshrunh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(vqshrunh_n_s16 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 prec_i num_13)
	]
	[ (vshr_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vshr_n_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret v2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vrshr_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(vrshr_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret vc_5 env) 
		 (arm:interpret v6 env) (arm:interpret v7 env) size_i_o 
		 num_9 num_10 num_11 
		 prec_i_o num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(vrshrn_n_s64 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret v5 env) 
		 (arm:interpret v6 env) size_i_o num_8 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 prec_i num_20)
	]
	[ (vshrn_n_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(vshrn_n_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 prec_i num_13)
	]
	[ (vqshrn_n_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(vqshrn_n_u32 (arm:interpret vc_0 env) (arm:interpret v1 env) (arm:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_o num_8 
		 num_9 num_10 num_11 
		 prec_i num_13)
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(vqrshrns_n_u32 (arm:interpret vc_0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret v5 env) 
		 (arm:interpret v6 env) size_i_o num_8 
		 num_9 num_10 prec_o 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 prec_i num_20)
	]
	[ (vrshld_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(vrshld_s64 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret vc_5 env) 
		 (arm:interpret vc_6 env) (arm:interpret vc_7 env) (arm:interpret v8 env) 
		 size_i_o num_10 num_11 
		 num_12 prec_i_o num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20 
		 num_21 num_22)
	]
	[ (vqshls_s32_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vqshls_s32 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vshll_n_u16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(vshll_n_u16 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i 
		 num_9 prec_o num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vrshl_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(vrshl_u16 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret vc_5 env) 
		 (arm:interpret vc_6 env) (arm:interpret vc_7 env) (arm:interpret v8 env) 
		 size_i_o num_10 num_11 
		 num_12 prec_i_o num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20 
		 num_21 num_22)
	]
	[ (vqshlq_u64_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vqshlq_u64 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqrshld_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(vqrshld_s64 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret vc_5 env) 
		 (arm:interpret vc_6 env) (arm:interpret vc_7 env) (arm:interpret v8 env) 
		 size_i_o num_10 num_11 
		 num_12 prec_i_o num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20 
		 num_21 num_22)
	]
	[ (vshld_s64_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(vshld_s64 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret v4 env) size_i_o 
		 num_6 num_7 num_8 
		 prec_i_o num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (vqshlh_n_u16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(vqshlh_n_u16 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13)
	]
	[ (vqrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(vqrshlq_u16 (arm:interpret v0 env) (arm:interpret vc_1 env) (arm:interpret vc_2 env) 
		 (arm:interpret vc_3 env) (arm:interpret vc_4 env) (arm:interpret vc_5 env) 
		 (arm:interpret vc_6 env) (arm:interpret vc_7 env) (arm:interpret v8 env) 
		 size_i_o num_10 num_11 
		 num_12 prec_i_o num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20 
		 num_21 num_22)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

