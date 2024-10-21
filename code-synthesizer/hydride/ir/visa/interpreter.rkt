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


(require hydride/ir/visa/semantics)
(require hydride/ir/visa/definition)
(require hydride/ir/visa/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (visa:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (visa:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (visa:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o (visa:interpret v4 env) num_5)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv (visa:interpret v0 env) (visa:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext (visa:interpret v0 env) size_i size_o)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat (visa:interpret v0 env) size_i size_o)
	]
	[ (VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(VMAD_sat_2_UB_UB_UB_UB (visa:interpret v0 env) (visa:interpret v1 env) (visa:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(VBFI_4_UD_UD_UD_UD_UD (visa:interpret vc_0 env) (visa:interpret vc_1 env) (visa:interpret vc_2 env) 
		 (visa:interpret vc_3 env) (visa:interpret v4 env) (visa:interpret v5 env) 
		 (visa:interpret v6 env) (visa:interpret v7 env) size_i_o 
		 num_9 num_10 num_11 
		 prec_i_o num_13)
	]
	[ (VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(VBFE_32_D_D_D_D (visa:interpret vc_0 env) (visa:interpret vc_1 env) (visa:interpret vc_2 env) 
		 (visa:interpret vc_3 env) (visa:interpret vc_4 env) (visa:interpret v5 env) 
		 (visa:interpret v6 env) (visa:interpret v7 env) size_i_o 
		 num_9 num_10 num_11 
		 prec_i_o num_13 num_14)
	]
	[ (VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(VAVG_sat_8_UB_UB_UB (visa:interpret vc_0 env) (visa:interpret vc_1 env) (visa:interpret v2 env) 
		 (visa:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15)
	]
	[ (VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(VMAD_4_B_B_B_B (visa:interpret v0 env) (visa:interpret v1 env) (visa:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14)
	]
	[ (VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(VMULH_1_D_D_D (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VMUL_sat_8_UW_UW_UW (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o)
	]
	[ (VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(VADD_4_W_W_W (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(VMOV_1_Q_Q (visa:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(VDP4A_sat_32_D_D_D_D (visa:interpret v0 env) (visa:interpret v1 env) (visa:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20 
		 num_21 num_22 num_23 
		 num_24 num_25 num_26 
		 num_27 num_28 num_29 
		 num_30 num_31)
	]
	[ (VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(VNOT_32_W_W (visa:interpret v0 env) size_i_o num_2 
		 num_3 num_4 prec_i_o)
	]
	[ (VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VXOR_32_UD_UD_UD (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o)
	]
	[ (VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(VDP4A_1_UD_UD_UD_UD (visa:interpret v0 env) (visa:interpret v1 env) (visa:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i prec_o 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18 num_19 num_20 
		 num_21 num_22 num_23 
		 num_24 num_25 num_26 
		 num_27 num_28 num_29 
		 num_30 num_31)
	]
	[ (VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VMUL_1_UB_UB_UB (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o)
	]
	[ (VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VAND_1_UD_UD_UD (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o)
	]
	[ (VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VOR_8_D_D_D (visa:interpret v0 env) (visa:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

