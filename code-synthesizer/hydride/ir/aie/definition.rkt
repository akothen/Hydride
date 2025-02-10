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
(struct v16int32_add16_dsl (v0 v1) #:transparent #:mutable)
(struct v8int32_add8_dsl (v0 v1) #:transparent #:mutable)
(struct v16int32_sub16_dsl (v0 v1) #:transparent #:mutable)
(struct mul_elem_32_dsl (v0 v1) #:transparent #:mutable)
(struct mac_elem_32_dsl (v0 v1 v2) #:transparent #:mutable)
(struct srs_to_v32int16_dsl (v0) #:transparent #:mutable)
(struct ups_to_v32acc32_dsl (v0) #:transparent #:mutable)
(struct ups_8_32_to_8_80_dsl (v0) #:transparent #:mutable)
;; ================================================================================

