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


(provide (all-defined-out))
;; ================================================================================
;;                                Struct Definitions
;; ================================================================================
(struct vpmin_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14) #:transparent #:mutable)
(struct vrshrn_n_s64_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16) #:transparent #:mutable)
(struct vpaddq_u8_dsl (vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vqdmlsl_n_s32_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14) #:transparent #:mutable)
(struct vqdmlal_high_s16_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vget_high_u64_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7) #:transparent #:mutable)
(struct vabal_high_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vqdmull_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11) #:transparent #:mutable)
(struct vqrshrnd_n_u64_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16) #:transparent #:mutable)
(struct vqmovn_u64_dsl (v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10) #:transparent #:mutable)
(struct vqneg_s32_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8) #:transparent #:mutable)
(struct vqdmlsl_s32_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vaba_u8_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmlal_n_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vpadalq_u8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18) #:transparent #:mutable)
(struct vtrn2_s8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vmull_n_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12) #:transparent #:mutable)
(struct vqshlq_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vqabsq_s64_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8) #:transparent #:mutable)
(struct vmlsl_high_n_s32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vclez_s8_dsl (vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9) #:transparent #:mutable)
(struct vqdmull_n_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12) #:transparent #:mutable)
(struct vsubhn_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10) #:transparent #:mutable)
(struct vmla_n_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vmls_n_s16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vmlsl_n_s32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmlsq_n_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vqdmlal_n_s32_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14) #:transparent #:mutable)
(struct vaddw_u8_dsl (v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrsra_n_u64_dsl (vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vqshrn_n_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11) #:transparent #:mutable)
(struct vqshrnd_n_u64_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9) #:transparent #:mutable)
(struct vshl_s8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vpaddlq_s32_dsl (vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18) #:transparent #:mutable)
(struct vshrn_n_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11) #:transparent #:mutable)
(struct vshrn_n_u64_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9) #:transparent #:mutable)
(struct vqshrn_n_s16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11) #:transparent #:mutable)
(struct vceqzq_s8_dsl (vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o) #:transparent #:mutable)
(struct vmla_n_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vqshlu_n_s64_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vabdl_high_u8_dsl (vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vmlal_high_n_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmovn_s16_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6) #:transparent #:mutable)
(struct vshll_n_s8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vaddhn_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10) #:transparent #:mutable)
(struct vqdmlal_high_n_s16_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmovl_s32_dsl (v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vtrn1_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vmul_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vmlal_high_n_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrshrq_n_u16_dsl (vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct vcltz_s32_dsl (vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9) #:transparent #:mutable)
(struct vqdmlsl_high_n_s16_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrsra_n_s32_dsl (vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct vabal_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vmull_high_n_s16_dsl (v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vget_low_u8_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6) #:transparent #:mutable)
(struct vsraq_n_u64_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9) #:transparent #:mutable)
(struct vmlal_high_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmull_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vrsra_n_u8_dsl (vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct vmul_n_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vqrshrun_n_s64_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16) #:transparent #:mutable)
(struct vmlal_n_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrsubhn_u16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12) #:transparent #:mutable)
(struct vaddw_high_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrshld_s64_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct vqdmull_n_s32_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12) #:transparent #:mutable)
(struct vraddhn_u64_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12) #:transparent #:mutable)
(struct vshr_n_u64_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9) #:transparent #:mutable)
(struct vabs_s32_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8) #:transparent #:mutable)
(struct vqdmlsl_high_n_s32_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmull_high_n_s32_dsl (v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vsraq_n_s64_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9) #:transparent #:mutable)
(struct vsqadds_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vabal_high_s16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vqdmlal_high_n_s32_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vqdmlsl_high_s16_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vaddl_high_s8_dsl (v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vqdmlal_n_s16_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14) #:transparent #:mutable)
(struct vmul_n_s16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vabdl_s8_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vcombine_u16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8) #:transparent #:mutable)
(struct vmlsl_high_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vuqaddq_s8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vabal_high_u8_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vsqadd_u64_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vqdmull_high_s16_dsl (vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vqrshrns_n_u32_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15) #:transparent #:mutable)
(struct vqrshrnh_n_s16_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15) #:transparent #:mutable)
(struct vsra_n_s64_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9) #:transparent #:mutable)
(struct vabal_s8_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vceqq_u16_dsl (v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o) #:transparent #:mutable)
(struct vaddl_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmull_high_s16_dsl (v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vabal_s32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vzip1q_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vmlsl_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrhadd_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vrshrd_n_s64_dsl (vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vuzp1q_u8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct vhsub_u16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vqshlh_n_s16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9) #:transparent #:mutable)
(struct vabdl_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vmovl_high_s8_dsl (v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vcgt_u32_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9) #:transparent #:mutable)
(struct vrshr_n_u64_dsl (vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vqdmull_high_n_s16_dsl (vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vsraq_n_s32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vabdl_high_s16_dsl (vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vmlsq_s32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vabdq_s32_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vpmaxq_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14) #:transparent #:mutable)
(struct vshrq_n_u8_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vqdmlal_s32_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vshr_n_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vrshr_n_s32_dsl (vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct vadd_u16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct vuqaddq_s16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vtst_u64_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o) #:transparent #:mutable)
(struct vnegq_s64_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8) #:transparent #:mutable)
(struct vqdmull_high_n_s32_dsl (vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vmull_n_s16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12) #:transparent #:mutable)
(struct vrsra_n_s64_dsl (vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vabdl_u32_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vabdl_high_u32_dsl (vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16) #:transparent #:mutable)
(struct vsubl_s8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vsubl_high_u16_dsl (v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vsubw_s8_dsl (v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vsubw_high_u16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmov_n_u16_dsl (v0 size_o num_2 num_3 num_4 prec_o) #:transparent #:mutable)
(struct vmin_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct vrshrn_n_s16_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15) #:transparent #:mutable)
(struct vmlsl_high_n_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vmlal_u8_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vqdmlsl_n_s16_dsl (vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14) #:transparent #:mutable)
(struct vsraq_n_u8_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vmlaq_u32_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vmvn_s16_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o) #:transparent #:mutable)
(struct vuzp2_s16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9) #:transparent #:mutable)
(struct vqrshld_s64_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct vzip2q_s64_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vsubq_u32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct vqshrn_n_s64_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9) #:transparent #:mutable)
(struct vhadd_s32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct vshll_high_n_s8_dsl (v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vdotq_s32_dsl (v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10) #:transparent #:mutable)
(struct vmax_u8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct vmlsl_n_u16_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct vzip_u16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct vqrdmulhq_n_s32_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vqdmulh_n_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vqrdmulhq_s16_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vqrdmulhq_n_s16_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vqdmulhq_n_s32_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct vqrdmulh_s32_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13) #:transparent #:mutable)
(struct vqdmulh_s16_dsl (vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11) #:transparent #:mutable)
;; ================================================================================

