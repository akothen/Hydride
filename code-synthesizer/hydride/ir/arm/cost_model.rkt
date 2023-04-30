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
(define cost_vqdmlsl_n_s32_dsl 1)
(define cost_vcgtd_u64_dsl 1)
(define cost_vqdmulh_n_s16_dsl 1)
(define cost_vmlaq_u32_dsl 1)
(define cost_vqdmlsl_n_s16_dsl 1)
(define cost_vqrshl_u64_dsl 1)
(define cost_vzip2q_u16_dsl 1)
(define cost_vmaxq_s8_dsl 1)
(define cost_vrsubhn_u32_dsl 1)
(define cost_vsubl_s32_dsl 1)
(define cost_vmlal_n_s16_dsl 1)
(define cost_vabs_s32_dsl 1)
(define cost_vcltq_u64_dsl 1)
(define cost_vqdmlal_n_s32_dsl 1)
(define cost_vqdmull_high_n_s16_dsl 1)
(define cost_vqshl_u32_dsl 1)
(define cost_vqshl_u8_dsl 1)
(define cost_vuzp2q_s8_dsl 1)
(define cost_vsqaddq_u64_dsl 1)
(define cost_vminq_s8_dsl 1)
(define cost_vmulq_s32_dsl 1)
(define cost_vuzp1_s8_dsl 1)
(define cost_vqdmlal_high_s32_dsl 1)
(define cost_vqdmlal_high_n_s32_dsl 1)
(define cost_vpminq_s8_dsl 1)
(define cost_vmla_n_s32_dsl 1)
(define cost_vqdmlslh_s16_dsl 1)
(define cost_vaddw_high_u32_dsl 1)
(define cost_vqdmull_n_s32_dsl 1)
(define cost_vqrshlq_s8_dsl 1)
(define cost_vaddw_u8_dsl 1)
(define cost_vsubl_high_u32_dsl 1)
(define cost_vqdmlal_high_n_s16_dsl 1)
(define cost_vmovl_high_s8_dsl 1)
(define cost_vmovn_u64_dsl 1)
(define cost_vmul_n_s16_dsl 1)
(define cost_vqrdmulhq_s16_dsl 1)
(define cost_vmlal_s32_dsl 1)
(define cost_vtrn2_s32_dsl 1)
(define cost_vtst_u8_dsl 1)
(define cost_vqmovunh_s16_dsl 1)
(define cost_vaddhn_s16_dsl 1)
(define cost_vtrn1_s16_dsl 1)
(define cost_vhaddq_s8_dsl 1)
(define cost_vclez_s32_dsl 1)
(define cost_vmlsq_n_s32_dsl 1)
(define cost_vmlsl_n_u32_dsl 1)
(define cost_vmull_n_u32_dsl 1)
(define cost_vqrdmulhq_n_s32_dsl 1)
(define cost_vmls_n_s16_dsl 1)
(define cost_vmvnq_s32_dsl 1)
(define cost_vmulq_n_u32_dsl 1)
(define cost_vpmax_u16_dsl 1)
(define cost_vqdmlal_n_s16_dsl 1)
(define cost_vmull_high_u16_dsl 1)
(define cost_vhsub_s8_dsl 1)
(define cost_vcltzd_s64_dsl 1)
(define cost_vqdmull_s16_dsl 1)
(define cost_vcleq_u64_dsl 1)
(define cost_vmull_u16_dsl 1)
(define cost_vmull_high_n_u32_dsl 1)
(define cost_vqdmull_n_s16_dsl 1)
(define cost_vsubw_u32_dsl 1)
(define cost_vadd_s64_dsl 1)
(define cost_vcgtz_s32_dsl 1)
(define cost_vqnegq_s64_dsl 1)
(define cost_vmla_n_s16_dsl 1)
(define cost_vmlsl_high_s16_dsl 1)
(define cost_vaddl_s8_dsl 1)
(define cost_vqdmlsl_high_n_s16_dsl 1)
(define cost_vmull_high_n_u16_dsl 1)
(define cost_vrshlq_s16_dsl 1)
(define cost_vmlsl_n_s16_dsl 1)
(define cost_vmlsq_s8_dsl 1)
(define cost_vsubw_high_s16_dsl 1)
(define cost_vpaddq_s64_dsl 1)
(define cost_vqadd_s64_dsl 1)
(define cost_vnegq_s64_dsl 1)
(define cost_vmlal_high_n_u32_dsl 1)
(define cost_vmlsl_high_n_u32_dsl 1)
(define cost_vshld_u64_dsl 1)
(define cost_vqdmlsl_high_s16_dsl 1)
(define cost_vshlq_s8_dsl 1)
(define cost_vqsubq_u16_dsl 1)
(define cost_vsubq_u64_dsl 1)
(define cost_vmovl_s32_dsl 1)
(define cost_vrshl_s8_dsl 1)
(define cost_vaddl_high_s8_dsl 1)
(define cost_vmlal_n_s32_dsl 1)
(define cost_vrhaddq_s16_dsl 1)
(define cost_vcgez_s64_dsl 1)
(define cost_vmlal_high_u32_dsl 1)
(define cost_vzip1_u32_dsl 1)
(define cost_vqabsq_s32_dsl 1)
(define cost_vmlsl_u16_dsl 1)
(define cost_vceqzq_s64_dsl 1)
(define cost_vqdmlals_s32_dsl 1)
(define cost_vqdmlsl_high_n_s32_dsl 1)
(define cost_vmlsl_high_n_s16_dsl 1)
(define cost_vqdmull_high_n_s32_dsl 1)
(define cost_vceqq_s8_dsl 1)
(define cost_vqdmull_high_s16_dsl 1)
(define cost_vcge_u16_dsl 1)

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
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcgtd_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqdmulh_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlaq_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqrshl_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqrshl_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vzip2q_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(+ cost_vzip2q_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (vmaxq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmaxq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vrsubhn_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vrsubhn_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vabs_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vcltq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcltq_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqshl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqshl_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqshl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vqshl_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vuzp2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vuzp2q_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vsqaddq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vsqaddq_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vminq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmulq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vuzp1_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vuzp1_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vqdmlal_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vpminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpminq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmlslh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlslh_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_high_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqrshlq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqrshlq_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vsubl_high_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_high_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmovl_high_s8_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(+ cost_vmovl_high_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vmovn_u64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmul_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulhq_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vtrn2_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vtst_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vtst_u8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		)
	]
	[ (vqmovunh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(+ cost_vqmovunh_s16_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vaddhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vaddhn_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vtrn1_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(+ cost_vtrn1_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vhaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhaddq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vclez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vclez_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmlsq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlsq_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqrdmulhq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmvnq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_vmvnq_s32_dsl (arm:cost  v0)  
		)
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmax_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmull_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vhsub_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhsub_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vcltzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcltzd_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vcleq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcleq_u64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmull_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(+ cost_vmull_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsubw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vadd_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vcgtz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgtz_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqnegq_s64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vaddl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vrshlq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vrshlq_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsq_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlsq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vsubw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vpaddq_s64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost_vpaddq_s64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqadd_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vnegq_s64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsl_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vshld_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vshld_u64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vshlq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vshlq_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqsubq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vsubq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vsubq_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vmovl_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(+ cost_vmovl_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vrshl_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vrshl_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_high_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vrhaddq_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vcgez_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgez_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmlal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vzip1_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vzip1_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqabsq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqabsq_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vceqzq_s64_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vceqzq_s64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  
		 
		)
	]
	[ (vqdmlals_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlals_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vceqq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vceqq_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		)
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vcge_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcge_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

