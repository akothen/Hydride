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
(define cost_vqshrn_n_s64_dsl 1)
(define cost_vmov_n_u16_dsl 1)
(define cost_vcltzq_s64_dsl 1)
(define cost_vsub_s32_dsl 1)
(define cost_vqdmlsl_n_s16_dsl 1)
(define cost_vabal_u32_dsl 1)
(define cost_vabdq_u8_dsl 1)
(define cost_vqrshl_s64_dsl 1)
(define cost_vmull_u8_dsl 1)
(define cost_vmovl_s8_dsl 1)
(define cost_vqrdmulhq_n_s32_dsl 1)
(define cost_vqrshlb_u8_dsl 1)
(define cost_vneg_s16_dsl 1)
(define cost_vsqaddq_u32_dsl 1)
(define cost_vcle_s32_dsl 1)
(define cost_vmlal_n_s32_dsl 1)
(define cost_vuzp1_s32_dsl 1)
(define cost_vrshrn_n_s64_dsl 1)
(define cost_vhsubq_u32_dsl 1)
(define cost_vqdmull_n_s32_dsl 1)
(define cost_vshl_s64_dsl 1)
(define cost_vshrn_n_u64_dsl 1)
(define cost_vrhaddq_s32_dsl 1)
(define cost_vhadd_u16_dsl 1)
(define cost_vdotq_u32_dsl 1)
(define cost_vqshld_s64_dsl 1)
(define cost_vrshr_n_u8_dsl 1)
(define cost_vtst_u16_dsl 1)
(define cost_vaba_u16_dsl 1)
(define cost_vshl_u32_dsl 1)
(define cost_vqdmullh_s16_dsl 1)
(define cost_vqdmlalh_s16_dsl 1)
(define cost_vqdmulhq_n_s32_dsl 1)
(define cost_vsraq_n_u8_dsl 1)
(define cost_vcgez_s32_dsl 1)
(define cost_vaddw_u32_dsl 1)
(define cost_vsubhn_s16_dsl 1)
(define cost_vmax_s16_dsl 1)
(define cost_vqsub_u64_dsl 1)
(define cost_vmlal_s16_dsl 1)
(define cost_vqdmlal_n_s16_dsl 1)
(define cost_vabdl_u8_dsl 1)
(define cost_vqdmlsl_s32_dsl 1)
(define cost_vsra_n_s16_dsl 1)
(define cost_vzip2q_s32_dsl 1)
(define cost_vmlsl_n_u32_dsl 1)
(define cost_vtrn1_s32_dsl 1)
(define cost_vqdmulh_n_s16_dsl 1)
(define cost_vqabs_s8_dsl 1)
(define cost_vcge_s32_dsl 1)
(define cost_vabs_s8_dsl 1)
(define cost_vqdmull_n_s16_dsl 1)
(define cost_vqshrnh_n_u16_dsl 1)
(define cost_vpmin_s32_dsl 1)
(define cost_vqdmlsl_n_s32_dsl 1)
(define cost_vqshld_u64_dsl 1)
(define cost_vcgtq_s8_dsl 1)
(define cost_vadd_s8_dsl 1)
(define cost_vrsubhn_s16_dsl 1)
(define cost_vqshlb_n_s8_dsl 1)
(define cost_vrshlq_u16_dsl 1)
(define cost_vmls_n_s32_dsl 1)
(define cost_vraddhn_s32_dsl 1)
(define cost_vcltq_s32_dsl 1)
(define cost_vrshrq_n_s64_dsl 1)
(define cost_vmlal_n_s16_dsl 1)
(define cost_vrshlq_s32_dsl 1)
(define cost_vminq_u8_dsl 1)
(define cost_vuzp2_u16_dsl 1)
(define cost_vceqz_s64_dsl 1)
(define cost_vmla_n_s32_dsl 1)
(define cost_vmla_u16_dsl 1)
(define cost_vshll_n_u8_dsl 1)
(define cost_vtrn2_s32_dsl 1)
(define cost_vqdmlal_n_s32_dsl 1)
(define cost_vmull_n_u16_dsl 1)
(define cost_vmulq_n_u32_dsl 1)
(define cost_vaddhn_s64_dsl 1)
(define cost_vpadal_u16_dsl 1)
(define cost_vqadd_s16_dsl 1)
(define cost_vceqq_u8_dsl 1)
(define cost_vzip1q_u64_dsl 1)
(define cost_vmlaq_n_s16_dsl 1)
(define cost_vqrdmulhq_n_s16_dsl 1)
(define cost_vqrshrn_n_s16_dsl 1)
(define cost_vshr_n_s64_dsl 1)
(define cost_vrsra_n_s64_dsl 1)
(define cost_vmovn_s64_dsl 1)
(define cost_vclez_s16_dsl 1)
(define cost_vmlsl_n_u16_dsl 1)
(define cost_vaddl_s16_dsl 1)
(define cost_vpmax_s16_dsl 1)
(define cost_vshr_n_u8_dsl 1)
(define cost_vmls_n_u16_dsl 1)
(define cost_vmulq_n_s16_dsl 1)
(define cost_vmlsl_u32_dsl 1)
(define cost_vqneg_s16_dsl 1)
(define cost_vcgtzd_s64_dsl 1)
(define cost_vmls_u32_dsl 1)
(define cost_vmull_n_s32_dsl 1)
(define cost_vrsra_n_u16_dsl 1)
(define cost_vsubl_s32_dsl 1)
(define cost_vqmovn_u32_dsl 1)
(define cost_vmul_s16_dsl 1)
(define cost_vqrshrnh_n_u16_dsl 1)
(define cost_vpaddq_u32_dsl 1)
(define cost_vmvn_u8_dsl 1)
(define cost_vsubw_u8_dsl 1)
(define cost_vget_low_u32_dsl 1)
(define cost_vcombine_u16_dsl 1)
(define cost_vget_high_u16_dsl 1)
(define cost_vpaddl_s16_dsl 1)
(define cost_vqrdmulhs_s32_dsl 1)
(define cost_vqdmulh_s16_dsl 1)

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
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(+ cost_vqshrn_n_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(+ cost_vmov_n_u16_dsl (arm:cost  v0)  
		)
	]
	[ (vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcltzq_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vsub_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabal_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vabdq_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqrshl_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vqrshl_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(+ cost_vmull_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(+ cost_vmovl_s8_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulhq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vqrshlb_u8_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vqrshlb_u8_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vneg_s16_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vsqaddq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcle_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vuzp1_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(+ cost_vrshrn_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  
		 
		 
		 
		)
	]
	[ (vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhsubq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vshl_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vshl_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(+ cost_vshrn_n_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vrhaddq_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhadd_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vdotq_u32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(+ cost_vdotq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqshld_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqshld_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(+ cost_vrshr_n_u8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  v6)  (arm:cost  v7)  
		 
		 
		 
		)
	]
	[ (vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vtst_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		)
	]
	[ (vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaba_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vshl_u32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vshl_u32_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(+ cost_vqdmullh_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlalh_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vqdmulhq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vsraq_n_u8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgez_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(+ cost_vsubhn_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmax_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqsub_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabdl_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vsra_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(+ cost_vzip2q_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(+ cost_vtrn1_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vqdmulh_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqabs_s8_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcge_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vabs_s8_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(+ cost_vqshrnh_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmin_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqshld_u64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqshld_u64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcgtq_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vadd_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vrsubhn_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqshlb_n_s8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqshlb_n_s8_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vrshlq_u16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vraddhn_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcltq_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(+ cost_vrshrq_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  v6)  (arm:cost  v7)  
		 
		 
		 
		)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrshlq_s32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vrshlq_s32_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vminq_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vuzp2_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vceqz_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vshll_n_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(+ cost_vshll_n_u8_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vtrn2_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(+ cost_vaddhn_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vpadal_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqadd_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vceqq_u8_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		)
	]
	[ (vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vzip1q_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlaq_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulhq_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(+ cost_vqrshrn_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  
		 
		 
		 
		)
	]
	[ (vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vshr_n_s64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(+ cost_vrsra_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  (arm:cost  v7)  
		 
		 
		 
		)
	]
	[ (vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vmovn_s64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vclez_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmax_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vshr_n_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqneg_s16_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgtzd_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(+ cost_vrsra_n_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  (arm:cost  v7)  
		 
		 
		 
		)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(+ cost_vqmovn_u32_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmul_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(+ cost_vqrshrnh_n_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  
		 
		 
		 
		)
	]
	[ (vpaddq_u32_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost_vpaddq_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_vmvn_u8_dsl (arm:cost  v0)  
		)
	]
	[ (vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vget_low_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vget_low_u32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(+ cost_vcombine_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vget_high_u16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vget_high_u16_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vpaddl_s16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vpaddl_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulhs_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vqdmulh_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

