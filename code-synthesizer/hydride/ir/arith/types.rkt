#lang rosette/safe

(require
  (only-in racket/struct make-constructor-style-printer)
  (only-in racket/base error)
  rosette/lib/destruct)

(provide (all-defined-out))
         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Define arith IR



(struct arith:int-imm (data signed?) #:transparent #:mutable)

(struct arith:tensor (data shape-vector layout-vector  elemT buffSize id) #:transparent #:mutable)
(struct arith:tensor-index (index shape-vector layout-vector  elemT buffSize id) #:transparent #:mutable)


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

(struct vector:bitcast (v1 signed? out-prec) #:transparent)
(struct vector:broadcast (v1 output-shape) #:transparent)
(struct vector:extract (v1 extract_indices) #:transparent) ; type of v1 : arith:tensor, type of extract_indices would (vector idx0 idx1 ... )
(struct vector:extract_strided_slice (v1 offsets sizes strides) #:transparent ) ; ; type of v1 : arith:tensor, type offsets sizes strides each  would (vector idx0 idx1 ... )


(struct vector:matrix_multiply (v1 v2 lhs_rows lhs_cols rhs_cols) #:transparent)
(struct vector:flat_transpose (v1 trows tcols) #:transparent)
(struct vector:splat (v1 output-shape) #:transparent)
(struct vector:reduction (v1 operation) #:transparent)

(struct vector:transpose (v1 rank_perm) #:transparent)

(struct vector:outer_product (v1 v2) #:transparent)

(struct vector:shape_cast (v1 input_shape output_shape) #:transparent)



