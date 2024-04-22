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
(struct pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimDiv_v512_e16__v512_e16__v512_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct pimEQ_v512_e8__v512_e8__v512_e8_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9) #:transparent #:mutable)
(struct pimMin_v512_e8__v512_e8__v512_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimDiv_v512_e8__v512_e8__v512_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimSub_v512_e8__v512_e8__v512_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10) #:transparent #:mutable)
(struct pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimBroadCast_v512_e8__v8_e8_dsl (v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7) #:transparent #:mutable)
(struct pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
;; ================================================================================

