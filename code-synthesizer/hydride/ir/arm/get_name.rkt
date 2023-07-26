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
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Names
;; ================================================================================
(define (arm:get-target-name prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		 (append (list  "two_input_swizzle_N6_T8_LO0_L3_G3_D1_R0") (arm:get-target-name v0) (arm:get-target-name v1))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		 (append (list  "interleave-vectors-128-16") (arm:get-target-name v0) (arm:get-target-name v1))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "interleave-vector-128-16") (arm:get-target-name v0))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "deinterleave-vector-128-16") (arm:get-target-name v0))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		 (append (list  "shuffle-vector-128-16-128") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v4))
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-add-128-16") (arm:get-target-name v0) (arm:get-target-name v1))
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sub-128-16") (arm:get-target-name v0) (arm:get-target-name v1))
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-mul-128-16") (arm:get-target-name v0) (arm:get-target-name v1))
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sdiv-128-16") (arm:get-target-name v0) (arm:get-target-name v1))
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-udiv-128-16") (arm:get-target-name v0) (arm:get-target-name v1))
	]
	[(vqrdmulh_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqrdmulh_s32") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqrdmulhs_s32") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqrdmulh_s16") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqrdmulhq_s32") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqrdmulhq_s16") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqrdmulhh_s16") (arm:get-target-name v3) (arm:get-target-name v4))]
		[else (error "Unable to get name  for vqrdmulh_s32")]
)

	]
	[(vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vqshrn_n_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vqshrun_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vqshrns_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vqshruns_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vqshrnh_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vqshrund_n_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vqshrunh_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vqshrun_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vqshrnd_n_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vqshrn_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vqshrun_n_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vqshrn_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vqshrn_n_s64")]
)

	]
	[(vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(cond 
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 
   (append (list  "vmov_n_u16") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 
   (append (list  "vdupq_n_s32") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 
   (append (list  "vdupq_n_s64") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 
   (append (list  "vmov_n_u8") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 
   (append (list  "vmovq_n_u8") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 
   (append (list  "vmovq_n_u32") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 
   (append (list  "vmov_n_s16") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 
   (append (list  "vmovq_n_u16") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 
   (append (list  "vmovq_n_s32") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 
   (append (list  "vdup_n_s32") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 
   (append (list  "vmovq_n_s8") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 
   (append (list  "vdup_n_u8") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 
   (append (list  "vdup_n_s16") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 
   (append (list  "vdup_n_s8") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 
   (append (list  "vdupq_n_u16") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 
   (append (list  "vmov_n_s32") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 
   (append (list  "vmov_n_s8") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 
   (append (list  "vmovq_n_u64") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 
   (append (list  "vmovq_n_s64") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 
   (append (list  "vmov_n_u32") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 
   (append (list  "vdupq_n_u32") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 
   (append (list  "vdupq_n_u64") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 
   (append (list  "vdupq_n_u8") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 
   (append (list  "vdup_n_u16") (arm:get-target-name v0))]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 
   (append (list  "vdup_n_u32") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 
   (append (list  "vdupq_n_s8") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 
   (append (list  "vmovq_n_s16") (arm:get-target-name v0))]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 
   (append (list  "vdupq_n_s16") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vmov_n_u16")]
)

	]
	[(vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltzq_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltz_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltzd_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltz_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltzq_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltz_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltzq_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltz_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcltzq_s16") (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcltzq_s64")]
)

	]
	[(vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vsub_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vsub_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vsub_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vsubd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vsubq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vsubq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vsub_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vsubq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vsub_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vsubq_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vsub_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vsub_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vsubd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vsubq_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vsub_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vsubq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vsubq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vsubq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vsub_s32")]
)

	]
	[(vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1)) 
   (append (list  "vqdmlsl_n_s16") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmlsl_n_s16")]
)

	]
	[(vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 
   (append (list  "vabal_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 
   (append (list  "vabal_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 
   (append (list  "vabal_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 
   (append (list  "vabal_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 
   (append (list  "vabal_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 
   (append (list  "vabal_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vabal_u32")]
)

	]
	[(vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabdq_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabd_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabdq_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabd_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabdq_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabdq_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabd_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabd_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabdq_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabdq_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabd_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabd_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vabdq_u8")]
)

	]
	[(vqrshl_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_s64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshld_s64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 8) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlb_s8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_s32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 32) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshls_s32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_s32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_s64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_s8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_s16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_s8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_s16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 16) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlh_s16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[else (error "Unable to get name  for vqrshl_s64")]
)

	]
	[(vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmull_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vmull_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vmull_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vmull_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmull_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmull_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmull_u8")]
)

	]
	[(vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1)) 
   (append (list  "vmovl_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1)) 
   (append (list  "vmovl_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0)) 
   (append (list  "vmovl_u8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0)) 
   (append (list  "vmovl_u16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0)) 
   (append (list  "vmovl_u32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1)) 
   (append (list  "vmovl_s32") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vmovl_s8")]
)

	]
	[(vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 
   (append (list  "vqrdmulhq_n_s32") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 
   (append (list  "vqrdmulh_n_s32") (arm:get-target-name v3) (arm:get-target-name v4))]
		[else (error "Unable to get name  for vqrdmulhq_n_s32")]
)

	]
	[(vqrshlb_u8_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlb_u8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_u16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshld_u64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_u64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 16) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlh_u16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 32) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshls_u32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_u32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_u16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_u8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshl_u8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_u32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vqrshlq_u64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[else (error "Unable to get name  for vqrshlb_u8")]
)

	]
	[(vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vneg_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vneg_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vneg_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vnegq_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vneg_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vnegq_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vnegd_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vnegq_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vnegq_s32") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vneg_s16")]
)

	]
	[(vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqadd_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqadds_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqadd_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqadds_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddb_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddh_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqadd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddq_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddh_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqadd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqadd_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqaddb_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqadd_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 
   (append (list  "vsqadd_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqaddq_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "vuqadd_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vsqaddq_u32")]
)

	]
	[(vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcle_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcleq_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcle_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcleq_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcleq_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcleq_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcle_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcled_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcle_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcleq_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcle_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcleq_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcled_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcle_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcle_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcle_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcleq_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcleq_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcle_s32")]
)

	]
	[(vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vmlal_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlal_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlal_n_s32")]
)

	]
	[(vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2)) 
   (append (list  "vuzp1_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2)) 
   (append (list  "vuzp1q_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2)) 
   (append (list  "vuzp1q_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2)) 
   (append (list  "vuzp1q_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2)) 
   (append (list  "vuzp1_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2)) 
   (append (list  "vuzp1_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2)) 
   (append (list  "vuzp1q_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2)) 
   (append (list  "vuzp1q_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2)) 
   (append (list  "vuzp1_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2)) 
   (append (list  "vuzp1_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2)) 
   (append (list  "vuzp1_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2)) 
   (append (list  "vuzp1q_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2)) 
   (append (list  "vuzp1q_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2)) 
   (append (list  "vuzp1q_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vuzp1_s32")]
)

	]
	[(vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vrshrn_n_s64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vrshrn_n_u64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vrshrn_n_s32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vrshrn_n_u32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vrshrn_n_u16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vrshrn_n_s16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[else (error "Unable to get name  for vrshrn_n_s64")]
)

	]
	[(vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhsubq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhsub_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhsubq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhsub_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhsubq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhsubq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhsubq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhsubq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhsub_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhsub_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhsub_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhsub_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vhsubq_u32")]
)

	]
	[(vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vqdmull_n_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vqdmull_n_s32")]
)

	]
	[(vshl_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshl_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshlq_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshlq_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshlq_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshl_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshld_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshl_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshl_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vshlq_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vshl_s64")]
)

	]
	[(vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vshrn_n_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vshrn_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vshrn_n_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vshrn_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vshrn_n_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vshrn_n_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vshrn_n_u64")]
)

	]
	[(vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vrhaddq_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vrhadd_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vrhaddq_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vrhaddq_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vrhadd_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vrhadd_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vrhadd_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vrhadd_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vrhaddq_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vrhaddq_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vrhaddq_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vrhadd_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vrhaddq_s32")]
)

	]
	[(vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhadd_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhaddq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhaddq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhadd_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhadd_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhadd_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhaddq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhadd_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhaddq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vhadd_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhaddq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vhaddq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vhadd_u16")]
)

	]
	[(vdotq_u32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vdotq_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vdot_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vdot_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vdotq_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vdotq_u32")]
)

	]
	[(vqshld_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshld_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshl_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlq_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlb_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlq_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlh_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlq_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlq_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshl_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshls_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshl_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshl_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqshld_s64")]
)

	]
	[(vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshr_n_u8") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshr_n_u32") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshrq_n_u8") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshr_n_u64") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshr_n_u16") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshrq_n_u16") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshrq_n_u32") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshrd_n_u64") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrshrq_n_u64") (arm:get-target-name v6) (arm:get-target-name v7))]
		[else (error "Unable to get name  for vrshr_n_u8")]
)

	]
	[(vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 
   (append (list  "vtst_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 
   (append (list  "vtst_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 
   (append (list  "vtst_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 
   (append (list  "vtstq_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vtstd_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 
   (append (list  "vtst_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 
   (append (list  "vtstq_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 
   (append (list  "vtstq_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 
   (append (list  "vtst_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 
   (append (list  "vtstq_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 
   (append (list  "vtstq_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 
   (append (list  "vtstq_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 
   (append (list  "vtstq_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vtst_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vtst_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 
   (append (list  "vtst_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 
   (append (list  "vtstq_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vtstd_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vtst_u16")]
)

	]
	[(vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vaba_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vaba_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabaq_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vaba_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabaq_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabaq_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vaba_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabaq_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vaba_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vabaq_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vabaq_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vaba_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vaba_u16")]
)

	]
	[(vshl_u32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshl_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshlq_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshlq_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshld_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshlq_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshl_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshlq_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshl_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vshl_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vshl_u32")]
)

	]
	[(vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vqdmullh_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vqdmull_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vqdmull_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vqdmulls_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vqdmullh_s16")]
)

	]
	[(vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlalh_s16") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlal_s32") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlal_s16") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlals_s32") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmlalh_s16")]
)

	]
	[(vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulhq_n_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulh_n_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmulhq_n_s32")]
)

	]
	[(vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsraq_n_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsra_n_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsraq_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsraq_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsraq_n_u64") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsra_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsra_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vsraq_n_u8")]
)

	]
	[(vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgez_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgez_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgez_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgezq_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgezq_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgezq_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgezq_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgezd_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgez_s64") (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcgez_s32")]
)

	]
	[(vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 
   (append (list  "vaddw_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 
   (append (list  "vaddw_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 
   (append (list  "vaddw_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 
   (append (list  "vaddw_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 
   (append (list  "vaddw_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 
   (append (list  "vaddw_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vaddw_u32")]
)

	]
	[(vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)) 
   (append (list  "vsubhn_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)) 
   (append (list  "vsubhn_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)) 
   (append (list  "vsubhn_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)) 
   (append (list  "vsubhn_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)) 
   (append (list  "vsubhn_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)) 
   (append (list  "vsubhn_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vsubhn_s16")]
)

	]
	[(vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmax_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmax_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmax_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmaxq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmaxq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmaxq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmaxq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmax_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmax_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmax_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmaxq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmaxq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmax_s16")]
)

	]
	[(vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsub_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsub_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsub_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubs_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubh_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsub_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubq_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsub_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubh_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubb_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubb_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsub_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsubq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubs_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsub_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubq_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqsubq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqsub_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vqsub_u64")]
)

	]
	[(vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vmlal_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlal_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vmlal_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vmlal_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlal_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlal_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlal_s16")]
)

	]
	[(vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1)) 
   (append (list  "vqdmlal_n_s16") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmlal_n_s16")]
)

	]
	[(vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 
   (append (list  "vabdl_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 
   (append (list  "vabdl_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 
   (append (list  "vabdl_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 
   (append (list  "vabdl_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 
   (append (list  "vabdl_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 
   (append (list  "vabdl_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vabdl_u8")]
)

	]
	[(vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlsl_s32") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlslh_s16") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlsls_s32") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 
   (append (list  "vqdmlsl_s16") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmlsl_s32")]
)

	]
	[(vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsra_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsraq_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsrad_n_s64") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsraq_n_s64") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsra_n_s64") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsraq_n_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsra_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsra_n_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vsraq_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vsra_n_s16")]
)

	]
	[(vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 
   (append (list  "vzip2q_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64)) 
   (append (list  "vzip2q_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 
   (append (list  "vzip2q_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 
   (append (list  "vzip2q_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 
   (append (list  "vzip2_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 
   (append (list  "vzip2_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64)) 
   (append (list  "vzip2q_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 
   (append (list  "vzip2q_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 
   (append (list  "vzip2q_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 
   (append (list  "vzip2_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 
   (append (list  "vzip2_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 
   (append (list  "vzip2q_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 
   (append (list  "vzip2_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 
   (append (list  "vzip2_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vzip2q_s32")]
)

	]
	[(vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlsl_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vmlsl_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlsl_n_u32")]
)

	]
	[(vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 
   (append (list  "vtrn1_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 
   (append (list  "vtrn1_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 
   (append (list  "vtrn1_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 
   (append (list  "vtrn1_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 
   (append (list  "vtrn1q_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 
   (append (list  "vtrn1q_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 
   (append (list  "vtrn1q_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 
   (append (list  "vtrn1q_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 
   (append (list  "vtrn1q_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 
   (append (list  "vtrn1_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32)) 
   (append (list  "vtrn1q_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 
   (append (list  "vtrn1_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32)) 
   (append (list  "vtrn1q_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 
   (append (list  "vtrn1q_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vtrn1_s32")]
)

	]
	[(vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulh_n_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulhq_n_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmulh_n_s16")]
)

	]
	[(vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabs_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsd_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsb_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsq_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabs_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabs_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabss_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsq_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabs_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsq_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsq_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqabsh_s16") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vqabs_s8")]
)

	]
	[(vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcge_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcge_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgeq_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgeq_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgeq_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcge_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgeq_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgeq_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgeq_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcge_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcge_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcge_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcged_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcged_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcge_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcge_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgeq_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgeq_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcge_s32")]
)

	]
	[(vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabs_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabsq_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabs_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabs_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabs_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabsq_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabsq_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabsq_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 
   (append (list  "vabsd_s64") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vabs_s8")]
)

	]
	[(vqdmulhq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulhq_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulh_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulh_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulhs_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulhh_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vqdmulhq_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmulhq_s16")]
)

	]
	[(vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vqdmull_n_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vqdmull_n_s16")]
)

	]
	[(vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vqshrnh_n_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vqshrns_n_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)) 
   (append (list  "vqshrn_n_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vqshrnd_n_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)) 
   (append (list  "vqshrn_n_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)) 
   (append (list  "vqshrn_n_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vqshrnh_n_u16")]
)

	]
	[(vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpmin_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpminq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpminq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpminq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpmin_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpmin_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpminq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpminq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpmin_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpmin_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpminq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpmin_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vpmin_s32")]
)

	]
	[(vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1)) 
   (append (list  "vqdmlsl_n_s32") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmlsl_n_s32")]
)

	]
	[(vqshld_u64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshld_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshlq_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshlq_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshl_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshlh_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshls_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshlb_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshl_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshl_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshl_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshlq_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vqshlq_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqshld_u64")]
)

	]
	[(vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgtq_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgtq_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgtq_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgt_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgt_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgtq_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgtd_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgtq_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgtq_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgt_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgt_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgtq_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgt_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgt_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgt_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgtq_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcgt_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcgtd_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcgtq_s8")]
)

	]
	[(vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vadd_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vadd_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vaddq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vaddq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vaddq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vaddq_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vadd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 
   (append (list  "vaddq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vadd_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vaddq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vadd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vaddq_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 
   (append (list  "vadd_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vadd_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vaddd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vadd_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 
   (append (list  "vaddd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 
   (append (list  "vaddq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vadd_s8")]
)

	]
	[(vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 
   (append (list  "vrsubhn_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 
   (append (list  "vrsubhn_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 
   (append (list  "vrsubhn_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 
   (append (list  "vrsubhn_s64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 
   (append (list  "vrsubhn_u64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 
   (append (list  "vrsubhn_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vrsubhn_s16")]
)

	]
	[(vqshlb_n_s8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlb_n_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshluq_n_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0)) 
   (append (list  "vqshlb_n_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlh_n_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshls_n_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshluq_n_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0)) 
   (append (list  "vqshls_n_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshluq_n_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlu_n_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlud_n_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlu_n_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlu_n_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlub_n_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlus_n_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshluh_n_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshlu_n_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vqshluq_n_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0)) 
   (append (list  "vqshlh_n_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqshlb_n_s8")]
)

	]
	[(vrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_u16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshld_u64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_u8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_u8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_u64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_u32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_u64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_u16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_u32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[else (error "Unable to get name  for vrshlq_u16")]
)

	]
	[(vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmls_n_s32")]
)

	]
	[(vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 
   (append (list  "vraddhn_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 
   (append (list  "vraddhn_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 
   (append (list  "vraddhn_s64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 
   (append (list  "vraddhn_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 
   (append (list  "vraddhn_u64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 
   (append (list  "vraddhn_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vraddhn_s32")]
)

	]
	[(vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcltq_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vclt_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcltq_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vclt_s32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vclt_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcltq_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcltd_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcltq_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vclt_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vclt_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcltq_s8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcltd_u64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcltq_s16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vcltq_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vclt_u8") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vclt_u16") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vcltq_u32") (arm:get-target-name v2) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 
   (append (list  "vclt_s64") (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcltq_s32")]
)

	]
	[(vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshrq_n_s64") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshrd_n_s64") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshrq_n_s16") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshrq_n_s32") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshr_n_s16") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshr_n_s8") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshrq_n_s8") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshr_n_s32") (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrshr_n_s64") (arm:get-target-name v6) (arm:get-target-name v7))]
		[else (error "Unable to get name  for vrshrq_n_s64")]
)

	]
	[(vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vmlal_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlal_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlal_n_s16")]
)

	]
	[(vrshlq_s32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_s32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshld_s64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_s64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_s8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_s8") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_s16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshlq_s64") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_s32") (arm:get-target-name v0) (arm:get-target-name v8))]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)) 
   (append (list  "vrshl_s16") (arm:get-target-name v0) (arm:get-target-name v8))]
		[else (error "Unable to get name  for vrshlq_s32")]
)

	]
	[(vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vminq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vminq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmin_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmin_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmin_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vminq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vmin_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vminq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vminq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmin_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vmin_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vminq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vminq_u8")]
)

	]
	[(vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 
   (append (list  "vuzp2_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 
   (append (list  "vuzp2_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 
   (append (list  "vuzp2_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 
   (append (list  "vuzp2q_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 
   (append (list  "vuzp2q_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 
   (append (list  "vuzp2_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 
   (append (list  "vuzp2_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 
   (append (list  "vuzp2q_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 
   (append (list  "vuzp2_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 
   (append (list  "vuzp2q_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 
   (append (list  "vuzp2q_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32)) 
   (append (list  "vuzp2q_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 
   (append (list  "vuzp2q_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32)) 
   (append (list  "vuzp2q_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vuzp2_u16")]
)

	]
	[(vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 
   (append (list  "vceqz_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 
   (append (list  "vceqz_u64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 
   (append (list  "vceqzd_u64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1)) 
   (append (list  "vceqzq_u8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1)) 
   (append (list  "vceqzq_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1)) 
   (append (list  "vceqz_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1)) 
   (append (list  "vceqzq_u16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1)) 
   (append (list  "vceqzq_u64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1)) 
   (append (list  "vceqzq_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1)) 
   (append (list  "vceqz_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1)) 
   (append (list  "vceqz_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1)) 
   (append (list  "vceqz_u8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1)) 
   (append (list  "vceqz_u16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1)) 
   (append (list  "vceqzq_u32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1)) 
   (append (list  "vceqzq_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1)) 
   (append (list  "vceqzq_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1)) 
   (append (list  "vceqz_u32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 
   (append (list  "vceqzd_s64") (arm:get-target-name v3))]
		[else (error "Unable to get name  for vceqz_s64")]
)

	]
	[(vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_n_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_n_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmla_n_s32")]
)

	]
	[(vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmla_u16")]
)

	]
	[(vshll_n_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0) (equal? prec_o 16) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0)) 
   (append (list  "vshll_n_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 0) (equal? prec_o 32) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1)) 
   (append (list  "vshll_n_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 0) (equal? prec_o 64) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0)) 
   (append (list  "vshll_n_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 0) (equal? prec_o 64) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1)) 
   (append (list  "vshll_n_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0) (equal? prec_o 16) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1)) 
   (append (list  "vshll_n_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 0) (equal? prec_o 32) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0)) 
   (append (list  "vshll_n_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vshll_n_u8")]
)

	]
	[(vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 
   (append (list  "vtrn2_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 
   (append (list  "vtrn2_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 
   (append (list  "vtrn2q_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 
   (append (list  "vtrn2_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32)) 
   (append (list  "vtrn2q_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 
   (append (list  "vtrn2q_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32)) 
   (append (list  "vtrn2q_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 
   (append (list  "vtrn2q_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 
   (append (list  "vtrn2_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 
   (append (list  "vtrn2q_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 
   (append (list  "vtrn2q_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 
   (append (list  "vtrn2q_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 
   (append (list  "vtrn2_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 
   (append (list  "vtrn2_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vtrn2_s32")]
)

	]
	[(vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1)) 
   (append (list  "vqdmlal_n_s32") (arm:get-target-name v1) (arm:get-target-name v2) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vqdmlal_n_s32")]
)

	]
	[(vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 0) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmull_n_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 1) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vmull_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmull_n_u16")]
)

	]
	[(vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_n_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_n_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmulq_n_u32")]
)

	]
	[(vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)) 
   (append (list  "vaddhn_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)) 
   (append (list  "vaddhn_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)) 
   (append (list  "vaddhn_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)) 
   (append (list  "vaddhn_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)) 
   (append (list  "vaddhn_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)) 
   (append (list  "vaddhn_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vaddhn_s64")]
)

	]
	[(vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2)) 
   (append (list  "vpadal_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2)) 
   (append (list  "vpadalq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2)) 
   (append (list  "vpadal_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2)) 
   (append (list  "vpadal_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2)) 
   (append (list  "vpadal_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2)) 
   (append (list  "vpadalq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2)) 
   (append (list  "vpadalq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2)) 
   (append (list  "vpadal_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2)) 
   (append (list  "vpadalq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2)) 
   (append (list  "vpadal_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2)) 
   (append (list  "vpadalq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2)) 
   (append (list  "vpadalq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vpadal_u16")]
)

	]
	[(vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqadd_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddb_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddb_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqadd_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqadds_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqadd_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddq_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqadd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddd_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqadd_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddh_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqadds_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddq_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqadd_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqaddh_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqadd_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
   (append (list  "vqaddq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vqadd_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vqadd_s16")]
)

	]
	[(vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 
   (append (list  "vceqq_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 
   (append (list  "vceqq_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 
   (append (list  "vceqq_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 
   (append (list  "vceq_s8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 
   (append (list  "vceqq_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 
   (append (list  "vceq_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 
   (append (list  "vceqq_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vceqd_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 
   (append (list  "vceq_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vceq_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 
   (append (list  "vceq_u8") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 
   (append (list  "vceq_u32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vceq_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 
   (append (list  "vceqq_s32") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 
   (append (list  "vceqd_s64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 
   (append (list  "vceqq_u64") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 
   (append (list  "vceqq_u16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 
   (append (list  "vceq_s16") (arm:get-target-name v0) (arm:get-target-name v3))]
		[else (error "Unable to get name  for vceqq_u8")]
)

	]
	[(vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32)) 
   (append (list  "vzip1q_u64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 
   (append (list  "vzip1_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 
   (append (list  "vzip1q_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 
   (append (list  "vzip1_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 
   (append (list  "vzip1_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 
   (append (list  "vzip1q_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 
   (append (list  "vzip1_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 
   (append (list  "vzip1q_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32)) 
   (append (list  "vzip1q_s64") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 
   (append (list  "vzip1_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 
   (append (list  "vzip1q_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 
   (append (list  "vzip1q_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 
   (append (list  "vzip1_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 
   (append (list  "vzip1q_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vzip1q_u64")]
)

	]
	[(vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlaq_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmla_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlaq_n_s16")]
)

	]
	[(vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 
   (append (list  "vqrdmulhq_n_s16") (arm:get-target-name v3) (arm:get-target-name v4))]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 
   (append (list  "vqrdmulh_n_s16") (arm:get-target-name v3) (arm:get-target-name v4))]
		[else (error "Unable to get name  for vqrdmulhq_n_s16")]
)

	]
	[(vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vqrshrn_n_s16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vqrshrn_n_s64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vqrshrun_n_s32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vqrshrunh_n_s16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vqrshrun_n_s16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vqrshrnh_n_s16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vqrshruns_n_s32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vqrshrn_n_s32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vqrshrun_n_s64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vqrshrnd_n_s64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vqrshrns_n_s32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vqrshrund_n_s64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[else (error "Unable to get name  for vqrshrn_n_s16")]
)

	]
	[(vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshr_n_s64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshr_n_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshrq_n_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshrd_n_s64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshrq_n_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshrq_n_s64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshr_n_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshrq_n_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vshr_n_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vshr_n_s64")]
)

	]
	[(vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsra_n_s64") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsra_n_s8") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsraq_n_s8") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsra_n_s16") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsraq_n_s16") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsraq_n_s32") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsrad_n_s64") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsra_n_s32") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)) 
   (append (list  "vrsraq_n_s64") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[else (error "Unable to get name  for vrsra_n_s64")]
)

	]
	[(vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2)) 
   (append (list  "vmovn_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2)) 
   (append (list  "vmovn_u64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2)) 
   (append (list  "vmovn_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2)) 
   (append (list  "vmovn_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2)) 
   (append (list  "vmovn_u16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2)) 
   (append (list  "vmovn_u32") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vmovn_s64")]
)

	]
	[(vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclez_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclezq_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclezq_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclezq_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclez_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclezq_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclezd_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclez_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vclez_s8") (arm:get-target-name v3))]
		[else (error "Unable to get name  for vclez_s16")]
)

	]
	[(vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlsl_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 
   (append (list  "vmlsl_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlsl_n_u16")]
)

	]
	[(vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vaddl_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vaddl_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vaddl_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vaddl_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vaddl_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vaddl_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vaddl_s16")]
)

	]
	[(vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpmax_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpmax_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpmax_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpmaxq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpmaxq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpmax_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpmax_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpmax_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 
   (append (list  "vpmaxq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpmaxq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 
   (append (list  "vpmaxq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 
   (append (list  "vpmaxq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vpmax_s16")]
)

	]
	[(vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshr_n_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshrq_n_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsra_n_u64") (arm:get-target-name vc_0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vsrad_n_u64") (arm:get-target-name vc_0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshrd_n_u64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshr_n_u64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshr_n_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshrq_n_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshrq_n_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshrq_n_u64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vshr_n_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vshr_n_u8")]
)

	]
	[(vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_n_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_n_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmls_n_u16")]
)

	]
	[(vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_n_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_n_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_n_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmulq_n_s16")]
)

	]
	[(vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlsl_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vmlsl_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlsl_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vmlsl_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 
   (append (list  "vmlsl_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 
   (append (list  "vmlsl_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmlsl_u32")]
)

	]
	[(vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqneg_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegs_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqneg_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegd_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegq_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegb_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegh_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegq_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegq_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqnegq_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqneg_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 
   (append (list  "vqneg_s32") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vqneg_s16")]
)

	]
	[(vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtzd_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtz_s32") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtzq_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtz_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtzq_s64") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtz_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtzq_s16") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtz_s8") (arm:get-target-name v3))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 
   (append (list  "vcgtzq_s32") (arm:get-target-name v3))]
		[else (error "Unable to get name  for vcgtzd_s64")]
)

	]
	[(vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_s8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_u8") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_u16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_s32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmlsq_u32") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmls_s16") (arm:get-target-name v0) (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vmls_u32")]
)

	]
	[(vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 1) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1)) 
   (append (list  "vmull_n_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 
   (append (list  "vmull_n_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmull_n_s32")]
)

	]
	[(vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsra_n_u16") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsra_n_u64") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsraq_n_u8") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsrad_n_u64") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsraq_n_u64") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsraq_n_u32") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsraq_n_u16") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsra_n_u8") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)) 
   (append (list  "vrsra_n_u32") (arm:get-target-name v5) (arm:get-target-name v6) (arm:get-target-name v7))]
		[else (error "Unable to get name  for vrsra_n_u16")]
)

	]
	[(vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vsubl_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vsubl_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vsubl_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vsubl_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 
   (append (list  "vsubl_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 
   (append (list  "vsubl_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vsubl_s32")]
)

	]
	[(vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2)) 
   (append (list  "vqmovn_u32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 
   (append (list  "vqmovn_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2)) 
   (append (list  "vqmovnh_u16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 
   (append (list  "vqmovnd_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 
   (append (list  "vqmovun_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 
   (append (list  "vqmovnh_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2)) 
   (append (list  "vqmovns_u32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 
   (append (list  "vqmovun_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2)) 
   (append (list  "vqmovn_u16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 
   (append (list  "vqmovuns_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 
   (append (list  "vqmovun_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 
   (append (list  "vqmovn_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 
   (append (list  "vqmovund_s64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 
   (append (list  "vqmovunh_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 
   (append (list  "vqmovn_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2)) 
   (append (list  "vqmovn_u64") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 
   (append (list  "vqmovns_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2)) 
   (append (list  "vqmovnd_u64") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vqmovn_u32")]
)

	]
	[(vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmulq_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 
   (append (list  "vmul_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vmul_s16")]
)

	]
	[(vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vqrshrnh_n_u16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vqrshrns_n_u32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vqrshrnd_n_u64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)) 
   (append (list  "vqrshrn_n_u32") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)) 
   (append (list  "vqrshrn_n_u16") (arm:get-target-name v5) (arm:get-target-name v6))]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)) 
   (append (list  "vqrshrn_n_u64") (arm:get-target-name v5) (arm:get-target-name v6))]
		[else (error "Unable to get name  for vqrshrnh_n_u16")]
)

	]
	[(vpaddq_u32_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 
   (append (list  "vpaddq_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 
   (append (list  "vpaddq_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 128) (equal? num_7 64) (equal? num_8 -1) (equal? num_9 64) (equal? num_10 32) (equal? num_11 64)) 
   (append (list  "vpaddq_u64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 
   (append (list  "vpaddq_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 128) (equal? num_7 64) (equal? num_8 -1) (equal? num_9 64) (equal? num_10 32) (equal? num_11 64)) 
   (append (list  "vpaddq_s64") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 
   (append (list  "vpaddq_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 
   (append (list  "vpadd_s16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 
   (append (list  "vpadd_u32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 
   (append (list  "vpaddq_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 
   (append (list  "vpadd_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 
   (append (list  "vpadd_s32") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 
   (append (list  "vpadd_u16") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 
   (append (list  "vpadd_u8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[(and  (equal? size_i 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 
   (append (list  "vpaddq_s8") (arm:get-target-name v1) (arm:get-target-name v2))]
		[else (error "Unable to get name  for vpaddq_u32")]
)

	]
	[(vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "vmvn_u8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "vmvn_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "vmvnq_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "vmvnq_u32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "vmvnq_s8") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "vmvnq_u16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "vmvn_u32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "vmvnq_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "vmvn_u16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "vmvn_s32") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 
   (append (list  "vmvn_s16") (arm:get-target-name v0))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 
   (append (list  "vmvnq_u8") (arm:get-target-name v0))]
		[else (error "Unable to get name  for vmvn_u8")]
)

	]
	[(vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 
   (append (list  "vsubw_u8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 
   (append (list  "vsubw_u32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 
   (append (list  "vsubw_s16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 
   (append (list  "vsubw_u16") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 
   (append (list  "vsubw_s8") (arm:get-target-name v0) (arm:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 
   (append (list  "vsubw_s32") (arm:get-target-name v0) (arm:get-target-name v1))]
		[else (error "Unable to get name  for vsubw_u8")]
)

	]
 )
)
;; ================================================================================

