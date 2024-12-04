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
(struct pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimSub_v8192_e16__v8192_e16__v8192_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimOr_v4096_e32__v4096_e32__v4096_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimAnd_v32_e32__v32_e32__v32_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct pimMin_v64_e32__v64_e32__v64_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimMax_v8192_e16__v8192_e16__v8192_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct pimAndScalar_v256_e32__v256_e32__v256_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimXor_v8192_e16__v8192_e16__v8192_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7) #:transparent #:mutable)
(struct pimBroadCast_v1024_e16__v16_e16_dsl (v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7) #:transparent #:mutable)
(struct pimEQ_v512_e16__v512_e16__v512_e16_dsl (vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9) #:transparent #:mutable)
(struct pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimGT_v16384_e8__v16384_e8__v16384_e8_dsl (vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10) #:transparent #:mutable)
(struct pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12) #:transparent #:mutable)
(struct pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9) #:transparent #:mutable)
(struct pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
(struct pimMul_v512_e8__v512_e8__v512_e8_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10) #:transparent #:mutable)
(struct pimDivScalar_v32_e16__v32_e16__v32_e16_dsl (v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8) #:transparent #:mutable)
;; ================================================================================

