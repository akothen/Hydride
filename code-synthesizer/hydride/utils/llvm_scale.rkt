#lang rosette
(require rosette/lib/synthax)
(require racket/pretty)
(require rosette/lib/destruct)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/ir/hydride/definition)

;; Implementation of llvm target agnostic operations
;; to lower to.

(provide (all-defined-out))

(define (scale-down-llvm expr scale-factor)
  (destruct expr
            [(reg id) expr]
            [(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
             (llvm-vect-add_dsl 
               (scale-down-llvm v0 scale-factor)
               (scale-down-llvm v1 scale-factor)
               (/ num_2 scale-factor) 
               prec_i_o)
             ]
            [(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
             (llvm-vect-sub_dsl 
               (scale-down-llvm v0 scale-factor)
               (scale-down-llvm v1 scale-factor)
               (/ num_2 scale-factor) 
               prec_i_o)
             ]

            [(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
             (llvm-vect-mul_dsl 
               (scale-down-llvm v0 scale-factor)
               (scale-down-llvm v1 scale-factor)
               (/ num_2 scale-factor) 
               prec_i_o)
             ]

            [(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
             (llvm-vect-sdiv_dsl 
               (scale-down-llvm v0 scale-factor)
               (scale-down-llvm v1 scale-factor)
               (/ num_2 scale-factor) 
               prec_i_o)
             ]
            [(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
             (llvm-vect-udiv_dsl 
               (scale-down-llvm v0 scale-factor)
               (scale-down-llvm v1 scale-factor)
               (/ num_2 scale-factor) 
               prec_i_o)
             ]
            [_
              (error "Unsupported LLVM scaling")
              ]
            )
  )


