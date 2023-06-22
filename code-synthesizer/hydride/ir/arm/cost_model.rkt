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
(define cost_vraddhn_s32_dsl 1)
(define cost_vmla_n_s32_dsl 1)
(define cost_vsubw_high_u8_dsl 1)
(define cost_vmull_n_u16_dsl 1)
(define cost_vmlsl_high_n_s32_dsl 1)
(define cost_vmlaq_n_u16_dsl 1)
(define cost_vaddl_high_s16_dsl 1)
(define cost_vqsub_u8_dsl 1)
(define cost_vpminq_s32_dsl 1)
(define cost_vqdmull_n_s16_dsl 1)
(define cost_vuqaddq_s8_dsl 1)
(define cost_vcgtzq_s64_dsl 1)
(define cost_vqdmulhq_n_s32_dsl 1)
(define cost_vqabs_s8_dsl 1)
(define cost_vmovn_u64_dsl 1)
(define cost_vabd_u16_dsl 1)
(define cost_vqdmlals_s32_dsl 1)
(define cost_vmul_n_s32_dsl 1)
(define cost_vsubl_s8_dsl 1)
(define cost_vmvnq_s8_dsl 1)
(define cost_vsraq_n_s32_dsl 1)
(define cost_vqdmull_high_n_s32_dsl 1)
(define cost_vsubhn_s32_dsl 1)
(define cost_vclt_u32_dsl 1)
(define cost_vqmovn_s32_dsl 1)
(define cost_vceqzq_s64_dsl 1)
(define cost_vmlal_s32_dsl 1)
(define cost_vqdmlsl_high_n_s32_dsl 1)
(define cost_vabdl_high_s8_dsl 1)
(define cost_vmovq_n_u8_dsl 1)
(define cost_vrhaddq_s8_dsl 1)
(define cost_vtst_s8_dsl 1)
(define cost_vmovl_high_s16_dsl 1)
(define cost_vqdmlal_high_n_s32_dsl 1)
(define cost_vmls_n_s16_dsl 1)
(define cost_vcgt_u16_dsl 1)
(define cost_vsub_s64_dsl 1)
(define cost_vceq_s8_dsl 1)
(define cost_vmlaq_s32_dsl 1)
(define cost_vqdmull_high_s32_dsl 1)
(define cost_vabdl_s8_dsl 1)
(define cost_vmlsl_n_s32_dsl 1)
(define cost_vmlsl_high_u32_dsl 1)
(define cost_vrsra_n_u8_dsl 1)
(define cost_vadd_u64_dsl 1)
(define cost_vmull_n_s32_dsl 1)
(define cost_vhadd_u8_dsl 1)
(define cost_vaddw_high_s32_dsl 1)
(define cost_vtrn1_u16_dsl 1)
(define cost_vmull_u32_dsl 1)
(define cost_vsra_n_u8_dsl 1)
(define cost_vqdmull_s32_dsl 1)
(define cost_vmaxq_u16_dsl 1)
(define cost_vzip1_s32_dsl 1)
(define cost_vcgeq_u32_dsl 1)
(define cost_vqdmlal_high_n_s16_dsl 1)
(define cost_vqneg_s32_dsl 1)
(define cost_vqdmlsl_n_s16_dsl 1)
(define cost_vmulq_u8_dsl 1)
(define cost_vtrn2_s32_dsl 1)
(define cost_vcltz_s32_dsl 1)
(define cost_vqdmlsl_high_s32_dsl 1)
(define cost_vqdmulh_s16_dsl 1)
(define cost_vqdmlsl_high_n_s16_dsl 1)
(define cost_vmlsl_high_n_s16_dsl 1)
(define cost_vpaddq_u64_dsl 1)
(define cost_vmull_high_n_s16_dsl 1)
(define cost_vmlal_n_u32_dsl 1)
(define cost_vmlsq_u16_dsl 1)
(define cost_vuzp2_s16_dsl 1)
(define cost_vclezq_s8_dsl 1)
(define cost_vhsubq_u16_dsl 1)
(define cost_vmlal_n_s16_dsl 1)
(define cost_vuzp1_u16_dsl 1)
(define cost_vqdmulhq_n_s16_dsl 1)
(define cost_vabs_s32_dsl 1)
(define cost_vaddl_u8_dsl 1)
(define cost_vqdmull_high_n_s16_dsl 1)
(define cost_vneg_s8_dsl 1)
(define cost_vqdmlsls_s32_dsl 1)
(define cost_vmull_high_n_u32_dsl 1)
(define cost_vpmax_u32_dsl 1)
(define cost_vqdmull_n_s32_dsl 1)
(define cost_vsubw_s8_dsl 1)
(define cost_vcle_s64_dsl 1)
(define cost_vsubl_high_s16_dsl 1)
(define cost_vqadd_u64_dsl 1)
(define cost_vqdmlal_n_s16_dsl 1)
(define cost_vqdmlsl_n_s32_dsl 1)
(define cost_vmlsl_n_u16_dsl 1)
(define cost_vminq_u16_dsl 1)
(define cost_vmlsl_u16_dsl 1)
(define cost_vcgez_s16_dsl 1)
(define cost_vmulq_n_s16_dsl 1)
(define cost_vmlal_high_s8_dsl 1)
(define cost_vqdmlal_n_s32_dsl 1)
(define cost_vqdmlal_high_s16_dsl 1)
(define cost_vmull_high_u8_dsl 1)
(define cost_vmls_n_s32_dsl 1)
(define cost_vaddw_s16_dsl 1)
(define cost_vmlal_high_n_u32_dsl 1)
(define cost_vmovl_s16_dsl 1)
(define cost_vzip2_s8_dsl 1)
(define cost_vmlal_high_n_s16_dsl 1)
(define cost_vshr_n_s8_dsl 1)
(define cost_vqrshrnd_n_s64_dsl 1)
(define cost_vqshrunh_n_s16_dsl 1)
(define cost_vshr_n_u32_dsl 1)
(define cost_vrshr_n_s64_dsl 1)
(define cost_vrshrn_n_s64_dsl 1)
(define cost_vshrn_n_u32_dsl 1)
(define cost_vqshrn_n_u32_dsl 1)
(define cost_vqrshrns_n_u32_dsl 1)
(define cost_vrshld_s64_dsl 1)
(define cost_vqshls_s32_dsl 1)
(define cost_vshll_n_u16_dsl 1)
(define cost_vrshl_u16_dsl 1)
(define cost_vqshlq_u64_dsl 1)
(define cost_vqrshld_s64_dsl 1)
(define cost_vshll_high_n_s8_dsl 1)
(define cost_vshld_s64_dsl 1)
(define cost_vqshlh_n_u16_dsl 1)
(define cost_vqrshlq_u16_dsl 1)

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
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vraddhn_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmla_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vsubw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_high_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlaq_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlaq_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vaddl_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqsub_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqsub_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpminq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpminq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vuqaddq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vcgtzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgtzq_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqdmulhq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqabs_s8_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ cost_vmovn_u64_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vabd_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vabd_u16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlals_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlals_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmul_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmul_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmvnq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_vmvnq_s8_dsl (arm:cost  v0)  
		)
	]
	[ (vsraq_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(+ cost_vsraq_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsubhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(+ cost_vsubhn_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vclt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vclt_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(+ cost_vqmovn_s32_dsl (arm:cost  v0)  
		 
		 
		)
	]
	[ (vceqzq_s64_dsl v0 vc_1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_vceqzq_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  
		 
		)
	]
	[ (vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vabdl_high_s8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabdl_high_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmovq_n_u8_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(+ cost_vmovq_n_u8_dsl (arm:cost  v0)  
		)
	]
	[ (vrhaddq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vrhaddq_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vtst_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vtst_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		)
	]
	[ (vmovl_high_s16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 size_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vmovl_high_s16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 
		 
		 
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vcgt_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcgt_u16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vsub_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vsub_s64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vceq_s8_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(+ cost_vceq_s8_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  vc_3)  
		)
	]
	[ (vmlaq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlaq_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_vabdl_s8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsl_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(+ cost_vrsra_n_u8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  (arm:cost  v7)  
		 
		 
		 
		)
	]
	[ (vadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vadd_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost_vmull_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vhadd_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhadd_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vaddw_high_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_high_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vtrn1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(+ cost_vtrn1_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(+ cost_vmull_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vsra_n_u8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(+ cost_vsra_n_u8_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmaxq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vzip1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vzip1_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vcgeq_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcgeq_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vqneg_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmulq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ cost_vtrn2_s32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcltz_s32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqdmulh_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vpaddq_u64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost_vpaddq_u64_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmlsq_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmlsq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vuzp2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vuzp2_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vclezq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vclezq_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vhsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vhsubq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlal_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vuzp1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_vuzp1_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
	[ (vqdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ cost_vqdmulhq_n_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  (arm:cost  v4)  
		 
		 
		)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vabs_s32_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddl_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vqdmull_high_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vneg_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_vneg_s8_dsl (arm:cost  v0)  
		 
		)
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsls_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vpmax_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmax_u32_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(+ cost_vqdmull_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubw_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vcle_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ cost_vcle_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vsubl_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_vsubl_high_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vqadd_u64_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlsl_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_n_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vminq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vminq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlsl_u16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vcgez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_vcgez_s16_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		)
	]
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_vmulq_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmlal_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_s8_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_n_s32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_vqdmlal_high_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		 
		 
		)
	]
	[ (vmull_high_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(+ cost_vmull_high_u8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(+ cost_vmls_n_s32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		)
	]
	[ (vaddw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ cost_vaddw_s16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_n_u32_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vmovl_s16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 prec_i prec_o num_12 num_13 num_14 num_15 num_16)
		(+ cost_vmovl_s16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 
		 
		 
		)
	]
	[ (vzip2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(+ cost_vzip2_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost_vmlal_high_n_s16_dsl (arm:cost  v0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vshr_n_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vshr_n_s8_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqrshrnd_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(+ cost_vqrshrnd_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  
		 
		 
		 
		)
	]
	[ (vqshrunh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(+ cost_vqshrunh_n_s16_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vshr_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vshr_n_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  v2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vrshr_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(+ cost_vrshr_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  v6)  (arm:cost  v7)  
		 
		 
		 
		)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(+ cost_vrshrn_n_s64_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  
		 
		 
		 
		)
	]
	[ (vshrn_n_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(+ cost_vshrn_n_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqshrn_n_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(+ cost_vqshrn_n_u32_dsl (arm:cost  vc_0)  (arm:cost  v1)  (arm:cost  v2)  
		 
		 
		 
		)
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(+ cost_vqrshrns_n_u32_dsl (arm:cost  vc_0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  v5)  
		 (arm:cost  v6)  
		 
		 
		 
		)
	]
	[ (vrshld_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vrshld_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vqshls_s32_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqshls_s32_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vshll_n_u16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(+ cost_vshll_n_u16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vrshl_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vrshl_u16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vqshlq_u64_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vqshlq_u64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vqrshld_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vqrshld_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[ (vshll_high_n_s8_dsl v0 vc_1 vc_2 v3 size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vshll_high_n_s8_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		 
		)
	]
	[ (vshld_s64_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_vshld_s64_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  v4)  
		 
		 
		 
		)
	]
	[ (vqshlh_n_u16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ cost_vqshlh_n_u16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  v3)  
		 
		 
		)
	]
	[ (vqrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ cost_vqrshlq_u16_dsl (arm:cost  v0)  (arm:cost  vc_1)  (arm:cost  vc_2)  
		 (arm:cost  vc_3)  (arm:cost  vc_4)  (arm:cost  vc_5)  
		 (arm:cost  vc_6)  (arm:cost  vc_7)  (arm:cost  v8)  
		 
		 
		 
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

