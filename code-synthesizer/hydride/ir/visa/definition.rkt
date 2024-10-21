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
(struct VMAD_sat_2_UB_UB_UB_UB_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct VBFI_4_UD_UD_UD_UD_UD_dsl (vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13) #:transparent #:mutable)
(struct VBFE_32_D_D_D_D_dsl (vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14) #:transparent #:mutable)
(struct VAVG_sat_8_UB_UB_UB_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15) #:transparent #:mutable)
(struct VMAD_4_B_B_B_B_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14) #:transparent #:mutable)
(struct VMULH_1_D_D_D_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct VMUL_sat_8_UW_UW_UW_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o) #:transparent #:mutable)
(struct VADD_4_W_W_W_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct VMOV_1_Q_Q_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o) #:transparent #:mutable)
(struct VDP4A_sat_32_D_D_D_D_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31) #:transparent #:mutable)
(struct VNOT_32_W_W_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o) #:transparent #:mutable)
(struct VXOR_32_UD_UD_UD_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o) #:transparent #:mutable)
(struct VDP4A_1_UD_UD_UD_UD_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31) #:transparent #:mutable)
(struct VMUL_1_UB_UB_UB_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o) #:transparent #:mutable)
(struct VAND_1_UD_UD_UD_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o) #:transparent #:mutable)
(struct VOR_8_D_D_D_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o) #:transparent #:mutable)
;; ================================================================================

