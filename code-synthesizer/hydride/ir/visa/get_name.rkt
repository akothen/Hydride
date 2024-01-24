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


(require hydride/ir/hydride/definition)
(require hydride/ir/visa/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Names
;; ================================================================================
(define (visa:get-target-name prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		 (append (list  "two_input_swizzle_N6_T8_LO0_L3_G3_D1_R0") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		 (append (list  "interleave-vectors-128-16") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "interleave-vector-128-16") (visa:get-target-name v0))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "deinterleave-vector-128-16") (visa:get-target-name v0))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		 (append (list  "shuffle-vector-128-16-128") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v4))
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-add-128-16") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sub-128-16") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-mul-128-16") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sdiv-128-16") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-udiv-128-16") (visa:get-target-name v0) (visa:get-target-name v1))
	]
		[(llvm-zext_dsl v0 size_i size_o)
		 (append (list  "llvm-zext-8-32") (visa:get-target-name v0))
	]
		[(scalar_splat_dsl v0 size_i size_o)
		 (append (list  "llvm-splat-8-32") (visa:get-target-name v0))
	]
	[(VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_2_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_1_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_32_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_16_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_1_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_32_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_8_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_8_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_4_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_16_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_4_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_sat_2_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[else (error "Unable to get name  for VMAD_sat_2_UB_UB_UB_UB")]
)

	]
	[(VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_4_UD_UD_UD_UD_UD") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_2_UD_UD_UD_UD_UD") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 256) (equal? num_9 256) (equal? num_10 0) (equal? num_11 256) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_8_D_D_D_D_D") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 1024) (equal? num_9 1024) (equal? num_10 0) (equal? num_11 1024) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_32_D_D_D_D_D") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_2_D_D_D_D_D") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 512) (equal? num_9 512) (equal? num_10 0) (equal? num_11 512) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_16_D_D_D_D_D") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 512) (equal? num_9 512) (equal? num_10 0) (equal? num_11 512) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_16_UD_UD_UD_UD_UD") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_1_UD_UD_UD_UD_UD") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 256) (equal? num_9 256) (equal? num_10 0) (equal? num_11 256) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_8_UD_UD_UD_UD_UD") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 1024) (equal? num_9 1024) (equal? num_10 0) (equal? num_11 1024) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_32_UD_UD_UD_UD_UD") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_1_D_D_D_D_D") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1)) 
   (append (list  "VBFI_4_D_D_D_D_D") (visa:get-target-name v4) (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[else (error "Unable to get name  for VBFI_4_UD_UD_UD_UD_UD")]
)

	]
	[(VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_9 1024) (equal? num_10 0) (equal? num_11 1024) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_32_D_D_D_D") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 256) (equal? num_9 256) (equal? num_10 0) (equal? num_11 256) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_8_D_D_D_D") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_4_D_D_D_D") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 512) (equal? num_9 512) (equal? num_10 0) (equal? num_11 512) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_16_D_D_D_D") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 512) (equal? num_9 512) (equal? num_10 0) (equal? num_11 512) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_16_UD_UD_UD_UD") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_1_D_D_D_D") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_2_D_D_D_D") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 256) (equal? num_9 256) (equal? num_10 0) (equal? num_11 256) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_8_UD_UD_UD_UD") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_2_UD_UD_UD_UD") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_1_UD_UD_UD_UD") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_4_UD_UD_UD_UD") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[(and  (equal? size_i_o 1024) (equal? num_9 1024) (equal? num_10 0) (equal? num_11 1024) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1)) 
   (append (list  "VBFE_32_UD_UD_UD_UD") (visa:get-target-name v5) (visa:get-target-name v6) (visa:get-target-name v7))]
		[else (error "Unable to get name  for VBFE_32_D_D_D_D")]
)

	]
	[(VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_8_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_1_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_32_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_32_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_32_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_1_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_16_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_1_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_4_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_2_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_1_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_1_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_32_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_2_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_16_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_16_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_8_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_8_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_16_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_4_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_4_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_2_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_32_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_4_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_1_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_32_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_8_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_8_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_2_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_4_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_16_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_16_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_4_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_4_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_8_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_4_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_2_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_8_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_1_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_16_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_4_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_2_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_4_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_4_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_32_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_4_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_16_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_32_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_8_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_32_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_1_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_8_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_8_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_32_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_2_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_2_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_2_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_16_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_16_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_2_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_1_W_W_W") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_1_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_16_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_2_UW_UW_UW") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_32_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_32_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_16_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_8_UD_UD_UD") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_8_D_D_D") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_sat_1_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_2_UB_UB_UB") (visa:get-target-name v2) (visa:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64)) 
   (append (list  "VAVG_1_B_B_B") (visa:get-target-name v2) (visa:get-target-name v3))]
		[else (error "Unable to get name  for VAVG_sat_8_UB_UB_UB")]
)

	]
	[(VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_4_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_4_UW_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_2_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_8_UW_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_16_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_4_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_1_W_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_32_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_1_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_2_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_16_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_32_W_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_16_W_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_32_UW_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_8_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_1_UW_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_32_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_16_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_8_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_2_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_1_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_16_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_8_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_2_UW_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_4_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_32_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_32_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_16_UW_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_1_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_2_W_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_8_UB_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_8_W_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_4_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_2_B_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_4_W_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1)) 
   (append (list  "VMAD_1_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[else (error "Unable to get name  for VMAD_4_B_B_B_B")]
)

	]
	[(VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1)) 
   (append (list  "VMULH_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VMULH_1_D_D_D")]
)

	]
	[(VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VMUL_sat_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VMUL_sat_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VMUL_sat_8_UW_UW_UW")]
)

	]
	[(VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "VADD_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1)) 
   (append (list  "VADD_sat_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "VADD_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1)) 
   (append (list  "VADD_sat_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "VADD_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1)) 
   (append (list  "VADD_sat_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VADD_4_W_W_W")]
)

	]
	[(VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64)) 
   (append (list  "VMOV_1_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16)) 
   (append (list  "VMOV_32_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "VMOV_8_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64)) 
   (append (list  "VMOV_8_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_8_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_4_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_4_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8)) 
   (append (list  "VMOV_1_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_4_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32)) 
   (append (list  "VMOV_4_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 2048) (equal? num_2 2048) (equal? num_3 0) (equal? num_4 2048) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_32_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_2_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_16_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8)) 
   (append (list  "VMOV_4_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_1_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_8_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16)) 
   (append (list  "VMOV_16_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_16_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16)) 
   (append (list  "VMOV_2_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32)) 
   (append (list  "VMOV_1_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32)) 
   (append (list  "VMOV_8_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_1_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_16_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8)) 
   (append (list  "VMOV_32_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16)) 
   (append (list  "VMOV_4_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16)) 
   (append (list  "VMOV_8_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 64)) 
   (append (list  "VMOV_16_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_8_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8)) 
   (append (list  "VMOV_4_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16)) 
   (append (list  "VMOV_1_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32)) 
   (append (list  "VMOV_16_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32)) 
   (append (list  "VMOV_8_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_16_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8)) 
   (append (list  "VMOV_2_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_1_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64)) 
   (append (list  "VMOV_1_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_4_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8)) 
   (append (list  "VMOV_32_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "VMOV_8_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_16_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32)) 
   (append (list  "VMOV_16_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_4_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32)) 
   (append (list  "VMOV_32_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_4_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_2_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_32_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_16_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32)) 
   (append (list  "VMOV_2_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16)) 
   (append (list  "VMOV_32_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 64)) 
   (append (list  "VMOV_16_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16)) 
   (append (list  "VMOV_8_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_1_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_32_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_32_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_8_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_16_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_2_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8)) 
   (append (list  "VMOV_1_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "VMOV_16_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_1_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_16_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_8_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_8_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "VMOV_16_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32)) 
   (append (list  "VMOV_4_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 2048) (equal? num_2 2048) (equal? num_3 0) (equal? num_4 2048) (equal? prec_i_o 64)) 
   (append (list  "VMOV_32_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_32_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_32_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_1_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64)) 
   (append (list  "VMOV_2_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 2048) (equal? num_2 2048) (equal? num_3 0) (equal? num_4 2048) (equal? prec_i_o 64)) 
   (append (list  "VMOV_32_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8)) 
   (append (list  "VMOV_2_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16)) 
   (append (list  "VMOV_2_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_1_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32)) 
   (append (list  "VMOV_1_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_2_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_8_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_2_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64)) 
   (append (list  "VMOV_4_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_1_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 2048) (equal? num_2 2048) (equal? num_3 0) (equal? num_4 2048) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_32_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_8_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_2_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_2_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8)) 
   (append (list  "VMOV_sat_4_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16)) 
   (append (list  "VMOV_16_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32)) 
   (append (list  "VMOV_32_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64)) 
   (append (list  "VMOV_sat_4_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64)) 
   (append (list  "VMOV_2_Q_Q") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16)) 
   (append (list  "VMOV_1_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16)) 
   (append (list  "VMOV_4_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32)) 
   (append (list  "VMOV_2_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64)) 
   (append (list  "VMOV_8_UQ_UQ") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32)) 
   (append (list  "VMOV_sat_2_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16)) 
   (append (list  "VMOV_sat_32_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64)) 
   (append (list  "VMOV_4_Q_Q") (visa:get-target-name v0))]
		[else (error "Unable to get name  for VMOV_1_Q_Q")]
)

	]
	[(VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_32_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_4_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_1_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_8_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_2_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_16_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_1_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_16_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_4_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_8_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_2_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_sat_32_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[else (error "Unable to get name  for VDP4A_sat_32_D_D_D_D")]
)

	]
	[(VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16)) 
   (append (list  "VNOT_32_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32)) 
   (append (list  "VNOT_4_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16)) 
   (append (list  "VNOT_1_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16)) 
   (append (list  "VNOT_8_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8)) 
   (append (list  "VNOT_2_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32)) 
   (append (list  "VNOT_32_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16)) 
   (append (list  "VNOT_8_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32)) 
   (append (list  "VNOT_1_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8)) 
   (append (list  "VNOT_1_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16)) 
   (append (list  "VNOT_16_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16)) 
   (append (list  "VNOT_16_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32)) 
   (append (list  "VNOT_1_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "VNOT_16_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "VNOT_16_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "VNOT_8_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16)) 
   (append (list  "VNOT_2_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16)) 
   (append (list  "VNOT_4_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16)) 
   (append (list  "VNOT_32_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32)) 
   (append (list  "VNOT_16_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32)) 
   (append (list  "VNOT_16_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32)) 
   (append (list  "VNOT_8_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32)) 
   (append (list  "VNOT_2_D_D") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16)) 
   (append (list  "VNOT_1_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8)) 
   (append (list  "VNOT_32_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16)) 
   (append (list  "VNOT_4_UW_UW") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32)) 
   (append (list  "VNOT_2_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32)) 
   (append (list  "VNOT_32_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8)) 
   (append (list  "VNOT_4_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8)) 
   (append (list  "VNOT_1_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8)) 
   (append (list  "VNOT_2_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "VNOT_8_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8)) 
   (append (list  "VNOT_32_B_B") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16)) 
   (append (list  "VNOT_2_W_W") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32)) 
   (append (list  "VNOT_4_UD_UD") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8)) 
   (append (list  "VNOT_4_UB_UB") (visa:get-target-name v0))]
		[(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32)) 
   (append (list  "VNOT_8_D_D") (visa:get-target-name v0))]
		[else (error "Unable to get name  for VNOT_32_W_W")]
)

	]
	[(VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VXOR_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VXOR_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VXOR_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VXOR_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VXOR_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VXOR_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VXOR_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VXOR_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VXOR_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VXOR_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VXOR_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VXOR_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VXOR_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VXOR_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VXOR_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VXOR_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VXOR_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VXOR_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VXOR_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VXOR_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VXOR_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VXOR_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VXOR_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VXOR_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VXOR_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VXOR_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VXOR_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VXOR_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VXOR_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VXOR_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VXOR_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VXOR_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VXOR_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VXOR_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VXOR_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VXOR_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VXOR_32_UD_UD_UD")]
)

	]
	[(VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_1_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_8_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_8_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_4_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_16_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_1_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_2_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_32_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_4_UD_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_32_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_16_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4)) 
   (append (list  "VDP4A_2_D_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1) (visa:get-target-name v2))]
		[else (error "Unable to get name  for VDP4A_1_UD_UD_UD_UD")]
)

	]
	[(VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VMUL_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VMUL_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VMUL_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VMUL_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VMUL_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VMUL_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VMUL_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VMUL_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VMUL_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VMUL_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VMUL_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VMUL_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VMUL_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VMUL_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VMUL_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VMUL_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VMUL_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VMUL_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VMUL_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VMUL_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VMUL_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VMUL_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VMUL_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VMUL_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VMUL_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VMUL_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VMUL_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VMUL_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VMUL_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VMUL_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VMUL_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VMUL_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VMUL_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VMUL_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VMUL_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VMUL_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VMUL_1_UB_UB_UB")]
)

	]
	[(VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VAND_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VAND_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VAND_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VAND_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VAND_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VAND_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VAND_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VAND_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VAND_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VAND_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VAND_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VAND_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VAND_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VAND_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VAND_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VAND_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VAND_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VAND_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VAND_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VAND_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VAND_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VAND_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VAND_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VAND_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VAND_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VAND_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VAND_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VAND_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VAND_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VAND_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VAND_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VAND_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VAND_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VAND_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VAND_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VAND_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VAND_1_UD_UD_UD")]
)

	]
	[(VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VOR_8_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VOR_32_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VOR_32_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VOR_16_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VOR_4_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VOR_2_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VOR_16_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VOR_4_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8)) 
   (append (list  "VOR_32_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16)) 
   (append (list  "VOR_2_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VOR_1_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VOR_1_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VOR_2_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8)) 
   (append (list  "VOR_1_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VOR_1_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16)) 
   (append (list  "VOR_16_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VOR_32_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16)) 
   (append (list  "VOR_1_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VOR_16_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32)) 
   (append (list  "VOR_16_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32)) 
   (append (list  "VOR_2_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16)) 
   (append (list  "VOR_4_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8)) 
   (append (list  "VOR_16_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VOR_4_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VOR_2_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16)) 
   (append (list  "VOR_32_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8)) 
   (append (list  "VOR_2_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VOR_8_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8)) 
   (append (list  "VOR_4_B_B_B") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32)) 
   (append (list  "VOR_4_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VOR_8_UW_UW_UW") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16)) 
   (append (list  "VOR_8_W_W_W") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32)) 
   (append (list  "VOR_1_D_D_D") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32)) 
   (append (list  "VOR_8_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32)) 
   (append (list  "VOR_32_UD_UD_UD") (visa:get-target-name v0) (visa:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8)) 
   (append (list  "VOR_8_UB_UB_UB") (visa:get-target-name v0) (visa:get-target-name v1))]
		[else (error "Unable to get name  for VOR_8_D_D_D")]
)

	]
 )
)
;; ================================================================================

