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
(define cost_vabdl_high_s32_dsl 1)
(define cost_vabdl_s8_dsl 1)
(define cost_vabd_s16_dsl 1)
(define cost_vhsub_u16_dsl 1)
(define cost_vqdmull_high_n_s32_dsl 1)
(define cost_vmvn_u32_dsl 1)
(define cost_vmlal_u16_dsl 1)
(define cost_vqrdmulhq_n_s16_dsl 1)
(define cost_vsubhn_s32_dsl 1)
(define cost_vmaxq_u8_dsl 1)
(define cost_vpadd_s16_dsl 1)
(define cost_vqdmlsl_n_s16_dsl 1)
(define cost_vceqz_s8_dsl 1)
(define cost_vqrshl_u32_dsl 1)
(define cost_vmul_n_u16_dsl 1)
(define cost_vqdmull_s16_dsl 1)
(define cost_vmlal_n_u32_dsl 1)
(define cost_vmovl_u16_dsl 1)
(define cost_vmlsl_high_n_s16_dsl 1)
(define cost_vqdmlsl_n_s32_dsl 1)
(define cost_vmull_s32_dsl 1)
(define cost_vtrn2q_s32_dsl 1)
(define cost_vqdmlal_high_n_s16_dsl 1)
(define cost_vmovq_n_s64_dsl 1)
(define cost_vqsubd_u64_dsl 1)
(define cost_vmull_high_s8_dsl 1)
(define cost_vcge_u8_dsl 1)
(define cost_vmlaq_n_s16_dsl 1)
(define cost_vqrshlb_s8_dsl 1)
(define cost_vmlsl_high_s8_dsl 1)
(define cost_vzip1q_s16_dsl 1)
(define cost_vqdmlal_high_n_s32_dsl 1)
(define cost_vmulq_n_u32_dsl 1)
(define cost_vcleq_u16_dsl 1)
(define cost_vclez_s32_dsl 1)
(define cost_vqrdmulh_n_s32_dsl 1)
(define cost_vsubq_s16_dsl 1)
(define cost_vcltzq_s32_dsl 1)
(define cost_vqshlq_s32_dsl 1)
(define cost_vrhaddq_s32_dsl 1)
(define cost_vqdmlsl_high_s32_dsl 1)
(define cost_vmovn_s32_dsl 1)
(define cost_vhadd_s8_dsl 1)
(define cost_vshlq_s64_dsl 1)
(define cost_vmlal_high_s16_dsl 1)
(define cost_vsqaddh_u16_dsl 1)
(define cost_vuzp2_u16_dsl 1)
(define cost_vmull_high_n_u32_dsl 1)
(define cost_vqmovn_u32_dsl 1)
(define cost_vmlsq_s32_dsl 1)
(define cost_vmlsl_s16_dsl 1)
(define cost_vmull_n_u16_dsl 1)
(define cost_vmull_high_n_u16_dsl 1)
(define cost_vmla_n_u32_dsl 1)
(define cost_vmlsl_n_s32_dsl 1)
(define cost_vmlal_high_n_u32_dsl 1)
(define cost_vrshl_s16_dsl 1)
(define cost_vmlsl_n_s16_dsl 1)
(define cost_vneg_s32_dsl 1)
(define cost_vcltq_u64_dsl 1)
(define cost_vqdmlal_high_s16_dsl 1)
(define cost_vsubw_high_u8_dsl 1)
(define cost_vqdmull_n_s16_dsl 1)
(define cost_vsubl_s32_dsl 1)
(define cost_vadd_u16_dsl 1)
(define cost_vtrn1q_s16_dsl 1)
(define cost_vtst_s64_dsl 1)
(define cost_vmin_s16_dsl 1)
(define cost_vqabsh_s16_dsl 1)
(define cost_vaddl_high_u8_dsl 1)
(define cost_vqadd_u64_dsl 1)
(define cost_vqdmull_high_n_s16_dsl 1)
(define cost_vqdmull_n_s32_dsl 1)
(define cost_vqdmlalh_s16_dsl 1)
(define cost_vaddw_high_s16_dsl 1)
(define cost_vshlq_u8_dsl 1)
(define cost_vmul_u32_dsl 1)
(define cost_vmla_s8_dsl 1)
(define cost_vqshlb_u8_dsl 1)
(define cost_vmlal_high_n_s16_dsl 1)
(define cost_vmls_n_u16_dsl 1)
(define cost_vqdmlsls_s32_dsl 1)
(define cost_vqdmlal_n_s32_dsl 1)
(define cost_vqneg_s32_dsl 1)
(define cost_vrshl_u8_dsl 1)
(define cost_vmovl_high_s32_dsl 1)
(define cost_vmlal_n_u16_dsl 1)
(define cost_vqdmlsl_high_n_s16_dsl 1)
(define cost_vsubl_high_s8_dsl 1)
(define cost_vaddw_s32_dsl 1)
(define cost_vpminq_u32_dsl 1)
(define cost_vaddl_u32_dsl 1)
(define cost_vcgez_s8_dsl 1)
(define cost_vqdmull_high_s32_dsl 1)
(define cost_vuzp1q_s32_dsl 1)
(define cost_vmull_n_u32_dsl 1)
(define cost_vmls_n_u32_dsl 1)
(define cost_vpmax_u16_dsl 1)
(define cost_vceq_u8_dsl 1)
(define cost_vcgtz_s8_dsl 1)
(define cost_vsubw_s16_dsl 1)
(define cost_vqdmlal_n_s16_dsl 1)
(define cost_vqdmlsl_high_n_s32_dsl 1)
(define cost_vabsq_s8_dsl 1)
(define cost_vcgtq_s32_dsl 1)
(define cost_vmlsl_high_n_u32_dsl 1)
(define cost_vraddhn_u64_dsl 1)
(define cost_vzip2_s16_dsl 1)

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
	[ (vabdl_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabdl_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabdl_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vabd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vabd_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhsub_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmvn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_vmvn_u32_dsl (arm:cost  v0)  
		)
	]
	[ (vmlal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulhq_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vsubhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vsubhn_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmaxq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmaxq_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpadd_s16_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost_vpadd_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vceqz_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vceqz_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqrshl_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrshl_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vmul_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmul_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmovl_u16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(+ cost_vmovl_u16_dsl (arm:cost  vc_0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmull_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(+ cost_vmull_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vtrn2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vtrn2q_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmovq_n_s64_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(+ cost_vmovq_n_s64_dsl (arm:cost  v0)  
		)
	]
	[ (vqsubd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqsubd_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmull_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vcge_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcge_u8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlaq_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqrshlb_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqrshlb_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vmlsl_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_s8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vzip1q_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vzip1q_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vcleq_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcleq_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vclez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vclez_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqrdmulh_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulh_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vsubq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vsubq_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vcltzq_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcltzq_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqshlq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqshlq_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vrhaddq_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vmovn_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vhadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhadd_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vshlq_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vshlq_s64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsqaddh_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vsqaddh_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vuzp2_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(+ cost_vqmovn_u32_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlsq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlsl_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrshl_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrshl_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vneg_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vcltq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcltq_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vsubw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_high_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vadd_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vtrn1q_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(+ cost_vtrn1q_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vtst_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vtst_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		)
	]
	[ (vmin_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmin_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqabsh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqabsh_s16_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vaddl_high_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_high_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqadd_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlalh_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vaddw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vshlq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vshlq_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmul_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmla_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_s8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqshlb_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vqshlb_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsls_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqneg_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vrshl_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vrshl_u8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vmovl_high_s32_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(+ cost_vmovl_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vsubl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_high_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vaddw_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vpminq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpminq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vaddl_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vcgez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgez_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vuzp1q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vuzp1q_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmls_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vpmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmax_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vceq_u8_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vceq_u8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  
		)
	]
	[ (vcgtz_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgtz_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vsubw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vabsq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vabsq_s8_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vcgtq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcgtq_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmlsl_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vraddhn_u64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vzip2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(+ cost_vzip2_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

