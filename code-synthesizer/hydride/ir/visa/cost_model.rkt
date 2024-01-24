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
(require hydride/ir/visa/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost_VMAD_sat_2_UB_UB_UB_UB_dsl 1)
(define cost_VBFI_4_UD_UD_UD_UD_UD_dsl 1)
(define cost_VBFE_32_D_D_D_D_dsl 1)
(define cost_VAVG_sat_8_UB_UB_UB_dsl 1)
(define cost_VMAD_4_B_B_B_B_dsl 1)
(define cost_VMULH_1_D_D_D_dsl 1)
(define cost_VMUL_sat_8_UW_UW_UW_dsl 1)
(define cost_VADD_4_W_W_W_dsl 1)
(define cost_VMOV_1_Q_Q_dsl 1)
(define cost_VDP4A_sat_32_D_D_D_D_dsl 1)
(define cost_VNOT_32_W_W_dsl 1)
(define cost_VXOR_32_UD_UD_UD_dsl 1)
(define cost_VDP4A_1_UD_UD_UD_UD_dsl 1)
(define cost_VMUL_1_UB_UB_UB_dsl 1)
(define cost_VAND_1_UD_UD_UD_dsl 1)
(define cost_VOR_8_D_D_D_dsl 1)

(define (visa:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (visa:cost  v0)  (visa:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (visa:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (visa:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (visa:cost  v0)  (visa:cost  v1)  
		 (visa:cost  v4) )
	]
		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (visa:cost  v0)  (visa:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (visa:cost  v0)  (visa:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (visa:cost  v0)  (visa:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (visa:cost  v0)  (visa:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (visa:cost  v0)  (visa:cost  v1)  
		)
	]
		[ (llvm-zext_dsl v0 size_i size_o)
		(+ 1 (visa:cost  v0) )
	]
		[ (scalar_splat_dsl v0 size_i size_o)
		(+ 1 (visa:cost  v0) )
	]
	[ (VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_VMAD_sat_2_UB_UB_UB_UB_dsl (visa:cost  v0)  (visa:cost  v1)  (visa:cost  v2)  
		 
		 
		 
		)
	]
	[ (VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(+ cost_VBFI_4_UD_UD_UD_UD_UD_dsl (visa:cost  vc_0)  (visa:cost  vc_1)  (visa:cost  vc_2)  
		 (visa:cost  vc_3)  (visa:cost  v4)  (visa:cost  v5)  
		 (visa:cost  v6)  (visa:cost  v7)  
		 
		)
	]
	[ (VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(+ cost_VBFE_32_D_D_D_D_dsl (visa:cost  vc_0)  (visa:cost  vc_1)  (visa:cost  vc_2)  
		 (visa:cost  vc_3)  (visa:cost  vc_4)  (visa:cost  v5)  
		 (visa:cost  v6)  (visa:cost  v7)  
		 
		)
	]
	[ (VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ cost_VAVG_sat_8_UB_UB_UB_dsl (visa:cost  vc_0)  (visa:cost  vc_1)  (visa:cost  v2)  
		 (visa:cost  v3)  
		 
		 
		 
		)
	]
	[ (VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ cost_VMAD_4_B_B_B_B_dsl (visa:cost  v0)  (visa:cost  v1)  (visa:cost  v2)  
		 
		 
		 
		)
	]
	[ (VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_VMULH_1_D_D_D_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		 
		)
	]
	[ (VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(+ cost_VMUL_sat_8_UW_UW_UW_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
	[ (VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_VADD_4_W_W_W_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
	[ (VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_VMOV_1_Q_Q_dsl (visa:cost  v0)  
		)
	]
	[ (VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(+ cost_VDP4A_sat_32_D_D_D_D_dsl (visa:cost  v0)  (visa:cost  v1)  (visa:cost  v2)  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(+ cost_VNOT_32_W_W_dsl (visa:cost  v0)  
		)
	]
	[ (VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(+ cost_VXOR_32_UD_UD_UD_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
	[ (VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(+ cost_VDP4A_1_UD_UD_UD_UD_dsl (visa:cost  v0)  (visa:cost  v1)  (visa:cost  v2)  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(+ cost_VMUL_1_UB_UB_UB_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
	[ (VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(+ cost_VAND_1_UD_UD_UD_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
	[ (VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(+ cost_VOR_8_D_D_D_dsl (visa:cost  v0)  (visa:cost  v1)  
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

