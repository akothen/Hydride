#lang rosette
;#lang rosette/safe

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require rosette/lib/destruct)
(require
  (only-in racket/base error bitwise-and)
  rosette/lib/destruct
  hydride/cpp
  hydride/utils/bvops
  hydride/ir/arith/types
  hydride/ir/arith/interpreter
  hydride/ir/arith/visitor
  
  )

(provide (prefix-out arith: (all-defined-out)))



(define (get-expr-depth e)
  (define depth 1)
  (destruct e
            [(arith:tensor data shape layout elemT buffsize id)
             (set! depth 0)
             ]

            [(arith:tensor-index index shape layout elemT buffsize id)
             (set! depth 0)
             ]
            [_
  (define sub-exp (arith:sub-exprs e))
  (for/list ([se sub-exp])
            (define sub-depth (get-expr-depth se))
            (define edge-depth (+ 1 sub-depth))
            (set! depth (max depth edge-depth))
            )
              ]
            )
  depth
  
  )



(define (get-expr-bv-sizes expr-list)

  (for/list ([i (range (length expr-list))])
            (vec-size (list-ref expr-list i))
            )
  
  )



(define (size-to-elemT-signed size signed?) 
(cond
    [(and (eq? size 8) signed?) 'int8]
    [(and (eq? size 16) signed?) 'int16]
    [(and (eq? size 32) signed?) 'int32]
    [(and (eq? size 64) signed?) 'int64]
    [(eq? size 8) 'uint8]
    [(eq? size 16) 'uint16]
    [(eq? size 32) 'uint32]
    [(eq? size 64) 'uint64]
    [else (error "halide/utils.rkt: Unexpected buffer type in size-to-elemT-signed" size )])
)

(define (get-elemT expr)
  (destruct expr
            [(arith:tensor data shape layout elemT buffsize id)
             elemT
             ]
            [(arith:tensor-index index shape layout elemT buffsize id)
             elemT
             ]
            [(arith:int-imm data signed?) (size-to-elemT-signed (bvlength data) signed?)]
            [(arith:cast-int vec olane oprec) 
             (size-to-elemT-signed oprec #t)
             ]
            [(arith:cast-uint vec olane oprec) 
             (size-to-elemT-signed oprec #f)
             ]
            [(arith:tensor-add v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-sat-add v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-sub v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-sat-sub v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-mul v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-div v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-mod v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-max v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-min v1 v2)
             (get-elemT v1)
             ]
            [(arith:tensor-if v1 v2 v3)
             (get-elemT v2)
             ]
            [(arith:tensor-lt v1 v2)
             'uint1
             ]
            [(arith:tensor-le v1 v2)
             'uint1
             ]
            [(arith:tensor-eq v1 v2)
             'uint1
             ]
            [(arith:tensor-abs v1)
             (get-elemT v1)
             ]
            [(arith:tensor-clz v1)
             (get-elemT v1)
             ]
            [(arith:tensor-absd v1 v2)
             (get-elemT v1)
             ]

            [(arith:tensor-shl v1 v2)
             (get-elemT v1)
             ]

            [(arith:tensor-shr v1 v2)
             (get-elemT v1)
             ]

            [(arith:tensor-bwand v1 v2)
             (get-elemT v1)
             ]

            [(vector:bitcast v1 signed? out-prec)
             (get-elemT v1)
             ]

            [(vector:broadcast v1 output-shape)
             (get-elemT v1)
             ]

            [(vector:extract v1 extract_indices)
             (get-elemT v1)
             ]

            [(vector:extract_strided_slice v1 offsets sizes strides)
             (get-elemT v1)
             ]

            [(vector:matrix_multiply v1 v2 lhs_rows lhs_cols rhs_cols)
             (get-elemT v1)
             ]

            [(vector:flat_transpose v1 trows tcols)
             (get-elemT v1)
             ]

            [(vector:transpose v1 rank_perm)
             (get-elemT v1)
             ]

            [(vector:reduction v1 operation)
             (get-elemT v1)
             ]

            [(vector:splat v1 output-shape)
             (get-elemT v1)
             ]

            [(vector:outer_product v1 v2)
             (get-elemT v1)
             ]

            [(vector:shape_cast v1 input_shape output_shape)
             (get-elemT v1)
             ]

            [v (error "Unrecognized expression in arith get-elemT" v)]
            )
  
  
  )


(define (get-expr-elemT expr-list)
  (for/list ([i (range (length expr-list))])
            (get-elemT (list-ref expr-list i))
            )
  
  )


(define (elemT-size elemT) 
(cond
    [(eq? elemT 'int8) 8]
    [(eq? elemT 'int16) 16]
    [(eq? elemT 'int32) 32]
    [(eq? elemT 'int64) 64]
    [(eq? elemT 'uint1) 1]
    [(eq? elemT 'uint8) 8]
    [(eq? elemT 'uint16) 16]
    [(eq? elemT 'uint32) 32]
    [(eq? elemT 'uint64) 64]
    [else (error "arith/utils.rkt: Unexpected buffer type in elemT-size" elemT )])
)

(define (vec-size expr)

  (define input-shape (arith:tensor-shape expr))
  (define num-elems (arith:get-num-elements input-shape))
  (define element-type (get-elemT expr))
  (define element-bitwidth (elemT-size element-type))
  (* num-elems element-bitwidth)
  )

(define (vec-len expr)
  (define input-shape (arith:tensor-shape expr))
  (vector-ref input-shape 0)
  )

(define (vec-precision expr)
  (define element-type (get-elemT expr))
  (define element-bitwidth (elemT-size element-type))
  element-bitwidth
  )

(define (scale-down-expr expr scale-factor)
  (values #t expr)
  )



(define (create-buffers sub-expr-ls sym-bvs)
  (list->vector (for/list ([i (range (length sub-expr-ls))])
            (define expr (list-ref sub-expr-ls i))
            (define sym-bv (vector-ref sym-bvs i))
            (define size (vec-size expr))
            (define expr-elemT (get-elemT expr))
            ;(println (arith:tensor-layout expr))
            (arith:create-tensor sym-bv (arith:tensor-shape expr) (arith:tensor-layout expr) expr-elemT i)
            )
  )
)





(define (bind-expr-args expr args depth)
  (define (arg i) (vector-ref args i))
  (define is-leaf-depth (eq? depth 1))

  (destruct expr
            [(arith:tensor data shape layout elemT buffsize id)
             (values (arg 0) 1)
             ]

            [(arith:tensor-index index shape layout elemT buffsize id)
             (values (arg 0) 1)
             ]
            [(arith:tensor-add v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-add (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-add leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]
            [(arith:tensor-sat-add v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-sat-add (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-sat-add leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]
            [(arith:tensor-sub v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-sub (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-sub leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]
            [(arith:tensor-sat-sub v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-sat-sub (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-sat-sub leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]
            [(arith:tensor-mul v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-mul (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-mul leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-div v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-div (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-div leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-mod v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-mod (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-mod leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]
            [(arith:tensor-max v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-max (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-max leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-min v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-min (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-min leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-shl v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-shl (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-shl leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-shr v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-shr (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-shr leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-absd v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-absd (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-absd leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-abs v1)
             (if is-leaf-depth
               (values (arith:tensor-abs (arg 0) ) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))

                 (values (arith:tensor-abs leaf1-sol ) args-used1 )
                 )
               )
             ]

            [(arith:tensor-clz v1)
             (if is-leaf-depth
               (values (arith:tensor-clz (arg 0) ) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))

                 (values (arith:tensor-clz leaf1-sol ) args-used1 )
                 )
               )
             ]

            [(arith:cast-int v1 olane oprec)
             (if is-leaf-depth
               (values (arith:cast-int (arg 0) olane oprec ) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))

                 (values (arith:cast-int leaf1-sol olane oprec ) args-used1 )
                 )
               )
             ]

            [(arith:cast-uint v1 olane oprec)
             (if is-leaf-depth
               (values (arith:cast-uint (arg 0) olane oprec ) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))

                 (values (arith:cast-uint leaf1-sol olane oprec ) args-used1 )
                 )
               )
             ]

            [(arith:tensor-bwand v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-bwand (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-bwand leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]


            [(arith:tensor-eq v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-eq (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-eq leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-lt v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-lt (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-lt leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-le v1 v2)
             (if is-leaf-depth
               (values (arith:tensor-le (arg 0) (arg 1)) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))


                 (values (arith:tensor-le leaf1-sol leaf2-sol) (+ args-used1 args-used2))
                 )
               )
             ]

            [(arith:tensor-if v1 v2 v3)
             (if is-leaf-depth
               (values (arith:tensor-if (arg 0) (arg 1) (arg 2)) 3)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))
                 (define remaining-values-1 (- (vector-length remaining-args) args-used2))
                 (define remaining-args-1 (vector-take-right remaining-args remaining-values-1))

                 (define-values (leaf3-sol args-used3) (bind-expr-args v3 remaining-args-1 (- depth 1)))


                 (values (arith:tensor-if leaf1-sol leaf2-sol leaf3-sol) (+ args-used1 args-used2 args-used3))
                 )
               )
             ]

            [(vector:bitcast v1 signed? out-prec)
             (if is-leaf-depth
               (values (vector:bitcast (arg 0) signed? out-prec ) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))

                 (values (vector:bitcast leaf1-sol signed? out-prec ) args-used1 )
                 )
               )
             ]

            [(vector:broadcast v1 output-shape)
             (if is-leaf-depth
               (values (vector:broadcast (arg 0) output-shape) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (values (vector:broadcast leaf1-sol output-shape ) args-used1 )
                 )
               )
             ]

            [(vector:extract v1 extract_indices)
             (if is-leaf-depth
               (values (vector:extract (arg 0) extract_indices) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (values (vector:extract leaf1-sol extract_indices) args-used1 )
                 )
               )
             ]

            [(vector:extract_strided_slice v1 offsets sizes strides)
             (if is-leaf-depth
               (values (vector:extract_strided_slice (arg 0) offsets sizes strides) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (values (vector:extract_strided_slice leaf1-sol offsets sizes strides) args-used1 )
                 )
               )
             ]

            [(vector:flat_transpose v1 trows tcols)
             (if is-leaf-depth
               (values (vector:flat_transpose (arg 0) trows tcols) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (values (vector:flat_transpose leaf1-sol trows tcols) args-used1 )
                 )
               )
             ]

            [(vector:transpose v1 rank_perm)
             (if is-leaf-depth
               (values (vector:transpose (arg 0) rank_perm) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (values (vector:transpose leaf1-sol rank_perm) args-used1 )
                 )
               )
             ]

            [(vector:shape_cast v1 input_shape output_shape)
             (if is-leaf-depth
               (values (vector:shape_cast (arg 0) input_shape output_shape) 1)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (values (vector:shape_cast leaf1-sol input_shape output_shape) args-used1 )
                 )
               )
             ]

            [(vector:matrix_multiply v1 v2 lhs_rows lhs_cols rhs_cols)
             (if is-leaf-depth
               (values (vector:matrix_multiply (arg 0) (arg 1) lhs_rows lhs_cols rhs_cols) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

                 (values (vector:matrix_multiply leaf1-sol leaf2-sol lhs_rows lhs_cols rhs_cols) (+ args-used1 args-used2))


                 )
               )
             ]

            [(vector:outer_product v1 v2)
             (if is-leaf-depth
               (values (vector:outer_product (arg 0) (arg 1) ) 2)
               (begin
                 (define-values (leaf1-sol args-used1) (bind-expr-args v1 args (- depth 1)))
                 (define remaining-values (- (vector-length args) args-used1))
                 (define remaining-args (vector-take-right args remaining-values))

                 (define-values (leaf2-sol args-used2) (bind-expr-args v2 remaining-args (- depth 1)))

                 (values (vector:outer_product leaf1-sol leaf2-sol ) (+ args-used1 args-used2))


                 )
               )
             ]
            
            )

  )


(define (hash-expr expr)
  (define (visitor-fn e)
    (destruct e
              [(arith:tensor data shape layout elemT buffsize id)               
                (list 'buf shape layout elemT buffsize)
               ]

              [(arith:tensor-index index shape layout elemT buffsize id)               
                (list 'buf shape layout elemT buffsize)
               ]
              [_ e]
              )
    )

  (define hashed-expr (arith:visit expr visitor-fn))
  hashed-expr
  )

(define (get-sub-exprs expr depth)

  (cond
    [(equal? expr '())
     expr
     ]
    [(<= depth 0)
     (list )
     ]
    [(equal? depth 1)
        (list expr)
     ]
    [else
      (define imm-sub-exprs (arith:sub-exprs expr))
      (apply append
             (for/list ([i (range (length imm-sub-exprs))])
                       (define imm-sub-expr (list-ref imm-sub-exprs i))
                       (define decremented-depth 
                         (- depth 1)
                         )
                       (get-sub-exprs (list-ref imm-sub-exprs i) decremented-depth)
                       )
             )
     ]
    
    )

  )



(define (print-buffer-type-info buff)

  (define elemT (get-elemT buff))
  (define step-size
    (cond
        [(eq? elemT 'int8) 8]
        [(eq? elemT 'int16) 16]
        [(eq? elemT 'int32) 32]
        [(eq? elemT 'int64) 64]
        [(eq? elemT 'uint1) 1]
        [(eq? elemT 'uint8) 8]
        [(eq? elemT 'uint16) 16]
        [(eq? elemT 'uint32) 32]
        [(eq? elemT 'uint64) 64]
        [else (error "arith/utils.rkt: Unexpected buffer type in print-buffer-type-info" buff)])
    )
  (define buffer-size (vec-size buff))
  (define buffer-num-elem (/ buffer-size step-size))

  (string-append "<" (~s buffer-num-elem) " x i" (~s step-size) ">")
  
  )



(define (get-bv-ops expr)
  (destruct expr
            [(arith:tensor data shape layout elemT buffsize id)
             (list (if (arith:is-buffer-signed expr)  (list sign-extend)  (list zero-extend)))
             ]

            [(arith:tensor-index index shape layout elemT buffsize id)
             (list (if (arith:is-buffer-signed expr)  (list sign-extend)  (list zero-extend)))
             ]
            [(arith:tensor-add v1 v2) (append (list extract bvadd) (if (arith:is-signed-expr? v1 v2) (list sign-extend  ) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) )]
            [(arith:tensor-mul v1 v2) (append (list extract bvmul) (if (arith:is-signed-expr? v1 v2) (list sign-extend  ) (list zero-extend)) (get-bv-ops v1)  (get-bv-ops v2) )]
            )


  )

