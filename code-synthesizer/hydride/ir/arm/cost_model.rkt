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
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost_vpmin_u32_dsl 1)
(define cost_vqdmulhq_n_s32_dsl 1)
(define cost_vrshrn_n_s64_dsl 1)
(define cost_vpaddq_u8_dsl 1)
(define cost_vqdmlsl_n_s32_dsl 1)
(define cost_vqdmlal_high_s16_dsl 1)
(define cost_vget_high_u64_dsl 1)
(define cost_vabal_high_u32_dsl 1)
(define cost_vqdmull_s16_dsl 1)
(define cost_vqrshrnd_n_u64_dsl 1)
(define cost_vqmovn_u64_dsl 1)
(define cost_vqneg_s32_dsl 1)
(define cost_vqdmlsl_s32_dsl 1)
(define cost_vaba_u8_dsl 1)
(define cost_vmlal_n_u32_dsl 1)
(define cost_vpadalq_u8_dsl 1)
(define cost_vtrn2_s8_dsl 1)
(define cost_vmull_n_s32_dsl 1)
(define cost_vqshlq_s32_dsl 1)
(define cost_vqabsq_s64_dsl 1)
(define cost_vmlsl_high_n_s32_dsl 1)
(define cost_vclez_s8_dsl 1)
(define cost_vqdmull_n_s16_dsl 1)
(define cost_vsubhn_u32_dsl 1)
(define cost_vmla_n_u32_dsl 1)
(define cost_vmls_n_s16_dsl 1)
(define cost_vmlsl_n_s32_dsl 1)
(define cost_vmlsq_n_u32_dsl 1)
(define cost_vqdmlal_n_s32_dsl 1)
(define cost_vaddw_u8_dsl 1)
(define cost_vrsra_n_u64_dsl 1)
(define cost_vqshrn_n_u32_dsl 1)
(define cost_vqshrnd_n_u64_dsl 1)
(define cost_vshl_s8_dsl 1)
(define cost_vpaddlq_s32_dsl 1)
(define cost_vshrn_n_s32_dsl 1)
(define cost_vshrn_n_u64_dsl 1)
(define cost_vqshrn_n_s16_dsl 1)
(define cost_vceqzq_s8_dsl 1)
(define cost_vmla_n_u16_dsl 1)
(define cost_vqshlu_n_s64_dsl 1)
(define cost_vabdl_high_u8_dsl 1)
(define cost_vmlal_high_n_u32_dsl 1)
(define cost_vmovn_s16_dsl 1)
(define cost_vqrdmulhq_n_s32_dsl 1)
(define cost_vshll_n_s8_dsl 1)
(define cost_vaddhn_u32_dsl 1)
(define cost_vqdmlal_high_n_s16_dsl 1)
(define cost_vmovl_s32_dsl 1)
(define cost_vtrn1_s32_dsl 1)
(define cost_vmul_u32_dsl 1)
(define cost_vmlal_high_n_u16_dsl 1)
(define cost_vrshrq_n_u16_dsl 1)
(define cost_vcltz_s32_dsl 1)
(define cost_vqdmlsl_high_n_s16_dsl 1)
(define cost_vrsra_n_s32_dsl 1)
(define cost_vabal_u16_dsl 1)
(define cost_vmull_high_n_s16_dsl 1)
(define cost_vget_low_u8_dsl 1)
(define cost_vsraq_n_u64_dsl 1)
(define cost_vmlal_high_u16_dsl 1)
(define cost_vmull_u32_dsl 1)
(define cost_vrsra_n_u8_dsl 1)
(define cost_vmul_n_u32_dsl 1)
(define cost_vqrdmulh_s32_dsl 1)
(define cost_vqrshrun_n_s64_dsl 1)
(define cost_vmlal_n_u16_dsl 1)
(define cost_vrsubhn_u16_dsl 1)
(define cost_vaddw_high_u32_dsl 1)
(define cost_vqrdmulhq_n_s16_dsl 1)
(define cost_vqrdmulhq_s16_dsl 1)
(define cost_vrshld_s64_dsl 1)
(define cost_vqdmull_n_s32_dsl 1)
(define cost_vraddhn_u64_dsl 1)
(define cost_vshr_n_u64_dsl 1)
(define cost_vabs_s32_dsl 1)
(define cost_vqdmlsl_high_n_s32_dsl 1)
(define cost_vmull_high_n_s32_dsl 1)
(define cost_vqdmulhh_s16_dsl 1)
(define cost_vsraq_n_s64_dsl 1)
(define cost_vsqadds_u32_dsl 1)
(define cost_vabal_high_s16_dsl 1)
(define cost_vqdmlal_high_n_s32_dsl 1)
(define cost_vqdmlsl_high_s16_dsl 1)
(define cost_vaddl_high_s8_dsl 1)
(define cost_vqdmlal_n_s16_dsl 1)
(define cost_vmul_n_s16_dsl 1)
(define cost_vabdl_s8_dsl 1)
(define cost_vcombine_u16_dsl 1)
(define cost_vmlsl_high_u16_dsl 1)
(define cost_vuqaddq_s8_dsl 1)
(define cost_vabal_high_u8_dsl 1)
(define cost_vsqadd_u64_dsl 1)
(define cost_vqdmull_high_s16_dsl 1)
(define cost_vqrshrns_n_u32_dsl 1)
(define cost_vqrshrnh_n_s16_dsl 1)
(define cost_vsra_n_s64_dsl 1)
(define cost_vabal_s8_dsl 1)
(define cost_vceqq_u16_dsl 1)
(define cost_vaddl_s32_dsl 1)
(define cost_vmull_high_s16_dsl 1)
(define cost_vabal_s32_dsl 1)
(define cost_vzip1q_u32_dsl 1)
(define cost_vmlsl_u32_dsl 1)
(define cost_vqdmulh_n_s16_dsl 1)
(define cost_vrhadd_s16_dsl 1)
(define cost_vrshrd_n_s64_dsl 1)
(define cost_vuzp1q_u8_dsl 1)
(define cost_vhsub_u16_dsl 1)
(define cost_vqshlh_n_s16_dsl 1)
(define cost_vabdl_s16_dsl 1)
(define cost_vmovl_high_s8_dsl 1)
(define cost_vcgt_u32_dsl 1)
(define cost_vrshr_n_u64_dsl 1)
(define cost_vqdmull_high_n_s16_dsl 1)
(define cost_vsraq_n_s32_dsl 1)
(define cost_vabdl_high_s16_dsl 1)
(define cost_vmlsq_s32_dsl 1)
(define cost_vabdq_s32_dsl 1)
(define cost_vpmaxq_s32_dsl 1)
(define cost_vshrq_n_u8_dsl 1)
(define cost_vqdmlal_s32_dsl 1)
(define cost_vshr_n_s16_dsl 1)
(define cost_vrshr_n_s32_dsl 1)
(define cost_vadd_u16_dsl 1)
(define cost_vuqaddq_s16_dsl 1)
(define cost_vtst_u64_dsl 1)
(define cost_vnegq_s64_dsl 1)
(define cost_vqdmull_high_n_s32_dsl 1)
(define cost_vmull_n_s16_dsl 1)
(define cost_vrsra_n_s64_dsl 1)
(define cost_vabdl_u32_dsl 1)
(define cost_vabdl_high_u32_dsl 1)
(define cost_vsubl_s8_dsl 1)
(define cost_vsubl_high_u16_dsl 1)
(define cost_vsubw_s8_dsl 1)
(define cost_vsubw_high_u16_dsl 1)
(define cost_vmov_n_u16_dsl 1)
(define cost_vmin_u32_dsl 1)
(define cost_vrshrn_n_s16_dsl 1)
(define cost_vmlsl_high_n_u16_dsl 1)
(define cost_vmlal_u8_dsl 1)
(define cost_vqdmlsl_n_s16_dsl 1)
(define cost_vsraq_n_u8_dsl 1)
(define cost_vmlaq_u32_dsl 1)
(define cost_vmvn_s16_dsl 1)
(define cost_vuzp2_s16_dsl 1)
(define cost_vqrshld_s64_dsl 1)
(define cost_vzip2q_s64_dsl 1)
(define cost_vsubq_u32_dsl 1)
(define cost_vqshrn_n_s64_dsl 1)
(define cost_vhadd_s32_dsl 1)
(define cost_vshll_high_n_s8_dsl 1)
(define cost_vdotq_s32_dsl 1)
(define cost_vmax_u8_dsl 1)
(define cost_vmlsl_n_u16_dsl 1)

(define (arm:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (arm:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (arm:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (arm:cost  v0)  (arm:cost  v1)  
		 (arm:cost  v4) )
	]
		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (llvm-zext_dsl v0 size_i size_o)
		(+ 1 (arm:cost  v0) )
	]
		[ (scalar_splat_dsl v0 size_i size_o)
		(+ 1 (arm:cost  v0) )
	]
	[ (vpmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(+ cost_vpmin_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vqdmulhq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vrshrn_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vpaddq_u8_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost_vpaddq_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(+ cost_vqdmlsl_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqdmlal_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vget_high_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vget_high_u64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vabal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabal_high_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11)
		(+ cost_vqdmull_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vqrshrnd_n_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vqmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10)
		(+ cost_vqmovn_u64_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(+ cost_vqneg_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(+ cost_vqdmlsl_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vaba_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vaba_u8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(+ cost_vmlal_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vpadalq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vpadalq_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (vtrn2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vtrn2_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(+ cost_vmull_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqshlq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqshlq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqabsq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(+ cost_vqabsq_s64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlsl_high_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vclez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vclez_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(+ cost_vqdmull_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsubhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(+ cost_vsubhn_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmla_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmls_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(+ cost_vmlsl_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmlsq_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(+ cost_vqdmlal_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vaddw_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vrsra_n_u64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vrsra_n_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vqshrn_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(+ cost_vqshrn_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqshrnd_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(+ cost_vqshrnd_n_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vshl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vshl_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpaddlq_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vpaddlq_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (vshrn_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(+ cost_vshrn_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(+ cost_vshrn_n_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqshrn_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(+ cost_vqshrn_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vceqzq_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vceqzq_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  
		)
	]
	[ (vmla_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmla_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqshlu_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqshlu_n_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vabdl_high_u8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabdl_high_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlal_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vmovn_s16_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrdmulhq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vshll_n_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(+ cost_vshll_n_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vaddhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(+ cost_vaddhn_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vqdmlal_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vmovl_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
		(+ cost_vmovl_s32_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vtrn1_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmul_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlal_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlal_high_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrshrq_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrshrq_n_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vcltz_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vqdmlsl_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vrsra_n_s32_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrsra_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vabal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabal_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmull_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vget_low_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vget_low_u8_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vsraq_n_u64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ cost_vsraq_n_u64_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlal_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlal_high_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmull_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrsra_n_u8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vmul_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmul_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqrdmulh_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrdmulh_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vqrshrun_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vqrshrun_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(+ cost_vmlal_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrsubhn_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vrsubhn_u16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vaddw_high_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrdmulhq_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrdmulhq_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrshld_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(+ cost_vqdmull_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vraddhn_u64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vshr_n_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ cost_vshr_n_u64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(+ cost_vabs_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vqdmlsl_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vmull_high_n_s32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmull_high_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmulhh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vqdmulhh_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vsraq_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ cost_vsraq_n_s64_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vsqadds_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsqadds_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vabal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabal_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vqdmlal_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqdmlsl_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vaddl_high_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(+ cost_vqdmlal_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmul_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabdl_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(+ cost_vcombine_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vmlsl_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlsl_high_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vuqaddq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vabal_high_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabal_high_u8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vsqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsqadd_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11)
		(+ cost_vqdmull_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(+ cost_vqrshrns_n_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vqrshrnh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(+ cost_vqrshrnh_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vsra_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ cost_vsra_n_s64_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vabal_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabal_s8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vceqq_u16_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vceqq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  
		)
	]
	[ (vaddl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vaddl_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmull_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmull_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vabal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabal_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vzip1q_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vzip1q_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlsl_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vqdmulh_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vrhadd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vrhadd_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrshrd_n_s64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vrshrd_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vuzp1q_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vuzp1q_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vhsub_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqshlh_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vqshlh_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vabdl_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabdl_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vmovl_high_s8_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10)
		(+ cost_vmovl_high_s8_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vcgt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vcgt_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vrshr_n_u64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vrshr_n_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsraq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vsraq_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vabdl_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabdl_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmlsq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vabdq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabdq_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vpmaxq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(+ cost_vpmaxq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vshrq_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vshrq_n_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmlal_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(+ cost_vqdmlal_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vshr_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vshr_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vrshr_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrshr_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vadd_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vuqaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vuqaddq_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vtst_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vtst_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		)
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(+ cost_vnegq_s64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(+ cost_vmull_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vrsra_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vrsra_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vabdl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabdl_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vabdl_high_u32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vabdl_high_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vsubl_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vsubl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vsubl_high_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vsubw_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vsubw_high_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vsubw_high_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(+ cost_vmov_n_u16_dsl (arm:cost  v0)  
		)
	]
	[ (vmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_vmin_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vrshrn_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(+ cost_vrshrn_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlsl_high_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlal_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vmlal_u8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(+ cost_vqdmlsl_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vsraq_n_u8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vmlaq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmvn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_vmvn_s16_dsl (arm:cost  v0)  
		)
	]
	[ (vuzp2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vuzp2_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrshld_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vzip2q_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vzip2q_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vsubq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(+ cost_vqshrn_n_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vhadd_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vhadd_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vshll_high_n_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vshll_high_n_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vdotq_s32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(+ cost_vdotq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmax_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_vmax_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(+ cost_vmlsl_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

