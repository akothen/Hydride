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
(struct add_v16int32_dsl (v0 v1 num_2 num_3) #:transparent #:mutable)
(struct sub_v16acc64_dsl (v0 v1 size_i_o prec_i_o) #:transparent #:mutable)
(struct mac_elem_32_dsl (v0 v1 v2) #:transparent #:mutable)
(struct srs_to_v32int16_dsl (v0) #:transparent #:mutable)
(struct ups_to_v32acc32_dsl (v0) #:transparent #:mutable)
;; ================================================================================

