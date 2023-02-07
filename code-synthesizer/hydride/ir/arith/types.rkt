#lang rosette/safe

(require
  (only-in racket/struct make-constructor-style-printer)
  (only-in racket/base error)
  rosette/lib/destruct)

(provide (all-defined-out))
         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define arith IR


;; Generalized Broadcast


;(arith:create-tensor bv (vector 2 2 2) (vector 0 1 2) 'int32 256)


;(struct vector:extract_strided_slice (v0 offset sizes strides))
(struct arith:int-imm (data signed?) #:transparent #:mutable)

(struct arith:tensor (data shape-vector layout-vector  elemT buffSize) #:transparent #:mutable)




;; Generalized Cast
(struct arith:cast-int  (vec olane oprec) #:transparent)
(struct arith:cast-uint (vec olane oprec) #:transparent)

;; Operations
(struct arith:tensor-add (v1 v2 ) #:transparent)
(struct arith:tensor-sat-add (v1 v2 ) #:transparent)
(struct arith:tensor-sub (v1 v2) #:transparent)
(struct arith:tensor-sat-sub (v1 v2 ) #:transparent)
(struct arith:tensor-mul (v1 v2) #:transparent)
(struct arith:tensor-div (v1 v2) #:transparent #:mutable)
(struct arith:tensor-mod (v1 v2) #:transparent)
(struct arith:tensor-max (v1 v2) #:transparent)
(struct arith:tensor-min (v1 v2) #:transparent)

(struct arith:tensor-if (v1 v2 v3) #:transparent)
(struct arith:tensor-eq (v1 v2) #:transparent)
(struct arith:tensor-lt (v1 v2) #:transparent)
(struct arith:tensor-le (v1 v2) #:transparent)

(struct arith:tensor-abs (v1) #:transparent)
(struct arith:tensor-clz (v1) #:transparent)
(struct arith:tensor-absd (v1 v2) #:transparent)
(struct arith:tensor-shl (v1 v2) #:transparent)
(struct arith:tensor-shr (v1 v2) #:transparent)

(struct arith:tensor-bwand (v1 v2) #:transparent)

