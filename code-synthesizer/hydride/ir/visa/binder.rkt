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

(require hydride/ir/visa/semantics)
(require hydride/ir/visa/definition)
(require hydride/ir/visa/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Binder
;; ================================================================================
(define (visa:bind-expr prog env)
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (vector-ref-bv env id)]
	[(lit v) (lit v)]
	[(idx-add i1 i2) (idx-add i1 i2)]
	[(idx-mul i1 i2) (idx-mul i1 i2)]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr num_6 env) (visa:bind-expr num_7 env) (visa:bind-expr num_8 env))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector_dsl (visa:bind-expr v0 env) (visa:bind-expr size_i_o env) (visa:bind-expr prec_i_o env))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector_dsl (visa:bind-expr v0 env) (visa:bind-expr size_i_o env) (visa:bind-expr prec_i_o env))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env) (visa:bind-expr v4 env) (visa:bind-expr num_5 env))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext_dsl (visa:bind-expr v0 env) (visa:bind-expr size_i env) (visa:bind-expr size_o env))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat_dsl (visa:bind-expr v0 env) (visa:bind-expr size_i env) (visa:bind-expr size_o env))
	]
	[ (VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(VMAD_sat_2_UB_UB_UB_UB_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr v2 env) 
		 (visa:bind-expr size_i_o env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr num_6 env) (visa:bind-expr prec_i_o env) (visa:bind-expr num_8 env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr num_12 env) (visa:bind-expr num_13 env) (visa:bind-expr num_14 env))
	]
	[ (VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(VBFI_4_UD_UD_UD_UD_UD_dsl (visa:bind-expr vc_0 env) (visa:bind-expr vc_1 env) (visa:bind-expr vc_2 env) 
		 (visa:bind-expr vc_3 env) (visa:bind-expr v4 env) (visa:bind-expr v5 env) 
		 (visa:bind-expr v6 env) (visa:bind-expr v7 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr prec_i_o env) (visa:bind-expr num_13 env))
	]
	[ (VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(VBFE_32_D_D_D_D_dsl (visa:bind-expr vc_0 env) (visa:bind-expr vc_1 env) (visa:bind-expr vc_2 env) 
		 (visa:bind-expr vc_3 env) (visa:bind-expr vc_4 env) (visa:bind-expr v5 env) 
		 (visa:bind-expr v6 env) (visa:bind-expr v7 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr prec_i_o env) (visa:bind-expr num_13 env) (visa:bind-expr num_14 env))
	]
	[ (VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(VAVG_sat_8_UB_UB_UB_dsl (visa:bind-expr vc_0 env) (visa:bind-expr vc_1 env) (visa:bind-expr v2 env) 
		 (visa:bind-expr v3 env) (visa:bind-expr size_i_o env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr num_6 env) (visa:bind-expr num_7 env) (visa:bind-expr prec_i_o env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr num_12 env) (visa:bind-expr num_13 env) (visa:bind-expr num_14 env) 
		 (visa:bind-expr num_15 env))
	]
	[ (VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(VMAD_4_B_B_B_B_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr v2 env) 
		 (visa:bind-expr size_i_o env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr num_6 env) (visa:bind-expr prec_i_o env) (visa:bind-expr num_8 env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr num_12 env) (visa:bind-expr num_13 env) (visa:bind-expr num_14 env))
	]
	[ (VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(VMULH_1_D_D_D_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env) (visa:bind-expr num_7 env) (visa:bind-expr num_8 env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env))
	]
	[ (VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VMUL_sat_8_UW_UW_UW_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(VADD_4_W_W_W_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env) (visa:bind-expr num_7 env))
	]
	[ (VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(VMOV_1_Q_Q_dsl (visa:bind-expr v0 env) (visa:bind-expr size_i_o env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr prec_i_o env))
	]
	[ (VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(VDP4A_sat_32_D_D_D_D_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr v2 env) 
		 (visa:bind-expr size_i_o env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr num_6 env) (visa:bind-expr prec_i env) (visa:bind-expr prec_o env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr num_12 env) (visa:bind-expr num_13 env) (visa:bind-expr num_14 env) 
		 (visa:bind-expr num_15 env) (visa:bind-expr num_16 env) (visa:bind-expr num_17 env) 
		 (visa:bind-expr num_18 env) (visa:bind-expr num_19 env) (visa:bind-expr num_20 env) 
		 (visa:bind-expr num_21 env) (visa:bind-expr num_22 env) (visa:bind-expr num_23 env) 
		 (visa:bind-expr num_24 env) (visa:bind-expr num_25 env) (visa:bind-expr num_26 env) 
		 (visa:bind-expr num_27 env) (visa:bind-expr num_28 env) (visa:bind-expr num_29 env) 
		 (visa:bind-expr num_30 env) (visa:bind-expr num_31 env))
	]
	[ (VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(VNOT_32_W_W_dsl (visa:bind-expr v0 env) (visa:bind-expr size_i_o env) (visa:bind-expr num_2 env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr prec_i_o env))
	]
	[ (VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VXOR_32_UD_UD_UD_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(VDP4A_1_UD_UD_UD_UD_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr v2 env) 
		 (visa:bind-expr size_i_o env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr num_6 env) (visa:bind-expr prec_i env) (visa:bind-expr prec_o env) 
		 (visa:bind-expr num_9 env) (visa:bind-expr num_10 env) (visa:bind-expr num_11 env) 
		 (visa:bind-expr num_12 env) (visa:bind-expr num_13 env) (visa:bind-expr num_14 env) 
		 (visa:bind-expr num_15 env) (visa:bind-expr num_16 env) (visa:bind-expr num_17 env) 
		 (visa:bind-expr num_18 env) (visa:bind-expr num_19 env) (visa:bind-expr num_20 env) 
		 (visa:bind-expr num_21 env) (visa:bind-expr num_22 env) (visa:bind-expr num_23 env) 
		 (visa:bind-expr num_24 env) (visa:bind-expr num_25 env) (visa:bind-expr num_26 env) 
		 (visa:bind-expr num_27 env) (visa:bind-expr num_28 env) (visa:bind-expr num_29 env) 
		 (visa:bind-expr num_30 env) (visa:bind-expr num_31 env))
	]
	[ (VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VMUL_1_UB_UB_UB_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VAND_1_UD_UD_UD_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[ (VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(VOR_8_D_D_D_dsl (visa:bind-expr v0 env) (visa:bind-expr v1 env) (visa:bind-expr size_i_o env) 
		 (visa:bind-expr num_3 env) (visa:bind-expr num_4 env) (visa:bind-expr num_5 env) 
		 (visa:bind-expr prec_i_o env))
	]
	[v v]
 )
)
;; ================================================================================

