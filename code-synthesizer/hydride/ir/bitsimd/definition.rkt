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
(struct dram_pimcpy_v16384_e8__v16384_e8_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6) #:transparent #:mutable)
(struct dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11) #:transparent #:mutable)
(struct dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimnot_v16384_e8__v16384_e8_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6) #:transparent #:mutable)
(struct dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimbitcount_v16384_e8__v16384_e8_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6) #:transparent #:mutable)
(struct dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12) #:transparent #:mutable)
(struct dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimabs_v16384_e8__v16384_e8_dsl (v0 size_i_o num_2 num_3 num_4 prec_i_o num_6) #:transparent #:mutable)
(struct dram_pimpopcount_v1_e16__v16384_e1_dsl (v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11) #:transparent #:mutable)
(struct dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12) #:transparent #:mutable)
(struct dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct dram_vadd_v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl (v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11) #:transparent #:mutable)
(struct dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl (vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9) #:transparent #:mutable)
(struct dram_pimredsum_v1_e8__v16384_e8_dsl (v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9) #:transparent #:mutable)
(struct dram_pimbrdcst_v16384_e8__v1_e8_dsl (v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7) #:transparent #:mutable)
(struct dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
;; ================================================================================

