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
(struct ups_to_v32acc32_dsl (v0) #:transparent #:mutable)
(struct srs_to_v32int16_dsl (v0) #:transparent #:mutable)
(struct mac_elem_32_dsl (v0 v1 v2) #:transparent #:mutable)
(struct mul_conv_32x8_dsl (v0 v1) #:transparent #:mutable)
(struct add_v64uint8_dsl (v0 v1 size_i_o prec_i_o) #:transparent #:mutable)
(struct mul_elem_32_v32acc32_dsl (v0 v1 size_i_o prec_i prec_o) #:transparent #:mutable)
(struct mul_elem_32_conf_v32acc32_dsl (v0 v1 v2 prec_i prec_o num_5) #:transparent #:mutable)
(struct sub_v64uint8_dsl (v0 v1 size_i_o prec_i_o) #:transparent #:mutable)
;; ================================================================================

